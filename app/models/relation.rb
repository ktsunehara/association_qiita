class Relation < ApplicationRecord
    belongs_to :following, class_name: "User"
    belongs_to :follower, class_name: "User"
    # relationは元々Usermodel同志。で区別するために、「class_name」メソッドを使って
    # 上のように記述する。belongs_to :変更したいモデル名, class_name: "User"文字列モデル名
    # "変更したいモデル名の所はカラム名と合わせると自動取得してくれて便利"

end
