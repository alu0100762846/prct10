#encoding:utf-8
require './lib/bib/Bibliografia.rb'
require './lib/bib/lista.rb'
    
    
    
describe Bibliografia do    
  before :each do
        @biblio = Bibliografia.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"],"Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide", "(July 7, 2013)")
    end
     describe "una_Bibliografiagrafia" do
        it "Existe un método para obtener el listado de autores" do
            @biblio.autores.should eq(["Dave Thomas", "Andy Hunt", "Chad Fowler"])
        end
        it "Existe un método para obtener titulo" do
            @biblio.titulo.should eq("Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide")
        end    
        it "Existe un método para obtener una fecha de publicación" do
            @biblio.fechapublicacion.should eq("(July 7, 2013)")    
        end
    end
  
  context "# comparaciones entre diferentes Bibliografias" do
    before :each do
        
        @biblio9 = Bibliografia.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"],"Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide", "(July 7, 2013)")
        @other1 = Bibliografia.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"],"Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide", "(July 7, 2013)")
        @other2 = Bibliografia.new(["David Chelimsky, Dave Astels, Bryan Helmkamp, Dan North, Zach Dennis, Aslak Hellesoy"],"The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends (The Facets of Ruby).", "(December 25, 2010)")
  
    end
    
    it "La bibliografia Other1 es menor que la Other2" do
      expect(@other1 < @other2).to eq(true)
    end
    it "La bibbliografia Other1 es menor o igual que la Other2" do
      expect(@other1 <= @other2).to eq(true)
    end
    it "La bibliografia Other2 es mayor que la Other2" do
      expect(@other2 > @other1).to eq(true)
    end
    it "La bibliografia Other2 es mayor o igual que la Other1" do
      expect(@other2 >= @other1).to eq(true)
    end

    it "La bibliografia biblio9 es igual la other1" do
      expect(@biblio9 == @other1).to eq(true)
    end

    it "La bibliografia Other1 y la Other2 son distintas" do
      expect(@other1 == @other2).to eq(false)
    end

  end # context 
    
end     
    


