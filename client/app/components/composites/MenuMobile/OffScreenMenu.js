import React, { Component } from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

import * as variables from '../../../assets/styles/variables';
import css from './MenuMobile.css';
import MenuSection from './MenuSection';
import LanguagesMobile from './LanguagesMobile';
import Avatar from '../../elements/Avatar/Avatar';
import AddNewListingButton from '../../elements/AddNewListingButton/AddNewListingButton';
import ShopButton from '../../elements/ShopButton/ShopButton';
import LoginLinks from '../../composites/LoginLinks/LoginLinks';

class OffScreenMenu extends Component {

  render() {
    const headerItemHeight = variables['--MobileMenu_offscreenHeaderItemHeight'];

    const avatarExtras = { imageHeight: headerItemHeight };
    const buttonExtrasNewPost = { className: css.offScreenHeaderNewListingButtonMobile, customColor: this.props.color };
    const buttonExtrasShop = { className: css.offScreenHeaderShopButtonMobile, customColor: this.props.color };
    const header = this.props.avatar ? [
      this.props.avatar ? React.createElement('div', { className: css.avatarSpacer }, React.createElement(Avatar, { ...this.props.avatar, ...avatarExtras })) : null,
    ] : [
      React.createElement(LoginLinks, this.props.loginLinks),
    ];
    const newButton = this.props.newListingButton ? React.createElement(AddNewListingButton, { ...this.props.newListingButton, ...buttonExtrasNewPost }) : null;
    const shopButton = this.props.shopButton ? React.createElement(ShopButton, { ...this.props.shopButton, ...buttonExtrasShop }) : null;
    const languagesMobile = this.props.languages ?
    React.createElement(LanguagesMobile, this.props.languages) : null;

    return React.createElement('div', {
      className: classNames('OffScreenMenu', css.offScreenMenu),
    }, React.createElement('div', {
      className: classNames('OffScreenMenu_scrollpane', css.scrollPane),
    }, [
      React.createElement('div', {
        className: classNames('OffScreenMenu_header', css.offScreenHeader),
      }, header),
      React.createElement('div', {
        className: classNames('OffScreenMenu_header', css.offScreenHeader),
      }, newButton, shopButton),
      React.createElement('div', {
        className: classNames('OffScreenMenu_header', css.offScreenHeader),
      }, shopButton),
      React.createElement('div', {
        className: classNames('OffScreenMenu_main', css.offScreenMain),
      }, [
        React.createElement(MenuSection, {
          name: this.props.menuLinksTitle,
          color: this.props.color,
          links: this.props.menuLinks,
        }),
        React.createElement(MenuSection, {
          name: this.props.userLinksTitle,
          color: this.props.color,
          links: this.props.userLinks,
        }),
      ]),
      React.createElement('div', {
        className: classNames('OffScreenMenu_footer', css.offScreenFooter),
      }, languagesMobile),
    ]));
  }
}

const { arrayOf, bool, node, object, oneOfType, shape, string } = PropTypes;

OffScreenMenu.propTypes = {
  color: string.isRequired,
  isOpen: bool.isRequired,
  menuLinksTitle: string.isRequired,
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
  userLinksTitle: string.isRequired,
  userLinks: arrayOf(
    shape({
      active: bool.isRequired,
      activeColor: string.isRequired,
      content: oneOfType([
        arrayOf(node),
        node,
      ]).isRequired,
      href: string.isRequired,
      type: string.isRequired,
    })
  ),
  languages: shape({
    name: string.isRequired,
    color: string.isRequired,
    links: arrayOf(
      shape({
        active: bool.isRequired,
        activeColor: string.isRequired,
        content: string.isRequired,
        href: string.isRequired,
      })),
  }),
  avatar: object, // eslint-disable-line react/forbid-prop-types
  newListingButton: object, // eslint-disable-line react/forbid-prop-types
  shopButton: object, // eslint-disable-line react/forbid-prop-types
  loginLinks: object, // eslint-disable-line react/forbid-prop-types
};

export default OffScreenMenu;
