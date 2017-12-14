#Board

1. get '/' {} : index.erb
  - 지금까지 써진 모든 글을 보여준다.
  - '글쓰기' 링크가 있고 -> '/new'

2. get '/new' {} : new.erb
  - 새로운 글을 쓸 수 있는 <form>, title, content, author -> '/create'

3. get '/create' {} :
  - new에서 보내준 정보를 바탕으로 Post.create()
  - Post
   * attributes(:id, :title, :content, :author, :created_at)
  - redirect -> '/'

4. 로그인 가능하게
  - 1. 회원가입 'signup' -> 'register'
  - 2. 로그인 'login' -> 'login_session'
  - 3. 로그인이 되어 있으면, :author => 로그인 된 유저의 email
  - 4. 로그인이 되어 있지 않으면, :author => "익명"

5. 삭제기능 만들기
  - 삭제시 사용되는 method는 .destroy
  - Variable Routing : 라우팅인데 변수 개념을 사용한다. -> 'URI + /:'
  - URI의 뒤에 아무런 값이 와도 가져오는 '/:' -> Variable Routing
  - params[:000] 를 사용해 값을 가져올 수 있다.
  - 이때 ':'를 사용한다. 이름은 Symbol
  - 평소 params[] 사용시 ""대신 :를 사용할 수 있다. 하지만 반대는 안됨
  - Variable Routing에서 params에 ""를 사용할 수 없다.

6. 수정하기
  - 글 목록에서 수정 버튼을 누르면 해당 아이디를 가져온다 (Variable Routing 사용)
  - 해당 아이디 DB에서 찾고 불러온다.
  - 불러온 내용을 수정한다.
  - 변경 내용을 다시 DB에 넣어준다. 이때 id를 기준으로 넣어주어야 DB전체의 내용이 바뀌지않고 해당 내용만 변경 된다.


7. Symbol

  - ' : ' + ' symbol_name ' 로 사용한다.
  - 고유하게 만들어서 사용하고 싶을 때
  - 해시의 경우 키 + 값인데 이때 키는 고유해야한다. 그렇기 때문에 해시의 키값은 Symbol을 사용한다.
  - :key => "value"   & key: "value"  
  - 위 둘은 같은 의미이다. 로켓사인(=>)을 사용할 경우 앞에 처럼 아닐 경우는 뒤처럼 사용하면 된다.
  - 보통은 뒤에 있는 것을 많이 사용한다.


8. Before Filter
  - app.rb : before -> get
