class MailsController < ApplicationController
  before_action :set_mail, only: %i[ show edit update destroy ]

  # GET /mails or /mails.json
  def index
    @mails = Mail.all
  end

  # GET /mails/1 or /mails/1.json
  def show
  end

  # GET /mails/new
  def new
    @mail = Mail.new
  end

  # GET /mails/1/edit
  def edit
  end

  # POST /mails or /mails.json
  def create
    @mail = Mail.new(mail_params)

    respond_to do |format|
      if @mail.save
        format.html { redirect_to @mail, notice: "Mail was successfully created." }
        format.json { render :show, status: :created, location: @mail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mails/1 or /mails/1.json
  def update
    respond_to do |format|
      if @mail.update(mail_params)
        format.html { redirect_to @mail, notice: "Mail was successfully updated." }
        format.json { render :show, status: :ok, location: @mail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mails/1 or /mails/1.json
  def destroy
    @mail.destroy
    respond_to do |format|
      format.html { redirect_to mails_url, notice: "Mail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail
      @mail = Mail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mail_params
      params.require(:mail).permit(:name, :post)
    end
end
