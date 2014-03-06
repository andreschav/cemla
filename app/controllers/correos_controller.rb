class CorreosController < ApplicationController
  # GET /correos
  # GET /correos.json
  def index
    @correos = Correo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @correos }
    end
  end

  # GET /correos/1
  # GET /correos/1.json
  def show
    @correo = Correo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @correo }
    end
  end

  # GET /correos/new
  # GET /correos/new.json
  def new
    @correo = Correo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @correo }
    end
  end

  # GET /correos/1/edit
  def edit
    @correo = Correo.find(params[:id])
  end

  # POST /correos
  # POST /correos.json
  def create
    @correo = Correo.new(params[:correo])

    respond_to do |format|
      if @correo.save
        format.html { redirect_to @correo, notice: 'Correo was successfully created.' }
        format.json { render json: @correo, status: :created, location: @correo }
      else
        format.html { render action: "new" }
        format.json { render json: @correo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /correos/1
  # PUT /correos/1.json
  def update
    @correo = Correo.find(params[:id])

    respond_to do |format|
      if @correo.update_attributes(params[:correo])
        format.html { redirect_to @correo, notice: 'Correo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @correo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /correos/1
  # DELETE /correos/1.json
  def destroy
    @correo = Correo.find(params[:id])
    @correo.destroy

    respond_to do |format|
      format.html { redirect_to correos_url }
      format.json { head :no_content }
    end
  end
end
