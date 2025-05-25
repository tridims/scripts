#!/bin/bash

# This is a script to scrape the videos from kodekloud.com
# The script uses pup and yt-dlp to scrape the videos

set -e

url='https://kodekloud.com/topic/mysql/'
cookie='cookie: cookiesModal=Set; _fbp=fb.1.1713092134738.1394479350; wp_automatewoo_visitor_625e25a3e0a285c253f1159732a1bafb=h0za0lxnw9c4z9qzekkk; sbjs_migrations=1418474375998%3D1; sbjs_current_add=fd%3D2024-04-14%2010%3A55%3A47%7C%7C%7Cep%3Dhttps%3A%2F%2Fkodekloud.com%2Fdashboard%2F%3Fslogin%3D1%7C%7C%7Crf%3Dhttps%3A%2F%2Fkodekloud.com%2F; sbjs_first_add=fd%3D2024-04-14%2010%3A55%3A47%7C%7C%7Cep%3Dhttps%3A%2F%2Fkodekloud.com%2Fdashboard%2F%3Fslogin%3D1%7C%7C%7Crf%3Dhttps%3A%2F%2Fkodekloud.com%2F; sbjs_current=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cmtke%3D%28none%29; sbjs_first=typ%3Dtypein%7C%7C%7Csrc%3D%28direct%29%7C%7C%7Cmdm%3D%28none%29%7C%7C%7Ccmp%3D%28none%29%7C%7C%7Ccnt%3D%28none%29%7C%7C%7Cid%3D%28none%29%7C%7C%7Ctrm%3D%28none%29%7C%7C%7Cmtke%3D%28none%29; _first_interaction_lab=tracked; _first_interaction_video=tracked; PHPSESSID=baa351e2c406ef4c0ba9880f9e534447; aelia_customer_country=NL; wp_automatewoo_session_started=1; learndash-video-progress-b366c8ff4a231cac07fad21bd953c176={%22video_time%22:269%2C%22video_state%22:%22pause%22%2C%22video_duration%22:273}; learndash-video-progress-6b5f7898e0c4084a694da095deb6866b={%22video_time%22:420%2C%22video_state%22:%22pause%22%2C%22video_duration%22:420}; learndash-video-progress-223cb7515b77315d39e1404aeda4a9b4={%22video_time%22:377%2C%22video_state%22:%22pause%22%2C%22video_duration%22:377}; learndash-video-progress-dc31f40221696f3cb0b4e954c465d535={%22video_time%22:344%2C%22video_state%22:%22pause%22%2C%22video_duration%22:344}; learndash-video-progress-fe23f7d3334bd7a8795afdeadd632692={%22video_time%22:676%2C%22video_state%22:%22play%22%2C%22video_duration%22:692}; learndash-video-progress-06b81a3e6c2ca144fdbd4f23f4c97f9c={%22video_time%22:4%2C%22video_state%22:%22play%22%2C%22video_duration%22:849}; learndash-video-progress-e4ff640d2a56a61378a2b7ec1a057fc1={%22video_time%22:135%2C%22video_state%22:%22play%22%2C%22video_duration%22:427}; learndash-video-progress-1f8e263e6d83144dc9c39be006958d7e={%22video_time%22:43%2C%22video_state%22:%22pause%22%2C%22video_duration%22:827}; learndash-video-progress-262ba7283a9b19e48b20a5ccede11ac4={%22video_time%22:0%2C%22video_state%22:%22%22}; learndash-video-progress-2b05a497ba7cf4b0390c40cd47f068fc={%22video_time%22:0%2C%22video_state%22:%22%22}; learndash-video-progress-aafc54b45ba979adc13f66b05b1a1a16={%22video_time%22:0%2C%22video_state%22:%22%22}; learndash-video-progress-caa802fdfeec38797c93150f8b15448f={%22video_time%22:735%2C%22video_state%22:%22pause%22%2C%22video_duration%22:805}; learndash-video-progress-b506eae894bc27d7f77aa85cb7f8ecc7={%22video_time%22:67%2C%22video_state%22:%22play%22%2C%22video_duration%22:70}; learndash-video-progress-fe48bd6dcd3b3b3b363b42e7146a30cf={%22video_time%22:123%2C%22video_state%22:%22play%22%2C%22video_duration%22:413}; learndash-video-progress-6d5e2e54cce145db8f40bd90b07133e0={%22video_time%22:5%2C%22video_state%22:%22play%22%2C%22video_duration%22:333}; kk_logged_in=1; wordpress_logged_in_625e25a3e0a285c253f1159732a1bafb=Arshy%7C1714740340%7Cx1o9YQroxT80dn1qZ8cVLprExKfslvfnDFxLWZV3QZG%7C747d1abc0e2f193fe3c9c18216a946a6c09dcd3b21f85f1fa7ee7c23f7413597; kk_user_access_level=0; bbtheme=dark; learndash-video-progress-286c5e9eda953fdf5f223acc7117ab54={%22video_time%22:5%2C%22video_state%22:%22play%22%2C%22video_duration%22:609}; learndash-video-progress-b3759387a30128361a2fc3edf378ce3a={%22video_time%22:170%2C%22video_state%22:%22play%22%2C%22video_duration%22:891}; learndash-video-progress-635a55876c6f5dc0e6a8d43d45b12ccf={%22video_time%22:3%2C%22video_state%22:%22play%22%2C%22video_duration%22:322}; learndash-video-progress-c424e0eee70542abd36a07f70afa9483={%22video_time%22:162%2C%22video_state%22:%22play%22%2C%22video_duration%22:183}; learndash-video-progress-093a3ac1d716a5b9a923e1187af02ada={%22video_time%22:16%2C%22video_state%22:%22play%22%2C%22video_duration%22:545}; learndash-video-progress-ee497de0ada950ca8bc42e7c11768710={%22video_time%22:3%2C%22video_state%22:%22play%22%2C%22video_duration%22:593}; learndash-video-progress-5f986a2db426def312a75eeb32a840f5={%22video_time%22:801%2C%22video_state%22:%22play%22%2C%22video_duration%22:1127}; learndash-video-progress-b06374447d07219b276fd9b24734c05c={%22video_time%22:20%2C%22video_state%22:%22play%22%2C%22video_duration%22:1148}; aelia_cs_selected_currency=USD; learndash-video-progress-86dbb0ab78c01f37cad9e2d06f7e76e7={%22video_time%22:50%2C%22video_state%22:%22pause%22%2C%22video_duration%22:334}; sbjs_udata=vst%3D6%7C%7C%7Cuip%3D%28none%29%7C%7C%7Cuag%3DMozilla%2F5.0%20%28X11%3B%20Linux%20x86_64%29%20AppleWebKit%2F537.36%20%28KHTML%2C%20like%20Gecko%29%20Chrome%2F124.0.0.0%20Safari%2F537.36; learndash-video-progress-67e5249f9c8208657eecacfd5db2b733={%22video_time%22:0%2C%22video_state%22:%22pause%22%2C%22video_duration%22:130}; cf_clearance=gIZ4q.4DHRaxJtzb2d4_zgh40wrqCm4gY4OTpyEiR5A-1713630490-1.0.1.1-OKlP5JMsLSt5fwA8AwDCtXWAeAqMhOfG.p27_p.3KHmLKlsoOCuHwbUTo8nE4v2ALucZXuLXTtKAM0zDBM4Wyg; scroll=null; sbjs_session=pgs%3D15%7C%7C%7Ccpg%3Dhttps%3A%2F%2Fkodekloud.com%2Fcourses%2Fcertified-kubernetes-administrator-cka%2F'

