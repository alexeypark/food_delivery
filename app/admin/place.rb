ActiveAdmin.register Place do

  permit_params :name, :description, :image

  index do
    column :name
    column :description
    column :image do |ad|
      image_tag ad.image.url(:thumb)
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name # shows errors on :base
      f.input :description
      f.input :image, as: :file, hint: image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
