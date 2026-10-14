Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC105CC6B1A
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 09:46:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGvXX-0005oi-64; Wed, 14 Oct 2026 05:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvXK-0005BM-VH
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:44:39 -0400
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvXI-00028d-H8
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:44:38 -0400
Received: by mail-dl1-x122c.google.com with SMTP id
 a92af1059eb24-170135e43c7so1218198c88.0
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 02:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791971075; x=1792575875; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iMUZS7K52F//fkHbX7hXqIL5N3cFp0eM7Rhs0CpcbPY=;
 b=ox+HgsBGA2etho5mvACO7WHp0Y13wyCqFm438de6182Tow5dGfuC0kungv+T2/25Ft
 IXa8Dj5sREq2pKZEZiu05Cq5mmyxerFNzlNqurbRtB9mrE/tuDxtwACdY2h7M1wp1HfB
 IWnQGRIxzzoE7f3zSjbaP1vNey3IQlkLo9uN/8zfjVPTD91o7lF0n2Y3q/64Z6KhBqBM
 BvCWpqHyxC/Vvhph3tuzt2eqzMukCk41eNlZJLXviKResYqygYz1qgh3Lr0yGlWkNNkm
 z8nL5deppOQi8EZkH5XdqY2ldn0k2dAOI4kqSfWzJJct/bvG4XIXSb0hGRuI0Mh41cEa
 o0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791971075; x=1792575875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=iMUZS7K52F//fkHbX7hXqIL5N3cFp0eM7Rhs0CpcbPY=;
 b=w5BkGWE6uiu/DTz2fKDsN7kgpxXJAT/34+VSeJlfvVR8kwG6kZwj3wqHN7FixCJ3Wl
 nxmIXzOrDsPy73iYsUU7GunHX9ofySl224HKIWgbk/tDsxyBWtHSYOM3qj1B8gBToGQp
 RAQ3/AQ1cW97fMr54Tfz0sKXx7j4I704vXHJrnasSOX0ELnQcO1XsLZHaBDIreVcLFoL
 er61e4figHU7P5f9x2Exynkgi2qXKDqVRwA6PtZyIG96+1+7mo5BLEwSbKvPJJVaLur4
 4jynr4e3RFbufXimECjCxS4FgLZy7mutSrQzH2YSUcrVUHm5L2TVf5QME4rqd0gxcEpA
 WYRA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxbmCQH7880QY3nY3D91i3frwjPfDEdf6S/mRKsyutIXzoU8WDvsjL0Iith/VXxxTYB3pBTW0/mcHN3@nongnu.org
X-Gm-Message-State: AFq9FYKwNKyiKORWVEe9DT5vvmiii1VT4omBPaXjLUaJznIBV01KVABP
 JzqxVveg2IoVR8gecm8yWK5MUz/nxzLglfAuutbhEZncPz6NdKpjsLJp
X-Gm-Gg: AYBFou1wOOYU6FoKRbEhv6nL4xWJGDeGmzll2Ah7epZBMqVAg5TEUlbtXuNYX5wAmzU
 /VYxm4mSg5VKCaKk0ZHqlSP8EBO7hFu95pw69aKQgsJhfUxd+iJaGLTJ8VUDIHPSRy5QxyXtcL1
 tJuSWPTC7rWhwQP+Vh6vogYO6Tm2MYD8oQjbOxLb8V+XL9cVg1eM2ivRsfnTai/fz7cdzPBOVRD
 uEvMs7rHUnOq5eSAMgl0el+BhM7bypM6JqY9L+IaedZTK3BCahR1UN5grHF60iFBtanFwJBEe1+
 zJxa6EdMZLxzNG1ywT8HPuhFPrSIPFY/wtnVVOwVsZsd7tclUCDdhE5by9ov+PM+xtSmkki9WKA
 Ugac9s8RVg16ZYHdXt7Ri88RMiUV23h1PLf2eB7RXU08Bok+cMQHeE+n0ZSwYruAgQ9/bW+kuKk
 w1G++QS3hI94OVCKOxM7z+Cgmh1gemUKY1StSKvCm1yC6FQlpqt7mqCc/aAMW+3l0s4JANfwNPs
 EDQfeMwgHPrLE5cgw==
X-Received: by 2002:a05:701b:2612:b0:158:1ed2:cb58 with SMTP id
 a92af1059eb24-16a65069ff4mr20170590c88.39.1791971074935; 
 Wed, 14 Oct 2026 02:44:34 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-169a31f6f5csm44348380c88.11.2026.10.14.02.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:44:33 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, Eric Blake <eblake@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-s390x@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 David Hildenbrand <david@kernel.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Fabiano Rosas <farosas@suse.de>,
 Song Gao <17746591750@163.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH 28/34] hw: Add MachineClass.targets for all "virt" machines
 for all possible targets
