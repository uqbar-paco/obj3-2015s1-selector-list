# obj3-2015s1-selector-list

Armar una clase `SelectorList` que entienda los siguientes mensajes
- `add_selector(a_selector)`, que agrega el selector a su lista.
- `select_responders(a_list)`, les llega una lista de objetos, tienen que devolver la sublista de los que entienden todos los selectores registrados en el SelectorList
- `select_selectors_for(an_object)`, les llega un objeto, tienen que devolver la sublista de los selectores registrados en el SelectorList, de los que entiende el objeto
- `values_for(an_object)`, les llega un objeto, tienen que devolver una lista con el resultado de enviarle cada mensaje que tengo en mi lista y que entiende el objeto

Ponele que tenemos las clases Perro con los métodos ladrido, velocidad, color_pelo y cuanto_come, Tortuga con los métodos edad, velocidad, dureza_caparazon y cuanto_come, y Auto con los métodos velocidad y cantidad_asientos.

Si hago
```ruby
slist = SelectorList.new.
slist.add_selector(:velocidad).
slist.add_selector(:cuanto_come).
fido = Perro.new.
pepa = Tortuga.new.
tutu = Auto.new.
slist2 = SelectorList.new.
slist2.add_selector(:size).
slist2.add_selector(:cuanto_come).
slist2.add_selector(:empty?).
```

entonces

```ruby
# me tiene que devolver la lista [fido,pepa], que son los únicos dos objetos 
# de la lista que entienden :velocidad y :cuanto_come.
slist.select_responders([fido,pepa,tutu,"hola",4]) 

# tiene que devolver [:velocidad, :cuanto_come].
slist.select_selectors_for(fido) 

# tiene que devolver [:velocidad].
slist.select_selectors_for(tutu) 

# tiene que devolver una lista vacía.
slist.select_selectors_for(4) 

# tiene que devolver [4,false], porque "hola".size = 4, "hola" no 
# entiende :cuanto_come, y "hola".empty? = false.
slist2.values_for("hola") 
```

Vale que consideren solamente selectores de mensajes sin parámetros.
