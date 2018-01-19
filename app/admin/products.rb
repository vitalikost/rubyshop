ActiveAdmin.register Product do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :name, :description, :price, :category_id, images: [], attribute_value_ids: []

 form html: { multipart: true } do |f|
   f.semantic_errors

   f.inputs do
     f.input :name
     f.input :category
     f.input :description
     f.input :price
     f.input :images, as: :file, input_html: { multiple: true }

     Attr.all.each do |property|

       f.label property.name
       f.input :attribute_values, :as => :check_boxes, collection: property.attribute_values
       end


   end

   actions
 end


 show do
   attributes_table do
     row :name
     row :category
     row :description
     row :price

     product.attribute_values.each do |attr_value|
       row attr_value.attr.name  do

         attr_value.name

       end
     end

     row :images do
       div do
         product.images.each do |image|
           div do
             image_tag(image)
           end
         end
       end
     end

   end
   # active_admin_comments
 end


 index do
   selectable_column
   id_column
   column :name
   column :category
   column :price
   column :description
   column :properties do |product|
     div do
       product.attribute_values.each do |attr_value|
         div do
          attr_value.attr.name + ":" + attr_value.name
         end
       end
     end
   end

   column :images do |product|
     div do
       image_tag(product.images[0] ? product.images[0].url(:thumb) : image_url('no-image.png'))
     end
   end
   actions
 end


#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
