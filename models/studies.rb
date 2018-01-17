# coding: utf-8

def get_studies
  # 受講している科目
  begin
    file = File.open('core/studies.txt','r') #プロジェクトルートからのパス
    studies = file.read().split("\n")
    file.close
  rescue => e
    return e
  end
  studies
end

def delete_study(study)
  # 受講している科目
  begin
    p study
    studies = get_studies
    p studies
    file = File.open('core/studies.txt', 'w') #プロジェクトルートからのパス
    studies = studies.delete(study) if studies.index(study) != nil #ほぼnilになることはない。
    p studies
    file.write(studies.join("\n"))
    file.close
  rescue => e
    return e
  end
end

def delete_all_study
  # 受講している科目
  begin
    file = File.open('core/studies.txt', 'w') #プロジェクトルートからのパス
    file.write('')
    file.close
  rescue => e
    return e
  end
end
