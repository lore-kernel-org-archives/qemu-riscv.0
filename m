Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05954C982FA
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 12:23:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x8zWB-0008L3-25; Tue, 22 Sep 2026 08:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qingwei.hu@bytedance.com>)
 id 1x8zW8-0008JM-Bs
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 08:22:36 -0400
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <qingwei.hu@bytedance.com>)
 id 1x8zW3-00078Q-5S
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 08:22:35 -0400
Received: by mail-pz2-x10.google.com with SMTP id
 d2e1a72fcca58-85469b35611so2642743b3a.0
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 05:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1790079746; x=1790684546; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=m0WrQ43rzEVhFUz28PvIA6KvJNkY/SSTS8KZcZgEzIw=;
 b=b8DvciaLP8LfXrUQew96WwmTlIs9F7PbzV2LOcne1DKb76Acsy81bnCWtCXnIqLKzE
 Dk79542VtYy2R0zTMQJgvYdkHoLP0MotRWceoYA4jm8rsa42/c+hJY1+0I/3wGYNY+tR
 Iy98f+DEmUN/6pW7lyHwSGSlxxD9K2yGVPSPZjYLQWHHi622jjS7R2DzQMlfo8tlkqWZ
 mMexklkFOQwWCdFYIuPOtqDD4/YqqQhU7Ck1zNqlqn0XjOvgQ60+xT45jDQuN4Vogna2
 L1JRBDMH5SzpK9BlWzEjjl/QIMr6hqapa6ZpZYl+rw1/zPjXwmKcITDt7mPHJundQy3w
 Ynkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790079746; x=1790684546;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=m0WrQ43rzEVhFUz28PvIA6KvJNkY/SSTS8KZcZgEzIw=;
 b=MWecyZXKJW6qDbggYk1F6UIXAPKXGmVEiq8+rulpdE9QU7gBDKK4+le2/l72kOf7h2
 0/9elio2/LuUIzqknXA6cKdu+KNqHgR2FfEiVU3WT5+GmpRXyF+QMEIlGpVf+NAC+Q2A
 XnL0CaJDJIm/eJsd5+zltu271Q5mZWFcsGGG/3kMxrkD+nwuhgi62RrJkdsGowwKVSgW
 MPGkjtB06RfUkzUF6vcRSZFjGqtnPk3MPu2A2/G1VJtSfyrw//rsL0u/Vk+JzVKyfsV9
 pTcKmnfHSH80obb0GVr2hefsDGXYCmDZ4A/blXxa5u0GaqCIh/JPoOyxoFiP7Qfm+SQq
 t6dg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxsV5hg21RvZECKA+Tcwy4pH8mjySCjc0iYifFp6uAjxXV/Fg+Y4mzdQq0pWpjaRNHhiqhLzEHX5O8s@nongnu.org
X-Gm-Message-State: AFuF++lsJs9PIjrlIlyvipeFgrng3IkJ7yyVEHa9DbGyAJJBXaoCbDFq
 /aHIamtLHuVV2Ked1aIUQ8Yfsoj107TPblTZdAjH42ioycu4eLLC8Q0V2FPyKS2HDP0=
X-Gm-Gg: AYBFou2VpH2w8mwlTI1dYpGH5CZr5qRCDKuq9NF32VHpXf9lOZPXq+9+E+7dH7zYtn3
 CW9frlEmPyfTCo59GTPWH6pduS2km1S78P9lSfmxwFozalYxOBG410ltKwExO1TLoksMDVAab7o
 e3HlaJ9KhED5c1cGBuW4MdGPlXPWIL6zr9AJWLf89WqugdSSUyLKV2bLM1dytvgk51Sddlorw/t
 IIidzyGGtrebERvIlGprd5pFuphm9PrrXkDYfJ5PP6uC96A6DdL71d54rYssJdBI5W3zTUoYOVU
 8im7S+97Y2Zravoi194T0ggIW6+FKwWIntuCjzwielsZqNidzzfydxAOupaHWjcX8CuRwfaIfjl
 2nHGhSoOcqBEX5FCjMg2Ccf7/POZqVko8tZQ21EtNMghIk+0tWP5bv0C9cszoR96RTlba/IyCt3
 fHIMfHxXoXAiGc7MItSnOfU1IjszIs3yCWBu3BdGiVwnC55byEKW5Nmplp2i0++x/AU7gc12FC2
 PRGXhAwqIAYaYsEYDpTW3O7LYRc
