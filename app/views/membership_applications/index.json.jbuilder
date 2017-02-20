json.array!(@membership_applications) do |membership_application|
  json.extract! membership_application, :id, :address, :postal_code, :phone, :occupation, :company_name, :company_address, :company_postal_code, :company_phone, :membership, :first_sponsor_name, :second_sponsor_name, :user_id
  json.url membership_application_url(membership_application, format: :json)
end
