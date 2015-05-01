class ConcertsController < ApplicationController
   	def index
      @concerts = Concert.all
   	end

   	def show
      @concert = Concert.find(params[:id])
    end

    def new
        @concert = Concert.new
    end

    def edit
        @concert = Concert.find(params[:id])
    end

    def create
        @concert = Concert.new(concert_params)
        
        if @concert.save
        redirect_to concert_path(@concert)
        else
           render :new
        end
    end

    def update
        @concert = Concert.find(params[:id])
        @concert.update(concert_params)
        redirect_to concert_path(@concert) #laptop_path es el metodo show al fin y al cabo
    end

    def destroy
        @concert = Concert.find(params[:id])
        @concert.destroy

        redirect_to root_path
    end

    def like
        @concert = Concert.find(params[:id])
        @concert.likes += 1
        @concert.save

        render :show
    end

    #def top10
     #   likes_concert = Hash.new
      #  likes_concert[@concert.likes] = @concert.band
       # likes_concert.sort.reverse
        #length = likes_concert.length
        #better_concerts = likes_concert.delete_if{|key,value| key.length > 10}
    #end

    private # para aceptar solo los parametros que nos interesa o se quiere controlar
    def concert_params
        params.require(:concert).permit(:band, :venue, :city, :date, :price, :photo, :description, :tickets)
    end
end



