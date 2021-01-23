Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3GLy-0003Mm-Nw
	for mharc-qemu-riscv@gnu.org; Sat, 23 Jan 2021 05:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLl-0003Cz-98; Sat, 23 Jan 2021 05:41:01 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3GLi-000337-Bx; Sat, 23 Jan 2021 05:41:00 -0500
Received: by mail-pg1-x529.google.com with SMTP id i7so5589077pgc.8;
 Sat, 23 Jan 2021 02:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nsH7YqqMFOy7hdEwufb73pDrnrkdgOcAfpojWeKqt3c=;
 b=iq9CZHAuRbn3CNUxdjBj0JW2zddyl4gEvYpdANKGGun9fBaKP/W9RmDQL0zTdpt9cH
 YQo/Cs+3BV1c+mwNXXeROmI7C7+pEeof+4KciUwJMywYVS05627WL77uR9JDbRUsOFxs
 B/dAdL93Eit+nuyEYFbdyEBZgk9qjrQfyu5VduiJM5Vnn5O+0bcA4ozE8599+mR40Wi2
 oW0hH7b3qLUftA1fzBO/Z0qKfsweHT9AbZOAj+stlmI+CaP//MrDX+SZR8WMDY6s/aoc
 qL/RVc6PSAW/456ZiwanEXbovU2K23e7yxg2G9qnOxHTuZnwXRZOGyZ6Y/AFERzcCmjn
 m+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nsH7YqqMFOy7hdEwufb73pDrnrkdgOcAfpojWeKqt3c=;
 b=hoijNytXeJD0FqYMlMfsp0/iVMoAXQvZ5NI2UVPw1oD4v2v2U1f4ZTB1+V9gHiYpk4
 4+tfwIMrAGp4rjbYqL4b69LOvt/qsfTjNzvGeWJQ3hCHbJQ0qzT6tZ69Nt/h65JPYNMX
 ifcUPmy90TcClHBEtUyLm8Tz1JL5e+CA85xCW+GBZDxggCoQEx4Q0lurA1D0/G7vPnbS
 OhkKscYy8bnFnmy5NQZFci8bs24hVhrkxQN/UVLiiS4tzneQ80qojgyzELj620/q1cAV
 IzNnUdVnkj+ERFobJ00fkesjrv7pCq3zpXN61Rv9XwY5/0rbB74KJ4dvOiaSpeUyQWYj
 wfBQ==
X-Gm-Message-State: AOAM531W4TnJLvfb70Lz1x2OF6qhJFlOvaGH0FwdFMm83AmFF7IGHkHf
 21beyspsx1hrkmq29uX/tas=
X-Google-Smtp-Source: ABdhPJzjZvrCPWUixEsMBEZfIGr4VS3yRKEtrb+cgdpHbwAPu3wBIjMuZ3NgcHcJOd3ipcm4350SNg==
X-Received: by 2002:aa7:909a:0:b029:1bc:22d3:9e58 with SMTP id
 i26-20020aa7909a0000b02901bc22d39e58mr9321746pfa.29.1611398455832; 
 Sat, 23 Jan 2021 02:40:55 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id a5sm10575463pgl.41.2021.01.23.02.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 02:40:55 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 12/25] hw/sd: sd: Remove duplicated codes in
 single/multiple block read/write
Date: Sat, 23 Jan 2021 18:40:03 +0800
Message-Id: <20210123104016.17485-13-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123104016.17485-1-bmeng.cn@gmail.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x529.google.com
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
X-List-Received-Date: Sat, 23 Jan 2021 10:41:02 -0000

From: Bin Meng <bin.meng@windriver.com>

The single block read (CMD17) codes are the same as the multiple
block read (CMD18). Merge them into one. The same applies to single
block write (CMD24) and multiple block write (CMD25).

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 hw/sd/sd.c | 47 -----------------------------------------------
 1 file changed, 47 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index b3952514fe..09753359bb 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1181,24 +1181,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 17:	/* CMD17:  READ_SINGLE_BLOCK */
-        switch (sd->state) {
-        case sd_transfer_state:
-
-            if (addr + sd->blk_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
-                return sd_r1;
-            }
-
-            sd->state = sd_sendingdata_state;
-            sd->data_start = addr;
-            sd->data_offset = 0;
-            return sd_r1;
-
-        default:
-            break;
-        }
-        break;
-
     case 18:	/* CMD18:  READ_MULTIPLE_BLOCK */
         switch (sd->state) {
         case sd_transfer_state:
@@ -1245,35 +1227,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     /* Block write commands (Class 4) */
     case 24:	/* CMD24:  WRITE_SINGLE_BLOCK */
-        switch (sd->state) {
-        case sd_transfer_state:
-            /* Writing in SPI mode not implemented.  */
-            if (sd->spi)
-                break;
-
-            if (addr + sd->blk_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
-                return sd_r1;
-            }
-
-            sd->state = sd_receivingdata_state;
-            sd->data_start = addr;
-            sd->data_offset = 0;
-            sd->blk_written = 0;
-
-            if (sd_wp_addr(sd, sd->data_start)) {
-                sd->card_status |= WP_VIOLATION;
-            }
-            if (sd->csd[14] & 0x30) {
-                sd->card_status |= WP_VIOLATION;
-            }
-            return sd_r1;
-
-        default:
-            break;
-        }
-        break;
-
     case 25:	/* CMD25:  WRITE_MULTIPLE_BLOCK */
         switch (sd->state) {
         case sd_transfer_state:
-- 
2.25.1


