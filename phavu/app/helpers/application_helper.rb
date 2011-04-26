module ApplicationHelper
  
  #
  # Parse the data file into a table.
  #
  def parse_data_file(data_file)
    return "" if data_file.blank?
    
    i = 1
    data = "<table id='datasets'>"
    
    # Set the headers
    headers = data_file.shift
    data << "<tr>"
    headers.split("|").each do |h|
      data << "<th>#{h.strip}</th>"
    end
    data << "</tr>"
    
    # Set the data
    data_file.each do |d|
      i.modulo(2) == 0 ? style = "even" : style = "odd"
      data << "<tr class='#{style}'>"
      d.split("|").each do |l|
        data << "<td>#{l.strip}</td>"
      end
      data << "</tr>"
      i += 1
    end
    data << "</table>"
    
    # Send the table
    raw(data)
  end
  
end
