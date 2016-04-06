class Api::SchoolsController < ApplicationController
  def index
    render json: School.all
  end

  def show
  #   render json: Post.find(params.fetch(:id))
  #                    .to_json(methods: [:prev, :next],
  #                             except: :user_id,
  #                             include: {
  #                               comments: {
  #                                 except: :user_id
  #                               }
  #                             })
  # rescue ActiveRecord::RecordNotFound
  #   render json: { message: "Not found", status: 404 }, status: 404
  end
end
