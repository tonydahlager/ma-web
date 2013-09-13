module Admin::TopicsHelper
  
  def display_group_topic_names(topic)
    result = ""
    topic.topic_groups.each do |group|
      result += "<span class='btn-sm btn-warning'>#{group.title}</span><br /><br />"
    end
    result
  end 
  
  def list_group_topic_names(topic)
    
    result = "<p><b>Topic Groups:</b></p>"
    result += "<ul>"
    topic.topic_groups.each do |group|
      result += "<li>#{group.title}</li>"
    end
    result += "</ul>"
    
    
  end
end