Date: Wed, 14 Oct 2026 17:41:43 +0800
Message-ID: <20261014094224.1976-13-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261014094224.1976-1-luoyonggang@gmail.com>
References: <20261014094224.1976-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122c;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Those targets are ARM, RISC-V, LoongArch, M68K, OpenRISC, Hexagon and Xtensa

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/arm/virt.c       | 2 ++
 hw/hexagon/virt.c   | 2 ++
 hw/loongarch/virt.c | 2 ++
 hw/m68k/virt.c      | 2 ++
 hw/or1k/virt.c      | 2 ++
 hw/riscv/virt.c     | 2 ++
 hw/xtensa/virt.c    | 2 ++
 7 files changed, 14 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ceb848ca386..b9f206f6cf0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -29,6 +29,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/base-arch-defs.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "qemu/option.h"
@@ -4162,6 +4163,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
+    mc->targets = QEMU_ARCH_ARM;
     mc->init = machvirt_init;
     /* Start with max_cpus set to 512, which is the maximum supported by KVM.
      * The value may be reduced later when we have more information about the
diff --git a/hw/hexagon/virt.c b/hw/hexagon/virt.c
index ed086afe204..ee026730841 100644
--- a/hw/hexagon/virt.c
+++ b/hw/hexagon/virt.c
@@ -6,6 +6,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/base-arch-defs.h"
 #include "qapi/error.h"
 #include "hw/hexagon/virt.h"
 #include "elf.h"
@@ -358,6 +359,7 @@ static void virt_class_init(ObjectClass *oc, const void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
+    mc->targets = QEMU_ARCH_HEXAGON;
     mc->desc = "Hexagon Virtual Machine";
     machine_class_set_name(mc, "virt");
     mc->init = virt_init;
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 5ca992a5ac7..f85a315388a 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2021 Loongson Technology Corporation Limited
  */
 #include "qemu/osdep.h"
+#include "qemu/base-arch-defs.h"
 #include "qemu/units.h"
 #include "qemu/datadir.h"
 #include "qemu/cutils.h"
@@ -1460,6 +1461,7 @@ static void virt_class_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
+    mc->targets = QEMU_ARCH_LOONGARCH;
     mc->init = virt_init;
     mc->default_cpu_type = LOONGARCH_CPU_TYPE_NAME("la464");
     mc->default_ram_id = "loongarch.ram";
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 6f141488752..a00c226f559 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/base-arch-defs.h"
 #include "qemu/target-info.h"
 #include "qemu/units.h"
 #include "qemu/guest-random.h"
@@ -314,6 +315,7 @@ static void virt_init(MachineState *machine)
 static void virt_machine_class_init(ObjectClass *oc, const void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    mc->targets = QEMU_ARCH_M68K;
     mc->desc = "QEMU M68K Virtual Machine";
     mc->init = virt_init;
     mc->default_cpu_type = M68K_CPU_TYPE_NAME("m68040");
diff --git a/hw/or1k/virt.c b/hw/or1k/virt.c
index ec20045a3d0..4e9630656b2 100644
--- a/hw/or1k/virt.c
+++ b/hw/or1k/virt.c
@@ -7,6 +7,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/base-arch-defs.h"
 #include "qemu/error-report.h"
 #include "qemu/guest-random.h"
 #include "qapi/error.h"
@@ -549,6 +550,7 @@ static void openrisc_virt_machine_init(ObjectClass *oc, const void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
+    mc->targets = QEMU_ARCH_OR1K;
     mc->desc = "or1k virtual machine";
     machine_class_set_name(mc, "virt");
     mc->init = openrisc_virt_init;
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d8a2fd7d468..56033eaec79 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/base-arch-defs.h"
 #include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qemu/guest-random.h"
@@ -1133,6 +1134,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
+    mc->targets = QEMU_ARCH_RISCV;
     mc->desc = "RISC-V VirtIO board";
     machine_class_set_name(mc, "virt");
     mc->init = virt_machine_init;
diff --git a/hw/xtensa/virt.c b/hw/xtensa/virt.c
index d3c51f8158a..173ef28f28b 100644
--- a/hw/xtensa/virt.c
+++ b/hw/xtensa/virt.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/base-arch-defs.h"
 #include "qemu/target-info.h"
 #include "qapi/error.h"
 #include "system/reset.h"
@@ -118,6 +119,7 @@ static void xtensa_virt_init(MachineState *machine)
 
 static void xtensa_virt_machine_init(MachineClass *mc)
 {
+    mc->targets = QEMU_ARCH_XTENSA;
     mc->desc = "virt machine (" XTENSA_DEFAULT_CPU_MODEL ")";
     machine_class_set_name(mc, "virt");
     mc->init = xtensa_virt_init;
-- 
2.55.0.windows.3


