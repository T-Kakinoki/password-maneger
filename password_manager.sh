#!/bin/bash
#起動時
echo "パスワードマネージャーへようこそ！"
echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
 read choices
#Add password 入力時
 case $choices in
 "Add Password")
  echo "パスワードマネージャーへようこそ！"
  echo "サービス名を入力してください："
  read service_name
  echo "ユーザー名を入力してください："
  read user_name
  echo "パスワードを入力してください："
  read password
# 入力が完了したら
  echo "パスワードの追加は成功しました。"  
#入力されたパスワードの保存
  echo "$service_name:$user_name:$password" >> password-store.txt
  ;;
#get password 入力時
 "Get Password")
  echo "サービス名を入力してください："
## サービス名が保存されていなかった場合
   echo "そのサービスは登録されていません。"
## サービス名が保存されていた場合
   echo "サービス名："
   echo "ユーザー名："
   echo "パスワード："
   ;;
#Exit入力時
 "Exit")
   echo "Thank you!"
   ;;
# Add Password/Get Password/Exit 以外が入力された場合   
 *)
   echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
   ;;
 esac
