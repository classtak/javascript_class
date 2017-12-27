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

- RESTful API

- | METHOD    |                    역할                    |
  | --------- | :--------------------------------------: |
  | POST      |    POST를 통해 해당 URI를 요청하면 리소스를 생성합니다.     |
  | GET       | GET를 통해 해당 리소스를 조회합니다. 리소스를 조회하고 해당 도큐먼트에 대한 자세한 정보를 가져온다. |
  | PUT/PATCH |          PUT를 통해 해당 리소스를 수정합니다.          |
  | DELETE    |          DELETE를 통해 리소스를 삭제합니다.          |





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



# 20171227

### 로그인할때

- 비밀번호가 틀렸는지
- 지금 입력된 이메일이 존재하는지
  - 둘을 합쳐서 이메일이 존재하지 않거나 비밀번호가 틀렸습니다.

*Gemfile*

```ruby
[...]
# Password encryption
gem 'bcrypt', '~> 3.1.7'
[...]
```

*app/models/user.rb*

```ruby
class User < ActiveRecord::Base
  has_secure_password
  has_many :boards
end
```

*app/config/routes.rb*

```ruby
[...]
  # SIGN IN / UP / OUT
  # sign in
  get '/signin' => 'sessions#signin'
  post '/signin' => 'sessions#user_signin'

  # sign up
  get '/signup' => 'sessions#signup'
  post '/signup' => 'sessions#user_signup'

  # sign out
  delete '/signout' => 'sessions#signout'
[...]
```

*app/controllers/sessions_controller.rb*

```ruby
class SessionsController < ApplicationController

  def signin
    
  end

  def user_signin
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # flash[:notice] = "로그인에 성공!"
      redirect_to '/', notice: "로그인에 성공!"
    else
      # flash[:notice] = "등록되지 않은 이메일 이거나 비밀번호가 틀렸습니다."
      redirect_to '/signin', notice: "등록되지 않은 이메일 이거나 비밀번호가 틀렸습니다."
    end
  end

  def signup

  end

  def user_signup
    User.create(
      email: params[:email],
      password: params[:password],
      password_confirmation:
      		   params[:password_confirmation]
    )
    redirect_to '/signin'
  end

  def signout
    session.delete(:user_id)
    redirect_to '/', notice: "로그아웃 성공!"
  end
end

```

*app/controllers/application_controller.rb*

```ruby
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :user_signed_in?
  def current_user
    # 현재 로그인한 유저의 정보(객체)를 리턴
    if !session[:user_id].nil?
      @current_user = User.find(session[:user_id])
    end
    @current_user
  end

  def user_signed_in?
    # 메소드 명이 ?로 끝날 경우 리턴 값이 boolean
    # 로그인 한 경우 true, 아닐 경우 false
    !session[:user_id].nil?
  end

  def authenticate_user!
    # !(bang) 주의해야할 메소드입니다.
    # 로그인 하지 않은 경우에 로그인 페이지로 이동시킴
    if session[:user_id].nil?
      redirect_to '/signin', notice: "로그인이 필요해!"
    end
  end
end
```



#### Javascript

- 동적? 이미 서버로부터 받아온 HTML구조, 내용물을 사용자가/개발자가 원하는 형태로 바꿔준다.
- 이벤트? 사용자의 행동(클릭, 스크롤, 마우스 오버, submit, 키보드 입력 ....)
- HTML element? 이벤트 리스너를 설정할 HTML의 일부분
- (이벤트 핸들러)? 이벤트가 발생했을 때 그 처리를 담당하는 *실행함수*

```html
<태그명 속성명="속성값">Lorem Ipsum</태그명>
```



#### 자바스크립트로 페이지 동적으로 조정하기

- 이벤트

  1. HTML element 찾기

     - document.getElementById('id'): 1개(유일)
     - document.getElementsByClassName('class'): n개(배열)
     - document.getElementsByTagName('tag'): n개(배열)
     - document.querySelector('css selector'): 1개(제일 첫번째)
     - document.querySelectorAll('css selector'): n개(배열)

  2. Event Listener 설정하기

     - *HTML_element*.on이벤트명 = Handler (ex: document.onclick)
     - *HTML_element*.addEventListener('이벤트명', Handler)

  3. Event Handler 선언하기

     - 익명함수를 선언해서 사용함

     ```javascript
     document.addEventListener('click', function() {
       // 실행문
     })
     ```

#### 자바스크립트 함수 만들기

1. 함수 표현식

```javascript
var func1 = function() {
  // 실행문
}
```

2. 함수 선언식

```javascript
function func2() {
  // 실행문
}
```

##### 함수 선언시 주의해야할 점

- 함수 표현식으로 함수를 만들 경우, 반드시 선언하기 전에 사용할 수 없음
- [참고사이트](http://blog.xcoda.net/65)



# 20171228

### 오전

- 현재 로그인한 유저가 해당 글을 수정/삭제할 권한이 있는지
- 오늘 작성했던 `helper_method` 수정
- jquery 기본 (HTML selector가 어떻게 바뀌는지)

### 오후

- javascript/jquery를 이용해서 페이지 동적으로 수정하기
- 좋아요(모델링)
- 좋아요를 ajax로 구현하기(ajax 가장 기본)