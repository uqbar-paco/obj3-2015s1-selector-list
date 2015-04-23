require_relative '../lib/selector_list'

class Perro
  def ladrido; end
  def velocidad; end
  def color_pelo; end
  def cuanto_come; end
end

class Tortuga
  def edad; end
  def velocidad; end
  def dureza_caparazon; end
  def cuanto_come; end
end

class Auto
  def velocidad; end
  def cantidad_asientos; end
end

RSpec.describe 'SelectorList' do
  before(:each) do
    @slist = SelectorList.new
    @slist.add_selector(:velocidad)
    @slist.add_selector(:cuanto_come)

    @fido = Perro.new
    @pepa = Tortuga.new
    @tutu = Auto.new
  end

  it 'select_responders devuelve la sublista de los objetos dados que entienden todos los selectores registrados en el SelectorList' do
    expect(@slist.select_responders([@fido, @pepa, @tutu, 'hola', 4])).to eql([@fido, @pepa])
  end

  describe 'select_selectors_for devuelve la sublista de los selectores registrados en el SelectorList, de los que entiende el objeto' do
    it 'cuando hay alguno que coincide' do
      expect(@slist.select_selectors_for(@fido)).to eql([:velocidad, :cuanto_come])
    end

    it 'cuando ningun coincide' do
      expect(@slist.select_selectors_for(4)).to eql([])
    end
  end

  it 'values_for devuelve una lista con el resultado de enviarle cada mensaje que tengo en mi lista y que entiende el objeto' do
    slist2 = SelectorList.new
    slist2.add_selector(:size)
    slist2.add_selector(:cuanto_come)
    slist2.add_selector(:empty?)

    expect(slist2.values_for('hola')).to eql([4,false])
  end
end
