ActiveAdmin.register Attr do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
#

  form do |f|
    f.inputs do
      f.input :name
    end
    f.inputs do
      f.has_many :attribute_values, new_record:true do |a|
        a.input :val
      end
    end
   actions
  end


  show do
    attributes_table do
      row :name
      row :values do |attr|
        div do
          attr.attribute_values.each do |attr_value|
            div do
              attr_value.val
            end
          end
        end
      end
    end
  end


end