describe Lista do
    before :all do
                             
        @biblio1 = Bibliografia.new(['Dave Thomas','Andy Hunt','Chad Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', 'July 7 2013')
        @biblio2 = Bibliografia.new('Scott Chacon', 'Pro Git 2009th Edition', 'August 27 2009')
        @biblio3 = Bibliografia.new(['David Flanagan','Yukihiro Matsumoto'], 'The Ruby Programming Language','February 4 2008')
        @biblio4 = Bibliografia.new(['David Chelimsky','Dave Astels','Bryan Helmkamp','Dan North','Zach Dennis','Aslak Hellesoy'], 'The RSpecBook: Behaviour Driven Development with RSpec, Cucumber, and Friends', 'December 25 2010')
        @biblio5 = Bibliografia.new('Richard E. Silverman','Git Pocket Guide', 'August 2 2013')
        
        
        @l1 = Lista.new()
        @l2 = Lista.new()
        @l3 = Lista.new()
        
    end
    describe "Se crea una Lista" do
        it "El nodo inicial es nulo" do
            expect(@l1.inicio).to eq(nil)
        end
        
        it "Tambien el nodo final es nulo" do
            expect(@l1.fin).to eq(nil)
        end
    
        it "Lista vacia" do
            expect(@l1.empty).to eq(true)
        end
    
        it "Insertar elemento al principio" do
            expect(@l2.insertar_i(@biblio1)).to eq(true)
        end
    
        it "Insertar elemento al final" do
            expect(@l2.insertar_f(@biblio1)).to eq(true)
        end
    
        it "Extraer un elemento del principio" do
            expect(@l2.insertar_i(@biblio1)).to eq(true)
            expect(@l2.extraer_i).to eq(@biblio1)
        end
    
        it "Extraer un elemento del final" do
            expect(@l2.insertar_f(@biblio2)).to eq(true)
            expect(@l2.extraer_f).to eq(@biblio2)
        end
        
    end
    describe "Mas de un elemento" do
        it "Insertar mas elementos en la Lista" do
            
            expect(@l3.insertar_f(@biblio1)).to eq(true)
            expect(@l3.insertar_f(@biblio2)).to eq(true)
            expect(@l3.insertar_f(@biblio3)).to eq(true)
            expect(@l3.insertar_f(@biblio4)).to eq(true)
            expect(@l3.insertar_f(@biblio5)).to eq(true)
        end
    
        it "Extraer mas elementos de la Lista" do
            
            expect(@l3.insertar_f(@biblio1)).to eq(true)
            expect(@l3.insertar_f(@biblio2)).to eq(true)
            expect(@l3.insertar_f(@biblio3)).to eq(true)
            expect(@l3.insertar_f(@biblio4)).to eq(true)
            expect(@l3.insertar_f(@biblio5)).to eq(true)
            
            expect(@l3.extraer_f).to eq(@biblio5)
            expect(@l3.extraer_f).to eq(@biblio4)
            expect(@l3.extraer_f).to eq(@biblio3)
            expect(@l3.extraer_f).to eq(@biblio2)
            expect(@l3.extraer_f).to eq(@biblio1)
        end
    end
    
    context "# haciendo el punto enumerable" do
    before :each do
        
        @biblio1 = Bibliografia.new(['Dave Thomas','Andy Hunt','Chad Fowler'], 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide', 'July 7 2013')
        @biblio2 = Bibliografia.new('Scott Chacon', 'Pro Git 2009th Edition', 'August 27 2009')
        @biblio3 = Bibliografia.new(['David Flanagan','Yukihiro Matsumoto'], 'The Ruby Programming Language','February 4 2008')
        @biblio4 = Bibliografia.new(['David Chelimsky','Dave Astels','Bryan Helmkamp','Dan North','Zach Dennis','Aslak Hellesoy'], 'The RSpecBook: Behaviour Driven Development with RSpec, Cucumber, and Friends', 'December 25 2010')
        @biblio5 = Bibliografia.new('Richard E. Silverman','Git Pocket Guide', 'August 2 2013')
        
        
        @l4 = Lista.new()
        @l5 = Lista.new()
        @l6 = Lista.new()
        
    end
    
        it "comprobrando el metodo all? con Bibliografia" do
          @l4.insertar_i(@biblio1)
          expect(@l4.all?).to eq(true)
        end 
        
        it 'Prueba del metodo all? con numeros' do
           @l5.insertar_f(1)
           @l5.insertar_f(2)
           @l5.insertar_f(3)
           @l5.insertar_f(4)
           expect(@l5.all?).to eq(true)
        end
        
        it "comprobrando el metodo all? con lista vacia" do
          expect(@l6.all?).to eq(true)
        end
        
        ########################################
        
        
        it "comprobrando el metodo any? con Bibliografia" do
          @l4.insertar_i(@biblio1)
          expect(@l4.any?).to eq(true)
        end 
        
        it 'Prueba del metodo any? con numeros' do
           @l5.insertar_f(1)
           @l5.insertar_f(2)
           @l5.insertar_f(3)
           @l5.insertar_f(4) 
           expect(@l5.any?).to eq(true)
        end
        
        #######################################
        
        
        it "Prueba del metodo collect" do
            @l4.insertar_f(2)
             expect(@l4.map{|i| i*i}).to eq([4])
             expect(@l4.collect{|i| i*i}).to eq([4])
       end
        
        it "comprobrando el metodo count" do
            @l5.insertar_f(1)
            @l5.insertar_f(8)
            @l5.insertar_f(0)
            @l5.insertar_f(5)
            @l5.insertar_f(9)
            @l5.insertar_f(2)
          expect(@l5.count).to eq(6)
        end
        
        it "comprobrando el metodo detect" do
            @l6.insertar_f(1)
            @l6.insertar_f(2)
            @l6.insertar_f(0)
            @l6.insertar_f(4)
            expect(@l6.detect {|i| i == 0}).to eq(0)
            expect(@l6.find {|i| i == 1}).to eq(1)
        end
        
        it "comprobrando drop" do
            @l6.insertar_f(1)
            @l6.insertar_f(2)
            @l6.insertar_f(3)
            @l6.insertar_f(4)
          expect(@l6.drop(1)).to eq([2,3,4])
        end
        
        it "comprobrando max " do
            @l4.insertar_f(1)
            @l4.insertar_f(3)
            expect(@l4.max).to eq(3)
        end
        
        it "comprobrando min " do
            @l4.insertar_f(1)
            @l4.insertar_f(3)
            expect(@l4.min).to eq(1)
        end
        
        it "comprobrando sort" do
            @l6.insertar_f(1)
            @l6.insertar_f(2)
            @l6.insertar_f(3)
            @l6.insertar_f(4)
            expect(@l6.sort).to eq([1,2,3,4])
        end
    end
end

describe Bibliografia do 
    before :each do 
        @libro_ =  Libro.new('(The Facets of Ruby)','Pragmatic Bookshelf','(July 7, 2013)',["ISBN-13: 978-1937785499","ISBN-10: 1937785491"])
        @art_revista_ = Art_revista.new('Cocina Facil',43,225)
        @art_periodico_ = Art_periodico.new('El Dia','Deportes',20)
        @doc_electronico_ = Doc_electronico.new('PDF','15MB')
    end

    describe "Herencia" do 
       
        it "Libro, clase hija de Bibliografia" do 
           expect(@libro_.is_a? Libro).to eq(true)
           expect(@libro_.kind_of? Bibliografia).to eq(true)
        end
        
        it "Art_revista, clase hija de Bibliografia" do 
           expect(@art_revista_.is_a? Art_revista).to eq(true)
           expect(@art_revista_.kind_of? Bibliografia).to eq(true)    
        end
        
        it "Art_periodico, clase hija de Bibliografia" do 
           expect(@art_periodico_.is_a? Art_periodico).to eq(true)
           expect(@art_periodico_.kind_of? Bibliografia).to eq(true)
        end       
       
        it "Doc_electronico, clase hija de Bibliografia" do 
           expect(@doc_electronico_.is_a? Doc_electronico).to eq(true)
           expect(@doc_electronico_.kind_of? Bibliografia).to eq(true)
        end       
    end
end



   