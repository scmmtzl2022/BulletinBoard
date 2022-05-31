# README
* Ruby version (3.0.4)
* Rails version (6.1.5.1)

# Gem Install
* run: bundle install
# DB migrate if you drop and create new datadase 
* bin/rails db:migrate RAILS_ENV=development 

 (or)

* rails db:migrate

# Project Setup
* delete or make comment these two lines in user.rb (temporarily)
    * belongs_to :created_user, class_name: 'User', foreign_key: 'created_user_id'
    * belongs_to :updated_user, class_name: 'User', foreign_key: 'updated_user_id'
* run: rails db:seed
* add these two lines back in user.rb
    * belongs_to :created_user, class_name: 'User', foreign_key: 'created_user_id'
    * belongs_to :updated_user, class_name: 'User', foreign_key: 'updated_user_id'

# Project Run
* run: rails s



