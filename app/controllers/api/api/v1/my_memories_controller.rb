module Api::Api::V1
	class MyMemoriesController < ApiController
		before_action :set_my_memory, only: [:show, :update, :destroy]
		
		def index
			@my_memories = MyMemory.all
			render json: @my_memories
		end

		def user_memories
			@user_memories = []
			MyMemory.where(user_id: params[:user_id]).each do |mm|
				um = {}
				um[:id] = mm.id
				um[:title] = mm.title
				um[:description] = mm.description
				um[:theme_id] = mm.theme_id
				um[:theme_color] = Theme.find(mm.theme_id).color
				um[:locations] = mm.locations
				@user_memories << um
			end
			render json: @user_memories
		end

		def show
			render :json => @my_memory
		end

		def create
			# @user_memory = MyMemory.create!(params[:my_memories])
			@my_memory = MyMemory.new(my_memory_params)

		    if @my_memory.save
		      render json: @my_memory, status: :created#, location: @user_memory
		    else
		      render json: @my_memory.errors, status: :unprocessable_entity
		    end
		end

		def update
	      if @my_memory.update(my_memory_params)
	        render json: @my_memory
	      else
	        render json: @my_memory.errors, status: :unprocessable_entity
	      end
	    end

		private
	      # Use callbacks to share common setup or constraints between actions.
	      def set_my_memory
	        @my_memory = MyMemory.find(params[:id])
	      end

	      # Only allow a trusted parameter "white list" through.
	      def my_memory_params
	        params.require(:my_memory).permit(:title, :description, :memory_date, :user_id, :theme_id, :location_id, :image, locations_attributes: [:id, :_destroy, :name, :lat, :log])
	      end
	end
end
