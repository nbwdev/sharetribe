import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';
import * as propTypeUtils from '../../../utils/PropTypes';
import { Image } from '../../../models/ImageModel';

import css from './Avatar.css';

export default function Avatar({ image, imageHeight, className, url, givenName, familyName, color }) {
  const displayName = [givenName, familyName].join(' ').trim();
  const initials = [givenName, familyName].filter((n) => typeof n === 'string')
    .map((n) => n.substring(0, 1))
    .join('');
  const height = imageHeight ? imageHeight : '100%';
  const imageEl = (image && image.url) ? React.createElement('img', {
    src: image.url,
    className: classNames('Avatar', className, css.avatar),
    style: { height },
    title: displayName,
    alt: displayName,
  }) : null;
  const textEl = React.createElement('div', {
    className: classNames('Avatar', className, css.textAvatar),
    style: { height, width: height, backgroundColor: color },
    title: displayName,
  }, initials);

  const displayEl = imageEl ? imageEl : textEl;

  return url ? React.createElement('a', { href: url, className: css.link }, [displayEl]) : displayEl;
}

const { string, instanceOf } = PropTypes;

Avatar.propTypes = {
  url: string,
  image: instanceOf(Image),
  imageHeight: string,
  className: propTypeUtils.className,
  givenName: string,
  familyName: string,
  color: string,
};
