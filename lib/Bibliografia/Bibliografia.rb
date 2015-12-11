module Bibliografia
    
    class Bibliografia
        include Comparable
       
        attr_reader :autores, :titulo, :serie, :fechapublicacion
        attr_accessor :autores, :titulo, :fechapublicacion
        def initialize(autores, titulo, fechapublicacion)
            @autores = autores
            @titulo = titulo
            @fechapublicacion = fechapublicacion
        end
        
        def to_s
          "#{@autores.join(",")}\n#{@titulo}\n#{@fecha}"
        end
       
        def <=> other
            autores <=> other.autores
        end
    end
    
    
    class Libro < Bibliografia
    
      attr_reader :serie, :editorial, :numeroedicion, :isbm
      attr_accessor :serie, :editorial, :numeroedicion, :isbn
       
       def initialize(serie = nil, editorial, nuemroedicion, isbm)
           @serie = serie
           @editorial = editorial
           @numeroedicion = numeroedicion
           @isbn = isbn
       end
    end
    
    class Art_revista < Bibliografia
    
     attr_reader :nom_revista, :cant_pag, :num_publicacion
     attr_accessor :nom_revista, :cant_pag, :num_publicacion
        
        def initialize(nom_revista, cant_pag, num_publicacion)
           @nom_revista = nom_revista
           @cant_pag = cant_pag
           @num_publicacion = num_publicacion
        end
    
    end
    
    class Art_periodico < Bibliografia
        
     attr_reader :nom_periodico, :seccion, :num_pag
        attr_accessor :nom_periodico, :seccion, :num_pag
        
        def initialize(nom_periodico, seccion, num_pag)
           @nom_periodico = nom_periodico
           @seccion = seccion
           @num_pag = num_pag
        end
     
    end
    
    class Doc_electronico < Bibliografia
    
        attr_reader :tipo, :size
        attr_accessor :tipo, :size
        
        def initialize(tipo, size)
            @tipo = tipo
            @size = size
        end
        
    end
end