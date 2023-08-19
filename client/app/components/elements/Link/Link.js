import React from 'react';
import PropTypes from 'prop-types';

import * as propTypeUtils from '../../../utils/PropTypes';
import * as variables from '../../../assets/styles/variables';

import css from './Link.css';
import classNames from 'classnames';

export default function Link({ href, className, customColor, openInNewTab, children }) {
  const color = customColor || variables['--customColorFallback'];

  return React.createElement('a', {
    className: classNames(className, { [css.link]: true }),
    href,
    style: { color },
    ...(openInNewTab ? { target: '_blank', rel: 'noreferrer' } : null),
  }, children);
}

const { string, bool } = PropTypes;

Link.propTypes = {
  href: string.isRequired,
  className: propTypeUtils.className,
  customColor: string,
  openInNewTab: bool,
  children: string.isRequired,
};
