class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :access_token, :first_name, :last_name, :name

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
