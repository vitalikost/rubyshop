ActiveAdmin.register Order do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :name, :phone
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


  show do
    attributes_table do
      row :name
      row :phone


      @all_summ = 0
      row :item do
        table do
          tr do
            th do
              "Name"
            end
            th do
              "Price"
            end
            th do
              "Quantity"
            end

            th do
              "Summa"
            end

          end

          order.item_orders.each do |product|
            @product = Product.find(product.product_id)
            tr do
              td do
                @product.name
              end
              td do
                @product.price
              end

              td do
                product.quantity
              end
              @all_summ +=product.quantity*@product.price
              td do
                product.quantity*@product.price
              end
            end
          end
        end
      end

      row :summa       do
        @all_summ
      end

    end


    # active_admin_comments
  end


end