class CommentsController < ApplicationController
  # def create
  #   @comment = Comment.new(comment_params)
  # end



 #  


  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = session[:user_id]
    # @comment.post_id = params[:id]
    if @comment.save
    	flash[:notice] = "nice comment."
    else
    	fash[:notice] = "Comment wasn't saved."
    end
    redirect_to post_path(@post)
  end

  def delete
  end

  # private 
  #  def comment_params
  #       params.require(:comment).permit(:user_id, :post_id, :body)
  #  end
end

# <h2>Comments</h2>
# <% @post.comments.each do |comment|%>
#   <%=comment.body %>
#   Commnent by:
#   <br>
#   <br>
#   <br>
#   <%=comment.user.username%>
# <% end %>
# <br><br>


# <%=form_for @comment.new do |t| %>

#   <%=t.label :body %>
#   <%=t.text_area :body %>
#   <%=t.submit%>
# <% end %>
