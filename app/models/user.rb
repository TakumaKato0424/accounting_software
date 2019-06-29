class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]
  


  # enum gender: { unknown: 0, male: 1, female: 2, other: 9 }

  # # ユーザー名による絞り込み
  # scope :get_by_name, ->(name) {
  #   where("name like ?", "%#{name}%")
  # }
  # # 性別による絞り込み
  # scope :get_by_gender, ->(gender) {
  #   where(gender: gender)
  # }
  # # 画像の保存設定
  # has_attached_file :image,
  # styles: { medium: "300x300>", thumb: "200x200>" },
  # path: "#{Rails.root}/public/system/:class/image/:id.:style.:extension",
  # url: "/system/:class/image/:id.:style.:extension"

  # validates_attachment_content_type :image, content_type: /image/

  # Google認証結果を取得
  def self.find_for_google_oauth2(auth)
    account = User.where(email: auth.info.email).first
  
    # アカウントが登録されていなければ登録
    unless account
      # ユーザー情報を作成する
      # user = User.create(nickname: auth.info.name)
      # アカウント情報を作成する
      account = User.create(
        nickname: auth.info.name,
        family_name: "森脇",
        first_name: "啓太",
        family_name_kana: "ﾓﾘﾜｷ",
        first_name_kana: "ｹｲﾀ",
        provider: auth.provider,
        uid: auth.uid,
        email: auth.info.email,
        token: auth.credentials.token,
        password: Devise.friendly_token[0, 20])
    end
    account
  end
end
