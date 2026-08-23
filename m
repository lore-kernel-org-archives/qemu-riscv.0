Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F1BC5DF81
	for <qemu-riscv@archiver.kernel.org>; Sun, 23 Aug 2026 15:20:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wy9y7-0000Dz-AW; Sun, 23 Aug 2026 11:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wy9oA-0007Vv-8T
 for qemu-riscv@nongnu.org; Sun, 23 Aug 2026 11:08:26 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wy9o7-0008Qt-7Q
 for qemu-riscv@nongnu.org; Sun, 23 Aug 2026 11:08:25 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-38759bcd877so3039208a91.2
 for <qemu-riscv@nongnu.org>; Sun, 23 Aug 2026 08:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787497702; x=1788102502; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xgwd4PX46ht/V2FaG2Y1aX4X+MdwT8hU946QKIfXeC8=;
 b=lwclP/5Hku1ENpAnvfm1Qa6qxnaecxARKKUSaZgRURZ9/vJWoiSyyTXEma4gVlNRg5
 Boi2d4awZ6V1TNeC4s6P73+h3IjuZiJ9a43mz6Toxa3lltibIH6IJdJhcU+xwvZFPrvS
 XEWqKDyWDWtvbavnjFjC/c2Y70zB51dY69qFw4vM4L1d0+mJIxEo7VeHlERx0IHTUXtk
 80Syr31pDOb+jdkKPTBi9dbQBh/yF5dinHI/MM7qV7jyrxuvsoz/8+BmJDBScxW5juwb
 fVftGAeIECGl6nbsR7rtyx5Wx88Irn3dWEWy8CQMcTV+zQBuBpckSDAI+IZVv95LZOsw
 I9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787497702; x=1788102502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xgwd4PX46ht/V2FaG2Y1aX4X+MdwT8hU946QKIfXeC8=;
 b=WkjiVBNxheO92utopG+32TAGJqdjKLl7HCtXXueWh9SUdM4WvpsVAIZz4eb5RET+rS
 dALUYo9v3KDry2KuWTTc4NXlKkY5qICXfsUJDwi09EtngjomgfvFI92BmFqEXeSMUNdx
 MCfxRAEW5u7dOmYEjLgfkUms3oBT3ORK6mtOdVrZpNEmr1R/gfiHco0B3clxidmjB1s/
 ZR5rNmMd3pdfT0owPz9lQD2y5yg0jXG3YtfPqU51pEpcHGrcZhH19y3jNoLdQCGMuBiE
 YwkZxCxAp6YPYujpvKZufqOm1Pw+J/fpH4fm0qdSqzD6qgjE4u0cR5A7RQKES/FukcER
 DT2g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpJ+0NxXdSevLQDSOf+Mip7Tve7QMP2ZUEt2i6JGQdCcckW0qsKnhqgVW9BPU4ai7VX7+nrcZoy+QyH@nongnu.org
X-Gm-Message-State: AFuF++mwva3NKV8QNpmgkMIi9PI6gRlG3q9adOMBNX3B1Aw9u81DvYAS
 XcbuRyqURdXT2qkuSehgKpcMjKRSBcU/MUY53ATXWUcqvfy6tJCuyQAE
X-Gm-Gg: AR+sD130Etcb11QZ+m7IUp0FY33gdc0+GT8XG7YA1yzF6c3BA7iyENpHbt0ZFxt5hL6
 PaP74AzZg7XamFKcrjVpWR/G9g5zImrooJQvMVKLHGGnLzYjU/ndQt6tdTVVjdIs+XkBRXJ7P4G
 Jyzo/7GP3lX9lfW224HhV8XiavUdrMKL8gaTZOwpEWxUf6ByMqSWSrB7scGZ3Wd2mzFbV1qvcC8
 MPMtAVqlKtOdFyfZYj9AeOKGs+kMjwz8i0fzGRTD2CVOYCa89g+LpPimbgoj1L2bPBnHKS5Ysey
 5qepZFhK90mBvPpv1shdYTS2DzUGtyG21R7kVzYneAoPjEOaXZMOIA85V07gMiJJ83EBGYLgPJB
 JhRupAUdP80qtJztPyeJCW3cJQWr8K8+QW/WymZ9OdkG5Ky9050nmD5q44b7mfZ8rasFSHL/g3k
 YaKJy5x4h85WjL/9sMP5oW3fjN7qTOm0fMP8hWBsxyczAhck1VOgkfp0+k6xhQCi3NxK5t9hX9Z
 +ecLSqFHZ5jtVkf+24Cyw==
X-Received: by 2002:a17:90b:3883:b0:380:540:d499 with SMTP id
 98e67ed59e1d1-395def03e79mr20349832a91.6.1787497701895; 
 Sun, 23 Aug 2026 08:08:21 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1418619d6ecsm16024511c88.14.2026.08.23.08.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2026 08:08:20 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Sunil V L <sunilvl@ventanamicro.com>,
 qemu-riscv@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Zhao Liu <zhao1.liu@intel.com>, Eric Farman <farman@linux.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <17746591750@163.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@kernel.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>
