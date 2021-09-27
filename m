Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUkxK-0000xr-Jj
	for mharc-qemu-riscv@gnu.org; Mon, 27 Sep 2021 03:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUkxI-0000sg-Cz; Mon, 27 Sep 2021 03:21:40 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:43002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUkxG-0002zF-JU; Mon, 27 Sep 2021 03:21:40 -0400
Received: by mail-io1-xd33.google.com with SMTP id b10so21474192ioq.9;
 Mon, 27 Sep 2021 00:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t5em0PdfaZhXRRKFyS8Am/scqyCdDbDmX3nEV2HzyKc=;
 b=UmwJDCAJXiVbm21p1fDqF9PqYgFZfvoGdiAtolejqZFF8bNqO7d85QbPr+KMZ6x7Sn
 IGM8VqMcW/X5MdUdsK/kstI6WhbVpehoT3/oNveZ/Fr2odi3lTBHfQHVlODVkK4VOg+8
 MtBiDFX4fgaherhBb/qXUO28iOt0R/6b+qpief5/ZJZz7pE4geZ8oPLJkPph34rgHbYV
 +8pbqk2IZGFBurm59ic4DirswXTvCZRGM2XAC7kFxUwiFxdQWdYEa2DBri5EkhztXfQy
 phH22zaVMG3FQdkG1m7uZ+wkjjhwDh01QcCCoNxn+jDdyQcHybLCcnVcQzmMqRznGrNi
 2agA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t5em0PdfaZhXRRKFyS8Am/scqyCdDbDmX3nEV2HzyKc=;
 b=ULO3gu0hCVEQc+tJDIowzC2MGg0YDwy9R9qPwMd3kZicJnHr6kik8jAO5g8jJ6qYj1
 kaHjRJtAZF/CZXFCb6x3QLjqgygJw26dEznumFP1pywu7BrpiRNuora1IkIAtC97xsat
 nchMgCrbUgFiZwS07g8iJ/EAcbj/duF2ZNDJeDlDnBfJtQnHilXJU3G9yHQ0hV57H7Ik
 wed0eR8PQHy/m+0Rm/mbr6QTPCcQCb94rQi2c5Ds+enau69V6UNT0mO7avQqWBneCCSA
 y0BITHL8z0Ks0pA9zGwFUPpmC/h1tUgBISAKqxgWUDAshNwcA0bZAxrEy1vcy92WNegF
 tDcQ==
X-Gm-Message-State: AOAM532W8goNLz00myBl/Tix9Kb+u64N1wJiYat8wBaIyZfUwsTksFe1
 zy9SXsLyEWcchD/6h33xoQo=
X-Google-Smtp-Source: ABdhPJxvlmY0btImkPmk3uU7LImDEUj1BsAkRjPFmBs8Dns/CYui9ywhlBPEf/NGdOa1Rd/6dE3WHw==
X-Received: by 2002:a02:6988:: with SMTP id e130mr20687004jac.97.1632727297041; 
 Mon, 27 Sep 2021 00:21:37 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id b12sm8690641ilv.46.2021.09.27.00.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 00:21:36 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 2/2] hw/dma: sifive_pdma: Don't run DMA when channel is
 disclaimed
Date: Mon, 27 Sep 2021 15:21:24 +0800
Message-Id: <20210927072124.1564129-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210927072124.1564129-1-bmeng.cn@gmail.com>
References: <20210927072124.1564129-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Mon, 27 Sep 2021 07:21:40 -0000

If Control.run bit is set while not preserving the Control.claim
bit, the DMA transfer shall not be started.

The following result is PDMA tested in U-Boot on Unleashed board:

=> mw.l 0x3000000 0x0                      <= Disclaim channel 0
=> mw.l 0x3000000 0x1                      <= Claim channel 0
=> mw.l 0x3000004 0x55000000               <= wsize = rsize = 5 (2^5 = 32 bytes)
=> mw.q 0x3000008 0x2                      <= NextBytes = 2
=> mw.q 0x3000010 0x84000000               <= NextDestination = 0x84000000
=> mw.q 0x3000018 0x84001000               <= NextSource = 0x84001000
=> mw.l 0x84000000 0x87654321              <= Fill test data to dst
=> mw.l 0x84001000 0x12345678              <= Fill test data to src
=> md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
84000000: 87654321                               !Ce.
84001000: 12345678                               xV4.
=> md.l 0x3000000 8                        <= Dump PDMA status
03000000: 00000001 55000000 00000002 00000000    .......U........
03000010: 84000000 00000000 84001000 00000000    ................
=> mw.l 0x3000000 0x2                      <= Set channel 0 run bit only
=> md.l 0x3000000 8                        <= Dump PDMA status
03000000: 00000000 55000000 00000002 00000000    .......U........
03000010: 84000000 00000000 84001000 00000000    ................
=> md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
84000000: 87654321                               !Ce.
84001000: 12345678                               xV4.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

(no changes since v1)

 hw/dma/sifive_pdma.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index b8ec7621f3..85fe34f5f3 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -232,7 +232,7 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
 {
     SiFivePDMAState *s = opaque;
     int ch = SIFIVE_PDMA_CHAN_NO(offset);
-    bool claimed;
+    bool claimed, run;
 
     if (ch >= SIFIVE_PDMA_CHANS) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
@@ -244,6 +244,7 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
     switch (offset) {
     case DMA_CONTROL:
         claimed = !!(s->chan[ch].control & CONTROL_CLAIM);
+        run = !!(s->chan[ch].control & CONTROL_RUN);
 
         if (!claimed && (value & CONTROL_CLAIM)) {
             /* reset Next* registers */
@@ -254,13 +255,19 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
             s->chan[ch].next_src = 0;
         }
 
+        /* claim bit can only be cleared when run is low */
+        if (run && !(value & CONTROL_CLAIM)) {
+            value |= CONTROL_CLAIM;
+        }
+
         s->chan[ch].control = value;
 
         /*
          * If channel was not claimed before run bit is set,
+         * or if the channel is disclaimed when run was low,
          * DMA won't run.
          */
-        if (!claimed) {
+        if (!claimed || (!run && !(value & CONTROL_CLAIM))) {
             s->chan[ch].control &= ~CONTROL_RUN;
             return;
         }
-- 
2.25.1


