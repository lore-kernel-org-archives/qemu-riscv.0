Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3989BCCD1BF
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 08:08:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDekG-0001vB-RG; Tue, 28 Oct 2025 04:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDeiM-0008Mb-8T
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 04:06:04 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDeiE-00018y-2t
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 04:05:57 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-427060bc0f5so3056463f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 01:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761638733; x=1762243533; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iLNTJJ29Ee3X1iQPo0J9sRKYXDME7PYcE1MlaahJ0F8=;
 b=NmbsCkdFO1bIXmdJPZU5bZmPxgf5ssytzFLmJLBu+iAO8MQO8Euwm1fpl0FSv2MkhR
 jVUuPj97s9f+Lq7Waz2GWX5rrBTYr0Pord70qhHz6verIv0VuR9M5XIzNC9P5V2MXWhg
 9WS50bMnqQQ7OCZ//b5YytlMQ2bo8CQnnTdnTKWIymkU4zovi1f9aRBY7YVjjbHQLJfZ
 GpEZHNOzEpuKzhyuAznsOIh7InZtsUkccwWDeiQrczi/7oVbxvHiH48csvARNMOUhDvU
 vAK3c/Qj+bHA5ff6d2nI5X6857bQEvPHlFsJnJFgN3yAs5cyFzOINwErkw1cZnsJ9OpA
 b9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761638733; x=1762243533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iLNTJJ29Ee3X1iQPo0J9sRKYXDME7PYcE1MlaahJ0F8=;
 b=qhPE+j/U4m4eWta/ZuRl7+zIIe/Ba9tuKTgoiAdMY5xjymYmGDxcsUwrWGQEQah546
 6UHDLGT4PPoX/gT7XjLXj9SzM2AGE6Q3QSNqU5ycHQvT/Z98RA1UzLJ/pFBZNrXJM/Qh
 wlubAahSo6ZksytA5NNWrkcoO20wCw36FEAnBCZBJMR5IGgIdhehfTvG1trR5T7uPgR/
 dnCnpuQeGF8FwRnUCYzDXVmeMmue1zjx5X8czY9ynMz4sI7dLWnpbbf5J/JeJuz5Yadd
 /75qZ9h4dHmf1jIzG1LVyZblxjdhXYrf3mXyC0T0b/QLoJYKjjn4D0TLn1RSXMm/XsdH
 AYaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY3Wsp0BKBZidaz+RGaXYGbcEU9otWQFnkYq5b2pKdr03FLuBBTTzu0sg753kUQ6kzxYliCGsfsZyy@nongnu.org
X-Gm-Message-State: AOJu0YwGRKkf1SN/7m8a1XoOuHg+kal4PquZrnG7itfWUgt+ktwM1Zf9
 agYbY837V2VU39UZJn6TnUivh7bJsV6kBk/Q4sluJFJCAR7dHjOQYviw/WfEXyIaUJI=
X-Gm-Gg: ASbGncugGm0qfb/Y26b9ePjDB0RsOcnzoqBh454GFPhgez4txYfJcwPaKDErWt47Lvx
 xfsylgxdTgDdH/NTWXXPESJZ7nGYwWHgvVKOiZLGrT03km2FavOWXdX6zy55MV169cjM6U+nCg0
 spUqQKiU5EhJgkZhCwL05Kr2JadROKHE3Sip2S4yucv27MZZ5/8Jf/q4nV/AbpLFBv9Ws16a+AW
 nmCJrQlErejhLaBbOTVc78ZDevfjpSWNBjCM8fmAx7w+bVGBZULKq3QjUcIkh4u7igCN2l/p5h9
 rv2gqQ+zORL85dL+Ev5loJpwK5SOzpyQONxXjBJYcY9KhTRiNudGRlcNgxjgNLq6WCRJIqxmBhI
 D2pBXY15gbmAMy5xiBO2q9bGCFMPcMfczOBKYxX1srGjLvUOR6CnhbtL3BXSncst/1UfuxoPH5L
 7REEJK0DpczfmyX7bJouDxCg4q0hia90olcs8aWSOONMAzZZJzeo3fSftlO2v7zlKf/A==
X-Google-Smtp-Source: AGHT+IHTV9tfboutLKGYM3eTyb+CR5VW0SOflc97As9XGisSmavfqFO11jtskHLKrFhaWBMZ+mW0Jw==
X-Received: by 2002:a05:6000:40d9:b0:427:665:e37f with SMTP id
 ffacd0b85a97d-429a7e36fe9mr1801485f8f.4.1761638733488; 
 Tue, 28 Oct 2025 01:05:33 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952da12dsm19103620f8f.29.2025.10.28.01.05.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 01:05:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 7/7] hw/pci-bridge/pci_expander_bridge: Use proper SysBus
 accessors
Date: Tue, 28 Oct 2025 09:02:57 +0100
Message-ID: <20251028080258.23309-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028080258.23309-1-philmd@linaro.org>
References: <20251028080258.23309-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

SysBusDevice::mmio[] is kind of internal. Use the proper
sysbus_mmio_get_region() accessor.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-bridge/pci_expander_bridge.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 1bcceddbc4d..b4e2c95ae4c 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -157,9 +157,9 @@ static char *pxb_host_ofw_unit_address(const SysBusDevice *dev)
     main_host = PCI_HOST_BRIDGE(pxb_dev_base->parent_bus->parent);
     main_host_sbd = SYS_BUS_DEVICE(main_host);
 
-    if (main_host_sbd->num_mmio > 0) {
-        return g_strdup_printf(HWADDR_FMT_plx ",%x",
-                               main_host_sbd->mmio[0].addr, position + 1);
+    if (sysbus_has_mmio(main_host_sbd, 0)) {
+        MemoryRegion *mr = sysbus_mmio_get_region(main_host_sbd, 0);
+        return g_strdup_printf(HWADDR_FMT_plx ",%x", mr->addr, position + 1);
     }
     if (main_host_sbd->num_pio > 0) {
         return g_strdup_printf("i%04x,%x",
-- 
2.51.0


