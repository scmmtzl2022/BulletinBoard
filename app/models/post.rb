class Post < ApplicationRecord
  belongs_to :created_user, class_name: "User", foreign_key: "created_user_id"
  belongs_to :updated_user, class_name: "User", foreign_key: "updated_user_id"
  
  # confirmation
  attr_accessor :confirmation
  validates_acceptance_of :confirmation, :on => :create
  # soft-delete
  acts_as_paranoid

  require "csv"
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  def self.to_csv
    attributes = ["title", "description", "status"]    
    CSV.generate(headers: true) do |csv|
      csv << attributes    
      all.each do |post|
        csv << attributes.map{ |attr| post.send(attr) }
      end
    end
  end

  def self.import(file,created_user_id,updated_user_id)        
    CSV.foreach(file.path, headers: true,encoding:'iso-8859-1:utf-8',:quote_char => "|", header_converters: :symbol) do |row|            
        Post.create! row.to_hash.merge(created_user_id: created_user_id, updated_user_id: updated_user_id)
    end
  end
end
