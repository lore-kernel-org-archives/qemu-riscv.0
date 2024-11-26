Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C479D3B984
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Nov 2024 11:24:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tFteX-0003oe-T5; Tue, 26 Nov 2024 06:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFteO-0003mn-Mk
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2024 06:22:36 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFteM-0002dg-4w
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2024 06:22:36 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-434a7ee3d60so1905845e9.1
 for <qemu-riscv@nongnu.org>; Tue, 26 Nov 2024 03:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732620152; x=1733224952; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ym7MlPUFYz2GU5YCplhDtE7b6ovE3xgVe6aZRCcPdv4=;
 b=O269jXpeoMK9d1++iTv+YTvOFcSfjM9awFg3fi93MDx5LY5PIBYYL2fxJTNi/PeMWK
 x2kewtuNbVV/z1r6AvUz2mE8nnoIq27syZTxNoddQktPcmloj1pmUQjuFdR78DlCsOyN
 qjD3N0wCN4BXh/mWKHZYo19e3OsqHUC35LlXpXIteTjvVTBo06DaQHd1M2V3k3GJMbZo
 JsEeAtCeKrVL1ZmCAsz8mgrJqS+aHGbAgIzsytwNqskzatFWdf9oX6KUy5eSLVAYza0y
 S1xyhxT51OyYJTmSyUpSn/9iUDwkN5CYQT8mWDUn+4Rgf/edkkQqEIzdgoH4nq77KKN7
 FFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732620152; x=1733224952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ym7MlPUFYz2GU5YCplhDtE7b6ovE3xgVe6aZRCcPdv4=;
 b=VSZK8WbfeeRRlcCi2CCjUZQmu8vDn2sNH0nTvDTEiXra1owNOca5QrG5I7KhXHpvfD
 FvfliVLt86C8uB27bH7Wg3IaqEzkRKD+mGvaJBoDt5UI+DGo5teHwlZJXEFp/PZCkRSO
 OqJi/9ws2qAjNHFGtkRTLSqFjgNbTsyDBMWxZjkw6u/yQiBXA+4tSEXS7DUfVa5nFyZe
 O1/PWiVqjYnHhqcjIKLHOUI7Uug4AzwxQUk3g8K/EszKUrbpXKxh3ncSANoyBztei9KM
 vRTiddmHimHWN5qkPzK8OXMCh8DkYONphG49qqk2+D089XFX06uIFajSrdkeC1L01UoX
 DOWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQHn437wdtrVAL6c1CmWrtemKjYRs+cwiQxvDO7S7IyksNggd1qZcsgjMl3rnVGfQOKpvJTAcPfOV/@nongnu.org
X-Gm-Message-State: AOJu0YwkMx0FuZKb8hdBoVHdPYGkEXMu92BhGYe6Q0vNLrOSCfL/h4nq
 BV9iJ/SYY3XfIuSRJi9ldubbt0CVuLysJ/S2YAyabBW4f/OdLHTdVzTPpEGcbpU=
X-Gm-Gg: ASbGnct4G3wrsY/Nerzx1im84dssbQWQht9lK89p23tkPTVZCm7KJbE0fwGOszdM/dD
 mcK2v/CzsBewUqdVLfMiGTp3eFk0hJNt2NNjhEKAdvzVhZopkUtuDo3gxYWORPgBNSp6AwxSQkW
 nU2GYE8x3FJaSgFFhQjSUEC9/Nu2V+0MkzVycToFcXHtWDVm404Rd+6kNJoK8+S2wB1kWnmv6r3
 G08ScbwVwG+KFHFj9plbDkp+Wn5MyJW84opBRJHZiqMzPL9L9XD0yfHTHM6Z/qmtGYsCcbm
X-Google-Smtp-Source: AGHT+IFBBmx/zRqWz+0+3nZ5bzn94HIXIH1xaptS/bJKBgN/Ji0e/N+lfNjKX8nxRbW8D6cFnG6cKw==
X-Received: by 2002:a7b:c85a:0:b0:431:15f1:421d with SMTP id
 5b1f17b1804b1-434a4eb786dmr23408865e9.16.1732620152605; 
 Tue, 26 Nov 2024 03:22:32 -0800 (PST)
Received: from localhost.localdomain ([176.176.143.205])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb3134bsm12970699f8f.58.2024.11.26.03.22.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Nov 2024 03:22:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 v2 03/13] hw/pci: Factor
 machine_refuses_bar_at_addr_0() helper out
Date: Tue, 26 Nov 2024 12:22:02 +0100
Message-ID: <20241126112212.64524-4-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126112212.64524-1-philmd@linaro.org>
References: <20241126112212.64524-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Since we are going to re-use access to the
MachineClass::pci_allow_0_address field, factor the
current code as a new machine_refuses_bar_at_addr_0()
helper. In pci_bar_address() invert 'allow_0_address'
logic as 'bar_at_addr_0_refused'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/pci.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 1416ae202c3..e05f8a828bb 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -520,6 +520,13 @@ bool pci_bus_bypass_iommu(PCIBus *bus)
     return host_bridge->bypass_iommu;
 }
 
+static bool machine_refuses_bar_at_addr_0(void)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
+
+    return !mc->pci_allow_0_address;
+}
+
 static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
                                        MemoryRegion *mem, MemoryRegion *io,
                                        uint8_t devfn_min)
@@ -1472,8 +1479,7 @@ pcibus_t pci_bar_address(PCIDevice *d,
 {
     pcibus_t new_addr, last_addr;
     uint16_t cmd = pci_get_word(d->config + PCI_COMMAND);
-    MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
-    bool allow_0_address = mc->pci_allow_0_address;
+    bool bar_at_addr_0_refused = machine_refuses_bar_at_addr_0();
 
     if (type & PCI_BASE_ADDRESS_SPACE_IO) {
         if (!(cmd & PCI_COMMAND_IO)) {
@@ -1485,7 +1491,7 @@ pcibus_t pci_bar_address(PCIDevice *d,
          * TODO: make priorities correct and remove this work around.
          */
         if (last_addr <= new_addr || last_addr >= UINT32_MAX ||
-            (!allow_0_address && new_addr == 0)) {
+            (bar_at_addr_0_refused && new_addr == 0)) {
             return PCI_BAR_UNMAPPED;
         }
         return new_addr;
@@ -1506,7 +1512,7 @@ pcibus_t pci_bar_address(PCIDevice *d,
        mappings, we handle specific values as invalid
        mappings. */
     if (last_addr <= new_addr || last_addr == PCI_BAR_UNMAPPED ||
-        (!allow_0_address && new_addr == 0)) {
+        (bar_at_addr_0_refused && new_addr == 0)) {
         return PCI_BAR_UNMAPPED;
     }
 
-- 
2.45.2


