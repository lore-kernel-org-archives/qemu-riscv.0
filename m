Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0424CCD1BF
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:16:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vCNHO-0008Cx-Lq; Fri, 24 Oct 2025 15:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNHI-0008BB-Lc
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:16:44 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNHF-0007TM-7N
 for qemu-riscv@nongnu.org; Fri, 24 Oct 2025 15:16:44 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-475c9881821so16099465e9.0
 for <qemu-riscv@nongnu.org>; Fri, 24 Oct 2025 12:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761333399; x=1761938199; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YDlsCHLjW8G2DhCTmRjvAvj5A32lGQeNER622BWchio=;
 b=TZxWXh6JJa86ctZBewkITm391ndMopoqfCe5p0zcmZ6nKco1PeSR3SMp9p8dHNb4pu
 TK1Kxh6gSall8qZnay9499fsdyuMwhzOoaAaaoAcAyI5HGhaj1wzh9/R+xUQqsMFKGt7
 Mohm7DQWNuBnKWopUsnxLiFHDaLoPi86yOPwW3kDJDC2S9C+AY0eII6FnQ5ze5mlnNNX
 +45xOeFdJ5rWoapY12AKL86aWsei6dstcljmTR92dbal6lZLeRhtydOvp94uDV7QE7SM
 LkaiNSe5ukOobp3aCq+FqIiy0GfHmhCvjkSKQSNoI+u/kvJpvilu28Pyx1oJpADELQcH
 OHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761333399; x=1761938199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YDlsCHLjW8G2DhCTmRjvAvj5A32lGQeNER622BWchio=;
 b=lfPof0cF1QrVGXRh1qwcpSAZKJXyviOaINwt5EAbEXyVmRFlJc6MIxAZL/5t+2z+Uv
 igRzmg5yLancODOMckIT7EeP48vrWboSZf/9uK1aKCl7JKKyr5plZ1a1XULPfPnetjjH
 TKw5mNyedoFGelHLDBz+wHc6qUwjEFMC3ZyVRqB7hizAE9lpUID8tewGEXEChtYncFJz
 HVRGbGvB6rzBUW56qf5QRw5hwBAK8WqpCe5ma/AROZIesSYOfHqBe5E5nJp+wai8gVxQ
 BP7ejNmtYPKdpUr80ML1mraVsG274ZsdnYqLSaKp7ytNfFDMx/6bQ3OkVio4iD9YuoaZ
 nobA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfQhLO05/Ahbs2N7SXOwrplHBCKHNr1RwhV02Qj+UstzkqjB8sVFgiRaA1r5FZQeFY7mOeCvr3n95/@nongnu.org
X-Gm-Message-State: AOJu0YyPhgGjQMXFM5WX9Eo1CRe8pmTp+ZyxHJh5CEB88k+l0fAEJTjK
 BD+pytCQ8rCjTLazsMW0NtD1oOw8qw93XqdbOX0QKuTx4Mod+DuoFMXAAvinQGYW1iI=
X-Gm-Gg: ASbGnctk+LKS2EbrCZxMpKzrSodX61vyvHJMUZVsw5fq7x1P9wbV75FDRqMe65Ax90q
 IrywJMuc3IAoD5EzTcsxKHo0oRQTFSwN9B0TijvNyla2mGT5nPMJ3KmSFsWPmSSTOM34YDTouDI
 3HF5DrEbGXGIc744Nk3HMKDTdw4syOynguBiZBPKCagnWmGA1MbgjS80EP1+tzd7kBNAMPqrbmG
 +pc06IhciUf7bmY+rcsmJMlO5Cfq92nw830hvUXkP9pdgFrnENV4H942Www6genLhqjF66DCX38
 DSp7cmZkKYLGWnXdWXI1ZeRlcPM0hhZ7w0W7/0cQtw8qUPZz9tJpx9tSQ41wm66p5m9qvMlJ5bX
 g80+G1kAg+dW38dRwD89t7V+Ou3si88MNARsdrDXXgI+1uhmY4lV8+gihf4zGbJda7MqyFelTun
 NTStl2OzRajDfwCVq9EtVhSws/TuL+UYlmlFobxYXf4cgriAYDIiOaoLfTy7Yc
X-Google-Smtp-Source: AGHT+IG+U60Ir9bRtfjEJVzelu3OzmRk1cfg5abPsD4lECTtWtXQXdua34LmaMXSL0w4T+Zl7suArw==
X-Received: by 2002:a05:600c:3f0d:b0:45d:dc10:a5ee with SMTP id
 5b1f17b1804b1-475d2430687mr30364255e9.15.1761333399299; 
 Fri, 24 Oct 2025 12:16:39 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caf152absm125783415e9.9.2025.10.24.12.16.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:16:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 08/27] hw/pci-bridge/pci_expander_bridge: Use proper SysBus
 accessors
Date: Fri, 24 Oct 2025 21:03:55 +0200
Message-ID: <20251024190416.8803-9-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

SysBusDevice::mmio[] and SysBusDevice::pio[] are kind of internal.
Use the proper accessors.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-bridge/pci_expander_bridge.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 1bcceddbc4d..2e84bbe1615 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -157,13 +157,13 @@ static char *pxb_host_ofw_unit_address(const SysBusDevice *dev)
     main_host = PCI_HOST_BRIDGE(pxb_dev_base->parent_bus->parent);
     main_host_sbd = SYS_BUS_DEVICE(main_host);
 
-    if (main_host_sbd->num_mmio > 0) {
-        return g_strdup_printf(HWADDR_FMT_plx ",%x",
-                               main_host_sbd->mmio[0].addr, position + 1);
+    if (sysbus_has_mmio(main_host_sbd, 0)) {
+        MemoryRegion *mr = sysbus_mmio_get_region(main_host_sbd, 0);
+        return g_strdup_printf(HWADDR_FMT_plx ",%x", mr->addr, position + 1);
     }
-    if (main_host_sbd->num_pio > 0) {
-        return g_strdup_printf("i%04x,%x",
-                               main_host_sbd->pio[0], position + 1);
+    if (sysbus_has_pio(main_host_sbd, 0)) {
+        uint32_t addr = sysbus_pio_get_address(main_host_sbd, 0);
+        return g_strdup_printf("i%04x,%x", addr, position + 1);
     }
     return NULL;
 }
-- 
2.51.0


