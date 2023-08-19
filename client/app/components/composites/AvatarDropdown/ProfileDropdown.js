import React, { Component } from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

import css from './ProfileDropdown.css';
import inboxEmptyIcon from './images/inboxEmptyIcon.svg';
import profileIcon from './images/profileIcon.svg';
import settingsIcon from './images/settingsIcon.svg';
import listingsIcon from './images/listingsIcon.svg';
import { className } from '../../../utils/PropTypes';

const actionProps = function actionProps(action) {
  return (typeof action) === 'function' ?
    { onClick: action } :
    { href: action };
};

const ProfileActionCard = function ProfileActionCard({ icon, label, action, notificationCount }) {
  const notificationCountInArray = notificationCount > 0 ? [React.createElement('span', { className: css.notificationCount }, notificationCount)] : [];
  return React.createElement('a', { ...actionProps(action), className: css.profileAction }, [
    React.createElement('div', { className: css.profileActionIconWrapper }, [
      React.createElement('div', { className: css.profileActionIcon, dangerouslySetInnerHTML: { __html: icon } }),
    ].concat(notificationCountInArray)),
    React.createElement('div', { className: css.profileActionLabel }, label),
  ]);
};

const eitherStringOrFunc = PropTypes.oneOfType([
  PropTypes.string,
  PropTypes.func,
]);

ProfileActionCard.propTypes = {
  icon: PropTypes.string.isRequired,
  label: PropTypes.string.isRequired,
  action: eitherStringOrFunc.isRequired,
  notificationCount: PropTypes.number,
};

class ProfileDropdown extends Component {
  render() {
    return React.createElement('div', {
      className: classNames(this.props.classNames),
      ref: this.props.profileDropdownRef,
    }, [
      React.createElement('div', { className: css.rootArrowTop }),
      React.createElement('div', { className: css.rootArrowBelow }),
      React.createElement('div', { className: css.box }, [
        React.createElement('div', { className: css.profileActions }, [
          React.createElement(ProfileActionCard, { label: this.props.translations.inbox, icon: inboxEmptyIcon, action: this.props.actions.inboxAction, notificationCount: this.props.notificationCount }),
          React.createElement(ProfileActionCard, { label: this.props.translations.listings, icon: listingsIcon, action: this.props.actions.listingsAction }),
          React.createElement(ProfileActionCard, { label: this.props.translations.profile, icon: profileIcon, action: this.props.actions.profileAction }),
          React.createElement(ProfileActionCard, { label: this.props.translations.settings, icon: settingsIcon, action: this.props.actions.settingsAction }),
        ]),
        React.createElement('div', { className: css.logoutArea }, [
          this.props.isAdmin ? React.createElement('a', {
            className: css.adminLink,
            style: { color: this.props.customColor },
            ...actionProps(this.props.actions.adminDashboardAction),
          }, this.props.translations.adminDashboard) : null,
          React.createElement('a', {
            className: css.logoutLink,
            ...actionProps(this.props.actions.logoutAction),
          }, this.props.translations.logout),
        ]),
      ]),
    ]);
  }
}

ProfileDropdown.propTypes = {
  actions: PropTypes.shape({
    inboxAction: eitherStringOrFunc.isRequired,
    listingsAction: eitherStringOrFunc.isRequired,
    profileAction: eitherStringOrFunc.isRequired,
    settingsAction: eitherStringOrFunc.isRequired,
    adminDashboardAction: eitherStringOrFunc.isRequired,
    logoutAction: eitherStringOrFunc.isRequired,
  }).isRequired,
  translations: PropTypes.shape({
    inbox: PropTypes.string.isRequired,
    listings: PropTypes.string.isRequired,
    profile: PropTypes.string.isRequired,
    settings: PropTypes.string.isRequired,
    adminDashboard: PropTypes.string.isRequired,
    logout: PropTypes.string.isRequired,
  }),
  customColor: PropTypes.string.isRequired,
  isAdmin: PropTypes.bool.isRequired,
  classNames: PropTypes.arrayOf(className).isRequired,
  notificationCount: PropTypes.number,
  profileDropdownRef: PropTypes.func.isRequired,
};

export default ProfileDropdown;
