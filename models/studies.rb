# coding: utf-8

def get_studies
  # 受講している科目を取得します。
  begin
    file = File.open('core/studies.txt','r') #プロジェクトルートからのパス
    studies = file.read().split("\n")
    file.close
  rescue => e
    return e
  end
  studies
end

def register_study(study)
  # 受講している科目の追加します。
  begin
    studies = get_studies
    file = File.open('core/studies.txt', 'a') #プロジェクトルートからのパス
    file.write(study+"\n") if studies.index(study) == nil #まだ登録されていない新規追加を行います。
    file.close
  rescue => e
    return e
  end
end

def delete_study(study)
  # 受講している科目を削除します。
  begin
    studies = get_studies
    p studies
    file = File.open('core/studies.txt', 'w') #プロジェクトルートからのパス
    p studies.index(study)
    studies.delete(study) if studies.index(study) != nil #ほぼnilになることはない。
    p studies
    #file.write(studies.join("\n"))
    file.close
  rescue => e
    return e
  end
end

def delete_all_study
  # 受講している科目を全て削除します。
  begin
    file = File.open('core/studies.txt', 'w') #プロジェクトルートからのパス
    file.write('')
    file.close
  rescue => e
    return e
  end
end
