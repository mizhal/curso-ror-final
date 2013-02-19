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
  
  ####
  ### funciona como content_for pero en lugar de agregar
  ### el texto de todas las veces que se llama con la misma
  ### clave como hace el content_for normal, elimina el texto
  ### anterior que hubiera en dicha clave y escribe el nuevo
  def set_content_for key
    @view_flow.content.delete key
    content_for key do
      yield
    end
  end
end
