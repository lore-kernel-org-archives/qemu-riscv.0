Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541BEC87FCF
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 15:09:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uiwoH-0000EU-Ne; Mon, 04 Aug 2025 11:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uivKl-0000Tn-0V
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 09:34:35 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uivKg-0008WQ-TY
 for qemu-riscv@nongnu.org; Mon, 04 Aug 2025 09:34:34 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b8db5e9b35so1488149f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 04 Aug 2025 06:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754314469; x=1754919269; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6JfNbJBRiGns9nQxb/dXlOb6j3h09lwYC9hOfonr8Uc=;
 b=lrn89bwey3Tu+WDBBZDjxzLPXz1GlH/G1ToMAbyS0+vtG+pjbG333UGHilbcNza9S6
 C9Psg+OIPQmdOsjO06SmTD6W2i22z85EVLVIJrxLBrVstvlNri/8qLYqBLf7LiJEhJcj
 xphrIs7DG8LySW7Qqm0VJ7/PoPIrksHDggnqwUXyRLZyyMn22mSy07LBxa9U6wQ9smPT
 /L8hKQ4/Z422tQWdDGKtFRuv0K+0yn/Piv0b60asD1vD6cAyDgrMjkL0tG+JyxgJNbYf
 wFZSJ5Ajt5zv62yQOUvqi69v/LAZlQh5ax8Y+KtNsqK/jVDZR0k7jgA8VYxUK5FRA4KF
 Kl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754314469; x=1754919269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6JfNbJBRiGns9nQxb/dXlOb6j3h09lwYC9hOfonr8Uc=;
 b=Vm1U6IEzzFsKO4Rc6undorK8qZ7jDkkadIBv7ym0ws86cNujpU7tUVGjgn7utCIL2C
 8ezLTj3GoQZzV35I1Dyu8j+7QNWpr4VerFGTTZISe5la8aGOhR++ierFNR2nV6I/E/C8
 wmR3LECTyONbZfoTc0ibRnpY05D/eMg6+6WoRO3SwlOyTHi0SRlzSGqhxsHA22MPYAGe
 vZ53JhtaIuk7cTkJKECvAS/Z14Dkjrv0S/ITpkUit6WFcAB7YRhwyygdt+ymcyiKCoK2
 UKgL3P9eKvAeXS/zq2isXyFbpK6EnAzjoNcZk6OaG90IU43KBKf6YoWh2TXlbUiagg2B
 35bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmTOX4s/KJYagDJe/w1YkIOcERs0QJiW7mE5GbvaG0L4Z4kSxoGckOHoV1OUnu7LlVODXsV+BhBHcN@nongnu.org
X-Gm-Message-State: AOJu0Yzm8MBzDYO8AzcgeWr5cJK284FZRVeFFHuVo15dFkAl1INEtsrX
 5+zc4CEYt6WKp6CrDZixgWyyTcJedeiJW/N1yBy1IQBIVD9xEHOCXsZXBA0H9dEldUA=
X-Gm-Gg: ASbGncsZGlPj1yY6QunKJ0UbgBSOXbWSXAJsS3VTaGow/ziPq7FZukiSzJN7VGf7rz8
 JU8oW4BJNTDQ6x5jQ98VbI82bjsu8Ty7xTjeVL1V6ucgY9T2egmykYNYVBQiu2WanTtjtewdpqn
 gKnRr0sICxVXfBr2LHS4jyxpJPOV5Fakkr296wBH8EdUWcTq4MsavFiPQU2JCJPY0pbaxOXncGw
 J1Vw5z10NrBo/esrK3TG/n0AdzXm6MvGTydmYrRrQBc/BmrwTckdW4DL8hBWxO+jqlfyFE4iO7J
 Bv2oZCJhQmcKNEEppHL6AaxuJu9LMb7cl9neHflVvdFlqu/ATLF8kgv6DPI6av+pluHDTuclQWO
 g/F+a1U4aR/1bvq05rs9NNG9ZNpr6X6San+g/2/Y4o2rHl41zYvGc8c1ad/SHVCJa1E40CUCp
X-Google-Smtp-Source: AGHT+IHKcZhP/j9SnSEtfOajWnPlIlr64RHOLptHsEDaDEJAOrncDTl/jUfYf1X+CnOq515ebaRJmg==
X-Received: by 2002:a05:6000:25c7:b0:3b8:d7c7:62d7 with SMTP id
 ffacd0b85a97d-3b8d94749abmr6554494f8f.16.1754314469249; 
 Mon, 04 Aug 2025 06:34:29 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e0b2d2fasm5471447f8f.50.2025.08.04.06.34.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Aug 2025 06:34:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH-for-10.1 v2 04/11] hw/sd/sdcard: Fill SPI response bits in
 card code
