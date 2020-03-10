class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :destroy]

  def index
    @emails = Email.all
  end

  def new
  end

  def create
    receivers = params[:receivers].delete(' ').split(',')
    @email = Email.new(receivers: receivers, subject: params[:subject], body: params[:body], state: "In progress")
    if @email.save
      EmailsServices::SendEmail.run(@email)
      redirect_to emails_path, notice: 'Sending E-Mail in proccessing'
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @email.destroy
    redirect_to emails_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_email
    @email = Email.find(params[:id])
  end
end