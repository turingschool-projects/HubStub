module Admin::ImagesHelper
  def create_image(param_path)
    Image.create(title:       param_path[:img_title],
                 description: param_path[:img_description],
                 image_url:         param_path[:image_url])
  end

  def update_image(param_path)
    add_image(param_path) if param_path[:image]
  end

  def add_image(param_path)
    default = Image.find_by(title: "Missing")
    param_path[:image_url] ? create_image(param_path) : default
  end
end
