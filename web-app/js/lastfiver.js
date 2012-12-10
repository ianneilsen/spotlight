/**
 * Created .
 * User: ineilsen
 * Date: 12/10/12
 * Time: 3:11 PM
 * To change this template use File | Settings | File Templates.
 */
$(function() {
    $("ul.more").each(function() {
        $("li:gt(4)", this).hide();
        $("li:nth-child(5)", this).after("<li class='more'><a href='#'>More...</a></li>");
    });
    $("li.more a").live("click", function() {
        var li = $(this).parents("li:first");
        li.parent().children().show();
        li.remove();
        return false;
    });
});
