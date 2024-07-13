#!/bin/bash
#起動時
echo "パスワードマネージャーへようこそ！"
while true; do
 echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
 read choices
#選択肢による処理分岐
#Add password 入力時
 case $choices in
  "Add Password")
   echo "サービス名を入力してください："
   read service_name
   echo "ユーザー名を入力してください："
   read user_name
   echo "パスワードを入力してください："
   read -s password
#入力が完了した場合
   echo "パスワードの追加は成功しました。"  
#入力されたパスワードの保存
   echo "$service_name:$user_name:$password" >> password-store.txt
   ;;
#get password 入力時
  "Get Password")
   echo "サービス名を入力してください："
   read service_name
#パスワードの取得
   password=$(grep "^$service_name:" password-store.txt | cut -d: -f3)
   if [ -z "$password" ]; then
## サービス名が保存されていなかった場合
    echo "そのサービスは登録されていません。"
## サービス名が保存されていた場合
   else
    user_name=$(grep "^$service_name:" password-store.txt | cut -d: -f2)
    echo "サービス名：$service_name"
    echo "ユーザー名：$user_name"
    echo "パスワード：$password"
    fi
    ;;
#Exit入力時
  "Exit")
    echo "Thank you!"
    break
    ;;
#Add Password/Get Password/Exit 以外が入力された場合   
  *)
    echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
    ;;
 esac
done