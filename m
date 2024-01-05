Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55AEC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 16:01:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmTV-0003cQ-Jl; Fri, 05 Jan 2024 10:51:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSZ-0000ow-H2
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:50:13 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSW-0001EJ-7N
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:50:11 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33677fb38a3so1539170f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469806; x=1705074606; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nno3VTCeo04e35HOY3p6uYOV1tAtecR5ZW2yhenY0Bs=;
 b=WincsaJJFH6/ydoWKzmDqEwadD24rT25SUPVLUTA2MOp2iyLtBxtrbgYvSnA+4cWEf
 C0LfAd4J2UhnX2wfrrTp3z7weXamxReN5VujcADpZJ5LYhwVJV1LPWRH77nwU1WtMOkf
 7FtdzEcLWsNhbkBG6FNJ0ogpHrSl7LxL8mLhbqy29U0UZDgjvsqAqQ4N35PoqlODXJ1d
 CIbgnFXKKvnAA4FgZNwrJkd2ahJPqsZVWt8VCSUXS0ryZ6KnXhz8/4yANRdiw7SiUTNZ
 N2sZQni3D46JyI4hDbjUMpBpR4YoqyN34KLbp3D3kTbw5gc8Dd3xaygryrcbPS1ZNMQv
 0mlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469806; x=1705074606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nno3VTCeo04e35HOY3p6uYOV1tAtecR5ZW2yhenY0Bs=;
 b=bjVOhe+olPwmECWr3CpyadZdaubkX3Os6EIkfJtUTdU1dOaj/uxM1L7s/Wgk7RVfOg
 lGWYrQkkzyzCyUxjXtDPCaeBDidj5GduEKyI7TeKPc0QQr5vUDDHkrmi1SnnqS8xqr1d
 13InwgEE63yth5iIbo/rt347koGSSQKgrrXW+zfSTdM6ZYUkzVhTBxeCrCSaNHPhJn/w
 d8UAyftSy3S5IMbubhDwddKUopgcyC3pwaTJQmhUmXjZaLnX3qagM9r6C9dmbBNQ/p5r
 e+SRYSFXTZMFLvUGi3pIqVR/QTpf9uTqgt+qw14Nn7A7/OC02+rzJaRJJQW/y1PH+NyE
 q4VA==
X-Gm-Message-State: AOJu0YyYyQHk0KGgcd6Yx2tzlo4NFTaEoKpPA4j7N6UAB1P3SWz4qauS
 N5yDBuZXQlaNPYuWRAxDa5J8bDlkqKS3mw==
X-Google-Smtp-Source: AGHT+IEDuBvHeDIQ6nmVzWRN2hi01IK23e06MHcHgOCGbKhDhedlo9shD8BOBcquIQOvAU/u1hsECw==
X-Received: by 2002:a5d:62d0:0:b0:337:5cf8:b12a with SMTP id
 o16-20020a5d62d0000000b003375cf8b12amr235231wrv.135.1704469806693; 
 Fri, 05 Jan 2024 07:50:06 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 q9-20020a05600000c900b003367eae8e18sm1623623wrx.57.2024.01.05.07.50.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:50:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 69/71] hw/m68k/mcf5206: Embed m5206_timer_state in
 m5206_mbar_state
Date: Fri,  5 Jan 2024 16:43:02 +0100
Message-ID: <20240105154307.21385-70-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Thomas Huth <huth@tuxfamily.org>

There's no need to explicitely allocate the memory here, we can
simply embed it into the m5206_mbar_state instead.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231221122939.11001-1-huth@tuxfamily.org>
---
 hw/m68k/mcf5206.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index a46a23538d..183fd3cc08 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -148,15 +148,11 @@ static void m5206_timer_write(m5206_timer_state *s, uint32_t addr, uint32_t val)
     m5206_timer_update(s);
 }
 
-static m5206_timer_state *m5206_timer_init(qemu_irq irq)
+static void m5206_timer_init(m5206_timer_state *s, qemu_irq irq)
 {
-    m5206_timer_state *s;
-
-    s = g_new0(m5206_timer_state, 1);
     s->timer = ptimer_init(m5206_timer_trigger, s, PTIMER_POLICY_LEGACY);
     s->irq = irq;
     m5206_timer_reset(s);
-    return s;
 }
 
 /* System Integration Module.  */
@@ -167,7 +163,7 @@ typedef struct {
     M68kCPU *cpu;
     MemoryRegion iomem;
     qemu_irq *pic;
-    m5206_timer_state *timer[2];
+    m5206_timer_state timer[2];
     DeviceState *uart[2];
     uint8_t scr;
     uint8_t icr[14];
@@ -293,9 +289,9 @@ static uint64_t m5206_mbar_read(m5206_mbar_state *s,
                                 uint16_t offset, unsigned size)
 {
     if (offset >= 0x100 && offset < 0x120) {
-        return m5206_timer_read(s->timer[0], offset - 0x100);
+        return m5206_timer_read(&s->timer[0], offset - 0x100);
     } else if (offset >= 0x120 && offset < 0x140) {
-        return m5206_timer_read(s->timer[1], offset - 0x120);
+        return m5206_timer_read(&s->timer[1], offset - 0x120);
     } else if (offset >= 0x140 && offset < 0x160) {
         return mcf_uart_read(s->uart[0], offset - 0x140, size);
     } else if (offset >= 0x180 && offset < 0x1a0) {
@@ -333,10 +329,10 @@ static void m5206_mbar_write(m5206_mbar_state *s, uint16_t offset,
                              uint64_t value, unsigned size)
 {
     if (offset >= 0x100 && offset < 0x120) {
-        m5206_timer_write(s->timer[0], offset - 0x100, value);
+        m5206_timer_write(&s->timer[0], offset - 0x100, value);
         return;
     } else if (offset >= 0x120 && offset < 0x140) {
-        m5206_timer_write(s->timer[1], offset - 0x120, value);
+        m5206_timer_write(&s->timer[1], offset - 0x120, value);
         return;
     } else if (offset >= 0x140 && offset < 0x160) {
         mcf_uart_write(s->uart[0], offset - 0x140, value, size);
@@ -598,8 +594,8 @@ static void mcf5206_mbar_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
 
     s->pic = qemu_allocate_irqs(m5206_mbar_set_irq, s, 14);
-    s->timer[0] = m5206_timer_init(s->pic[9]);
-    s->timer[1] = m5206_timer_init(s->pic[10]);
+    m5206_timer_init(&s->timer[0], s->pic[9]);
+    m5206_timer_init(&s->timer[1], s->pic[10]);
     s->uart[0] = mcf_uart_create(s->pic[12], serial_hd(0));
     s->uart[1] = mcf_uart_create(s->pic[13], serial_hd(1));
 }
-- 
2.41.0


