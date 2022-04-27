class Api::V1::ResumesController < Api::V1::BaseController
    def like
        resume = Resume.published.friendly.find(params[:id])
        message = "no action"

        if not current_user.favorite_resumes.exists?(resume.id)
          current_user.favorite_resumes << resume
          message = "added"
        end

        render json: { message: message }
      end
    
      def unlike
        resume = Resume.published.friendly.find(params[:id])
        message = "no action"
        
        if current_user.favorite_resumes.exists?(resume.id)
          current_user.favorite_resumes.destroy(resume)
          message = "removed"
        end
        render json: { message: message }
      end
end
