Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GMv-0003gb-0Q
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLy-0003NC-RD; Sat, 23 Jan 2021 05:41:16 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLt-00036w-9d; Sat, 23 Jan 2021 05:41:14 -0500
Received: by mail-pj1-x1036.google.com with SMTP id kx7so5394484pjb.2;
 Sat, 23 Jan 2021 02:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jl5yWzJQLZ/3iIKrZa05bEzfjs6tF2YDXsKTDBgwC7Q=;
 b=ghN7kRi9kaGtFlK+cuALRIlCAqzEcjLivXdPo+cGChUd1p46iS9i5VzfOfp74Qv3r0
 AhFwm+34hVff18neio7j6oJw916qvw0P3GTirXtKshhNwXBG7vAXRxClZZUuYicOQ1f5
 g/L3HZXa038S/2S1XzjrmuKmW2bthyl66Hzj2ApJSI6yfqn0uGeNAQrDEbS1Cqxg4FJW
 ub/ntjLuUsVoDBX7zAjqDWo4VT24xDhZB9boUU/4uoSpQZ9IA/aCgc5G7brOyoLBS2ah
 yM/UXiM5kuJO53ND9ptMjGjTo7RoLDexDKofLwWzDTkrxIMcTMzIRcxDmarz8Z++02AB
 hxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jl5yWzJQLZ/3iIKrZa05bEzfjs6tF2YDXsKTDBgwC7Q=;
 b=Web+adlQ0FLZ56g2ub0eZ3R0T0MhGD15FOGCT7ct2IntN165RgFldpc053TRl1lZyR
 jeCxd8/GTNyIpyPVuzT/q+ZAZ/f6ljVqaT7xtR3W2QTZmz6/lvH6MUTKwVT8y2CGz4TB
 BVaCtOjD3bMAlcztpbzKSbgedC5PMdKVzerQagIxODvGDX1aKnSJPO+haIjYz3vx4tDD
 CWNujkS3xwFBxkBg4PmjmRKlfBX4BzKHMhxk8kgP6E87PGy9oISCIeZ3f+069Ka8LS2t
 VxtL5LbS9Qji//jdwypj1e7UHCvukZpnEAKPmOZuOoWeqgoVvcJLd1EOEoKx00Ch/ThV
 MG8Q==
X-Gm-Message-State: AOAM532MTZ7QGn0v+vR+Kjl5t7THxnwP1ao8NrTstDbfP4pVQNA43xKF
 gLfTTZ37wS4MnvsqfAVLPoE=
X-Google-Smtp-Source: ABdhPJxJUqnWbMsNdRNK2hRDx5ZrDhCwdR8icitT1fPvXvqhewZSA8FJ2Y+0rbcX/yiVgljq/hVcHQ==
X-Received: by 2002:a17:90b:1a87:: with SMTP id
 ng7mr1236459pjb.211.1611398463901; 
 Sat, 23 Jan 2021 02:41:03 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:41:03 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 15/25] hw/sd: Introduce receive_ready() callback
Date: Sat, 23 Jan 2021 18:40:06 +0800
Message-Id: <20210123104016.17485-16-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Sat, 23 Jan 2021 10:41:22 -0000

From: Bin Meng <bin.meng@windriver.com>

At present there is a data_ready() callback for the SD data read
path. Let's add a receive_ready() for the SD data write path.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

(no changes since v1)

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
index 946036d87c..c99c0e93bb 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2037,6 +2037,11 @@ uint8_t sd_read_byte(SDState *sd)
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


