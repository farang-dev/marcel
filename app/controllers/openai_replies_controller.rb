class OpenaiRepliesController < ApplicationController
    def test_openai_reply
      if request.post?
        if params[:to].present? && params[:platform].present? && params[:tone].present? && params[:length].present? && params[:reply].present? && params[:message].present?
          prompt = build_prompt(params)
          @response = OpenaiService.new(prompt).call
        else
          @response = "Please fill in all the fields."
        end
        redirect_to response_page_path(response: CGI.escape(@response))
      end
    end

    def response_page
      @response = CGI.unescape(params[:response]) if params[:response].present?
    end

    private

    def build_prompt(params)
      to = params[:to]
      platform = params[:platform]
      tone = params[:tone]
      length = params[:length]
      reply = params[:reply]
      message = params[:message]

      prompt_text = "I am replying to this message: #{reply} on #{platform}. The tone of the message needs to be #{tone} and the length of the message is #{length}. In this message, I want to say #{message} to this person. Write a response/reply based on these information"

      Rails.logger.debug("Built prompt: #{prompt_text}")

      prompt_text
    end
end
