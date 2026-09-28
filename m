Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A40CA5FA2
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 12:12:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBACQ-0002v5-1p; Mon, 28 Sep 2026 08:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan260699@gmail.com>)
 id 1xB4W8-0005Lk-Jr
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 02:07:12 -0400
Received: from mail-wm2-f13.google.com ([74.125.225.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefan260699@gmail.com>)
 id 1xB4W4-0004PG-Hg
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 02:07:12 -0400
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49d1fb0cf5eso24414155e9.3
 for <qemu-riscv@nongnu.org>; Sun, 27 Sep 2026 23:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790575627; x=1791180427;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UrVtJk/zRiOa4XVd4HFsMF4pqFTMubmXdGMXTPSPLPg=;
 b=b2wVmBG1l5aT/Ru/q1pjr4NIzm8ycec3f5VgBXx55V/BMbihU3fh4e4Mw5fToQl3WK
 /Iih86ueoilgYJ5Ajd3mMLiZkmaiQPWOJ5FzEwl60Xvwwc24tUSTqfx3BnzSnT6oFK+5
 MOF0s2x4zSQfOwfRrAnI5+w2AZndKANtHjFM8Pb2uZonzrMl4eiWkfA64vR65tlJcWtZ
 vagEW4XIpmZM/deR9q/fuPPQvldWBwcvfF+g7lx3AEpqoP+JcTY03kfQuKv1KPnXUTFc
 5l9HOAZipmVWNr9+p29YXJolCsbFbEOW6wqoAoo0Kp1nbfUZ/mwi5vrv5T0YQ+89XWdT
 tG9A==
X-Forwarded-Encrypted: i=1;
 AKwUvBy3Xme/0a8un1lGs/L8o2lX/cjCq2ZFukX0K4cfQhwHUstWD38n76ps0wToIjPdb+8Oug0cxGaNjhNW@nongnu.org
X-Gm-Message-State: AFuF++loiLwyPtTPdFD6NUDQwLcV1VqG0pAufTORyn9s0Gz1R5E06Wp/
 15Ulwwx8iCr5cTeq7PJeS4+HOE6l6XPoWXssE6BERpWfsmabcoP2g5Ys
X-Gm-Gg: AYBFou0zwgacspwtLRz3yFl/QP3vjP/IXsyEVrmZVB162OujAUr2VzlgVxVPkHPKnzw
 rwlYyxvA3x1PicEiy6I0l19w0NTNIh2v5QjjYYbxjwGspZGRTjC2AMnF3zrT0TfXx9aVETB4pLW
 Fyf/Rfijvz5xZQrQVCGkWw+qJB+d2jcnSubNCgaG5e6ra/D5K2IicFvfm7GiVzs0mvznAdgI9AW
 eif61yruv5DuBq9h0NMk1RxhZtSCIOwP2tD0yNy5LeOJ9BDdMbZDBEhyKf+jNbWly/36ayBT1ZS
 wch9Sh2B8M+zA97FocMxMp8AifWkdMdJy82UQ5vLQi3ZsCEndTO+sptUYyzahutFpFtu60oMS0I
 gB3TtYLgy/UsjN+Boxkb0zT56BxWQa0xCu5Bs94YbKJyM/jsHkViJjNqodNuL+4REuDCi8iY3kr
 Fk26sNIOsXG16/rxu07Lv0pdN0YixVjjfs9LLc4cXNcK1UwIAFVIlBOzeg1n0tltzm4lVmw/9ym
 gYPrS9LcCx8Dx6dtA==
X-Received: by 2002:a05:600c:4e55:b0:49f:bd3c:bc1a with SMTP id
 5b1f17b1804b1-49fe66f506fmr198725375e9.21.1790575626985; 
 Sun, 27 Sep 2026 23:07:06 -0700 (PDT)
Received: from mac.fritz.box ([2a05:fa40:300:1a00:d105:6a41:99ee:cbff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a008f7f1c2sm1325775e9.1.2026.09.27.23.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 23:07:06 -0700 (PDT)
Date: Mon, 28 Sep 2026 08:06:38 +0200
Subject: [PATCH 3/4] target/riscv/kvm: Create KVM AIA device before
 configuring it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-spacemit-k3-v1-3-8c57d0596b87@butz.st>
References: <20260928-spacemit-k3-v1-0-8c57d0596b87@butz.st>
In-Reply-To: <20260928-spacemit-k3-v1-0-8c57d0596b87@butz.st>
To: qemu-devel@nongnu.org
Cc: Sunil V L <sunilvl@ventanamicro.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org, 
 Stefan Butz <mail@butz.st>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1790575623; l=5680;
 i=mail@butz.st; h=from:subject:message-id;
 bh=ZHu1gcQh340uibL5qlA7g4LAeLjP6u4ZEbGaM7hx5EA=;
 b=U1NIU0lHAAAAAQAAAZcAAAAHc3NoLXJzYQAAAAMBAAEAAAGBAOJW8yHG2FdKcC8jiWoQyd2Z6
 SNHh+aJB0RLkH7BFF7Yy7MymfE5UJE2mmoucIa3HiNQdlVZjgqLY7wph/VSM4kniDO57IG9Q9jN
 x96oOAzzWWJEVrh8vlxRGXatNy8ywcO9WExvzLop5s2ddP08f0Wrzn/55mpqoLJyoKaIbk10kxz
 JW1GONHT8nsNvBpVB2lnzA2jhv7DC79UlHzA98+sp8eX6kmUips+9LpTJLDeVna8f/vwkU708PI
 Qxt/5nhmFXKj/su/CMFivCLHckdmMOem/4UNoTyRcAbcoFQ9WWyYHvAD/bRuYZVEA2hfoBEQVu2
 FGHdG/OimvbT/GseVmWjiw7WV9HUOJJawVmfoTEJynX9BbV+VNMKZVpW5YaAaps6/KOC7V2bM7P
 hvORUmj3b8eUr418GYC3M4rLJtrj6Vu2cUyTV9Q5dvq9Lg2TIj/jpbEWpOqn2FSGkQcLvcDksNk
 jOSGmdG4h+OJ3vbGrva5UCJF/KIyuV4ozlSU7awAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAZ
 QAAAAMcnNhLXNoYTItNTEyAAABgIeZvVjlPJhqxoVDv/7mKJMPS4/8RgOCtnYAkjOijxW9/qEcf
 5Hzvb/7GfO9jvL+OZ5m1ozKAIFT+iTz+A+QqMFTXz+9ztvPGh63glTeivVrztDMs8wehA1UdRkg
 SWAuUCNQoF/mSzyD2mFMMWx93JerQ1gyuu9AmltXCdxizwfW7zF+bVd1O94ZK03ycbvkctUOJb1
 IrvqQWtF+chAp0hNp0ICDoPSEcaAjZ/sDagg6Qb3QqRIpwFD2De0fn6F1uhqCniZ2SVNnCCJ6ZF
 MDWg9guEkJVvLumuD15WkWmLiJFmCAkJDhCVSLU6YSWxd+ykLl7ODcxsivztcH8k6Y6OBSwM2ib
 dwU0sAcPB9JKTxGVAhSYiIPqBy8QkR46i3j/Jf9RJEYKwgSD6Vd8X8gnRJf1ydjb/BXxh4IMB2+
 NUv05EwSCu3Fx93XG/OzK2ElHwEIyV+QSzu8ZLDXP5Em1v8FGSKFQfuKDf57/ERz+67VVm2YQsf
 ODwN6sPVSInLqOg==
X-Developer-Key: i=mail@butz.st; a=openssh;
 fpr=SHA256:jcZFBs39daoQJIontO/rJaVachWp/oqTbhNpQk8+REQ
Received-SPF: pass client-ip=74.125.225.141;
 envelope-from=stefan260699@gmail.com; helo=mail-wm2-f13.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Sep 2026 08:11:08 -0400
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
Reply-to:  Stefan Butz <mail@butz.st>
From:  Stefan Butz via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The next patch shall limit the number of sources to what the host's
KVM AIA supports.
This requires creating the KVM AIA device before buildling the
device tree.

Signed-off-by: Stefan Butz <mail@butz.st>
---
 hw/riscv/virt.c              | 14 +++++++++-----
 target/riscv/kvm/kvm-cpu.c   | 27 ++++++++++++++++-----------
 target/riscv/kvm/kvm-stub.c  | 13 +++++++++----
 target/riscv/kvm/kvm_riscv.h |  9 +++++----
 4 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 0ee726b4c0..28fa31d538 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -733,6 +733,10 @@ static void virt_machine_init(MachineState *machine)
         exit(1);
     }
 
+    if (kvm_enabled() && virt_use_kvm_aia_aplic_imsic(s->aia_type)) {
+        kvm_riscv_aia_create();
+    }
+
     /* Initialize sockets */
     mmio_irqchip = virtio_irqchip = pcie_irqchip = NULL;
     for (i = 0; i < socket_count; i++) {
@@ -846,11 +850,11 @@ static void virt_machine_init(MachineState *machine)
     }
 
     if (kvm_enabled() && virt_use_kvm_aia_aplic_imsic(s->aia_type)) {
-        kvm_riscv_aia_create(machine, IMSIC_MMIO_GROUP_MIN_SHIFT,
-                             s->num_sources, s->num_msis,
-                             s->memmap[VIRT_APLIC_S].base,
-                             s->memmap[VIRT_IMSIC_S].base,
-                             s->aia_guests);
+        kvm_riscv_aia_init(machine, IMSIC_MMIO_GROUP_MIN_SHIFT,
+                           s->num_sources, s->num_msis,
+                           s->memmap[VIRT_APLIC_S].base,
+                           s->memmap[VIRT_IMSIC_S].base,
+                           s->aia_guests);
     }
 
     if (riscv_is_32bit(&s->soc[0])) {
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 68e1501b21..1098581e7a 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1814,6 +1814,7 @@ void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
 }
 
 static int aia_mode;
+static int aia_fd = -1;
 
 static const char *kvm_aia_mode_str(uint64_t mode)
 {
@@ -1859,13 +1860,22 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
                                     "auto");
 }
 
-void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
-                          uint64_t aia_irq_num, uint64_t aia_msi_num,
-                          uint64_t aplic_base, uint64_t imsic_base,
-                          uint64_t guest_num)
+void kvm_riscv_aia_create(void)
+{
+    aia_fd = kvm_create_device(kvm_state, KVM_DEV_TYPE_RISCV_AIA, false);
+
+    if (aia_fd < 0) {
+        error_report("Unable to create in-kernel irqchip");
+        exit(1);
+    }
+}
+
+void kvm_riscv_aia_init(MachineState *machine, uint64_t group_shift,
+                        uint64_t aia_irq_num, uint64_t aia_msi_num,
+                        uint64_t aplic_base, uint64_t imsic_base,
+                        uint64_t guest_num)
 {
     int ret, i;
-    int aia_fd = -1;
     uint64_t default_aia_mode;
     uint64_t socket_count = riscv_socket_count(machine);
     uint64_t max_hart_per_socket = 0;
@@ -1873,12 +1883,7 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
     uint64_t socket_bits, hart_bits, guest_bits;
     uint64_t max_group_id;
 
-    aia_fd = kvm_create_device(kvm_state, KVM_DEV_TYPE_RISCV_AIA, false);
-
-    if (aia_fd < 0) {
-        error_report("Unable to create in-kernel irqchip");
-        exit(1);
-    }
+    g_assert(aia_fd >= 0);
 
     ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
                             KVM_DEV_RISCV_AIA_CONFIG_MODE,
diff --git a/target/riscv/kvm/kvm-stub.c b/target/riscv/kvm/kvm-stub.c
index 64e39c96d8..672f635b08 100644
--- a/target/riscv/kvm/kvm-stub.c
+++ b/target/riscv/kvm/kvm-stub.c
@@ -9,10 +9,15 @@
 #include "qemu/osdep.h"
 #include "target/riscv/kvm/kvm_riscv.h"
 
-void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
-                          uint64_t aia_irq_num, uint64_t aia_msi_num,
-                          uint64_t aplic_base, uint64_t imsic_base,
-                          uint64_t guest_num)
+void kvm_riscv_aia_create(void)
+{
+    g_assert_not_reached();
+}
+
+void kvm_riscv_aia_init(MachineState *machine, uint64_t group_shift,
+                        uint64_t aia_irq_num, uint64_t aia_msi_num,
+                        uint64_t aplic_base, uint64_t imsic_base,
+                        uint64_t guest_num)
 {
     g_assert_not_reached();
 }
diff --git a/target/riscv/kvm/kvm_riscv.h b/target/riscv/kvm/kvm_riscv.h
index 61eaa12443..532e42b0df 100644
--- a/target/riscv/kvm/kvm_riscv.h
+++ b/target/riscv/kvm/kvm_riscv.h
@@ -23,10 +23,11 @@
 
 void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
 void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
-void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
-                          uint64_t aia_irq_num, uint64_t aia_msi_num,
-                          uint64_t aplic_base, uint64_t imsic_base,
-                          uint64_t guest_num);
+void kvm_riscv_aia_create(void);
+void kvm_riscv_aia_init(MachineState *machine, uint64_t group_shift,
+                        uint64_t aia_irq_num, uint64_t aia_msi_num,
+                        uint64_t aplic_base, uint64_t imsic_base,
+                        uint64_t guest_num);
 void riscv_kvm_aplic_request(void *opaque, int irq, int level);
 bool kvm_riscv_has_mp_state(void);
 void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp);

-- 
Git-157)


