class PersonasController < ApplicationController
  # GET /personas
  # GET /personas.json
  def index
    @search = Persona.search(params[:search])
    @personas = @search.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @personas }
    end
  end

  # GET /personas/1
  # GET /personas/1.json
  def show
    @persona = Persona.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @persona }
    end
  end

  # GET /personas/new
  # GET /personas/new.json
  def new
    @persona = Persona.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @persona }
    end
  end

  # GET /personas/1/edit
  def edit
    @persona = Persona.find(params[:id])
  end

  # POST /personas
  # POST /personas.json
  def create
    @persona = Persona.new(params[:persona])

    respond_to do |format|
      if @persona.save
        format.html { redirect_to @persona, notice: 'Persona was successfully created.' }
        format.json { render json: @persona, status: :created, location: @persona }
      else
        format.html { render action: "new" }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /personas/1
  # PUT /personas/1.json
  def update
    @persona = Persona.find(params[:id])
    if @persona.usuario.nil?
      if @persona.build_usuario(:email=>"coordinacionscr@gmail.com",:password => '123456789', :password_confirmation=>'123456789').save
        redirect_to @persona, notice: 'Persona was successfully updated.'
      else
        redirect_to crear_usuario_persona_path(@persona), notice: 'Error intente nuevamente.'
      end

    else
      if @persona.update_attributes(params[:persona])
         redirect_to @persona, notice: 'Persona was successfully updated.'
      else
        render action: "edit"
      end
    end

  end

  # DELETE /personas/1
  # DELETE /personas/1.json
  def destroy
    @persona = Persona.find(params[:id])
    @persona.destroy

    respond_to do |format|
      format.html { redirect_to personas_url }
      format.json { head :no_content }
    end
  end
  def alumnos
    @personas = Persona.where(:tipo_id => 1)

    respond_to do |format|
      format.html {redirect_to personas_url}
      format.json { render json: @personas }
    end
  end
  def crear_usuario
    @persona = Persona.find(params[:id])
  end
end