X-Received: by 2002:a05:6a00:2c88:b0:878:6ee:671c with SMTP id
 d2e1a72fcca58-87c83c49b2cmr1053529b3a.30.1790079746073; 
 Tue, 22 Sep 2026 05:22:26 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.15])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-87c31ee864asm752123b3a.18.2026.09.22.05.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 05:22:24 -0700 (PDT)
From: Qingwei Hu <qingwei.hu@bytedance.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: sunilvl@ventanamicro.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 yongxuan.wang@sifive.com, Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [PATCH] target/riscv/kvm: Use the host AIA MSI ID limit
Date: Tue, 22 Sep 2026 20:22:15 +0800
Message-Id: <20260922122215.1619439-1-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::10;
 envelope-from=qingwei.hu@bytedance.com; helo=mail-pz2-x10.google.com
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

KVM initializes CONFIG_IDS to the number of guest MSI IDs supported by
the host. The virt machine currently overwrites it with the fixed
VIRT_IRQCHIP_NUM_MSIS value of 255, which can be inconsistent with the
host-supported guest MSI ID count.

Create the KVM AIA device before realizing the per-socket IMSICs and
read the host-provided CONFIG_IDS value. Use it to configure the QEMU
IMSIC devices and the guest-visible DT and ACPI descriptions. Complete
the remaining KVM AIA setup after all vCPUs have been created, as the
IMSIC address configuration depends on them.

Keep VIRT_IRQCHIP_NUM_MSIS as the default for non-KVM machines.

Fixes: 9634ef7eda5f ("target/riscv: Create an KVM AIA irqchip")
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 hw/riscv/virt-acpi-build.c   |  4 +--
 hw/riscv/virt.c              | 28 ++++++++++++-----
 include/hw/riscv/virt.h      |  1 +
 target/riscv/kvm/kvm-cpu.c   | 59 +++++++++++++++++++++++-------------
 target/riscv/kvm/kvm_riscv.h |  9 +++---
 5 files changed, 66 insertions(+), 35 deletions(-)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 8e516ec114..0ebfa10a02 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -576,9 +576,9 @@ static void build_madt(GArray *table_data,
         build_append_int_noprefix(table_data, 0, 1);        /* Reserved */
         build_append_int_noprefix(table_data, 0, 4);        /* Flags */
         /* Number of supervisor mode Interrupt Identities */
-        build_append_int_noprefix(table_data, VIRT_IRQCHIP_NUM_MSIS, 2);
+        build_append_int_noprefix(table_data, s->num_msis, 2);
         /* Number of guest mode Interrupt Identities */
-        build_append_int_noprefix(table_data, VIRT_IRQCHIP_NUM_MSIS, 2);
+        build_append_int_noprefix(table_data, s->num_msis, 2);
         /* Guest Index Bits */
         build_append_int_noprefix(table_data, guest_index_bits, 1);
         /* Hart Index Bits */
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d4b501802f..ba0e74ce83 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -277,7 +277,7 @@ static void create_fdt_sockets(RISCVVirtState *s,
             .imsic_m_base = !kvm_enabled() ? s->memmap[VIRT_IMSIC_M].base : 0,
             .imsic_s_base = s->memmap[VIRT_IMSIC_S].base,
             .imsic_group_max_size = VIRT_IMSIC_GROUP_MAX_SIZE,
-            .irqchip_num_msis = VIRT_IRQCHIP_NUM_MSIS,
+            .irqchip_num_msis = s->num_msis,
             .aia_guests = s->aia_guests
         };
 
@@ -718,6 +718,7 @@ static void virt_machine_init(MachineState *machine)
     DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
     int i, base_hartid, hart_count;
     int socket_count = riscv_socket_count(machine);
+    int aia_fd = -1;
 
     s->memmap = virt_memmap;
 
@@ -733,6 +734,16 @@ static void virt_machine_init(MachineState *machine)
         exit(1);
     }
 
