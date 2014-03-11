class ProfesionesController < ApplicationController
  # GET /profesiones
  # GET /profesiones.json
  def index
    @profesiones = Profesion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profesiones }
    end
  end

  # GET /profesiones/1
  # GET /profesiones/1.json
  def show
    @profesion = Profesion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profesion }
    end
  end

  # GET /profesiones/new
  # GET /profesiones/new.json
  def new
    @profesion = Profesion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profesion }
    end
  end

  # GET /profesiones/1/edit
  def edit
    @profesion = Profesion.find(params[:id])
  end

  # POST /profesiones
  # POST /profesiones.json
  def create
    @profesion = Profesion.new(params[:profesion])

    respond_to do |format|
      if @profesion.save
        format.html { redirect_to @profesion, notice: 'La Profesion fue creada exitosamente' }
        format.json { render json: @profesion, status: :created, location: @profesion }
      else
        format.html { render action: "new" }
        format.json { render json: @profesion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profesiones/1
  # PUT /profesiones/1.json
  def update
    @profesion = Profesion.find(params[:id])

    respond_to do |format|
      if @profesion.update_attributes(params[:profesion])
        format.html { redirect_to @profesion, notice: 'La Profesion fue actualizada correctamente' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profesion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profesiones/1
  # DELETE /profesiones/1.json
  def destroy
    @profesion = Profesion.find(params[:id])
    @profesion.destroy

    respond_to do |format|
      format.html { redirect_to profesiones_url }
      format.json { head :no_content }
    end
  end
end
