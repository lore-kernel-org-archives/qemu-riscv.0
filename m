Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36FDD3B987
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Nov 2024 11:26:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tFtfW-00048I-J1; Tue, 26 Nov 2024 06:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFted-0003uG-Pm
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2024 06:22:53 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFteZ-0002gZ-Pw
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2024 06:22:50 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3822ba3cdbcso3401966f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 26 Nov 2024 03:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732620166; x=1733224966; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V/FHFrkLjfSL+r0KQnjlYWTgmdb9j50qofDa5n4Bijs=;
 b=P4SX3nJ8Vp6RJZ+ihkQdj6vdIKHHI1dbmNsq42BoCGN9fw9FCVwFCPhZqMvctY7AIq
 6jQiCN7JUjJAPJoShU9MBou4+IFRiGMgUnl/Ke7MZ7ZRqnzKjyZk0jdDshtjg8Xt9UCH
 cCpmhpg8MEtYKMPWGAoRHbwS84HO7gE8gGN2/uURE/Bfmwrmh/mgcmFZ7nY2kbvSSx/F
 y9QO2aXxDbmL2aKtfl+tH65IqlblSR/tt3o8v/xtnEzZSWBa5s+M85Uhtlrk0ITCpqNF
 e9YifWPO+xtwtikySDHSgzXmlsaf4LtLJihCbir4hM3xVwDnEKb6rOA5Wy1jtx+PMtEm
 C+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732620166; x=1733224966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V/FHFrkLjfSL+r0KQnjlYWTgmdb9j50qofDa5n4Bijs=;
 b=Dq6uw1awXGHMWbIPF5cPVc+VhKMouw+jTcxLY3xNKa+ybfR5BbdSxaej8T9xROV02I
 UG75MVkMSrKCof4QGK3sHe8H1lmM4KqRCeCny3XsYJF/20PRRrVKkxm4iUh6V0QiBjx1
 y5l5AQIC81uVwqY3pQlbWcYOFe3elyM8JLO3poNvVaWuKRyvnsqoz57yyKg7EiNCPe33
 SFpgktCoIZtuZo4Lrug6I1ZD1f12gD+6jcUqBa9XqGGdOLDBeDkbM4u1/gBw/ZT6UQP2
 pPKjV0bg+8u0i+eNCYwbMQCeu616P2+PgagrB7uTaN++hKQt9Z6muIwf8zCrzRIDcypm
 b96A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRs9WX2/6eJYijYSpTVgMuJCl5qtEaJYF9NW4vP12JQTh7hIRo0xl31jaRUmW9flnKobBrAKOEYOCu@nongnu.org
X-Gm-Message-State: AOJu0YwS1FurI6kvN79q3lBrKlV4JP3vHmmUE4pp2OdsS+6Hb13bEyqO
 NF3aEQ1O1CaEFAI/VjrMf2OdMUNB6/BTm69eWP9nMKHmGBQRgzWYAkNJszeSarQ=
X-Gm-Gg: ASbGncuxuFAf1uTfeAobcdJ5xiQSIdD0+CJcPTJcTfjh7FTs8qR8hKrnBOCAwyAMaYt
 D1Xhsj1xn68oaSvGuRh8eFfcL4FCQ2wKEGdh2p6Ig8p/f6VPxG2145pv/IQddKmsr2Gski4HAwA
 uSXaXff463xLbFXanJRd95ttr9NFpkhRAq8qficPJZxfh7g7sDdYfUn2+c0IOR71HLOQTXDqRvj
 e/erIOTBPZzvIYsnt2fJVDizyYL5b1Pc1Kbs6O0qTrGaahDxIiVzS1Ih46/CZXb1HuEWZbN
X-Google-Smtp-Source: AGHT+IFQD3d6AiS/0pziBy+6unSAZm4P726MrSNX2osV0nsY0tXODVnNZJr/byHSaMZMlw5SB6lpbw==
X-Received: by 2002:a5d:6d01:0:b0:382:4c36:e072 with SMTP id
 ffacd0b85a97d-38260b969b2mr13375617f8f.30.1732620165804; 
 Tue, 26 Nov 2024 03:22:45 -0800 (PST)
Received: from localhost.localdomain ([176.176.143.205])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb264cdsm13228780f8f.49.2024.11.26.03.22.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Nov 2024 03:22:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 v2 04/13] hw/pci: Introduce
 PCIBusFlag::PCI_BUS_BAR_AT_ADDR0_REFUSED
Date: Tue, 26 Nov 2024 12:22:03 +0100
Message-ID: <20241126112212.64524-5-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126112212.64524-1-philmd@linaro.org>
References: <20241126112212.64524-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

Some machines need PCI buses to allow access at BAR0.
Introduce the PCI_BUS_BAR_AT_ADDR0_REFUSED flag and the
pci_bus_refuse_bar_at_addr_0() helper. Set the flag in
pci_root_bus_internal_init() where all root buses are
created.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/pci/pci_bus.h | 6 ++++++
 hw/pci/pci.c             | 5 ++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
index 6ecfe2e06d5..6d7bf682e8f 100644
--- a/include/hw/pci/pci_bus.h
+++ b/include/hw/pci/pci_bus.h
@@ -26,6 +26,7 @@ enum PCIBusFlag {
     PCI_BUS_EXTENDED_CONFIG_SPACE                           = 0x0002,
     /* This is a CXL Type BUS */
     PCI_BUS_CXL                                             = 0x0004,
+    PCI_BUS_BAR_AT_ADDR0_REFUSED                            = 0x0008,
 };
 
 #define PCI_NO_PASID UINT32_MAX
@@ -72,4 +73,9 @@ static inline bool pci_bus_allows_extended_config_space(PCIBus *bus)
     return !!(bus->flags & PCI_BUS_EXTENDED_CONFIG_SPACE);
 }
 
+static inline bool pci_bus_refuse_bar_at_addr_0(PCIBus *bus)
+{
+    return !!(bus->flags & PCI_BUS_BAR_AT_ADDR0_REFUSED);
+}
+
 #endif /* QEMU_PCI_BUS_H */
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index e05f8a828bb..27b66583e54 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -537,6 +537,9 @@ static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
     bus->address_space_mem = mem;
     bus->address_space_io = io;
     bus->flags |= PCI_BUS_IS_ROOT;
+    if (machine_refuses_bar_at_addr_0()) {
+        bus->flags |= PCI_BUS_BAR_AT_ADDR0_REFUSED;
+    }
 
     /* host bridge */
     QLIST_INIT(&bus->child);
@@ -1479,7 +1482,7 @@ pcibus_t pci_bar_address(PCIDevice *d,
 {
     pcibus_t new_addr, last_addr;
     uint16_t cmd = pci_get_word(d->config + PCI_COMMAND);
-    bool bar_at_addr_0_refused = machine_refuses_bar_at_addr_0();
+    bool bar_at_addr_0_refused = pci_bus_refuse_bar_at_addr_0(pci_get_bus(d));
 
     if (type & PCI_BASE_ADDRESS_SPACE_IO) {
         if (!(cmd & PCI_COMMAND_IO)) {
-- 
2.45.2


