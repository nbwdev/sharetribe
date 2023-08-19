import React, { Component } from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

import { className } from '../../../utils/PropTypes';
import MenuItem from '../../elements/MenuItem/MenuItem';
import css from './Menu.css';

class MenuContent extends Component {

  constructor(props, context) {
    super(props, context);
    this.resolveElement = this.resolveElement.bind(this);
  }

  resolveElement(data, index) {
    if (data.type === 'menuitem') {
      return Object.assign({},
        { ContentComponent: MenuItem },
        { props: Object.assign({}, data, { index }) }
      );
    }
    return null;
  }

  render() {
    return (
      React.createElement('div', 
        {
          className: classNames('MenuContent', css.menuContent, this.props.className),
        }, [
          React.createElement('div', {
            className: css.menuContentArrowBelow,
            style: { left: this.props.arrowPosition },
          }),
          React.createElement('div', {
            className: css.menuContentArrowTop,
            style: { left: this.props.arrowPosition },
          }),
        ].concat(
          this.props.content.map((v, i) => {
            const elemData = this.resolveElement(v, i);
            return React.createElement(elemData.ContentComponent, elemData.props);
          })
        )
      )
    );
  }

}

const { arrayOf, bool, number, shape, string } = PropTypes;

MenuContent.propTypes = {
  content: arrayOf(
    shape({
      active: bool.isRequired,
      activeColor: string.isRequired,
      content: string.isRequired,
      href: string.isRequired,
      type: string.isRequired,
    })
  ).isRequired,
  arrowPosition: number.isRequired,
  className,
};

export default MenuContent;