pages=$(curl "$url" \
    -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
    -H 'accept-language: en-US,en;q=0.9' \
    -H 'cache-control: max-age=0' \
    -H "$cookie" \
    -H 'priority: u=0, i' \
    -H 'referer: https://kodekloud.com/courses/certified-kubernetes-application-developer-ckad/' \
    -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
    -H 'sec-ch-ua-mobile: ?0' \
    -H 'sec-ch-ua-platform: "Linux"' \
    -H 'sec-fetch-dest: document' \
    -H 'sec-fetch-mode: navigate' \
    -H 'sec-fetch-site: same-origin' \
    -H 'sec-fetch-user: ?1' \
    -H 'upgrade-insecure-requests: 1' \
    -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36')

number_of_items=$(echo $pages | pup "li.lms-lesson-item json{}" | jq 'length')
current_dir=$(pwd)
echo "Number of items: $number_of_items"
echo "Saving in $current_dir"

# loop through the items 1 until the number of items (both inclusive)
for i in $(seq 1 $number_of_items); do
    data=$(echo $pages | pup "li.lms-lesson-item:nth-child($i)")
    title=$(echo $data | pup "a.bb-lesson-head Mattr{title}" | tr ' ' '_')
    download_links=$(echo $data | pup "a.flex.bb-title.bb-lms-title-wrap attr{href}")

    echo "Downloading topic : $title"
    mkdir -p $title
    cd "$current_dir/$title"

    # loop through the download links
    counter=0
    for link in $download_links; do
        is_video=$(echo $data | pup "a.flex.bb-title.bb-lms-title-wrap[href=$link] i.bb-icon-play-thin")

        # if the is_video is not empty, then it is a video. if not print debug that it's not a video then skip
        if [ -z "$is_video" ]; then
            echo "Skipping $link as it is not a video"
            continue
        fi

        echo "Downloading $link"
        # download the file
        yt-dlp $link \
            --add-header 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
            --add-header 'accept-language: en-US,en;q=0.9' \
            --add-header 'cache-control: max-age=0' \
            --add-header "$cookie" \
            --add-header 'priority: u=0, i' \
            --add-header 'referer: https://kodekloud.com/courses/certified-kubernetes-application-developer-ckad/' \
            --add-header 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
            --add-header 'sec-ch-ua-mobile: ?0' \
            --add-header 'sec-ch-ua-platform: "Linux"' \
            --add-header 'sec-fetch-dest: document' \
            --add-header 'sec-fetch-mode: navigate' \
            --add-header 'sec-fetch-site: same-origin' \
            --add-header 'sec-fetch-user: ?1' \
            --add-header 'upgrade-insecure-requests: 1' \
            --add-header 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' &

        counter=$((counter + 1))
        if [ $counter -eq 4 ]; then
            wait
            counter=0
        fi
    done

    wait

    cd "$current_dir"

done
