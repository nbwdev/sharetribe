import { Provider } from 'react-redux';
import middleware from 'redux-thunk';
import { combineReducers, applyMiddleware, createStore } from 'redux';
import reducers from '../reducers/reducersIndex';

import { initialize as initializeI18n } from '../utils/i18n';
import ArticleEditPage from '../components/sections/ArticleEditor/ArticleEditPage';
import React from 'react';

export default (props) => {
  const locale = props.i18n.locale;
  const defaultLocale = props.i18n.defaultLocale;

  initializeI18n(locale, defaultLocale, process.env.NODE_ENV);

  const combinedReducer = combineReducers(reducers);
  const initialStoreState = {};

  const combinedProps = {
    // Load from the server?
    initialStoreState,
    blahXXX: "blahYYY",
  };

  const store = applyMiddleware(middleware)(createStore)(combinedReducer, combinedProps);


  // return r(Provider, { store }, [
  //   r(ArticleEditPage, combinedProps),
  // ]);
  return(
    <Provider store={store}>
      <ArticleEditPage />
    </Provider>
  );
};
