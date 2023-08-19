import React, { Component } from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

import { className } from '../../../utils/PropTypes';

import css from './MenuMobile.css';
import OffScreenMenu from './OffScreenMenu';
import MenuLabelMobile from './MenuLabelMobile';
import NotificationBadge from '../../elements/NotificationBadge/NotificationBadge';

class MenuMobile extends Component {

  constructor(props, context) {
    super(props, context);

    this.handleClick = this.handleClick.bind(this);
    this.closeMenu = this.closeMenu.bind(this);
    this.state = {
      isOpen: false,
    };
  }

  handleClick() {
    this.setState({ isOpen: !this.state.isOpen });// eslint-disable-line react/no-set-state
  }

  closeMenu() {
    this.setState({ isOpen: false });// eslint-disable-line react/no-set-state
  }

  render() {
    // Ugly, but only way to make the page beneath not scroll
    if (typeof document === 'object' && document.body) {
      if (this.state.isOpen) {
        if (!document.body.classList.contains(css.menuMobileOpen)) {
          document.body.classList.add(css.menuMobileOpen);
        }
      } else if (document.body.classList.contains(css.menuMobileOpen)) {
        document.body.classList.remove(css.menuMobileOpen);
      }
    }

    const overlayColor = this.props.color ? this.props.color : 'black';
    const openClass = this.state.isOpen ? css.canvasOpen : '';
    const extraClasses = this.props.extraClasses ? this.props.extraClasses : '';
    const notificationBadgeInArray = this.props.notificationCount > 0 ?
      [React.createElement(NotificationBadge, { className: css.notificationBadge }, this.props.notificationCount)] :
      [];
    return React.createElement('div', {
      className: classNames(this.props.className, 'MenuMobile', css.menuMobile, extraClasses, openClass),
      tabIndex: 0,
    }, [
      React.createElement('div', {
        style: { backgroundColor: overlayColor },
        onClick: this.closeMenu,
        className: `MenuMobile_overlay ${css.overlay}`,
      }),
      React.createElement(MenuLabelMobile, {
        name: this.props.name,
        handleClick: this.handleClick,
      }, notificationBadgeInArray),
      React.createElement(OffScreenMenu, {
        toggleOpen: this.closeMenu,
        isOpen: this.state.isOpen,
        color: overlayColor,
        menuLinksTitle: this.props.menuLinksTitle,
        menuLinks: this.props.menuLinks,
        userLinksTitle: this.props.userLinksTitle,
        userLinks: this.props.userLinks,
        languages: this.props.languages,
        avatar: this.props.avatar,
        newListingButton: this.props.newListingButton,
        shopButton: this.props.shopButton,
        loginLinks: this.props.loginLinks,
      }),
    ]);
  }
}

const { arrayOf, bool, node, number, object, oneOfType, shape, string } = PropTypes;

MenuMobile.propTypes = {
  name: string.isRequired,
  extraClasses: string,
  identifier: string.isRequired,
  color: string,
  menuLinksTitle: string,
  menuLinks: arrayOf(
    shape({
      active: bool.isRequired,
      activeColor: string.isRequired,
      content: string.isRequired,
      href: string.isRequired,
      type: string.isRequired,
      external: bool,
    })
  ).isRequired,
  userLinksTitle: string,
  userLinks: arrayOf(
    PropTypes.shape({
      active: bool.isRequired,
      activeColor: string.isRequired,
      content: oneOfType([
        PropTypes.arrayOf(node),
        node,
      ]).isRequired,
      href: string.isRequired,
      type: string.isRequired,
    })
  ),
  languages: PropTypes.shape({
    name: PropTypes.string.isRequired,
    color: PropTypes.string.isRequired,
    links: PropTypes.arrayOf(
      PropTypes.shape({
        active: PropTypes.bool.isRequired,
        activeColor: PropTypes.string.isRequired,
        content: PropTypes.string.isRequired,
        href: PropTypes.string.isRequired,
      })),
  }),
  className,
  avatar: object, // eslint-disable-line react/forbid-prop-types
  newListingButton: object, // eslint-disable-line react/forbid-prop-types
  shopButton: object, // eslint-disable-line react/forbid-prop-types
  loginLinks: object, // eslint-disable-line react/forbid-prop-types
  notificationCount: number,
};

export default MenuMobile;
