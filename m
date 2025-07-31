Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9093AC87FD2
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 21:41:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uhb1V-0005AA-TE; Thu, 31 Jul 2025 17:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uhap7-0000Bg-1s
 for qemu-riscv@nongnu.org; Thu, 31 Jul 2025 17:28:25 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uhap4-0007sn-Q9
 for qemu-riscv@nongnu.org; Thu, 31 Jul 2025 17:28:24 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4561a4a8bf2so2219225e9.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Jul 2025 14:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753997301; x=1754602101; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HLMZZx0BTIjmaMZzKMYMD/wlzh9Bhbnd20BwbDdOA5g=;
 b=npwJNpKApwCGbDVrWf+b4NnNuGWwiYaFRd2QniY7DNv5FaAEBlF7LJRtF3oU1n/J+4
 7+iOXSFOueEJlcWzW50zLOcRJvioe0nirP0JlAEytPHGuaRWY64Cki6wNTT5HJhqFhJ4
 MoIZ891uQLhOPcwSxYSjVPP90j3VCJHXS6rA5P2i7ryoIht7qxPoxxqFjQXyYGwOJPa1
 F2V7Mp0ERY6x4MoIblD4t77+ED8OXVi2bSiEino6EUuuubZ3Zccb9/ngk/R4yzyuHSKI
 WqWtAbsfQ9D471c5wSHRZZzawlo6RCv5+qI9Uatrb+H53sDlSp0R7ufwLu2xNu1jnvA1
 IQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753997301; x=1754602101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HLMZZx0BTIjmaMZzKMYMD/wlzh9Bhbnd20BwbDdOA5g=;
 b=qezyh5cL7U0Md3ZzAt/oGaSchoaqYNBFCcdeZMxOTBOeaNbg9N+uAb1zLzD/4FtPBj
 yBFsNXnlGwhvI6HIBZKq+JXVXsHI2Eiue/FNd48nktADjxr1D2B68j5xn1SZDIDpjZ8g
 RFV4MHdZKM4MhrBDGEfXFZUGKrOMxaJUFkuDt4o+eWl5cKK76dHJAK+f7eqVnO7wVT/j
 K4Dnq/5tV5HwyG4fySCKQGsLaCHvxibtxWMLisJzemKNnONw6M6tG/GoMAOXihUPfliW
 VrKe7/DfPRXmbXtu3MMgcESiUJSkkpVJ1EAUs9EKSlQ4liTuohc5LdzTNj/s8w4XB/0v
 3Dig==
X-Forwarded-Encrypted: i=1;
 AJvYcCV49UjTEBKjSHNGrR09VvOeDbAVwSVIPb5gBy8ixBGae+wx5VU0/CL+LoMA+t3Z7pee4lBlokEqLa9E@nongnu.org
X-Gm-Message-State: AOJu0YwUpmwKGgf69iB5pi11xveRzlyfx3PQU9IZFWgPU4JmLJSdOWYy
 1CYPUKX1ZNh+79CzZ8QI8HRx+S1/gkjxPCEbG6oCPbSzRUOMz68pG0uOT6ApLE72JYk=
X-Gm-Gg: ASbGncsOKJyDFcVDI7U11cf8hs4QTDJE77LnHS2O2fmK6BmUrlC81s+JgdrgH7VnY8q
 8Yw+3aQobo09JAoPnYRNZ6+370ye3tbjZ9A4yzpvJfk1Y8bkL5gWptfX5htOzpEAwNE//BRxhiQ
 uD9ObkHHICR3GLx9329YO1mH7hgnL3LmrDtPdTVRMHiS2mhe2ZWsZy6uYRQjHFOf6/yG7/+0ThR
 0ufj4ObJcTKzOAzvvlWUFWmRXm/H6QbnOb3Ju0mYRDewyfl9LyJBTNSQKJh3H3wy3F/PzXLcyMi
 SPWt16Q2ZxN84CDV7nM+OgDG7p71fcze+n8UZOfQZijk8U4mVpZe+1QHt9/S7SfdoCclLTvbvVM
 CB8aSBdv3dqgn+a4oOYDkt+DKwMexgClRPsqSLCuXoPlNtyovN4cisdOoGK59Qg5e25HlYMG1rv
 yYYQ9bOl8=
X-Google-Smtp-Source: AGHT+IH19EmjemCIRLXZLf0VnUNmaXdjVYPHMWt9jYo6KrJ6frV00UG8onRcitIzQ8PAxjtMP3TuIQ==
X-Received: by 2002:a05:600c:4e06:b0:43c:eeee:b713 with SMTP id
 5b1f17b1804b1-45892bc5977mr77580555e9.20.1753997301190; 
 Thu, 31 Jul 2025 14:28:21 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953f8e02sm77101605e9.32.2025.07.31.14.28.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Jul 2025 14:28:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Weiwei Li <liwei1518@gmail.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 02/11] hw/sd/sdbus: Provide buffer size to
 sdbus_do_command()
