Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532B7EB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 12:11:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEqUe-0005r7-WE; Thu, 29 Jun 2023 08:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEqUd-0005qV-FA
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 08:11:23 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEqUb-0000Cf-O9
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 08:11:23 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3141140f51bso668844f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 05:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688040679; x=1690632679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yB0NCZT8QF6RTN9p4AzdupdhKCd458WHvVaRRns1YuU=;
 b=YNT/N+beqVDkqxKFnOFvYKPKZqC0gomiXkMrDN/ybmsWD/4Wk+bM5W5hq6C3LYxm1D
 aEOtlHgE9CW+Hf1Pn/EdvkvslJ2F1/6MZxi8aWp1772TTxrYDRvlNV/ziK7l131j83fp
 F9UpapQPNdwUsk31DnjwzefnQtNVREQcu2QXgBymg7JGevXCgsqBJZigFwK8HQo/6KBv
 2hXamMCBiO/Whp7AvHaAdrQOjWwZkYBYmf+7MCxvMAT3NIeZ6laaXUSdnXacXcXn+Be5
 I2QDB5I9kvywZVS/uGUCq+RF6TBHts03K4Q2go7AY47//Vh/th6zcrfkGGCle9l+c655
 hUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688040679; x=1690632679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yB0NCZT8QF6RTN9p4AzdupdhKCd458WHvVaRRns1YuU=;
 b=RqsL1ezoBVC3x6X9/qdj5zVKkyzOBrTvAUpvmApuXL/4lyUtUbA0aybfpcHHXYWgk9
 GEjXxsqsJLdA+DBlwy9Aj3437CBV6mw2JkCSp+2Bnj99uDg9DKTakG1i3PtueTuTpcoF
 kPmALpq6+wBhmCQEaWGauzaiQJrnuuVMdbhcOnZy2yPq64rc6Z7uXqmtieNlQNsNdccS
 VZmwOihJ5AjcT8jW23uttMfTWJBVnZ0l6VlNMP0NZpWldsQB6TQxtW38pCjePmhgI902
 p36aV2teqCwpQooAMWYPOQr+bDgGRWN/NNlDhZomSCqrfMJg9xiH8U1ZwbInGvWEIqqD
 MqgQ==
X-Gm-Message-State: AC+VfDyV+i6sMrwqTNFMGiwd/a4brmyF0yqKd90yqYi9UfHIT4MCHgBJ
 M4eceXv8h40rqoSHATAsez6Yuw==
X-Google-Smtp-Source: ACHHUZ5HwHZ4gV+p92tEanxKFvyyxd/a+esdaHnzALF6ZcnyXPROh5MV12wMcm01D3MKgRjaFiN/Nw==
X-Received: by 2002:a5d:6a8c:0:b0:313:f8ca:989f with SMTP id
 s12-20020a5d6a8c000000b00313f8ca989fmr7409629wru.10.1688040679265; 
 Thu, 29 Jun 2023 05:11:19 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.242])
 by smtp.gmail.com with ESMTPSA id
 j4-20020adfea44000000b0030fa3567541sm15838493wrn.48.2023.06.29.05.11.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Jun 2023 05:11:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/2] hw/riscv/virt: Restrict ACLINT to TCG
Date: Thu, 29 Jun 2023 14:11:03 +0200
Message-Id: <20230629121103.87733-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230629121103.87733-1-philmd@linaro.org>
References: <20230629121103.87733-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

The Advanced Core Local Interruptor (ACLINT) device can
only be used with TCG. Check for TCG enabled instead of
KVM being not. Only add the property when TCG is used.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/system/riscv/virt.rst |  1 +
 hw/riscv/virt.c            | 18 ++++++++++--------
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index b33f45e5b3..f9a2eac544 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -93,6 +93,7 @@ The following machine-specific options are supported:
 
   When this option is "on", ACLINT devices will be emulated instead of
   SiFive CLINT. When not specified, this option is assumed to be "off".
+  This option is restricted to the TCG accelerator.
 
 - aia=[none|aplic|aplic-imsic]
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 68ccd0bde1..cdb88a1529 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -44,6 +44,7 @@
 #include "chardev/char.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tpm.h"
 #include "hw/pci/pci.h"
@@ -776,7 +777,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
 
         g_free(clust_name);
 
-        if (!kvm_enabled()) {
+        if (tcg_enabled()) {
             if (s->have_aclint) {
                 create_fdt_socket_aclint(s, memmap, socket,
                     &intc_phandles[phandle_pos]);
@@ -1370,7 +1371,7 @@ static void virt_machine_init(MachineState *machine)
                                 hart_count, &error_abort);
         sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_fatal);
 
-        if (!kvm_enabled()) {
+        if (tcg_enabled()) {
             if (s->have_aclint) {
                 if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
                     /* Per-socket ACLINT MTIMER */
@@ -1682,12 +1683,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
 #endif
 
-    object_class_property_add_bool(oc, "aclint", virt_get_aclint,
-                                   virt_set_aclint);
-    object_class_property_set_description(oc, "aclint",
-                                          "Set on/off to enable/disable "
-                                          "emulating ACLINT devices");
-
+    if (tcg_enabled()) {
+        object_class_property_add_bool(oc, "aclint", virt_get_aclint,
+                                       virt_set_aclint);
+        object_class_property_set_description(oc, "aclint",
+                                              "Set on/off to enable/disable "
+                                              "emulating ACLINT devices");
+    }
     object_class_property_add_str(oc, "aia", virt_get_aia,
                                   virt_set_aia);
     object_class_property_set_description(oc, "aia",
-- 
2.38.1


