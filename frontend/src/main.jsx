import React from 'react';
import ReactDOM from 'react-dom/client';
import { Provider } from 'react-redux';
import { SkeletonTheme } from 'react-loading-skeleton';
import 'react-loading-skeleton/dist/skeleton.css';
import { store } from './store/store';
import App from './App';
import './index.css';

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <Provider store={store}>
      {/* Skeleton colors match the app's --surface (#f5f2ec) palette */}
      <SkeletonTheme baseColor="#e8e4da" highlightColor="#f5f2ec">
        <App />
      </SkeletonTheme>
    </Provider>
  </React.StrictMode>
);
