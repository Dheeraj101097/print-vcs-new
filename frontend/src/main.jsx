import React from 'react';
import ReactDOM from 'react-dom/client';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import App from './App';
import './index.css';

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      // Data is considered fresh for 3 minutes — navigating back to a list
      // page won't trigger a refetch unless the data is older than this
      staleTime: 3 * 60 * 1000,
      // Keep cached data for 5 minutes after a component unmounts
      gcTime: 5 * 60 * 1000,
      // Don't retry failed requests on the network (Render cold-start errors
      // would cause the UI to hang for 3x the timeout otherwise)
      retry: 1,
      refetchOnWindowFocus: false,
    },
  },
});

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <QueryClientProvider client={queryClient}>
      <App />
    </QueryClientProvider>
  </React.StrictMode>
);
