


webView.setWebViewClient(new WebViewClient(){
@SuppressLint("NewApi")
@Override
public WebResourceResponse shouldInterceptRequest(WebView view,WebResourceRequest request){
        if(request!=null&&request.getUrl()!=null&&request.getMethod().equalsIgnoreCase("get")){
        String scheme=request.getUrl().getScheme().trim();
        if(scheme.equalsIgnoreCase("http")||scheme.equalsIgnoreCase("https")){
        try{
        URL url=new URL(injectIsParams(request.getUrl().toString()));
        URLConnection connection=url.openConnection();
        return new WebResourceResponse(connection.getContentType(),connection.getHeaderField("encoding"),connection.getInputStream());
        }catch(MalformedURLException e){
        e.printStackTrace();
        }catch(IOException e){
        e.printStackTrace();
        }
        }
        }
        return null;
        }
@Override
public WebResourceResponse shouldInterceptRequest(WebView view,String url){
        if(!TextUtils.isEmpty(url)&&Uri.parse(url).getScheme()!=null){
        String scheme=Uri.parse(url).getScheme().trim();
        if(scheme.equalsIgnoreCase("http")||scheme.equalsIgnoreCase("https")){
        try{
        URL url=new URL(injectIsParams(request.getUrl().toString()));
        URLConnection connection=url.openConnection();
        return new WebResourceResponse(connection.getContentType(),connection.getHeaderField("encoding"),connection.getInputStream());
        }catch(MalformedURLException e){
        e.printStackTrace();
        }catch(IOException e){
        e.printStackTrace();
        }
        }
        }
        return null;
        }
        });