Date: Thu, 31 Jul 2025 23:27:57 +0200
Message-ID: <20250731212807.2706-3-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250731212807.2706-1-philmd@linaro.org>
References: <20250731212807.2706-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We provide to sdbus_do_command() a pointer to a buffer to be
filled with a varying number of bytes. By not providing the
buffer size, the callee can not check the buffer is big enough.
Pass the buffer size as argument to follow good practices.

sdbus_do_command() doesn't return any error, only the size filled
in the buffer. Convert the returned type to unsigned and remove
the few unreachable lines in callers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sd/sd.h       | 23 +++++++++++++++++++++--
 hw/sd/allwinner-sdhost.c |  5 +----
 hw/sd/bcm2835_sdhost.c   |  5 +----
 hw/sd/core.c             |  5 +++--
 hw/sd/omap_mmc.c         |  2 +-
 hw/sd/pl181.c            |  4 +---
 hw/sd/sd.c               |  5 +++--
 hw/sd/sdhci.c            |  4 ++--
 hw/sd/ssi-sd.c           |  8 +++++---
 9 files changed, 38 insertions(+), 23 deletions(-)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index d6bad175131..55d363f58fb 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -96,7 +96,17 @@ struct SDCardClass {
     DeviceClass parent_class;
     /*< public >*/
 
-    int (*do_command)(SDState *sd, SDRequest *req, uint8_t *response);
+    /**
+     * Process a SD command request.
+     * @sd: card
+     * @req: command request
+     * @resp: buffer to receive the command response
+     * @respsz: size of @resp buffer
+     *
+     * Return: size of the response
+     */
+    size_t (*do_command)(SDState *sd, SDRequest *req,
+                         uint8_t *resp, size_t respsz);
     /**
      * Write a byte to a SD card.
      * @sd: card
@@ -153,7 +163,16 @@ struct SDBusClass {
 void sdbus_set_voltage(SDBus *sdbus, uint16_t millivolts);
 uint8_t sdbus_get_dat_lines(SDBus *sdbus);
 bool sdbus_get_cmd_line(SDBus *sdbus);
-int sdbus_do_command(SDBus *sd, SDRequest *req, uint8_t *response);
+/**
+ * sdbus_do_command: Process a SD command request
+ * @sd: card
+ * @req: command request
+ * @resp: buffer to receive the command response
+ * @respsz: size of @resp buffer
+ *
+ * Return: size of the response
+ */
+size_t sdbus_do_command(SDBus *sd, SDRequest *req, uint8_t *resp, size_t respsz);
 /**
  * Write a byte to a SD bus.
  * @sd: bus
diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
index b31da5c399c..65bef08fc83 100644
--- a/hw/sd/allwinner-sdhost.c
+++ b/hw/sd/allwinner-sdhost.c
@@ -246,10 +246,7 @@ static void allwinner_sdhost_send_command(AwSdHostState *s)
         request.arg = s->command_arg;
 
         /* Send request to SD bus */
-        rlen = sdbus_do_command(&s->sdbus, &request, resp);
-        if (rlen < 0) {
-            goto error;
-        }
+        rlen = sdbus_do_command(&s->sdbus, &request, resp, sizeof(resp));
 
         /* If the command has a response, store it in the response registers */
         if ((s->command & SD_CMDR_RESPONSE)) {
diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
index 29debdf59e4..2b3160f05f3 100644
--- a/hw/sd/bcm2835_sdhost.c
+++ b/hw/sd/bcm2835_sdhost.c
@@ -118,10 +118,7 @@ static void bcm2835_sdhost_send_command(BCM2835SDHostState *s)
     request.cmd = s->cmd & SDCMD_CMD_MASK;
     request.arg = s->cmdarg;
 
-    rlen = sdbus_do_command(&s->sdbus, &request, rsp);
-    if (rlen < 0) {
-        goto error;
-    }
+    rlen = sdbus_do_command(&s->sdbus, &request, rsp, sizeof(rsp));
     if (!(s->cmd & SDCMD_NO_RESPONSE)) {
         if (rlen == 0 || (rlen == 4 && (s->cmd & SDCMD_LONG_RESPONSE))) {
             goto error;
diff --git a/hw/sd/core.c b/hw/sd/core.c
index 4b30218b520..d3c9017445e 100644
--- a/hw/sd/core.c
+++ b/hw/sd/core.c
@@ -90,7 +90,8 @@ void sdbus_set_voltage(SDBus *sdbus, uint16_t millivolts)
     }
 }
 
-int sdbus_do_command(SDBus *sdbus, SDRequest *req, uint8_t *response)
+size_t sdbus_do_command(SDBus *sdbus, SDRequest *req,
+                        uint8_t *resp, size_t respsz)
 {
     SDState *card = get_card(sdbus);
 
@@ -98,7 +99,7 @@ int sdbus_do_command(SDBus *sdbus, SDRequest *req, uint8_t *response)
     if (card) {
         SDCardClass *sc = SDMMC_COMMON_GET_CLASS(card);
 
-        return sc->do_command(card, req, response);
+        return sc->do_command(card, req, resp, respsz);
     }
 
     return 0;
diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index b7648d41cc5..1520ca87b74 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -157,7 +157,7 @@ static void omap_mmc_command(OMAPMMCState *host, int cmd, int dir,
     request.arg = host->arg;
     request.crc = 0; /* FIXME */
 
-    rsplen = sdbus_do_command(&host->sdbus, &request, response);
+    rsplen = sdbus_do_command(&host->sdbus, &request, response, sizeof(response));
 
     /* TODO: validate CRCs */
     switch (resptype) {
diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index b8fc9f86f13..b8072530d65 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -178,9 +178,7 @@ static void pl181_do_command(PL181State *s)
     request.cmd = s->cmd & PL181_CMD_INDEX;
     request.arg = s->cmdarg;
     trace_pl181_command_send(request.cmd, request.arg);
-    rlen = sdbus_do_command(&s->sdbus, &request, response);
-    if (rlen < 0)
-        goto error;
+    rlen = sdbus_do_command(&s->sdbus, &request, response, sizeof(response));
     if (s->cmd & PL181_CMD_RESPONSE) {
         if (rlen == 0 || (rlen == 4 && (s->cmd & PL181_CMD_LONGRESP)))
             goto error;
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 0bb385268ed..1d88aee38d5 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2139,8 +2139,9 @@ static bool cmd_valid_while_locked(SDState *sd, unsigned cmd)
     return cmd_class == 0 || cmd_class == 7;
 }
 
-static int sd_do_command(SDState *sd, SDRequest *req,
-                         uint8_t *response) {
+static size_t sd_do_command(SDState *sd, SDRequest *req,
+                            uint8_t *response, size_t respsz)
+{
     int last_state;
     sd_rsp_type_t rtype;
     int rsplen;
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 226ff133ff9..f1e149f46f3 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -346,7 +346,7 @@ static void sdhci_send_command(SDHCIState *s)
     request.arg = s->argument;
 
     trace_sdhci_send_command(request.cmd, request.arg);
-    rlen = sdbus_do_command(&s->sdbus, &request, response);
+    rlen = sdbus_do_command(&s->sdbus, &request, response, sizeof(response));
 
     if (s->cmdreg & SDHC_CMD_RESPONSE) {
         if (rlen == 4) {
@@ -400,7 +400,7 @@ static void sdhci_end_transfer(SDHCIState *s)
         request.cmd = 0x0C;
         request.arg = 0;
         trace_sdhci_end_transfer(request.cmd, request.arg);
-        sdbus_do_command(&s->sdbus, &request, response);
+        sdbus_do_command(&s->sdbus, &request, response, sizeof(response));
         /* Auto CMD12 response goes to the upper Response register */
         s->rspreg[3] = ldl_be_p(response);
     }
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 6c90a86ab41..3aba0e08ffe 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -146,7 +146,8 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
             /* manually issue cmd12 to stop the transfer */
             request.cmd = 12;
             request.arg = 0;
-            s->arglen = sdbus_do_command(&s->sdbus, &request, longresp);
+            s->arglen = sdbus_do_command(&s->sdbus, &request,
+                                         longresp, sizeof(longresp));
             if (s->arglen <= 0) {
                 s->arglen = 1;
                 /* a zero value indicates the card is busy */
@@ -171,8 +172,9 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
             request.cmd = s->cmd;
             request.arg = ldl_be_p(s->cmdarg);
             DPRINTF("CMD%d arg 0x%08x\n", s->cmd, request.arg);
-            s->arglen = sdbus_do_command(&s->sdbus, &request, longresp);
-            if (s->arglen <= 0) {
+            s->arglen = sdbus_do_command(&s->sdbus, &request,
+                                         longresp, sizeof(longresp));
+            if (s->arglen == 0) {
                 s->arglen = 1;
                 s->response[0] = 4;
                 DPRINTF("SD command failed\n");
-- 
2.49.0


