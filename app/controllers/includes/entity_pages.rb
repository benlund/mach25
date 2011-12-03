module EntityPages

  def self.included(controller)
    controller.respond_to :json, :html
  end

  def index
    @entities = Engine.all
    respond_with @entities
  end

  def show
    @entity = Engine.find(params[:id])
    respond_with @entity
  end

  def versions
    @entity = Engine.find(params[:id])
    @versions = @entity.versions.reverse
    respond_with @versions
  end

  ## todo - support json
  def revert
    if e = Engine.find(params[:id]).revert_to(params[:version])
      redirect_to engine_url(e)
    end
  end

  protected

end