+    /*
+     * Create the KVM AIA device and query the host MSI ID count before
+     * realizing the per-socket IMSICs. Complete AIA initialization after
+     * all vCPUs have been created.
+     */
+    if (kvm_enabled() && virt_use_kvm_aia_aplic_imsic(s->aia_type)) {
+        aia_fd = kvm_riscv_aia_create(VIRT_IRQCHIP_NUM_SOURCES,
+                                      &s->num_msis);
+    }
+
     /* Initialize sockets */
     mmio_irqchip = virtio_irqchip = pcie_irqchip = NULL;
     for (i = 0; i < socket_count; i++) {
@@ -826,7 +837,7 @@ static void virt_machine_init(MachineState *machine)
                                              &s->memmap[VIRT_IMSIC_M],
                                              &s->memmap[VIRT_IMSIC_S],
                                              i, base_hartid, hart_count,
-                                             VIRT_IRQCHIP_NUM_MSIS,
+                                             s->num_msis,
                                              VIRT_IRQCHIP_NUM_PRIO_BITS);
         }
 
@@ -845,12 +856,12 @@ static void virt_machine_init(MachineState *machine)
         }
     }
 
-    if (kvm_enabled() && virt_use_kvm_aia_aplic_imsic(s->aia_type)) {
-        kvm_riscv_aia_create(machine, IMSIC_MMIO_GROUP_MIN_SHIFT,
-                             VIRT_IRQCHIP_NUM_SOURCES, VIRT_IRQCHIP_NUM_MSIS,
-                             s->memmap[VIRT_APLIC_S].base,
-                             s->memmap[VIRT_IMSIC_S].base,
-                             s->aia_guests);
+    if (aia_fd >= 0) {
+        kvm_riscv_aia_init(machine, aia_fd, IMSIC_MMIO_GROUP_MIN_SHIFT,
+                           VIRT_IRQCHIP_NUM_SOURCES,
+                           s->memmap[VIRT_APLIC_S].base,
+                           s->memmap[VIRT_IMSIC_S].base,
+                           s->aia_guests);
     }
 
     if (riscv_is_32bit(&s->soc[0])) {
@@ -972,6 +983,7 @@ static void virt_machine_instance_init(Object *obj)
     s->acpi = ON_OFF_AUTO_AUTO;
     s->iommu_sys = ON_OFF_AUTO_AUTO;
     s->num_sources = VIRT_IRQCHIP_NUM_SOURCES;
+    s->num_msis = VIRT_IRQCHIP_NUM_MSIS;
 }
 
 static char *virt_get_aia_guests(Object *obj, Error **errp)
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e516898f9a..f64a2a3448 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -66,6 +66,7 @@ struct RISCVVirtState {
     OnOffAuto iommu_sys;
     uint16_t pci_iommu_bdf;
     uint16_t num_sources;
+    uint32_t num_msis;
 };
 
 enum {
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 68e1501b21..02af4e7723 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1859,19 +1859,11 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
                                     "auto");
 }
 
