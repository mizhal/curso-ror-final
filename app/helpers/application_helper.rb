module ApplicationHelper
  def true_false_icon guard
    if guard 
      return raw image_tag("true.png", 
          :alt => t(".true", :default => "cierto")
        ) 
    else
      return raw image_tag("false.png", 
        :alt => t(".false", :default => "falso")
      ) 
    end
  end
end
