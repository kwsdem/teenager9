# Copyright (c) 2015, @sudharti(Sudharsanan Muralidharan)
# Socify is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  acts_as_voter
  acts_as_follower
  acts_as_followable

  acts_as_messageable

  belongs_to :user

  Benchmark.bmbm do |results|
    
  end

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy 
  has_many :events, dependent: :destroy 
  has_many :users, dependent: :destroy

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover, AvatarUploader

  validates_presence_of :name
  validates_presence_of :content
  validates_presence_of :user
  validates_presence_of :avatar
  validates_presence_of :cover

  self.per_page = 10

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
