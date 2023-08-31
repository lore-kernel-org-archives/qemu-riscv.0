Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE073C83F12
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:14:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhJO-0004xM-Ku; Thu, 31 Aug 2023 09:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhGO-0004D9-AY
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:59:15 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhGI-0005mm-Ne
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:59:06 -0400
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-ccc462deca6so546365276.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486741; x=1694091541; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hQQOLonhj1lfjw6EyIeNwvldxW3rnJRehE92SZcD36E=;
 b=BQ1ghpm2f/TH+wm03s8Dj7UuTOVpyXpwyk2e5690TB0VpDNCLLP2nedcDPnpW5zOTH
 LX13u6ghQF2tf9uLoWan3iYG+WLavzoKT80ZEU18njcVgWrPpYC5rJzjtp2tXa5qfRHu
 C7TwuCRxikNwGPG+jPJjPWojHX+u78fCYbJj8YjOLLu5ciogF/FmQQ7m7kPMGQoSXf/k
 2hSnrRykfAm6mX1fxkcZhm5bOlrz6R2RfNSEjHyXtYjP3vraVDHdqdz3KdeQf1gwSmaU
 MjOIUea4Xh5rbQb4LQWph7JXIrrReROeSoQMhCAKOYHsRqn5PNw8h5+jwhWKB4MCytWY
 A8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486741; x=1694091541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hQQOLonhj1lfjw6EyIeNwvldxW3rnJRehE92SZcD36E=;
 b=CmXtiBroqqy0w9CMUj1SMPn0dw0161GhKNpIPgn61luQba0SUBUzPESJdQ/nVqbqdW
 WxpP7rTXFRMLX4wA28Ft/D4Pa0c50V+w+e2EfxbyvVoNMzET2hLSkX2z/qEG/r2ap/HX
 TKFZ+MHKpbLxMGhy5knA3/abv9CmLS4cCR71INs7EV4cGxEBaTQsE78W6UifIPcZASj7
 kP7OFcOQu7BHBtWviT4bvsRxh5si2HGYzYW8rh/Y7XPL6JxK511Rd2hnbw1Ls5ahFTJi
 IeB0cXN2LvHUDGAuhQOtN3sdoruqNf2W7HTWAV/T9OVwpZjUK88IlmHTH2kzY6OROIfL
 jYiQ==
X-Gm-Message-State: AOJu0YwpdNgLUn7pQxwMNuVVcVsLBoCghDWnG/HzKiTetPQkl/F9Br7O
 hdQRxl+pNRfgVGQRpcrFi50Dkw==
X-Google-Smtp-Source: AGHT+IHRdJjheQLIpok6Yi9baSoqDy0y/6oV8Ui/S1tIDsKXPe6Z/j8aJ8l4Tu+zzQ3bF356181nzg==
X-Received: by 2002:a25:d20a:0:b0:d0f:6f1d:89ec with SMTP id
 j10-20020a25d20a000000b00d0f6f1d89ecmr5473933ybg.35.1693486740963; 
 Thu, 31 Aug 2023 05:59:00 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 i85-20020a25d158000000b00d74c54dea92sm298458ybg.25.2023.08.31.05.58.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:59:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 22/41] hw/char/pl011: Display register name in trace events
Date: Thu, 31 Aug 2023 14:56:24 +0200
Message-ID: <20230831125646.67855-23-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=philmd@linaro.org; helo=mail-yb1-xb34.google.com
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

To avoid knowing the register addresses by heart,
display their name along in the trace events.

Since the MMIO region is 4K wide (0x1000 bytes),
displaying the address with 3 digits is enough,
so reduce the address format.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230522153144.30610-5-philmd@linaro.org>
---
 hw/char/pl011.c      | 25 ++++++++++++++++++++++---
 hw/char/trace-events |  4 ++--
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 73f1a3aea2..c3203e5b41 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -51,6 +51,7 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
 #define PL011_INT_TX 0x20
 #define PL011_INT_RX 0x10
 
+/* Flag Register, UARTFR */
 #define PL011_FLAG_TXFE 0x80
 #define PL011_FLAG_RXFF 0x40
 #define PL011_FLAG_TXFF 0x20
@@ -76,6 +77,24 @@ static const unsigned char pl011_id_arm[8] =
 static const unsigned char pl011_id_luminary[8] =
   { 0x11, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1 };
 
+static const char *pl011_regname(hwaddr offset)
+{
+    static const char *const rname[] = {
+        [0] = "DR", [1] = "RSR", [6] = "FR", [8] = "ILPR", [9] = "IBRD",
+        [10] = "FBRD", [11] = "LCRH", [12] = "CR", [13] = "IFLS", [14] = "IMSC",
+        [15] = "RIS", [16] = "MIS", [17] = "ICR", [18] = "DMACR",
+    };
+    unsigned idx = offset >> 2;
+
+    if (idx < ARRAY_SIZE(rname) && rname[idx]) {
+        return rname[idx];
+    }
+    if (idx >= 0x3f8 && idx <= 0x400) {
+        return "ID";
+    }
+    return "UNKN";
+}
+
 /* Which bits in the interrupt status matter for each outbound IRQ line ? */
 static const uint32_t irqmask[] = {
     INT_E | INT_MS | INT_RT | INT_TX | INT_RX, /* combined IRQ */
@@ -191,7 +210,7 @@ static uint64_t pl011_read(void *opaque, hwaddr offset,
         break;
     }
 
-    trace_pl011_read(offset, r);
+    trace_pl011_read(offset, r, pl011_regname(offset));
     return r;
 }
 
@@ -234,7 +253,7 @@ static void pl011_write(void *opaque, hwaddr offset,
     PL011State *s = (PL011State *)opaque;
     unsigned char ch;
 
-    trace_pl011_write(offset, value);
+    trace_pl011_write(offset, value, pl011_regname(offset));
 
     switch (offset >> 2) {
     case 0: /* UARTDR */
@@ -252,7 +271,7 @@ static void pl011_write(void *opaque, hwaddr offset,
     case 6: /* UARTFR */
         /* Writes to Flag register are ignored.  */
         break;
-    case 8: /* UARTUARTILPR */
+    case 8: /* UARTILPR */
         s->ilpr = value;
         break;
     case 9: /* UARTIBRD */
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 2ecb36232e..babf4d35ea 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -54,9 +54,9 @@ escc_sunmouse_event(int dx, int dy, int buttons_state) "dx=%d dy=%d buttons=0x%0
 
 # pl011.c
 pl011_irq_state(int level) "irq state %d"
-pl011_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
+pl011_read(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x value 0x%08x reg %s"
 pl011_read_fifo(int read_count) "FIFO read, read_count now %d"
-pl011_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
+pl011_write(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x value 0x%08x reg %s"
 pl011_can_receive(uint32_t lcr, int read_count, int r) "LCR 0x%08x read_count %d returning %d"
 pl011_put_fifo(uint32_t c, int read_count) "new char 0x%x read_count now %d"
 pl011_put_fifo_full(void) "FIFO now full, RXFF set"
-- 
2.41.0


