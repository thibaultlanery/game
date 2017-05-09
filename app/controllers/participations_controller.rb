class ParticipationsController < ApplicationController

  def update
    participation = Participation.find(params[:id])
    if participation.update(participation_params)
      flash[:notice] = 'Thank you for answering'
    else
      flash[:alert] = 'Something went wrong'
    end
      redirect_to event_path(participation.event)
  end

  private

  def participation_params
    params.require(:participation).permit(:status)
  end

end
