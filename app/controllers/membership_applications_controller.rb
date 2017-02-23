class MembershipApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_membership_application, only: [:show, :edit, :update, :destroy]

  # GET /membership_applications
  # GET /membership_applications.json
  def index
    @membership_applications = MembershipApplication.all
  end

  # GET /membership_applications/1
  # GET /membership_applications/1.json
  def show
  end

  # GET /membership_applications/new
  def new
    if current_user.guest == true
      @membership_application = MembershipApplication.new
    else
      redirect_to new_user_session_path
    end
  end

  # GET /membership_applications/1/edit
  def edit
  end

  # POST /membership_applications
  # POST /membership_applications.json
  def create
    @user = current_user
    @membership_application = @user.build_membership_application(membership_application_params)
    @user.update_attribute(:guest, false)
    @user.update_attribute(:member, true)

    if @membership_application.membership == "Gold"
      @user.update_attribute(:shareholder, true)
    end

    respond_to do |format|
      if @membership_application.save
        format.html { redirect_to @membership_application, notice: 'Membership application was successfully created.' }
        format.json { render :show, status: :created, location: @membership_application }
      else
        format.html { render :new }
        format.json { render json: @membership_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /membership_applications/1
  # PATCH/PUT /membership_applications/1.json
  def update
    respond_to do |format|
      if @membership_application.update(membership_application_params)
        format.html { redirect_to @membership_application, notice: 'Membership application was successfully updated.' }
        format.json { render :show, status: :ok, location: @membership_application }
      else
        format.html { render :edit }
        format.json { render json: @membership_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /membership_applications/1
  # DELETE /membership_applications/1.json
  def destroy
    @membership_application.destroy
    respond_to do |format|
      format.html { redirect_to membership_applications_url, notice: 'Membership application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership_application
      @membership_application = MembershipApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_application_params
      params.require(:membership_application).permit(:address, :postal_code, :phone, :occupation, :company_name, :company_address, :company_postal_code, :company_phone, :membership, :first_sponsor_name, :second_sponsor_name, :user_id, :date_of_birth)
    end
end
