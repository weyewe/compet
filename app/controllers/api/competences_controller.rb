class Api::CompetencesController < Api::BaseApiController
  
  def index
    if params[:livesearch].present? 
      livesearch = "%#{params[:livesearch]}%"
      @objects = Competence.where{
        (
          (name =~  livesearch )
        )
        
      }.page(params[:page]).per(params[:limit]).order("id DESC")
      
      @total = Competence.where{
        (
          (name =~  livesearch )
        )
      }.count
    else
      @objects = Competence.page(params[:page]).per(params[:limit]).order("id DESC")
      @total = Competence.count
    end
    
    render :json => { :competences => @objects , :total => @total , :success => true }
  end

  def create
    @object = Competence.create_by_employee(current_user, params[:competence])
 
    if @object.valid?
      render :json => { :success => true, 
                        :competences => [@object] , 
                        :total => Competence.count }  
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
    @object = Competence.find(params[:id])
    @object.update_by_employee(current_user, params[:competence])
    
    if @object.valid?
      render :json => { :success => true,   
                        :competences => [@object],
                        :total => Competence.count  } 
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
    @object = Competence.find(params[:id])
    @object.delete(current_user)

    if @object.is_deleted
      render :json => { :success => true, :total => Competence.count }  
    else
      render :json => { :success => false, :total => Competence.count }  
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
      @objects = Competence.where{  (name =~ query)   
                              }.
                        page(params[:page]).
                        per(params[:limit]).
                        order("id DESC")
    else
      @objects = Competence.where{ (id.eq selected_id)  
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
      @objects = Competence.where{     
                                        (name =~ query)   | 
                                        (description =~ query )
                              }.
                        page(params[:page]).
                        per(params[:limit]).
                        order("id DESC")
    else
      @objects = Competence.where{ 
                                (id.eq selected_id) 
                              }.
                        page(params[:page]).
                        per(params[:limit]).
                        order("id DESC")
    end
    
    
    render :json => { :records => @objects , :total => @objects.count, :success => true }
  end
  
 
end
