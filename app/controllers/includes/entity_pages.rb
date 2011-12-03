module EntityPages

  def self.included(controller)
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
                  Engine.send(meth, fields)
                else
                  Engine.all
                end
    respond_with @entities
  end

  def show
    @entity = Engine.find(params[:id])
    if params[:version]
      @entity = @entity.versions.where(:version => params[:version]).first
    end
    respond_with @entity
  end

  def versions
    @entity = Engine.find(params[:id])
    @versions = @entity.versions.reverse
    respond_with @versions
  end

  ## todo - support json
  ## todo - implement revert_to !!!!
  def revert
    if e = Engine.find(params[:id]).revert_to(params[:version])
      redirect_to engine_url(e)
    end
  end

  protected

end
