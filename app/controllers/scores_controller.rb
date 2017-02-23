class ScoresController < ApplicationController
  def create
    @reservation = Reservation.find(params[:reservation_id])
    @score = @reservation.build_score(score_params)
    @score.user = current_user

    if @score.save
      session[:total] = nil
      session[:course_rating] = nil

      redirect_to reservations_url
    else
      session[:errors] = @score.errors.full_messages
      session[:total] = @score.total
      session[:course_rating] = @score.course_rating

      redirect_to reservations_url
    end
  end

  def destroy
    @reservation = Reservation.find(params[:reservation_id])
    @score = @reservation.score.destroy

    redirect_to reservations_url
  end

  private

  def score_params
    params.require(:score).permit(:total, :course_rating, :carts, :handicap)
  end
end
