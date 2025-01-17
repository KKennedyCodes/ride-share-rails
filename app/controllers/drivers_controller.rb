class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end
  
  def show
    driver_id = params[:id]
    @driver = Driver.find_by(id: driver_id)
    if @driver.nil?
      head :not_found
      return
    end
  end
  
  def new
    @driver = Driver.new
  end
  
  def create
    #Handle Validation Errors
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to drivers_path
      return 
    else 
      render :new
    end
  end
  
  def edit
    @driver = Driver.find_by(id: params[:id])
    if @driver.nil?
      redirect_to driver_path
      head :not_found
      return
    end
  end
  
  def update
    #Handle Validation Errors
    @driver = Driver.find_by(id: params[:id])
    if @driver.nil? 
      head :not_found
      return
      #anytime we do a head or render or redirect
    end
    if @driver.update(driver_params)
      redirect_to driver_path(@driver.id)
      return
    else
      render driver_path
    end
  end
  
  def active    
    driver_id = params[:id]
    @driver = Driver.find_by(id: params[:id])
    if @driver.active == true
      @driver.active = false
      @driver.save
    else
      @driver.active == false
      @driver.active = true
      @driver.save
    end
    redirect_to drivers_path
  end
  
  def destroy
    driver_id = params[:id]
    @driver = Driver.find_by(id: driver_id)
    if @driver.nil?
      head :not_found
      return
    end
    @driver.destroy
    redirect_to drivers_path
    return
  end
  
  private
  
  def driver_params
    return params.require(:driver).permit(:driver_id, :name, 
      :vin, :make, :model, :active)
    end
  end#end of class
  
  
  