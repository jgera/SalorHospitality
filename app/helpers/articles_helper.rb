module ArticlesHelper

  def add_ingredient_link(caption, frm)
    link_to_function caption do |page|
      ingredient = render(:partial => 'ingredient', :locals => { :frm => frm, :ingredient => Ingredient.new })
      page << %{
        var new_ingredient_id = "new_" + new Date().getTime();
        $('ingredients').insert({ bottom: '<tr id="' + new_ingredient_id + '">#{ escape_javascript ingredient }</tr>'.replace(/new_\\d+/g, new_ingredient_id) });
        function HighlightEffect(element){
          new Effect.Highlight(element,
            {
              startcolor: "#FFAAAA",
              endcolor: "#EEEEEE",
              restorecolor: "#EEEEEE",
              duration: 3
            }
          )
        }
        HighlightEffect($(new_ingredient_id));
      }
    end
  end

  def add_quantity_link(caption, frm)
    link_to_function caption do |page|
      quantity = render(:partial => 'quantity', :locals => { :frm => frm, :quantity => Quantity.new })
      page << %{
        var new_quantity_id = "new_" + new Date().getTime();
        $('quantities').insert({ bottom: '<tr id="' + new_quantity_id + '">#{ escape_javascript quantity }</tr>'.replace(/new_\\d+/g, new_quantity_id) });
        function HighlightEffect(element){
          new Effect.Highlight(element,
            {
              startcolor: "#FFAAAA",
              endcolor: "#EEEEEE",
              restorecolor: "#EEEEEE",
              duration: 3
            }
          )
        }
        HighlightEffect($(new_quantity_id));
      }
    end
  end

end
