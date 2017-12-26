# 20171226

### 0. Gemfile

```ruby
# Bootstrap4 library
gem 'bootstrap', '~> 4.0.0.beta2.1'
# Generate fake data
gem 'faker'
# Easy Paginator
gem 'kaminari'
# show rails db
gem 'rails_db', group: :development
```

```shell
$ bundle install
```



### 1. CRUD 만들기

- model: `board`, `user`, `comment`

- contoller: `boards`, `sessions`, route: *[RESTful API](http://meetup.toast.com/posts/92)*, views

  - *app/controllers/boards_controller.rb*

    - CRUD
    - action: `index`, `show`, `new`, `create`, `edit`, `update`, `destroy`

  - *app/controller/sessions_controller.rb*

    - Session
    - action: `signin`, `user_signin`, `signup`, `user_signup`

  - *config/routes.rb*

    ```ruby
    Rails.application.routes.draw do
      # '/'
      root 'boards#index'
      # CRUD
      # C - new, create
      get '/boards/new' => 'boards#new' # new
      post '/boards' => 'boards#create' # create
      # R - index, show
      get '/boards' => 'boards#index' # index
      get '/boards/:id' => 'boards#show' # show
      # U - edit, update
      get '/boards/:id/edit' => 'boards#edit' # edit
      put '/boards/:id' => 'boards#update' # update
      # D - delete
      delete '/boards/:id' => 'boards#destroy' # destroy
    end

    ```

  - - `index.html.erb`, `show.html.erb`, `new.html.erb`, `edit.html.erb`

  - - 

- | METHOD |                    역할                    |
  | ------ | :--------------------------------------: |
  | POST   |    POST를 통해 해당 URI를 요청하면 리소스를 생성합니다.     |
  | GET    | GET를 통해 해당 리소스를 조회합니다. 리소스를 조회하고 해당 도큐먼트에 대한 자세한 정보를 가져온다. |
  | PUT    |          PUT를 통해 해당 리소스를 수정합니다.          |
  | DELETE |          DELETE를 통해 리소스를 삭제합니다.          |



### 2. jQuery 기본

- css Selector
- jQuery에 있는 기본 함수들 사용







## 실습

### *app/controllers/sessions_controller.rb*

```ruby
class SessionsController < ApplicationController
  def signin   
  end
  
  def user_signin   
  end
  
  def signup 
  end
  
  def user_signup 
  end
  
  def signout  
  end
end
```

