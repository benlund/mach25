module EntityPages

  module ClassMethods

    def entity_type(et)
      @entity_type = et
    end

  end

  def self.included(controller)
    controller.extend(ClassMethods)
    controller.respond_to :json, :html
  end

  def index
    @entities = if params[:sort]
                  meth = if 'asc' == params[:order]
                           :asc
                         else
                           :desc
                         end
                  fields = [params[:sort], :name]
                  entity_class.send(meth, fields)
                else
                  entity_class.all
                end
    respond @entities
  end

  def show
    @entity = entity_class.find(params[:id])
    if params[:version]
      @entity = @entity.versions.where(:version => params[:version]).first
    end
    respond @entity
  end

  def versions
    @entity = entity_class.find(params[:id])
    @versions = @entity.versions.reverse
    respond @versions
  end

  ## todo - support json
  ## todo - implement revert_to !!!!
  def revert
    if e = entity_class.find(params[:id]).revert_to(params[:version])
      redirect_to engine_url(e)
    end
  end

  protected

  def respond(obj)
    respond_with(obj) do |format|
      format.html { render "entities/#{params[:action]}" }
    end
  end

  def entity_class
    self.class.instance_variable_get('@entity_type').camelize.constantize
  end


end
