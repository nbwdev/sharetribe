import { Component } from 'react';
import PropTypes from 'prop-types';
import { default as React, useEffect, useState, useRef } from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import r, { div, a } from 'r-dom';
import Article from './Article';
import EditorJS from '@editorjs/editorjs';
import Header from '@editorjs/header'; 
import Undo from 'editorjs-undo';

import * as OnboardingGuideActions from '../../../actions/OnboardingGuideActions';
 
const DEFAULT_INITIAL_DATA = () => {
  return {
    "time": new Date().getTime(),
    "blocks": [
      {
        "type": "header",
        "data": {
          "text": "Add the text here",
          "level": 1
        }
      },
    ]
  }
}
 
const EDITOR_HOLDER_ID = 'editorjs';

const ArticleTextEditor = (props) => {

  const articleId = props.articleId;
  const editorId = "editorjs" + articleId;
  const [editor, setEditor] = useState("")

  useEffect(() => {
    editor === "" && setEditor(() => new EditorJS({
      holder: editorId,
      logLevel: "VERBOSE",
      placeholder: "Add the section text here",
  //     onReady: () => {
  //       // EditorJS fires this when it is initialised
  //       ejInstance.current = editor;
  //       new Undo( {editor} );
  //     },
  //     onChange: async () => {
  //       // will do something when the content changes
  //       // try to use this for the undo/redo later
  //       // see https://walkthrough.so/pblc/snKICMzxzedr/codelab-integrating-editor-js-into-your-react-application?sn=3 for the example this is from
  //     },
      autofocus: true,
      tools: { 
        header: Header, 
      }
    }))

  }, []);

  return (
    <div id={editorId}> </div>
  );
}

const mapStateToProps = function mapStateToProps(state) {
  return {
    data: state.editor_page_state,
    marketplaceContext: state.marketplaceContext,
    routes: state.routes,
  };
};

const mapDispatchToProps = function mapDispatchToProps(dispatch) {
  return { actions: bindActionCreators(OnboardingGuideActions, dispatch) };
};

export default connect(mapStateToProps, mapDispatchToProps)(ArticleTextEditor);
