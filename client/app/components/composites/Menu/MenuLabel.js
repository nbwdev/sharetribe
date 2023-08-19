import React, { Component } from 'react';
import PropTypes from 'prop-types';
import css from './Menu.css';
import hamburgerIcon from './images/hamburgerIcon.svg';

class MenuLabel extends Component {

  render() {
    const extraClasses = this.props.extraClasses ? this.props.extraClasses : '';
    return (
      React.createElement('div', {
        className: `MenuLabel ${css.menuLabel} ${extraClasses}`,
        ref: this.props.menuLabelRef,
      }, [
        React.createElement('span', {
          className: css.menuLabelIcon,
          dangerouslySetInnerHTML: {
            __html: hamburgerIcon,
          },
        }),
        this.props.name,
      ])
    );
  }
}

MenuLabel.propTypes = {
  extraClasses: PropTypes.string,
  name: PropTypes.string.isRequired,
  menuLabelRef: PropTypes.func.isRequired,
};

export default MenuLabel;
