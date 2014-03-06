class InvitacionesController < ApplicationController
  # GET /invitaciones
  # GET /invitaciones.json
  def index
    @invitaciones = Invitacion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invitaciones }
    end
  end

  # GET /invitaciones/1
  # GET /invitaciones/1.json
  def show
    @invitacion = Invitacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invitacion }
    end
  end

  # GET /invitaciones/new
  # GET /invitaciones/new.json
  def new
    @invitacion = Invitacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invitacion }
    end
  end

  # GET /invitaciones/1/edit
  def edit
    @invitacion = Invitacion.find(params[:id])
  end

  # POST /invitaciones
  # POST /invitaciones.json
  def create
    @invitacion = Invitacion.new(params[:invitacion])

    respond_to do |format|
      if @invitacion.save
        format.html { redirect_to @invitacion, notice: 'Invitacion was successfully created.' }
        format.json { render json: @invitacion, status: :created, location: @invitacion }
      else
        format.html { render action: "new" }
        format.json { render json: @invitacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invitaciones/1
  # PUT /invitaciones/1.json
  def update
    @invitacion = Invitacion.find(params[:id])

    respond_to do |format|
      if @invitacion.update_attributes(params[:invitacion])
        format.html { redirect_to @invitacion, notice: 'Invitacion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invitacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invitaciones/1
  # DELETE /invitaciones/1.json
  def destroy
    @invitacion = Invitacion.find(params[:id])
    @invitacion.destroy

    respond_to do |format|
      format.html { redirect_to invitaciones_url }
      format.json { head :no_content }
    end
  end
end
