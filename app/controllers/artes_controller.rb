class ArtesController < ApplicationController
  # GET /artes
  # GET /artes.json
  def index
    @search = Arte.search(params[:search])
    @artes = @search.page(params[:page]).per(2)


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artes }
    end
  end

  # GET /artes/1
  # GET /artes/1.json
  def show
    @arte = Arte.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @arte }
    end
  end

  # GET /artes/new
  # GET /artes/new.json
  def new
    @arte = Arte.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @arte }
    end
  end

  # GET /artes/1/edit
  def edit
    @arte = Arte.find(params[:id])
  end

  # POST /artes
  # POST /artes.json
  def create
    @arte = Arte.new(params[:arte])

    respond_to do |format|
      if @arte.save
        format.html { redirect_to @arte, notice: 'Arte was successfully created.' }
        format.json { render json: @arte, status: :created, location: @arte }
      else
        format.html { render action: "new" }
        format.json { render json: @arte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /artes/1
  # PUT /artes/1.json
  def update
    @arte = Arte.find(params[:id])

    respond_to do |format|
      if @arte.update_attributes(params[:arte])
        format.html { redirect_to @arte, notice: 'Arte was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @arte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artes/1
  # DELETE /artes/1.json
  def destroy
    @arte = Arte.find(params[:id])
    @arte.destroy

    respond_to do |format|
      format.html { redirect_to artes_url }
      format.json { head :no_content }
    end
  end
end
