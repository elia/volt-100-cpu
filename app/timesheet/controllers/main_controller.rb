module Timesheet
  class MainController < Volt::ModelController
    model :store

    def index
      # Add code for when the index view is loaded
      page._new_timesheet ||= {
        month: nil, day: nil, client: nil, hour_n: nil,
      }
    end

    def about
      # Add code for when the about view is loaded
    end

    def add_timesheet
      _timesheets.clear
      _timesheets << {
        month: page._new_timesheet_month,
        day: page._new_timesheet_day,
        client: page._new_timesheet_client,
        hour_n: page._new_timesheet_hour_n,
      }
      page._new_timesheet_hour_n = 8 - page._new_timesheet_hour_n.to_i
    end

    def new_timesheet
      page._new_timesheet
    end

    def remove_time_entry(entry)
      # _timesheets.delete entry
      p entry
    end


    private

    # the main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._controller and params._action values.
    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end
  end
end
