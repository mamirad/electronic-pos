class HomeController < ApplicationController
	skip_before_action :authenticate_user!,only: [:index,:sign_up,:free_trial_save,:save_store]
	layout 'home'

  def index
  end
  
	def sign_up
	end
  
  def free_trial_save
    begin
      ActiveRecord::Base.transaction do
        @base_url = request.base_url
      	@lead = Lead.new(lead_params)
      	@lead.slug = slug
      	if @lead.save
      		flash.now[:success] = "Your Free Account has been created"
          MyMailer.sample_email(@lead).deliver_now
      	else
      		flash.now[:error] = "There is Error while created your Account"
      	end
      end
    rescue Exception => e
      ActiveRecord::Rollback
      Rails.logger.info "Error="+e.message
    end
  	respond_to do |format|
  		format.html{}
  		format.js{}
  	end

  end

  def save_store
    begin
      ActiveRecord::Base.transaction do
        @lead = Lead.where(slug:params[:slug]).last
        if @lead.present?
          @store = StoreConfiguration.create_with(email_address:@lead.email,store_name:@lead.organization,phone_number:@lead.phone,currency:'$').find_or_create_by!(email_address:@lead.email)
          User.create_with(password:'12345678',store_configuration_id:@store.id).find_or_create_by!(username:@lead.email,email:@lead.email) 
          MyMailer.send_username_password(@lead).deliver_now
          flash[:success] = "Please check your mail for password"
          redirect_to  new_user_session_path
        end
      end
      
    rescue Exception => e
      ActiveRecord::Rollback
      flash[:error] = "Error "+e.message
       Rails.logger.info "Error="+e.message
      @error = e.message
      redirect_to  new_user_session_path
    end
  end

  private

  def slug
  	slug = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
  end

  def lead_params
  	params.require(:lead).permit(:name,
                                 :organization,
                                 :email,
                                 :phone
                                 )
  end

end
