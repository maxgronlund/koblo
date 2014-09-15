class Admin::GenresController < Admin::AdminController
  inherit_resources
  # load_and_authorize_resource

  def index
    @genres = collection.sort_by(&:name)
  end

  def create
    super { admin_genres_path }
  end

  def update
    super { admin_genres_path }
  end

  def destroy
    super { admin_genres_path }
  end
end

