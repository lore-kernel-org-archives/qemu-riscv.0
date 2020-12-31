Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kuwAn-00081D-UR
	for mharc-qemu-riscv@gnu.org; Thu, 31 Dec 2020 06:31:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAj-0007tB-Iy; Thu, 31 Dec 2020 06:31:13 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAe-0007Kz-8e; Thu, 31 Dec 2020 06:31:13 -0500
Received: by mail-pf1-x42c.google.com with SMTP id h10so10190270pfo.9;
 Thu, 31 Dec 2020 03:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+MRQ94HqNQPfotzejyTazGvZctafoVB2L4SztQ4M9ow=;
 b=A+5KL/qQp+JrEavt6VofFwmYL8hSRgXaMqEpkN/iEdSQ8Cbu442JAj5LOOYKVhlPBJ
 mDvvVxVxdFP/X8Q6Gtk8qjpnCCd3aZZb+Doo003esU0EPuu/uAzsZ8DA/+wglXk6FPVv
 7pQ9rTrGdNt2m0X7+QQdzdecc37gz85UTmK0GaYeLeDUQuubqqjCXSMneqZm/bxgTdi5
 oED2q6DicFIu7JWEIvVdCnEp0Gl39PnHWNQRhq+G7V0CqiTmF612UXtatsCMCdK/jvPB
 A/yGqH3hPV89yYWOOgLPqeM/AdIK3uJq1lh2zROCyaEL81p+nwE1Ka5n0xx5X7qqSkZs
 NGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+MRQ94HqNQPfotzejyTazGvZctafoVB2L4SztQ4M9ow=;
 b=n/MVrtYeg/uoWdYzR1EenFt/SoZe4DT+yosST2F6yIZjA8n1BTWknng96IklmViiAX
 NLSOr0mGwVzncVj42GhvVWR0a4IE+ZVolMji49as3ubUAJf0V5JIgMo/A3yaviX58JOY
 l52zSHxr9ve8Ue+4xaKNBQbg0BEzgRk7SOzn0gHTzqhI29yoBB2gWWzmL4R/+Gc5K7eR
 iTG982beJZJyaVyUwBT/aDu38g7O8dl2RPKwruoo5HtTL5Hk4wwYZPcdtpIAXy41j81/
 T3/nOfByRtWiKjKmztv+HtbV8to4MyHoMJRkjKGhOXZ5Jh3TSxzAqwHC7unQCJQC9d+f
 FIug==
X-Gm-Message-State: AOAM532oFP6RLRsY8VVaunO+BJtc8xW2sB5XX6jtREnxv4vs7/g1dC9M
 hpczxcvnMd8St4ffh+tQU9k=
X-Google-Smtp-Source: ABdhPJy6XqcFmGXDv63ehn9ROdGwSdhgKDeCio+CzWSQLCH+bh6ZRGCC+CKG6qMdXiZCEoqZ1Ji1Dw==
X-Received: by 2002:a05:6a00:148d:b029:19d:9622:bf7 with SMTP id
 v13-20020a056a00148db029019d96220bf7mr52470016pfu.11.1609414265776; 
 Thu, 31 Dec 2020 03:31:05 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t23sm45957591pfc.0.2020.12.31.03.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 03:31:05 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 13/22] hw/sd: Introduce receive_ready() callback
Date: Thu, 31 Dec 2020 19:30:01 +0800
Message-Id: <20201231113010.27108-14-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201231113010.27108-1-bmeng.cn@gmail.com>
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Dec 2020 11:31:14 -0000

From: Bin Meng <bin.meng@windriver.com>

At present there is a data_ready() callback for the SD data read
path. Let's add a receive_ready() for the SD data write path.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 include/hw/sd/sd.h |  2 ++
 hw/sd/core.c       | 13 +++++++++++++
 hw/sd/sd.c         |  6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 05ef9b73e5..47360ba4ee 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -116,6 +116,7 @@ struct SDCardClass {
      * Return: byte value read
      */
     uint8_t (*read_byte)(SDState *sd);
+    bool (*receive_ready)(SDState *sd);
     bool (*data_ready)(SDState *sd);
     void (*set_voltage)(SDState *sd, uint16_t millivolts);
     uint8_t (*get_dat_lines)(SDState *sd);
@@ -187,6 +188,7 @@ void sdbus_write_data(SDBus *sdbus, const void *buf, size_t length);
  * Read multiple bytes of data on the data lines of a SD bus.
  */
 void sdbus_read_data(SDBus *sdbus, void *buf, size_t length);
+bool sdbus_receive_ready(SDBus *sd);
 bool sdbus_data_ready(SDBus *sd);
 bool sdbus_get_inserted(SDBus *sd);
 bool sdbus_get_readonly(SDBus *sd);
diff --git a/hw/sd/core.c b/hw/sd/core.c
index 08c93b5903..30ee62c510 100644
--- a/hw/sd/core.c
+++ b/hw/sd/core.c
@@ -160,6 +160,19 @@ void sdbus_read_data(SDBus *sdbus, void *buf, size_t length)
     }
 }
 
+bool sdbus_receive_ready(SDBus *sdbus)
+{
+    SDState *card = get_card(sdbus);
+
+    if (card) {
+        SDCardClass *sc = SD_CARD_GET_CLASS(card);
+
+        return sc->receive_ready(card);
+    }
+
+    return false;
+}
+
 bool sdbus_data_ready(SDBus *sdbus)
 {
     SDState *card = get_card(sdbus);
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 67e5f7c05d..f19e38625a 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2036,6 +2036,11 @@ uint8_t sd_read_byte(SDState *sd)
     return ret;
 }
 
+static bool sd_receive_ready(SDState *sd)
+{
+    return sd->state == sd_receivingdata_state;
+}
+
 static bool sd_data_ready(SDState *sd)
 {
     return sd->state == sd_sendingdata_state;
@@ -2147,6 +2152,7 @@ static void sd_class_init(ObjectClass *klass, void *data)
     sc->do_command = sd_do_command;
     sc->write_byte = sd_write_byte;
     sc->read_byte = sd_read_byte;
+    sc->receive_ready = sd_receive_ready;
     sc->data_ready = sd_data_ready;
     sc->enable = sd_enable;
     sc->get_inserted = sd_get_inserted;
-- 
2.25.1


