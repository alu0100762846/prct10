module Bibliografia
    
    class Bibliografia
        include Comparable
       
        attr_reader :autores,:apellidos, :titulo, :fechapublicacion, :serie, :edicion ,:numeroedicion, :isbm  
        
        def initialize(autores,apellidos, titulo, fechapublicacion, serie, edicion,numeroedicion,isbn)
            @autores = autores
            @apellidos = apellidos
            @titulo = titulo
            @fechapublicacion = fechapublicacion
            @serie = serie
            @edicion = edicion
            @numeroedicion = numeroedicion
            @isbn = isbn
        end
        #comentario
        
        def to_s
          "#{@autores.join(",")}\n#{@titulo}\n#{@fecha}\n#{@apellidos}"
        end
       
        def <=>(other)
			if(@apellidos != other.apellidos)
				@apellidos <=> other.apellidos
			else
				if(@fechapublicacion != other.fechapublicacion)
					@fechapublicacion <=> other.fechapublicacion
				else
					@titulo <=> other.titulo
				end
			end
		end
		
		def getautores()
			tam = @autores.length
			i, j = 0
			while i < (tam - 1)
				cadena = "#{cadena}"+"#{@autores[i]} #{@apellidos[i]}, "
				i = i+1
				j = j+1
			end
			cadena = "#{cadena}"+"#{@autores[i]} #{@apellidos[i]}"
		end
		
		def gettitulo()
			"#{@titulo}"
		end


        def getedicion()
			"#{@edicion}"
		end

		def getnumeroedicion()
			"#{@numeroedicion}"
		end

		def getserie()
			"#{@serie}"
		end

		def getisbn()
			tam = @isbn.length
			a = @isbn[0].length
			cadena = "ISBN-#{a}: "
			if a > 10
				cadena = "#{cadena}" + "#{@isbn[0][-a..-11]}" + " - " + "#{@isbn[0][-10..-1]}"
			else
				cadena = "#{cadena}"+"#{@isbn[0]}"
			end
			i = 1
		end

		def getfecha()
			"#{@fechapublicacion}"
		end

		def to_s(valor)
			"#{@valor}"
		end
		
end
    
    
    class Libro < Bibliografia
    
        def initialize(autores,apellidos,titulo, fechapublicacion, serie = nil,edicion, numeroedicion, isbn)
            @autores = autores
            @apellidos = apellidos
            @titulo = titulo
            @fechapublicacion = fechapublicacion
            @serie = serie
            @edicion = edicion
            @numeroedicion = numeroedicion
            @isbn = isbn
       end
       
       def <=> other
			@titulo <=> other.titulo
	   end
	   
	    def ==(other)
			@titulo == other.titulo
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