class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '指定なし' },
    { id: 2, name: '自社開発' },
    { id: 3, name: 'SES' },
    { id: 4, name: '受託開発(Sler)' }
  ]
end
