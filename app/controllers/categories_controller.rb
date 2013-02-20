class CategoriesController < ApplicationController
  load_and_authorize_resource
  
  layout 'admin'
  
  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.toplevel ## NOTA: no se paginan arboles (de momento)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new
    @category.secure_set_parent_id params[:parent_id] unless params[:parent_id].blank?  
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to @category, notice: t('controllers.categories.create_success')
    else
      flash[:error] = t("controllers.categories.create_fail")
      render action: "new" 
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      redirect_to @category, notice: t('controllers.categories.update_success')
    else
      flash[:error] = t("controllers.categories.update_fail")
      render action: "edit" 
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice] = t('controllers.categories.destroy_success')
    else
      flash[:error] = t('controllers.categories.destroy_fail') + ": " +
        @category.errors.full_messages.join(", ")
    end

    redirect_to categories_url
  end
  
  def subcategories
    categories = Category.subcategories_of(params[:parent_id]).select("id, name").order("name asc")
    render json: categories
  end
end
