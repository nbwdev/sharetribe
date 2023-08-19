import PropTypes from 'prop-types';
import useState from "react";
import ArticleTextEditor from './ArticleTextEditor';

/*
This only holds the state & ability to edit an article.
Things like the save button etc go into ArticleEditPage.
Components:
article title
list of article sections
new section placeholder

State:
Published or not
creation date
modified date

*/

function Title() {

    return (
        <input type="text" placeholder="Article Title" />  
    );
}

function Section({ id, type, content}) {

    return(
        <div className="section" id={id}>
            <p>Type is {type}</p>
            <p>Content is {content}</p>
            <ArticleTextEditor articleId={id} />
        </div>
    );

}

function NewSectionPlaceholder() {

    return(
        <div className="new-section">
            <a href="#">Add a section</a>
        </div>
    );
}

const Article = (props) => {

    var sections = SECTIONS;

    const sectionList = [].concat(sections)
        .sort((a,b) => a.id > b.id ? 1 : -1)
        .map((section) => 
            <li key={section.id}>
                <Section id={section.id} type={section.type} content={section.content} />
            </li>
        );

    return(
        <div id="Article">
            <Title />
            <ol id="article-sections">
                {sectionList}
            </ol>
            <NewSectionPlaceholder />
        </div>
    );
}


Article.prototypes = {
    blah: PropTypes.string,
}


// TEMP till I read data from the controller
const SECTIONS = [
    {id: "1", type:"textOnly", content:"hello"},
    {id: "2", type:"textOnly", content:"goodbye"}
];

export default Article;