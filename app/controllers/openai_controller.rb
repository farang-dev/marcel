class OpenaiController < ApplicationController
  def test_openai
    if request.post?
      if params[:prompt].present?
        @response = OpenaiService.new(build_prompt(params)).call
      end

      respond_to do |format|
        format.html { render partial: "openai_response" } # Check if the partial name is correct
        format.turbo_stream { render turbo_stream: turbo_stream.replace("openai-response", partial: "openai_response") }
      end
    else
      @response = nil
    end
  end

  private

  def build_prompt(params)
    to = params[:to]
    platform = params[:platform]
    tone = params[:tone]
    length = params[:length]
    who = params[:who]
    message = params[:message]

    "I am sending a message to #{to} whose name is #{who} on #{platform}. The tone of the message needs to be #{tone} and the length of the message is #{length}. In this message, I want to say #{message}."
  end
end
