package com.goblinstic.cleaningschool.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * packageName : com.goblinstic.cleaningschool.utils
 * fileName : SystemUtils
 * author : goodhyoju
 * date : 2022/04/27 4:22 PM
 * description :
 */

@Slf4j
@Component
public class SystemUtils {
    /**
     *
     * @return
     */
    public String getServerIp() {

        InetAddress local = null;
        try {
            local = InetAddress.getLocalHost();
        }
        catch ( UnknownHostException e ) {
            log.error(e.getMessage());
        }

        if( local == null ) {
            return "";
        }
        else {
            String ip = local.getHostAddress();
            return ip;
        }

    }
}
