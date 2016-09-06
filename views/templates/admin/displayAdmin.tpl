
<div class="panel col-lg-12">
  <form action="index.php?controller=AdminGoogleManyMarkers&token={$token}" method="post"  enctype="multipart/form-data">
      {if !empty($settingsCollection)} 
      <div class="col-md-12" style="background: #363A41;color: white;position: relative; border: 1px solid #c7d6db; border-radius: 15px; margin: 20px 0;padding: 20px;">
          <strong style="font-size: 22px; float: left;width: 100%;margin-bottom: 30px; "> 
                <img src="../modules/googlemanymarkers/logo.png" style="margin-right: 50px;"/> Settings 
            </strong>
        GOOGLE API KEY <br/>
        <input type="text" name="markersSettings[google_api_key]" value="{$settingsCollection[0]->option_value}" style="border: 2px solid #c12727;" /><br/>
        <p style="margin: 0px 0 20px 0;">You need to have one to make plugin works. You can generate key<a href="https://developers.google.com/maps/documentation/javascript/get-api-key" target="_blank">  here </a></p>
        Main zoom <br/>
        <input type="text" name="markersSettings[main_zoom]" value="{$settingsCollection[1]->option_value}"/><br/>
        Main map center <br/>
        <input type="text" name="markersSettings[main_map_center]" value="{$settingsCollection[2]->option_value}"/><br/>
        Map styles <br/>
        <textarea style="min-height: 160px;"type="text" name="markersSettings[map_styles]" >{$settingsCollection[3]->option_value}</textarea>
        <p style="margin: 5px 0 20px 0;"> You can generate your own style: <a href="https://snazzymaps.com/" target="_blank"> here </a> </p>
        Zoom after click <br/>
        <input type="text" name="markersSettings[zoom_after_click]" value="{$settingsCollection[4]->option_value}"/><br/>
        Marker image <br/>
        <input type="text" name="markersSettings[marker_image]" value="{$settingsCollection[5]->option_value}"/><br/>
        <input type="submit" value="save" name="markersSettings[submit]" class="btn btn-primary btn-large" style="float: right;padding: 10px 20px">
      </div>
      {/if}
      
      
    {if !empty($markerCollection)}
      {foreach from=$markerCollection key=k item=item}      
        <div class="col-md-12" style="position: relative; border: 1px solid #c7d6db; border-radius: 15px; margin: 20px 0;padding: 20px;">
            <strong style="font-size: 22px; float: left;width: 100%;margin-bottom: 30px;"> 
                <img src="../modules/googlemanymarkers/lib/img/marker.png" style="margin-right: 15px;"/>  Marker - {$item->marker_name}
            </strong>
            <a href="index.php?controller=AdminGoogleManyMarkers&token={$token}&marker[delete]={$item->id}" class="btn btn-large btn-danger" style="float: right;color: white;position: absolute; top: 20px; right: 20px;z-index:1;"> Delete marker </a>
            <div class="col-md-12">
                Marker Name  <br/>
                <input type="text" name="markerEdit[{$k}][marker_name]" value="{$item->marker_name}"/><br/>
                Street <br/>
                <input type="text" name="markerEdit[{$k}][street]" value="{$item->street}"/><br/>
                Postcode <br/>
                <input type="text" name="markerEdit[{$k}][postcode]" value="{$item->postcode}"/><br/>
                City  <br/>
                <input type="text" name="markerEdit[{$k}][city]" value="{$item->city}"/><br/>
                Phone  <br/>
                <input type="text" name="markerEdit[{$k}][phone]" value="{$item->phone}"/><br/>
                Latitude  <br/>
                <input type="text" name="markerEdit[{$k}][latitude]" value="{$item->latitude}"/><br/>
                Latitude  <br/>
                <input type="text" name="markerEdit[{$k}][longitude]" value="{$item->longitude}"/><br/>         
                URL  <br/>
                <input type="text" name="markerEdit[{$k}][url]" value="{$item->url}"/><br/>       
            
                <input type="submit" value="save" name="markerEdit[submit]" class="btn btn-primary btn-large" style="position: relative; float: left;padding: 10px 20px">
                <input type="hidden" name="markerEdit[{$k}][id]" value="{$item->id}"/>
            </div>
        </div>
    {/foreach}
    {/if}
        <div class="col-md-12" style="position: relative; border: 1px solid #c7d6db; border-radius: 15px;margin: 20px 0;padding: 20px;">
            <strong style="font-size: 22px; float: left;width: 100%;margin-bottom: 30px;"> 
                <img src="../modules/googlemanymarkers/lib/img/marker.png" style="margin-right: 15px;"/> 
                Add new marker 
            </strong> 
            <div class="col-md-12">
                Marker Name <br/>
                <input type="text" name="markerAddNew[marker_name]" /><br/>
                Street <br/>
                <input type="text" name="markerAddNew[street]" /><br/>
                Postcode <br/>
                <input type="text" name="markerAddNew[postcode]" /><br/>
                City <br/>
                <input type="text" name="markerAddNew[city]" /><br/>
                Phone  <br/>
                <input type="text" name="markerAddNew[phone]" /><br/>
                Latitude <br/>
                <input type="text" name="markerAddNew[latitude]" /><br/>
                Longitude <br/>
                <input type="text" name="markerAddNew[longitude]" /><br/>
                URL <br/>
                <input type="text" name="markerAddNew[url]" /><br/>
                
            <input type="submit" value="Add new Marker" name="markerAddNew[submit]" class="btn btn-primary btn-large" style="position:relative; float: right;padding: 10px 20px;">
            </div>
        </div>
</div>