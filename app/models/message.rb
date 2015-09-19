class Message < ActiveRecord::Base
    #名前は必須入力が20文字以内
    validates :name , length: { maximum:20 } , presence:true
    #内容は必須入力かつ2文字以上30文字以下
    validates :body , length: {minimum:2 , maximum:30 } , presence:true
    #年齢は18歳以上60歳以内大文字小文字を区別しない
    validates :age , inclusion: {in: 18..60} , presence:true, uniqueness: { case_sensitive: false }
end
