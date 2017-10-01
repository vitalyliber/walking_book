class ImageUploaderController < ApplicationController
  def create
    image = Image.new(file: params[:file])
    if image.save
      render json: {
          image_url: image.file.url,
          image_id: image.id
      }
    else
      render json: {errors: image.errors.to_a}, status: 400
    end

  end
end
