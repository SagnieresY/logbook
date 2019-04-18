# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:radio_certificate,
                                      :aviation_document,
                                      :aviation_document_date,
                                      :pilot_license_type,
                                      :pilot_license_number,
                                      :medical_category,
                                      :medical_date,
                                      :instrument_rating_date,
                                      :instrument_rating_renewal_date,
                                      :night_rating_date,
                                      :FAA_PPL_Conversion_date,
                                      :FAA_PPL_license,
                                      :FAA_CPL_license,
                                      :FAA_CPL_conversion_date,
                                      :biennial_flight_review])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:radio_certificate,
                                      :aviation_document,
                                      :aviation_document_date,
                                      :pilot_license_type,
                                      :pilot_license_number,
                                      :medical_category,
                                      :medical_date,
                                      :instrument_rating_date,
                                      :instrument_rating_renewal_date,
                                      :night_rating_date,
                                      :FAA_PPL_Conversion_date,
                                      :FAA_PPL_license,                                      :FAA_PPL_license,
                                      :FAA_CPL_license,
                                      :FAA_CPL_conversion_date,
                                      :biennial_flight_review])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end

