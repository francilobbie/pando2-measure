class MeasuresController < ApplicationController
  def index
    @selected_measure_type = params[:measure_type]
    room_ids = params[:room_ids] || []

    # Fetch and process data only if both room_ids and measure_type are present
    if room_ids.present? && @selected_measure_type.present?
      @data = process_data(room_ids, @selected_measure_type)
    else
      @data = { labels: [], datasets: [] }
    end

    respond_to do |format|
      format.html
      format.json { render json: @data }
    end
  end

  private

  def process_data(room_ids, measure_type)
    datasets = room_ids.map do |room_id|
      room_data = prepare_data_for_room(room_id, measure_type)
      {
        label: "Room #{room_id} #{measure_type}",
        data: room_data[:data],
        borderColor: generate_random_color
      }
    end

    # Assume all rooms have the same labels (timestamps)
    labels = if datasets.any?
               prepare_data_for_room(room_ids.first, measure_type)[:labels]
             else
               []
             end

    { labels: labels, datasets: datasets }
  end

  def prepare_data_for_room(room_id, measure_type)
    records = Csv.where(room_id: room_id, measure_type: measure_type).order(:timestamp)
    {
      labels: records.map { |record| record.timestamp.strftime('%Y-%m-%d %H:%M') },
      data: records.map(&:measure_float) # Assuming you want to plot measure_float
    }
  end

  def generate_random_color
    "#" + ("%06x" % (rand * 0xffffff))
  end
end
