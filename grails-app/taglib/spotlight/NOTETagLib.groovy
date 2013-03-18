package spotlight

class NOTETagLib {

    def NOTE = {attrs, body ->
        out << "<div class=\"note\" style=\"border: 1px solid #F0C000;background-color: #FFFFCE;margin: 20px;padding: 0px 6px 0px 6px;\">"
        out << body()
        out << "</div>"
    }

}
