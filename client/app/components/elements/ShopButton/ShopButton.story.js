import withProps from '../../Styleguide/withProps';

import ShopButton from './ShopButton';

const { storiesOf } = storybookFacade;

storiesOf('Top bar')
  .add('ShopButton: default color', () => (
    withProps(ShopButton, {
      text: 'Shop',
      url: '/s',
    })))
  .add('ShopButton: custom color', () => (
    withProps(ShopButton, {
      text: 'Some long text from translations here',
      url: '/s',
      customColor: 'red',
    })));
