import _ from 'lodash';
import React from 'react';

import { initialize as initializeI18n } from '../utils/i18n';
import Topbar from '../components/sections/Topbar/Topbar';
import { Image } from '../models/ImageModel';
import { subset } from '../utils/routes';

export default (props) => {
  const locale = props.i18n.locale;
  const defaultLocale = props.i18n.defaultLocale;

  initializeI18n(locale, defaultLocale, process.env.NODE_ENV);

  const routes = subset([
    'new_listing',
    'person_inbox',
    'person',
    'person_settings',
    'logout',
    'admin2',
    'login',
    'sign_up',
    'listings_person_settings',
  ], { locale });

  const avatarImage = _.get(props, 'avatarDropdown.avatar.image.url');
  const avatarImageRecord = avatarImage ? new Image({
    type: ':thumb',
    url: avatarImage,
  }) : null;

  _.set(props, 'avatarDropdown.avatar.image', avatarImageRecord);

  const combinedProps = Object.assign({}, props, { routes });
  return React.createElement(Topbar, combinedProps);
};
