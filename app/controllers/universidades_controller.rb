class UniversidadesController < ApplicationController
  # GET /universidades
  # GET /universidades.json
  def index
    @search = Universidad.search(params[:search])
    @universidades = @search.page(params[:page]).per(10)


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @universidades }
    end
  end

  # GET /universidades/1
  # GET /universidades/1.json
  def show
    @universidad = Universidad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @universidad }
    end
  end

  # GET /universidades/new
  # GET /universidades/new.json
  def new
    @universidad = Universidad.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @universidad }
    end
  end

  # GET /universidades/1/edit
  def edit
    @universidad = Universidad.find(params[:id])
  end

  # POST /universidades
  # POST /universidades.json
  def create
    @universidad = Universidad.new(params[:universidad])

    respond_to do |format|
      if @universidad.save

        format.html { redirect_to @universidad, notice: 'La Universidad fue creada exitosamente' }
        format.json { render json: @universidad, status: :created, location: @universidad }
      else
        format.html { render action: "new" }
        format.json { render json: @universidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /universidades/1
  # PUT /universidades/1.json
  def update
    @universidad = Universidad.find(params[:id])

    respond_to do |format|
      if @universidad.update_attributes(params[:universidad])
        format.html { redirect_to @universidad, notice: 'La Universidad fue actualizada exitosamente' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @universidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /universidades/1
  # DELETE /universidades/1.json
  def destroy
    @universidad = Universidad.find(params[:id])
    @universidad.destroy

    respond_to do |format|
      format.html { redirect_to universidades_url }
      format.json { head :no_content }
    end
  end
end
