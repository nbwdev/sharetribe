import { Component } from 'react';
import PropTypes from 'prop-types';
import { default as React, useEffect, useRef } from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import r, { div, a } from 'r-dom';
import Article from './Article';

import * as OnboardingGuideActions from '../../../actions/OnboardingGuideActions';
 
class ArticleEditPage extends Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
  }

  componentWillUnmount() {
  }

  render() {
    return (
        <div id="edit-article-page">
          <Article />
          <button id="save">Save</button>
        </div>
    );
  }
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

export default connect(mapStateToProps, mapDispatchToProps)(ArticleEditPage);
