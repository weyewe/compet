class Api::MaterialsController < Api::BaseApiController
  
  def index
    if params[:livesearch].present? 
      livesearch = "%#{params[:livesearch]}%"
      @objects = Material.where{
        (
          (name =~  livesearch )
        )
        
      }.page(params[:page]).per(params[:limit]).order("id DESC")
      
      @total = Material.where{
        (
          (name =~  livesearch )
        )
      }.count
    else
      @objects = Material.page(params[:page]).per(params[:limit]).order("id DESC")
      @total = Material.count
    end
    
    render :json => { :materials => @objects , :total => @total , :success => true }
  end

  def create
    @object = Material.create_by_employee(current_user, params[:material])
 
    if @object.valid?
      render :json => { :success => true, 
                        :materials => [@object] , 
                        :total => Material.count }  
    else
      msg = {
        :success => false, 
        :message => {
          :errors => extjs_error_format( @object.errors ) 
        }
      }
      
      render :json => msg                         
    end
  end

  def update
    @object = Material.find(params[:id])
    @object.update_by_employee(current_user, params[:material])
    
    if @object.valid?
      render :json => { :success => true,   
                        :materials => [@object],
                        :total => Material.count  } 
    else
      msg = {
        :success => false, 
        :message => {
          :errors => {
            :name => "Nama tidak boleh kosong"
          }
        }
      }
      
      render :json => msg 
    end
  end

  def destroy
    @object = Material.find(params[:id])
    @object.delete(current_user)

    if @object.is_deleted
      render :json => { :success => true, :total => Material.count }  
    else
      render :json => { :success => false, :total => Material.count }  
    end
  end
  
  def search
    search_params = params[:query]
    selected_id = params[:selected_id]
    if params[:selected_id].nil?  or params[:selected_id].length == 0 
      selected_id = nil
    end
    
    query = "%#{search_params}%"
    # on PostGre SQL, it is ignoring lower case or upper case 
    
    if  selected_id.nil?  
      @objects = Material.where{  (name =~ query)   
                              }.
                        page(params[:page]).
                        per(params[:limit]).
                        order("id DESC")
    else
      @objects = Material.where{ (id.eq selected_id)  
                              }.
                        page(params[:page]).
                        per(params[:limit]).
                        order("id DESC")
    end
    
    
    render :json => { :records => @objects , :total => @objects.count, :success => true }
  end
  
  def search
    search_params = params[:query]
    selected_id = params[:selected_id]
    if params[:selected_id].nil?  or params[:selected_id].length == 0 
      selected_id = nil
    end
    
    query = "%#{search_params}%"
    # on PostGre SQL, it is ignoring lower case or upper case 
    
    if  selected_id.nil?  
      @objects = Material.where{     
                                        (name =~ query)   | 
                                        (description =~ query )
                              }.
                        page(params[:page]).
                        per(params[:limit]).
                        order("id DESC")
    else
      @objects = Material.where{ 
                                (id.eq selected_id) 
                              }.
                        page(params[:page]).
                        per(params[:limit]).
                        order("id DESC")
    end
    
    
    render :json => { :records => @objects , :total => @objects.count, :success => true }
  end
  
 
end
