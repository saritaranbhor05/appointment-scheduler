class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  # GET /pets
  # GET /pets.json
  def index
    @user_id = current_user.customer? ? current_user.id : params[:user_id]
    @user_id = @user_id || current_user.id
    @pets = Pet.where(user_id: @user_id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pets }
    end
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pet }
    end
  end

  # GET /pets/new
  def new
    @pet = Pet.new
    @user_id = params[:user_id] || current_user.id
  end

  # GET /pets/1/edit
  def edit
    @user_id = @pet.user_id
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = Pet.new(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render json: @pet, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    user_id = @pet.user_id
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url(user_id: user_id) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :pet_type, :breed, :age, :weight, :user_id)
    end
end
