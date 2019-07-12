class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

def show
   @heroine = Heroine.find(params[:id])
end

def new
  @powers = Power.all
  @power = Power.find(params[:id])
  @heroine = Heroine.new
  # new-controller cannot find exact power with necessary :id 
end

def create
  @heroine = Heroine.new(heroine_params)
  if @heroine.valid?
    @heroine.save
  else
    redirect_to heroines_path
  end
end


private

def heroine_params
  params.require(:heroine).permit(:name, :super_name, :power_id)
end

end
