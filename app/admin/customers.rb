ActiveAdmin.register Customer do
  actions :all
  permit_params :full_name, :phone_number, :email_address, :notes, :image

  form do |f|
    f.inputs "Customer Details" do
      f.input :full_name
      f.input :phone_number
      f.input :email_address
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email_address
      row :notes
      row :image do |customer|
        if customer.image.attached?
          image_tag url_for(customer.image), class: "admin-image"
        else
          "No image available"
        end
      end  # Closing `end` for the `if` condition
    end  # Closing `end` for `attributes_table`
  end  # Closing `end` for `show`
end  # Closing `end` for `ActiveAdmin.register`