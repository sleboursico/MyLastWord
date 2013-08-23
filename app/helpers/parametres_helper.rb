module ParametresHelper

  def date_prochain_rappel(date)
    case current_user.frequence_cd
      when 0 ; return l(current_user.dateDerniereValidation + 48.days)
      when 1 ; return l(current_user.dateDerniereValidation + 1.month )
    end

  end
end
