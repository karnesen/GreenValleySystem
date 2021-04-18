<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="systemAnalytics.aspx.cs" Inherits="GreenValleySystem.systemAnalytics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script type='text/javascript' src='https://code.jquery.com/jquery-1.11.0.js'></script>
    <script type='text/javascript' src="https://rawgit.com/RobinHerbots/jquery.inputmask/3.x/dist/jquery.inputmask.bundle.js"></script>
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" />
</head>
<body>

    
    <form id="form1" runat="server">
        <div class="card">
            
            <div class='tableauPlaceholder' id='viz1618779381606' style='position: relative'>
                            <asp:Button ID="btnHome" runat="server" class="btn btn-primary btn-block mb-3" Text="Return to Home Page" OnClick="btnHome_Click" />
                            <h2>Hover your cursor over visualizations to see more data</h2>
                <noscript>
                    <a href='#'>
                        <img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Gr&#47;GreenValleyWorkbook&#47;StorageLocations&#47;1_rss.png' style='border: none' />

                    </a>

                </noscript>
                <object class='tableauViz'  style='display:none;'>
                    <param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' />
                    <param name='embed_code_version' value='3' />
                    <param name='site_root' value='' />
                    <param name='name' value='GreenValleyWorkbook&#47;StorageLocations' />
                    <param name='tabs' value='yes' />
                    <param name='toolbar' value='yes' />
                    <param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Gr&#47;GreenValleyWorkbook&#47;StorageLocations&#47;1.png' />
                    <param name='animate_transition' value='yes' />
                    <param name='display_static_image' value='yes' />
                    <param name='display_spinner' value='yes' />
                    <param name='display_overlay' value='yes' />
                    <param name='display_count' value='yes' />
                    <param name='language' value='en' />
                    <param name='filter' value='publish=yes' />
                </object>

            </div>                
            <script type='text/javascript'>                 
                var divElement = document.getElementById('viz1618779381606');
                var vizElement = divElement.getElementsByTagName('object')[0];
                vizElement.style.width = '100%';
                vizElement.style.height = (divElement.offsetWidth * 0.75) + 'px';
                var scriptElement = document.createElement('script');
                scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';
                vizElement.parentNode.insertBefore(scriptElement, vizElement);                

            </script>

        </div>
    </form>
</body>
</html>
