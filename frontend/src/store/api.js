import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react';

export const api = createApi({
  reducerPath: 'api',
  baseQuery: fetchBaseQuery({
    baseUrl: '/api',
    // Attach JWT on every request — reads fresh from localStorage so login/logout
    // is reflected immediately without needing to recreate the client
    prepareHeaders: (headers) => {
      const token = localStorage.getItem('cad_token');
      if (token) headers.set('Authorization', `Bearer ${token}`);
      return headers;
    },
  }),
  tagTypes: ['Product', 'Part', 'Version'],
  endpoints: (builder) => ({

    // ── Products ─────────────────────────────────────────────────────────
    getProducts: builder.query({
      query: () => '/products',
      providesTags: ['Product'],
    }),
    getProduct: builder.query({
      query: (id) => `/products/${id}`,
      providesTags: (result, error, id) => [{ type: 'Product', id }],
    }),
    createProduct: builder.mutation({
      query: (data) => ({ url: '/products', method: 'POST', body: data }),
      invalidatesTags: ['Product'],
    }),
    // id is stripped from body — only name/description/sku reach the API
    updateProduct: builder.mutation({
      query: ({ id, ...data }) => ({ url: `/products/${id}`, method: 'PUT', body: data }),
      invalidatesTags: (result, error, { id }) => ['Product', { type: 'Product', id }],
    }),
    deleteProduct: builder.mutation({
      query: (id) => ({ url: `/products/${id}`, method: 'DELETE' }),
      invalidatesTags: ['Product'],
    }),

    // ── Parts ────────────────────────────────────────────────────────────
    getParts: builder.query({
      query: (productId) => `/parts/product/${productId}`,
      providesTags: (result, error, productId) => [{ type: 'Part', id: productId }],
    }),
    getPart: builder.query({
      query: (id) => `/parts/${id}`,
      providesTags: (result, error, id) => [{ type: 'Part', id }],
    }),
    createPart: builder.mutation({
      query: (data) => ({ url: '/parts', method: 'POST', body: data }),
      invalidatesTags: (result, error, arg) => [{ type: 'Part', id: arg.product }],
    }),
    // productId is used only for cache invalidation — not sent to the API
    updatePart: builder.mutation({
      query: ({ id, productId, ...data }) => ({ url: `/parts/${id}`, method: 'PUT', body: data }),
      invalidatesTags: (result, error, { productId }) => [{ type: 'Part', id: productId }],
    }),
    deletePart: builder.mutation({
      query: ({ id }) => ({ url: `/parts/${id}`, method: 'DELETE' }),
      invalidatesTags: (result, error, { productId }) => [{ type: 'Part', id: productId }],
    }),

    // ── GCode Versions ───────────────────────────────────────────────────
    getVersions: builder.query({
      query: (partId) => `/gcodes/part/${partId}`,
      providesTags: (result, error, partId) => [{ type: 'Version', id: partId }],
    }),
    // partId used only for cache invalidation
    updateVersionNotes: builder.mutation({
      query: ({ id, notes }) => ({ url: `/gcodes/${id}`, method: 'PUT', body: { notes } }),
      invalidatesTags: (result, error, { partId }) => [{ type: 'Version', id: partId }],
    }),
    deleteVersion: builder.mutation({
      query: ({ id }) => ({ url: `/gcodes/${id}`, method: 'DELETE' }),
      invalidatesTags: (result, error, { partId }) => [{ type: 'Version', id: partId }],
    }),
  }),
});

export const {
  useGetProductsQuery,
  useGetProductQuery,
  useCreateProductMutation,
  useUpdateProductMutation,
  useDeleteProductMutation,
  useGetPartsQuery,
  useGetPartQuery,
  useCreatePartMutation,
  useUpdatePartMutation,
  useDeletePartMutation,
  useGetVersionsQuery,
  useUpdateVersionNotesMutation,
  useDeleteVersionMutation,
} = api;