Date: Mon,  4 Aug 2025 15:33:58 +0200
Message-ID: <20250804133406.17456-5-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250804133406.17456-1-philmd@linaro.org>
References: <20250804133406.17456-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

ssi-sd.c contains the SPI link layer adaptation,
while sd.c contains all the SD card internal details.

We already handle the response values in sd.c, but
missed the SPI case. Complete them (fill R1, prepend
R1 in R3/R7 and always return something in SPI mode).
Remove all the duplication in ssi-sd.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c     | 32 ++++++++++++++++---
 hw/sd/ssi-sd.c | 87 ++++----------------------------------------------
 2 files changed, 35 insertions(+), 84 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 069107a2e70..cbcc180f6a4 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -734,22 +734,24 @@ static size_t sd_response_size(SDState *sd, sd_rsp_type_t rtype)
     switch (rtype) {
     case sd_r1:
     case sd_r1b:
-        return 4;
+        return sd_is_spi(sd) ? 1 : 4;
 
     case sd_r2_i:
     case sd_r2_s:
+        assert(!sd_is_spi(sd));
         return 16;
 
     case sd_r3:
     case sd_r7:
-        return 4;
+        return sd_is_spi(sd) ? 5 : 4;
 
     case sd_r6:
+        assert(!sd_is_spi(sd));
         return 4;
 
     case sd_r0:
     case sd_illegal:
-        return 0;
+        return sd_is_spi(sd) ? 1 : 0;
 
     default:
         g_assert_not_reached();
@@ -758,7 +760,19 @@ static size_t sd_response_size(SDState *sd, sd_rsp_type_t rtype)
 
 static void sd_response_r1_make(SDState *sd, uint8_t *response)
 {
-    stl_be_p(response, sd->card_status);
+    if (sd_is_spi(sd)) {
+        response[0] = sd->state == sd_idle_state
+                   && !FIELD_EX32(sd->ocr, OCR, CARD_POWER_UP);
+        response[0] |= FIELD_EX32(sd->card_status, CSR, ERASE_RESET) << 1;
+        response[0] |= FIELD_EX32(sd->card_status, CSR, ILLEGAL_COMMAND) << 2;
+        response[0] |= FIELD_EX32(sd->card_status, CSR, COM_CRC_ERROR) << 3;
+        response[0] |= FIELD_EX32(sd->card_status, CSR, ERASE_SEQ_ERROR) << 4;
+        response[0] |= FIELD_EX32(sd->card_status, CSR, ADDRESS_ERROR) << 5;
+        response[0] |= FIELD_EX32(sd->card_status, CSR, BLOCK_LEN_ERROR) << 6;
+        response[0] |= 0 << 7;
+    } else {
+        stl_be_p(response, sd->card_status);
+    }
 
     /* Clear the "clear on read" status bits */
     sd->card_status &= ~CARD_STATUS_C;
@@ -766,6 +780,11 @@ static void sd_response_r1_make(SDState *sd, uint8_t *response)
 
 static void sd_response_r3_make(SDState *sd, uint8_t *response)
 {
+    if (sd_is_spi(sd)) {
+        /* Prepend R1 */
+        sd_response_r1_make(sd, response);
+        response++;
+    }
     stl_be_p(response, sd->ocr & ACMD41_R3_MASK);
 }
 
@@ -783,6 +802,11 @@ static void sd_response_r6_make(SDState *sd, uint8_t *response)
 
 static void sd_response_r7_make(SDState *sd, uint8_t *response)
 {
+    if (sd_is_spi(sd)) {
+        /* Prepend R1 */
+        sd_response_r1_make(sd, response);
+        response++;
+    }
     stl_be_p(response, sd->vhs);
 }
 
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 3025f8f15f4..2d5c0ad5016 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -70,23 +70,6 @@ struct ssi_sd_state {
 #define TYPE_SSI_SD "ssi-sd"
 OBJECT_DECLARE_SIMPLE_TYPE(ssi_sd_state, SSI_SD)
 
-/* State word bits.  */
-#define SSI_SDR_LOCKED          0x0001
-#define SSI_SDR_WP_ERASE        0x0002
-#define SSI_SDR_ERROR           0x0004
-#define SSI_SDR_CC_ERROR        0x0008
-#define SSI_SDR_ECC_FAILED      0x0010
-#define SSI_SDR_WP_VIOLATION    0x0020
-#define SSI_SDR_ERASE_PARAM     0x0040
-#define SSI_SDR_OUT_OF_RANGE    0x0080
-#define SSI_SDR_IDLE            0x0100
-#define SSI_SDR_ERASE_RESET     0x0200
-#define SSI_SDR_ILLEGAL_COMMAND 0x0400
-#define SSI_SDR_COM_CRC_ERROR   0x0800
-#define SSI_SDR_ERASE_SEQ_ERROR 0x1000
-#define SSI_SDR_ADDRESS_ERROR   0x2000
-#define SSI_SDR_PARAMETER_ERROR 0x4000
-
 /* multiple block write */
 #define SSI_TOKEN_MULTI_WRITE   0xfc
 /* terminate multiple block write */
@@ -104,7 +87,7 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
 {
     ssi_sd_state *s = SSI_SD(dev);
     SDRequest request;
-    uint8_t longresp[16];
+    uint8_t longresp[5];
 
     /*
      * Special case: allow CMD12 (STOP TRANSMISSION) while reading data.
@@ -171,74 +154,18 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
             /* FIXME: Check CRC.  */
             request.cmd = s->cmd;
             request.arg = ldl_be_p(s->cmdarg);
-            DPRINTF("CMD%d arg 0x%08x\n", s->cmd, request.arg);
             s->arglen = sdbus_do_command(&s->sdbus, &request,
                                          longresp, sizeof(longresp));
-            if (s->arglen == 0) {
-                s->arglen = 1;
-                s->response[0] = 4;
-                DPRINTF("SD command failed\n");
-            } else if (s->cmd == 8 || s->cmd == 58) {
-                /* CMD8/CMD58 returns R3/R7 response */
-                DPRINTF("Returned R3/R7\n");
-                s->arglen = 5;
-                s->response[0] = 1;
-                memcpy(&s->response[1], longresp, 4);
-            } else if (s->arglen != 4) {
-                BADF("Unexpected response to cmd %d\n", s->cmd);
-                /* Illegal command is about as near as we can get.  */
-                s->arglen = 1;
-                s->response[0] = 4;
-            } else {
-                /* All other commands return status.  */
-                uint32_t cardstatus;
-                uint16_t status;
+            DPRINTF("CMD%d arg 0x%08x = %d\n", s->cmd, request.arg, s->arglen);
+            assert(s->arglen > 0);
                 /* CMD13 returns a 2-byte statuse work. Other commands
                    only return the first byte.  */
                 s->arglen = (s->cmd == 13) ? 2 : 1;
+            memcpy(s->response, longresp, s->arglen);
 
-                /* handle R1b */
-                if (s->cmd == 28 || s->cmd == 29 || s->cmd == 38) {
-                    s->stopping = 1;
-                }
-
-                cardstatus = ldl_be_p(longresp);
-                status = 0;
-                if (((cardstatus >> 9) & 0xf) < 4)
-                    status |= SSI_SDR_IDLE;
-                if (cardstatus & ERASE_RESET)
-                    status |= SSI_SDR_ERASE_RESET;
-                if (cardstatus & ILLEGAL_COMMAND)
-                    status |= SSI_SDR_ILLEGAL_COMMAND;
-                if (cardstatus & COM_CRC_ERROR)
-                    status |= SSI_SDR_COM_CRC_ERROR;
-                if (cardstatus & ERASE_SEQ_ERROR)
-                    status |= SSI_SDR_ERASE_SEQ_ERROR;
-                if (cardstatus & ADDRESS_ERROR)
-                    status |= SSI_SDR_ADDRESS_ERROR;
-                if (cardstatus & CARD_IS_LOCKED)
-                    status |= SSI_SDR_LOCKED;
-                if (cardstatus & (LOCK_UNLOCK_FAILED | WP_ERASE_SKIP))
-                    status |= SSI_SDR_WP_ERASE;
-                if (cardstatus & SD_ERROR)
-                    status |= SSI_SDR_ERROR;
-                if (cardstatus & CC_ERROR)
-                    status |= SSI_SDR_CC_ERROR;
-                if (cardstatus & CARD_ECC_FAILED)
-                    status |= SSI_SDR_ECC_FAILED;
-                if (cardstatus & WP_VIOLATION)
-                    status |= SSI_SDR_WP_VIOLATION;
-                if (cardstatus & ERASE_PARAM)
-                    status |= SSI_SDR_ERASE_PARAM;
-                if (cardstatus & (OUT_OF_RANGE | CID_CSD_OVERWRITE))
-                    status |= SSI_SDR_OUT_OF_RANGE;
-                /* ??? Don't know what Parameter Error really means, so
-                   assume it's set if the second byte is nonzero.  */
-                if (status & 0xff)
-                    status |= SSI_SDR_PARAMETER_ERROR;
-                s->response[0] = status >> 8;
-                s->response[1] = status;
-                DPRINTF("Card status 0x%02x\n", status);
+            /* handle R1b (busy signal) */
+            if (s->cmd == 28 || s->cmd == 29 || s->cmd == 38) {
+                s->stopping = 1;
             }
             s->mode = SSI_SD_PREP_RESP;
             s->response_pos = 0;
-- 
2.49.0