-void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
-                          uint64_t aia_irq_num, uint64_t aia_msi_num,
-                          uint64_t aplic_base, uint64_t imsic_base,
-                          uint64_t guest_num)
+int kvm_riscv_aia_create(uint64_t aia_irq_num, uint32_t *aia_msi_num)
 {
-    int ret, i;
-    int aia_fd = -1;
+    int ret;
+    int aia_fd;
     uint64_t default_aia_mode;
-    uint64_t socket_count = riscv_socket_count(machine);
-    uint64_t max_hart_per_socket = 0;
-    uint64_t socket, base_hart, hart_count, socket_imsic_base, imsic_addr;
-    uint64_t socket_bits, hart_bits, guest_bits;
-    uint64_t max_group_id;
 
     aia_fd = kvm_create_device(kvm_state, KVM_DEV_TYPE_RISCV_AIA, false);
 
@@ -1903,6 +1895,41 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
         }
     }
 
+    /*
+     * Get the maximum MSI ID supported by the host from the CONFIG_IDS
+     * attribute and use it for the guest-visible interrupt controller
+     * configuration.
+     */
+    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
+                            KVM_DEV_RISCV_AIA_CONFIG_IDS,
+                            aia_msi_num, false, NULL);
+    if (ret < 0) {
+        error_report("KVM AIA: failed to get number of MSI IDs");
+        exit(1);
+    }
+
+    if (!kvm_kernel_irqchip_split() && *aia_msi_num < aia_irq_num) {
+        error_report("KVM AIA: host supports only %" PRIu32 " MSI IDs, "
+                     "but the virt machine requires at least %" PRIu64,
+                     *aia_msi_num, aia_irq_num);
+        exit(1);
+    }
+
+    return aia_fd;
+}
+
+void kvm_riscv_aia_init(MachineState *machine, int aia_fd,
+                        uint64_t group_shift, uint64_t aia_irq_num,
+                        uint64_t aplic_base, uint64_t imsic_base,
+                        uint64_t guest_num)
+{
+    int ret, i;
+    uint64_t socket_count = riscv_socket_count(machine);
+    uint64_t max_hart_per_socket = 0;
+    uint64_t socket, base_hart, hart_count, socket_imsic_base, imsic_addr;
+    uint64_t socket_bits, hart_bits, guest_bits;
+    uint64_t max_group_id;
+
     /*
      * Skip APLIC creation in KVM if we're running split mode.
      * This is done by leaving KVM_DEV_RISCV_AIA_CONFIG_SRCS
@@ -1927,15 +1954,6 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
         }
      }
 
-    ret = kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
-                            KVM_DEV_RISCV_AIA_CONFIG_IDS,
-                            &aia_msi_num, true, NULL);
-    if (ret < 0) {
-        error_report("KVM AIA: failed to set number of msi");
-        exit(1);
-    }
-
-
     if (socket_count > 1) {
         max_group_id = socket_count - 1;
         socket_bits = find_last_bit(&max_group_id, BITS_PER_LONG) + 1;
@@ -1987,7 +2005,6 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
         }
     }
 
-
     if (max_hart_per_socket > 1) {
         max_hart_per_socket--;
         hart_bits = find_last_bit(&max_hart_per_socket, BITS_PER_LONG) + 1;
diff --git a/target/riscv/kvm/kvm_riscv.h b/target/riscv/kvm/kvm_riscv.h
index 61eaa12443..1499fb4487 100644
--- a/target/riscv/kvm/kvm_riscv.h
+++ b/target/riscv/kvm/kvm_riscv.h
@@ -23,10 +23,11 @@
 
 void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
 void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
-void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
-                          uint64_t aia_irq_num, uint64_t aia_msi_num,
-                          uint64_t aplic_base, uint64_t imsic_base,
-                          uint64_t guest_num);
+int kvm_riscv_aia_create(uint64_t aia_irq_num, uint32_t *aia_msi_num);
+void kvm_riscv_aia_init(MachineState *machine, int aia_fd,
+                        uint64_t group_shift, uint64_t aia_irq_num,
+                        uint64_t aplic_base, uint64_t imsic_base,
+                        uint64_t guest_num);
 void riscv_kvm_aplic_request(void *opaque, int irq, int level);
 bool kvm_riscv_has_mp_state(void);
 void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
-- 
2.39.5


