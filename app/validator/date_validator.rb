class DateValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    begin
      if value.kind_of?(Date)
        value = value.strftime("%Y-%m-%d")
      end
      
      if value.present?
        record.errors[attribute] << I18n.t('errors.messages.invalid_date_format') unless /\A\d{1,4}\-\d{1,2}\-\d{1,2}\Z/ =~ value
        puts("validate_each value.split")
        (y,m,d) = value.split('-')
        puts("validate_each Time.local")
        Time.local(y, m, d, 0, 0, 0)
      end
    rescue
      puts("validate_each rescue")
      record.errors[attribute] << I18n.t('errors.messages.invalid_date')
    end
  end
end