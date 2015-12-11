#encoding:utf-8
require './lib/Bibliografia/Bibliografia.rb'
require './lib/Bibliografia/lista.rb'
require './lib/Bibliografia/Formato_Apa.rb'
    
    
describe Bibliografia do 
    before :each do 
        @fapa = Bibliografia::Formato_Apa.new()
    	@libro1 = Bibliografia::Libro.new(['Dave','Andy','Chad'], ['Thomas', 'Hunt', 'Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', '4 July 2013','2323', 'Pragmatic Bookshelf', 'edicion 2',  ['9781937785499', '1937785491'])
    	@libro2 = Bibliografia::Libro.new(['Dave','Andy','Chad'], ['Thomas', 'Hunt', 'Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', '4 July 2015','2323', 'Pragmatic Bookshelf', 'edicion 2',  ['9781937785499', '1937785491'])
    	@libro3 = Bibliografia::Libro.new(['Dave','Andy','Chad'], ['Thomas', 'Hunt', 'Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', '4 July 2013','2323', 'Pragmatic Bookshelf', 'edicion 2',  ['9781937785499', '1937785491'])
    	@libro4 = Bibliografia::Libro.new(['Dave','Andy','Chad'], ['Thomas', 'Hunt', 'Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', '4 July 2013','2323', 'Pragmatic Bookshelf', 'edicion 2',  ['9781937785499', '1937785491'])

    end

    describe 'Citas de la APA' do
		it "Nombres invertidos " do
			expect(@fapa.nombre(@libro1)).to eq("Thomas,D.,Hunt,A. &Fowler,C.")
		end	
		it "Orden de entrada correcto" do
			@fapa.insertar(@libro1)
			@fapa.insertar(@libro3)
			expect(@fapa.nombre(@fapa.lista2[0])).to eq("Thomas,D.,Hunt,A. &Fowler,C.")
			expect(@fapa.nombre(@fapa.lista2[1])).to eq("Thomas,D.,Hunt,A. &Fowler,C.")
		end

		it "Ordena por fecha de publicacion (Cuando autor es el mismo)" do
			@fapa.insertar(@libro1)
			@fapa.insertar(@libro3)
			@fapa.insertar(@libro4)
			expect(@fapa.lista2[1].fechapublicacion).to eq('4 July 2013')
		end

		it "Si un autor aparece solo y el primero de un grupo (lse lista primero las entradas de un autor)." do
			@fapa.insertar(@libro1)
			@fapa.insertar(@libro3)
			expect(@fapa.nombre(@fapa.lista2[0])).to eq("Thomas,D.,Hunt,A. &Fowler,C.")
		end

		it "Mismos autores y el misma fecha de publicacion" do
			@fapa.insertar(@libro1)
			@fapa.insertar(@libro3)
			expect(@fapa.lista2[0].titulo).to eq("Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide")
		end

		it "Utilizar & en lugar de 'y' o de 'and'" do
			@fapa.insertar(@libro1)
			expect(@fapa.nombre(@fapa.lista2[0])).to eq("Thomas,D.,Hunt,A. &Fowler,C.")
		end
		it "Sangría Francesa" do
			@fapa.insertar(@libro1)
			expect(@fapa.imprimir(@libro1)).to eq("Thomas,D.,Hunt,A. &Fowler,C.\n   Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide\n   (2323)\n   Pragmatic Bookshelf; edition (4 July 2013)\n   1")
		end
	end


end