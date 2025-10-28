Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F000CCF9E0
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 18:20:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDoIN-0003Vd-Ou; Tue, 28 Oct 2025 14:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoI6-0003KG-LA
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:19:33 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoHx-0002KL-CG
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 14:19:30 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-475ca9237c2so35884715e9.3
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 11:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761675557; x=1762280357; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fUj5tDuFxMrJLcMfMzba2XS192smTgWQLL5DdnxIsIc=;
 b=IuhRkrFVs+vVgPzP0yd83rXBTD1ivBFPi7bpG7j9cmaTAfYd2oSrfLpkNhO/EJ0GY3
 nmgJcOqeJkmZ+kf9dE6QiVRg/mOOBUqaD33YUbAgMND2DapTwePLYxqK2Bclq9ieag8c
 Rj3M0WNTQHdrhajYg4zTBn6Rly9BqQ5zomqzL9WJUDqgdqSba+nq/iY9UnCNCHsu0t2j
 H6Q83GGKjajqL5ck7WeDhxIUPUPx2Eo6kLtO9tZo4hhL1s6cVKeZr9w4udNZcKO93tkj
 w96fQ76cY7ebJKXG16c/SwTxZ8Sd9cvvmRTMAM0gjiUgARe+aEchG/axA00mprGI5wUJ
 4DyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761675557; x=1762280357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fUj5tDuFxMrJLcMfMzba2XS192smTgWQLL5DdnxIsIc=;
 b=Q+Do1U7L3IVWZPJg925uPdUZJ73zt348AtFIC6nnFIgoiYOEr5/ijDgUWzc9X4K/Wo
 En6JM5/NGREuY/rsNxinJM24CLaNLzf3dCn6bBZzD2DOFHQilpH3WQNPjsiA2HdbVYMR
 F+mbo/+1HKZzYnuhuusenSa8pNiyDW1r0yziKdKYzZ7wln4WPPzZo/s4OJ2tkZKK3oC4
 gb8kfUMtjhcwsioMSBzsooJbttlB7xXMU67DY7MgwA6lG8llZPhII6SUncZptqnmGu2P
 9Hbs8QGODaP9qJF7Sph/5JnGxlBBWiMkY3rBErC02+PnwP9CsWcVWCzTvaLreeFjtpc2
 8GXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXXMlhCjwv1dEBq2/yr8pExWZvL3X/mYxTAYV6JuA7TKQ16EDaesb6YQ0QGldlhfXzsrDIYS5QY2o/@nongnu.org
X-Gm-Message-State: AOJu0Yyb6W8stq7TcBT314BoSdi8HICIebRKHR+GBrYHpNsZBQmfVD1V
 6L42x1sbeXDoFIBwb7SGztSCvS4eKn+QC/JTIH5kRqDEHJRPXWzCknKIXFV80nPz8wg=
X-Gm-Gg: ASbGncsjrQOWp8ubIQxf/ncqoNXA0V5oy24Ut/K/3ad2TGza0WQHijzVMeTZLb4ux27
 LT1LaSbHQvUPA6d0yJtAIz4RcXmo6Kz5PfFm4Y+ti4923pOY3zU9uDM8JxFt3TShO9nYzNwzZvN
 4bcR9HG5R5YjudCCBExivkKZZBIUl5vCz5SqldyB61pwnZQQCK5IVohU2kCnHj+QE3OKH+Peplj
 v8IfrFe3EjYUyekInukXEBwDkA33cZ+Nbv+fIqVQKSdp69AxeAISFGvMXEhaz9aI/kMhJE8vKS4
 n6bZ5/rT5P8v5MaPQVTmchMRVJaxfSxZyRIDpgVGUYKg1LZgyFAlwRPg5Nk8bzfaJgdTNSOSWsT
 nXHipcg6It23l8hVwnW+x7AY+PZR300zGwxzAgBYwnuNVokiZBS11UtJsKqKBqUH7+iIPmbnoQN
 FLjUNNK02360cZ5PjLr8K8qAD9gKz5SebJtRN8HGYvVUE9QRL6qw==
X-Google-Smtp-Source: AGHT+IFI+gul3yKAwz4c1fktmae3PtXn0re8tT5hM2q9v277iSe/eJTmPxa7M5Ll7Jfuyxo1LE2TRg==
X-Received: by 2002:a05:600c:46cc:b0:477:bb0:751b with SMTP id
 5b1f17b1804b1-4771e1e0589mr3761845e9.27.1761675557024; 
 Tue, 28 Oct 2025 11:19:17 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e196a4bsm6065935e9.6.2025.10.28.11.19.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:19:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v3 06/25] hw/pci-bridge: Use proper SysBus accessors
Date: Tue, 28 Oct 2025 19:12:40 +0100
Message-ID: <20251028181300.41475-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

SysBusDevice::mmio[] is private data of SysBusDevice, use
sysbus_mmio_get_region() to access it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/pci-bridge/pci_expander_bridge.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 1bcceddbc4d..aa55749954a 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -157,9 +157,11 @@ static char *pxb_host_ofw_unit_address(const SysBusDevice *dev)
     main_host = PCI_HOST_BRIDGE(pxb_dev_base->parent_bus->parent);
     main_host_sbd = SYS_BUS_DEVICE(main_host);
 
-    if (main_host_sbd->num_mmio > 0) {
+    if (sysbus_has_mmio(main_host_sbd, 0)) {
+        MemoryRegion *mr = sysbus_mmio_get_region(main_host_sbd, 0);
+
         return g_strdup_printf(HWADDR_FMT_plx ",%x",
-                               main_host_sbd->mmio[0].addr, position + 1);
+                               mr->addr, position + 1);
     }
     if (main_host_sbd->num_pio > 0) {
         return g_strdup_printf("i%04x,%x",
-- 
2.51.0


