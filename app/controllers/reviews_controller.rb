class ReviewsController < ApplicationController

  before_action :set_movie

  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.new
  end

  def edit
    @review = @movie.reviews.find(params[:id])
  end

  def create
    @review = @movie.reviews.new(review_params)
    if @review.save
      redirect_to movie_reviews_path, notice: 'Thanks for your review!'
    else
      render :new
    end
  end

  def update
    @review = @movie.reviews.find(params[:id])
    if @review.update(review_params)
      redirect_to movie_reviews_path, notice: 'Your review was updated!'
    else
      render :edit
    end
  end

  def destroy
    review = @movie.reviews.find(params[:id])
    if review.destroy
      redirect_to movie_reviews_path, notice: 'Review successfully deleted!'
    else
      render movie_reviews_path, warning: 'Review NOT deleted!'
    end
  end

  private
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:name, :stars, :comment)
  end


end