Subject: [PATCH 04/12] hw/arm/virt: prefix ACPI helpers with arm_virt_
Date: Sun, 23 Aug 2026 23:07:22 +0800
Message-ID: <20260823150731.896-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260823150731.896-1-luoyonggang@gmail.com>
References: <20260823150731.896-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 23 Aug 2026 11:18:31 -0400
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

- virt_acpi_setup and virt_is_acpi_enabled are generic names also used
  by RISC-V and LoongArch virt. A combined binary cannot export two
  functions with the same C symbol.
- Rename the ARM helpers to arm_virt_acpi_setup and
  arm_virt_is_acpi_enabled. Leave the trace event virt_acpi_setup
  unchanged; it is a separate identifier.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/arm/virt-acpi-build.c |  4 ++--
 hw/arm/virt.c            | 12 ++++++------
 include/hw/arm/virt.h    |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f6386088b6f..a4a0d2c9997 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -1556,7 +1556,7 @@ static const VMStateDescription vmstate_virt_acpi_build = {
     },
 };
 
-void virt_acpi_setup(VirtMachineState *vms)
+void arm_virt_acpi_setup(VirtMachineState *vms)
 {
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
@@ -1567,7 +1567,7 @@ void virt_acpi_setup(VirtMachineState *vms)
         return;
     }
 
-    if (!virt_is_acpi_enabled(vms)) {
+    if (!arm_virt_is_acpi_enabled(vms)) {
         trace_virt_acpi_setup();
         return;
     }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c2ace7706f1..4b9e1e50d44 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -770,7 +770,7 @@ static void fdt_add_cpu_nodes(VirtMachineState *vms)
                     &bottom_node,
                     CPU_TOPOLOGY_LEVEL_SOCKET);
             if (cache_at_topo_level) {
-                if (bottom_node == 1 && !virt_is_acpi_enabled(vms))
+                if (bottom_node == 1 && !arm_virt_is_acpi_enabled(vms))
                     error_setg(
                         &error_fatal,
                         "Cannot share L1 at socket_id %d."
@@ -810,7 +810,7 @@ static void fdt_add_cpu_nodes(VirtMachineState *vms)
                                                         top_cluster,
                                                         bottom_cluster, cpu,
                                                         &cluster_offset);
-                if (bottom_cluster == 1 && !virt_is_acpi_enabled(vms)) {
+                if (bottom_cluster == 1 && !arm_virt_is_acpi_enabled(vms)) {
                     error_setg(&error_fatal,
                         "Cannot share L1 at socket_id %d, cluster_id %d. "
                         "DT limitation on sharing at cache level = 1.",
@@ -2037,7 +2037,7 @@ static void create_smmuv3_dev_dtb(VirtMachineState *vms, DeviceState *dev,
     hwaddr base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
     MachineState *ms = MACHINE(vms);
 
-    if (!(vms->bootinfo.firmware_loaded && virt_is_acpi_enabled(vms))) {
+    if (!(vms->bootinfo.firmware_loaded && arm_virt_is_acpi_enabled(vms))) {
         if (object_property_get_bool(OBJECT(dev), "accel", &error_abort)) {
             error_setg(errp, "SMMUv3 with accel=on not supported for DT");
             return;
@@ -2447,7 +2447,7 @@ void virt_machine_done(Notifier *notifier, void *data)
     pci_bus_add_fw_cfg_extra_pci_roots(vms->fw_cfg, vms->bus,
                                        &error_abort);
 
-    virt_acpi_setup(vms);
+    arm_virt_acpi_setup(vms);
     virt_build_smbios(vms);
 }
 
@@ -3211,7 +3211,7 @@ static void machvirt_init(MachineState *machine)
     create_pcie(vms);
     create_cxl_host_reg_region(vms);
 
-    if (aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
+    if (aarch64 && firmware_loaded && arm_virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
         vms->generic_error_notifier.notify = virt_generic_error_req;
         notifier_list_add(&acpi_generic_error_notifiers,
@@ -3561,7 +3561,7 @@ static void virt_set_oem_table_id(Object *obj, const char *value,
 }
 
 
-bool virt_is_acpi_enabled(const VirtMachineState *vms)
+bool arm_virt_is_acpi_enabled(const VirtMachineState *vms)
 {
     if (vms->acpi == ON_OFF_AUTO_OFF) {
         return false;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 383ee320948..2ee61cc5a06 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -218,8 +218,8 @@ struct VirtMachineState {
 #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("arm-virt")
 OBJECT_DECLARE_TYPE(VirtMachineState, VirtMachineClass, VIRT_MACHINE)
 
-void virt_acpi_setup(VirtMachineState *vms);
-bool virt_is_acpi_enabled(const VirtMachineState *vms);
+void arm_virt_acpi_setup(VirtMachineState *vms);
+bool arm_virt_is_acpi_enabled(const VirtMachineState *vms);
 
 #define CLIDR_CTYPE_NO_CACHE 0x00
 #define CLIDR_CTYPE_I_CACHE 0x01
-- 
2.52.0.windows.1


