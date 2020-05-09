class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_books, through: :favorites
  has_many :book_comments, dependent: :destroy
  attachment :profile_image
  validates :name, presence: true, length: {maximum: 20, minimum: 2}
  validates :introduction, length: { maximum: 50 }
  def favorited_by?(book_id)
  	favorites.where(book_id: book_id).exists?
  end
end
