class Gender < ActiveHash::Base
  self.data = [
      {id: 1, name: '男の子'}, 
      {id: 2, name: '女の子'}, 
      {id: 3, name: '不明'}
  ]
end