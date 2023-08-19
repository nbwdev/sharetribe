import React from 'react';
import classNames from 'classnames';

import css from './RoundButton.css';
import arrowLeft from './images/arrowLeft.svg';
import arrowRight from './images/arrowRight.svg';

export default function RoundButton({ diameter, content, className }) {
  return React.createElement('div', { className: classNames(className, css.roundButton), style: { height: diameter, width: diameter } }, content);
}

export const ArrowButton = ({ className, direction, isDisabled }) =>
React.createElement('div', {
    className: classNames(className, css.arrowButton, css.roundButton, { [css.disabled]: isDisabled }),
    dangerouslySetInnerHTML: {
      __html: direction === 'left' ? arrowLeft : arrowRight,
    },
  });
