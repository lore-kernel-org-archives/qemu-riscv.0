Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kuwAn-0007zq-Ey
	for mharc-qemu-riscv@gnu.org; Thu, 31 Dec 2020 06:31:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAf-0007pb-RR; Thu, 31 Dec 2020 06:31:10 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:46599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAW-0007Ju-QP; Thu, 31 Dec 2020 06:31:09 -0500
Received: by mail-pf1-x433.google.com with SMTP id s21so11119087pfu.13;
 Thu, 31 Dec 2020 03:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fj7RWSj4mDJ+Lm4fu8akdKs8wzDoeUmT5eZi3x+PQyI=;
 b=XCye3+qTyPYvh8fSJH7mkPjmfzfvfUPOYE97XTgpqlLPPgL/hrs4jYUs+0JbLZIPeC
 Pdw4AlN1qmSi2Z+mzO2XPT1eSbtoI6tyuHTKk+H/XsHBy5hfnDJ8e4ASNNkesAkdF4SY
 E2+bnfhTElsIuuR6FWoUnIRISGkqOBluB7Qk1vvbBY7Fr2NFeZyByWvKbD42oiQDKyqM
 E1YHevI+QBC5kni+72gGlTgki7Xl16yCOhbptnOUZBfOIFoL1/jGOolDeEvqW1koBUpV
 Phf6IkWysNm21dvW+aT0kiuziufzaSJ4u3BhNaHxU8Z/iSF7E1eh7huPyPTscvculLF8
 cRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fj7RWSj4mDJ+Lm4fu8akdKs8wzDoeUmT5eZi3x+PQyI=;
 b=AwaDAL8BWjlMl9VXN+MXySmDOcATt5Op29RNCYprOGvRH2sHqGLmtfZ3GRk4ZN9HMf
 lsUybRA/i7q31MNNXd9720oLWsex38xttTY6HabGWTkbedmcw089FFnq+05aVC2dN5Dp
 qaKI9CvhKuZrM7zXda6zKCHYdk+shFFJM1ftO+FR2Zs1NIkmGRtCwNkAJB6WvQGu5IL6
 eEMQ6C0rpPBIn92x5/sk8nk3e85nWjnuYvgY+gPNTVSLo7JBMZnrV9UzrQr7fXrGGzcY
 Ue/fTZK4uBHTonn0zeIsuNwl/CtkMjC8Z3BhgKAsrNnA8e6Mr62NScwUo+o9oRWxnYEA
 7EWw==
X-Gm-Message-State: AOAM532TBFgLP5XU/Qexrhy/GpRkWzkqoZAyxa5LWZb/sg+WEyJlAR80
 bEBkgzpOKL4TMPFr5Lc0HaE=
X-Google-Smtp-Source: ABdhPJy+GjL7ILBXRpuv13gAYC066EsGP7kqNeOVAZ2Mndb5j9spDe79ztXL39ctwOotyNaDwjjvJQ==
X-Received: by 2002:a62:7b86:0:b029:19d:f996:44f3 with SMTP id
 w128-20020a627b860000b029019df99644f3mr51803552pfc.65.1609414257250; 
 Thu, 31 Dec 2020 03:30:57 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t23sm45957591pfc.0.2020.12.31.03.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 03:30:56 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 10/22] hw/sd: sd: Remove duplicated codes in single/multiple
 block read/write
Date: Thu, 31 Dec 2020 19:29:58 +0800
Message-Id: <20201231113010.27108-11-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201231113010.27108-1-bmeng.cn@gmail.com>
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Thu, 31 Dec 2020 11:31:13 -0000

From: Bin Meng <bin.meng@windriver.com>

The single block read (CMD17) codes are the same as the multiple
block read (CMD18). Merge them into one. The same applies to single
block write (CMD24) and multiple block write (CMD25).

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/sd/sd.c | 47 -----------------------------------------------
 1 file changed, 47 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 52c7217fe1..1ada616e1e 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1180,24 +1180,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
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
@@ -1244,35 +1226,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
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


