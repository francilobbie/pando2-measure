class MeasuresController < ApplicationController
  def index
    selected_measure_type = params[:measure_type] || 'CO2'
    @data_for_room_1 = prepare_data_for_room(1, selected_measure_type)
    @data_for_room_3 = prepare_data_for_room(3, selected_measure_type)
    @data_for_room_4 = prepare_data_for_room(4, selected_measure_type)
  end

  private

  def prepare_data_for_room(room_id, measure_type)
    records = Csv.where(room_id: room_id, measure_type: measure_type).order(:timestamp)
    {
      labels: records.map { |record| record.timestamp.strftime('%Y-%m-%d %H:%M') },
      data: records.map(&:measure_float) # Assuming you want to plot measure_float
    }
  end
end
