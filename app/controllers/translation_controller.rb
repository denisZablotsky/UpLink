class TranslationController < ApplicationController
  def translate
    result = service.new(translate_params[:word]).call

    render partial: 'shared/word', locals: { word: result }, layout: false, formats: [:html]
  end

  private

  def service
    ::Lingua::Translator
  end

  def translate_params
    params.permit(:word)
  end
end
