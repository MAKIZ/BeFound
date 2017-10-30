# BeFound
A web app helping find missing person/s

[screenshot coming soon]

#### Description
Everyday in social media or when i walk in the street there is always a post or a flyer looking for their missing loveones and they need help. Its hard to find a great app that is user friendly and up to date to find missing person/s. Thats why i decided to make this app. even though its not yet 100% complete as im still in the beginning of my career as a web developer i will continue to improve this app as i grow my skills as a web developer.

### List of Technoligies use
- HTML
- CSS
- Javascript
- Bootstrap
- Ruby on Rails

### Code Snippet
database - Active Record
```rb
  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "session_token"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_token"], name: "index_users_on_session_token"
    t.index ["username"], name: "index_users_on_username"
  end
```
The Model 
```rb
class User < ApplicationRecord
  PASSWORD_LENGTH = (6..25)
  USERNAME_LENGTH = (5..15)

  validates_presence_of :username
  validates :username, length: USERNAME_LENGTH, uniqueness: true

  validates :password, length: PASSWORD_LENGTH, allow_nil: true

  has_many :posts

  attr_reader :password

  def self.find_from_credentials(username, password)
    user = find_by(username: username)
    return nil unless user
    user if user.is_password?(password)
  end
```

The View
```rb
  <%= render "layouts/nav_user" %>
  <div class="container pt-4">
  <h3>Users</h3>

  <ul>
    <% @users.each do |user| %>
      <li>
        <%= link_to user.username, user_path(user) %>
      </li>
      <% end %>
  </ul>
  </div>
```

The Controller
```rb
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(create_params)

    if @user.save
      sign_in(@user)
      flash[:notice] = 'You are now sign in!'
      redirect_to users_path
    else
      flash[:error] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
```



My Stretch Goals
- Update the User Experience
- Update the User Interface
- Make the search by categories
- 
