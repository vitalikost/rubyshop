ActiveAdmin.register Order do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :name, :phone, :status
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
      row :email
      row :comment
      row :status

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
          @all_summ = 0
          order.item_orders.each do |product|
            @product = Product.find(product.product_id)
            tr do
              td do
                #@product.name
                link_to @product.name, admin_product_path(@product)
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

      row :summa_order do
        b do
          @all_summ
        end

      end

    end


    # active_admin_comments
  end


end
