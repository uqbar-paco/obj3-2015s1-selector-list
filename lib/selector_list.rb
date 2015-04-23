# Armar una clase SelectorList que entienda los siguientes mensajes
# - addSelector(aSelector), que agrega el selector a su lista.
# - selectResponders(aList), les llega una lista de objetos, tienen que devolver la sublista de los que entienden todos los selectores registrados en el SelectorList
# - selectSelectorsFor(anObject), les llega un objeto, tienen que devolver la sublista de los selectores registrados en el SelectorList, de los que entiende el objeto
# - valuesFor(anObject), les llega un objeto, tienen que devolver una lista con el resultado de enviarle cada mensaje que tengo en mi lista y que entiende el objeto

class SelectorList
  def initialize
    @selectors = Array.new
  end

  def add_selector(a_selector)
    @selectors.push(a_selector)
  end

  def select_responders(a_list)
    a_list.select { |objeto|
      @selectors.all? { |selector| objeto.respond_to? selector }
    }
  end

  def select_selectors_for(an_object)
    an_object.methods & @selectors
  end
end
