class FuentesLaboralesController < ApplicationController
  # GET /fuentes_laborales
  # GET /fuentes_laborales.json
  def index
    @fuentes_laborales = FuenteLaboral.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fuentes_laborales }
    end
  end

  # GET /fuentes_laborales/1
  # GET /fuentes_laborales/1.json
  def show
    @fuente_laboral = FuenteLaboral.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fuente_laboral }
    end
  end

  # GET /fuentes_laborales/new
  # GET /fuentes_laborales/new.json
  def new
    @fuente_laboral = FuenteLaboral.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fuente_laboral }
    end
  end

  # GET /fuentes_laborales/1/edit
  def edit
    @fuente_laboral = FuenteLaboral.find(params[:id])
  end

  # POST /fuentes_laborales
  # POST /fuentes_laborales.json
  def create
    @fuente_laboral = FuenteLaboral.new(params[:fuente_laboral])

    respond_to do |format|
      if @fuente_laboral.save
        format.html { redirect_to @fuente_laboral, notice: 'Fuente laboral was successfully created.' }
        format.json { render json: @fuente_laboral, status: :created, location: @fuente_laboral }
      else
        format.html { render action: "new" }
        format.json { render json: @fuente_laboral.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fuentes_laborales/1
  # PUT /fuentes_laborales/1.json
  def update
    @fuente_laboral = FuenteLaboral.find(params[:id])

    respond_to do |format|
      if @fuente_laboral.update_attributes(params[:fuente_laboral])
        format.html { redirect_to @fuente_laboral, notice: 'Fuente laboral was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fuente_laboral.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fuentes_laborales/1
  # DELETE /fuentes_laborales/1.json
  def destroy
    @fuente_laboral = FuenteLaboral.find(params[:id])
    @fuente_laboral.destroy

    respond_to do |format|
      format.html { redirect_to fuentes_laborales_url }
      format.json { head :no_content }
    end
  end
end
