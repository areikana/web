 class AddPasswordDigestToUsers < ActiveRecord::Migration[8.0]
    def change
      add_column :users, :password_digest, :string
    end
 end
user = User.new(email: "test@example.com", password: "secret123", password_confirmation: "secret123")
user.save