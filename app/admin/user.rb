ActiveAdmin.register User do

  permit_params :email, :password, :password_confirmation, :role, :address, :phone, :name
  actions :index, :show, :new, :create, :update, :edit

  index do
    column :name
    column :address
    column :phone
    column :email
    column :sign_in_count
    column :role
    actions
  end

  filter :email
  filter :name

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :address
      f.input :phone
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :radio, collection: {None: "none", Administrator: "admin"}
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
