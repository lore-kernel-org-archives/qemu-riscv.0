Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EA9C47DAF
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:43:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQnAj-0003Jm-PG; Fri, 19 Jan 2024 06:36:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAi-0003IS-Ux
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:36:28 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAh-0002ab-3s
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:36:28 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40d6b4e2945so7281155e9.0
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664185; x=1706268985; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yC7nFrc+dTucMYfwHpflpLWtq50UrK6Wx6/xFIpSsPw=;
 b=hxSEOLGX6TEMJipYg0bdGyv3sY7C5crsh7vTE0WMqROIW/I54924/dWcXxxID0Fp63
 QJRN8KD6sRnEGKbssQ4nKsQEAI3UwWFwBSX/dQVj7SoKuTMzKqq//4BWcFCdfdZbmEWJ
 hNRXp259U6AOkwuneBEQnsmsgynRqrWIWKdiudILpvmfjPxHkw3MUus4zZsFbq7t/w/1
 b23e9+00JhQ3PrAimUN6ll3nH5AaJRhhHkct+E9K2I4w2V/3MCUOYmgN0NrkDK5d0Il0
 WPpzHS96RwvyJ3YCDEbcuYaEdZ+TQboFvAoeO9KU87CltVX2j5AnaUoOkDiO24MiErtW
 qewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664185; x=1706268985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yC7nFrc+dTucMYfwHpflpLWtq50UrK6Wx6/xFIpSsPw=;
 b=vxYR93g1OkR2GCWWzjIK4l7/DvGWJRa9XBRPmu4uf/z3aiaVf+usiOjk6jEd5ROLcf
 feZ1ei0ORXYuxjxAcjr3lkpUPAQEe1zYehjfGSq0+RusmholtG9gPcMR9hYJMPnX2nVv
 FfPWGG5GY6hlvu03IG2UPdAdMOriJBLaObTBKME2rI6ahlKFhu/Js9g5tMTXY9mD8p85
 TRukAxP+IWzMsSr/H/0s5vuUINQULbsMWxaQ3JDCvf/9qRGNRQB16/WDwq6yvpZvklld
 GTk0kwn2iml/OiHnWu7qPaZ7ko5/6ycb4kC1dQ7nilsWqMTgZadGueRuYBgGIEU2Js6K
 SAGQ==
X-Gm-Message-State: AOJu0YxFQOyybai+dN3y8lCw7Y2nYsPanx2DNyYkYyloSTgqpUKq+Z2X
 468uUDA+HDqu77WONmMkUWysbaQdfxwcsS4EKymGf6XPWT625weoxljBj8vQqPE=
X-Google-Smtp-Source: AGHT+IFBVm7S7WLzwCwyYGo7rcNIMeCwphiNOVoiujwihRnMx0X0nYPI5NriculF1uGSxEVY7KBWBw==
X-Received: by 2002:a05:600c:1d03:b0:40e:4210:6bc3 with SMTP id
 l3-20020a05600c1d0300b0040e42106bc3mr1112822wms.2.1705664185405; 
 Fri, 19 Jan 2024 03:36:25 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 be13-20020a05600c1e8d00b0040e96a98762sm3062837wmb.17.2024.01.19.03.36.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:36:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 17/36] hw/i386/pc_piix: Make piix_intx_routing_notifier_xen()
 more device independent
Date: Fri, 19 Jan 2024 12:34:46 +0100
Message-ID: <20240119113507.31951-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Bernhard Beschow <shentey@gmail.com>

This is a follow-up on commit 89965db43cce "hw/isa/piix3: Avoid Xen-specific
variant of piix3_write_config()" which introduced
piix_intx_routing_notifier_xen(). This function is implemented in board code but
accesses the PCI configuration space of the PIIX ISA function to determine the
PCI interrupt routes. Avoid this by reusing pci_device_route_intx_to_irq() which
makes piix_intx_routing_notifier_xen() more device-agnostic.

One remaining improvement would be making piix_intx_routing_notifier_xen()
agnostic towards the number of PCI interrupt routes and move it to xen-hvm.
This might be useful for possible Q35 Xen efforts but remains a future exercise
for now.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240107231623.5282-1-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_piix.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 042c13cdbc..abfcfe4d2b 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -92,13 +92,10 @@ static void piix_intx_routing_notifier_xen(PCIDevice *dev)
 {
     int i;
 
-    /* Scan for updates to PCI link routes (0x60-0x63). */
+    /* Scan for updates to PCI link routes. */
     for (i = 0; i < PIIX_NUM_PIRQS; i++) {
-        uint8_t v = dev->config_read(dev, PIIX_PIRQCA + i, 1);
-        if (v & 0x80) {
-            v = 0;
-        }
-        v &= 0xf;
+        const PCIINTxRoute route = pci_device_route_intx_to_irq(dev, i);
+        const uint8_t v = route.mode == PCI_INTX_ENABLED ? route.irq : 0;
         xen_set_pci_link_route(i, v);
     }
 }
-- 
2.41.0


