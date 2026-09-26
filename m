Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EBAC98318
	for <qemu-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 11:10:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xAQHI-0008AW-K9; Sat, 26 Sep 2026 07:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQHD-00087t-B8
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 07:09:11 -0400
Received: from mail-dl2-x0e.google.com ([2607:f8b0:4864:38::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQHB-0002mc-Mf
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 07:09:07 -0400
Received: by mail-dl2-x0e.google.com with SMTP id
 a92af1059eb24-144ee9debe9so1579794c88.0
 for <qemu-riscv@nongnu.org>; Sat, 26 Sep 2026 04:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790420944; x=1791025744; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=d8GfpFm6vmw+Ti4b+sLfRBJnqeCjT91Kjc97U0dGguc=;
 b=q+GF/i5mSs2EESqu2A7jeaM4lP4JN6OGnpIHFwK9am4Zn7AM5gvB/ylPr6E264D0tu
 nzw/p1bCeO8BV2BOPaGtbED9rN90f+dhHdK8lt4npk+QAsfhMy1d4gg++FjbKbDu91qE
 7uHHKgQ87GUaIL39TxHTeISDl1g8bHadEjkAY3gmzJ4vYrsk3MpLyJfHh9Tvy3Azrjpb
 HHHZ1CKS3mWAzwcWEoToYlXrLqOD1vqPzEI63EWzS8NfP9yneOTcDGAxfbrsW1KPvpRS
 p+aUlOdJFWNjMHWk3KjSCWFYq6ELJVNrPSGwtCBTNLMRCgV/fJNDF9iRQ0Bmks4rbqzj
 kRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790420944; x=1791025744;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=d8GfpFm6vmw+Ti4b+sLfRBJnqeCjT91Kjc97U0dGguc=;
 b=tqtnG+G53cIj9jiNFwFn6RR73ASpNTlGtJYuaOKuFHGppPO2eWZ3DHvXLaZ1EbZsAu
 lZP7A2MW7GyxQW4QKwCQCNKIOqHh9JqggVmUS4lZHKtcHy4kcuKA9DbTWT45hb1qN6R4
 gjY9wfcilrnKsFn34TLy1lWAperYxyOOQorBDIvrfOjTl7d+nCVgGz8gCzNPQBCfhJIp
 N5zwBG5dtm43m6O5Ydn8sFz1upRvIRFKK93EcVy56lNjk2SbT9vmJUnJp5su3gnqA+Ag
 bXo8mTvDZg65sr3MRWB8o+s6sIUQPmoPXosPtiy4Bgut8ZBuTvJkvqxj4RdkbJBwJy+Z
 6SXg==
X-Forwarded-Encrypted: i=1;
 AKwUvBw2RV7P6vRd9lmGMGx62Eo33f+49MXLdyWNd4tTYROubNC7UrYt6HI5lIKja3VXfS+jk0bZYfDmbpin@nongnu.org
X-Gm-Message-State: AFuF++m2b1tJyxJZehnhbyJOC9Cdz/aF0WEQl0k8HRZjgsaVzXJ9juV3
 Z5pxDSnwlrDgr3k4LH8BKoREbeLyG5Fn9PeeIay0rHtoZelU+wxfs24/
X-Gm-Gg: AYBFou0hBf51i7a3cbZMoJt64/6Li2mxBBVmLw04lMxiTiMjzKmZQeNAfoSba+/GZZb
 TSqKS7w6ZAMTWTQoJt6em269A1C8hgeC5F/gcB9ZvJ+0sjqsYlYJSU7e0m38BculWTWHDxGqx7f
 1iCwuEJqTYWrpdYrG97mifW8+Fwy2ZCRx6M06LVggHJVZdlQCCnAh8FkmPdWkOJJ8rJhA1kfNiB
 J0GSyT8FIpYbwT7jlRRWyFYANCzwbUKgPE0Ph8hcLxcNb1dOP5Yz14S8aeKrDXtq621yUn9zkla
 SdF44cA5wZ/g2pNjP1Nn/KGrm6p5DPG6k9EJrIWzGuJzcBLH43m3FhLG1PaXAJQTd0lTD6Qz70F
 Uy2Ka9sVsHW5+vRcQZvz9taIP7zXTP74JYz0Jq3BBoBS/UKfKoGIF/fYRJ1b3xTs/5YoMbGT2l/
 KglvXlEKByDKNdrYgNtbgO+Hwo5pPpWWKiYDiaVVrm5qBcxAuFMcGW7h+eK/2M+Q9l0t18ot1wV
 BhTvWZhWc8qDCvRTuIgo4C0I4WTYuQ=
X-Received: by 2002:a05:701b:2908:b0:141:52e3:8606 with SMTP id
 a92af1059eb24-146cddbd03emr2461766c88.6.1790420943973; 
 Sat, 26 Sep 2026 04:09:03 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-145a7318afcsm11414045c88.0.2026.09.26.04.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 04:09:03 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Brian Cain <brian.cain@oss.qualcomm.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Song Gao <17746591750@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>, Ani Sinha <anisinha@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chao Liu <chao.liu@processmission.com>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 6/9] hw/arm/virt: prefix ACPI helpers with arm_virt_
Date: Sat, 26 Sep 2026 19:08:14 +0800
Message-ID: <20260926110818.1912-7-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926110818.1912-1-luoyonggang@gmail.com>
References: <20260926110818.1912-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

- virt_acpi_setup and virt_is_acpi_enabled are generic names also used
  by RISC-V and LoongArch virt. A combined binary cannot export two
  functions with the same C symbol.
- Rename the ARM helpers to arm_virt_acpi_setup and
  arm_virt_is_acpi_enabled. Leave the trace event virt_acpi_setup
  unchanged; it is a separate identifier.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/arm/virt-acpi-build.c |  4 ++--
 hw/arm/virt.c            | 12 ++++++------
 include/hw/arm/virt.h    |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d368913e766..5737c3a8fa4 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -1559,7 +1559,7 @@ static const VMStateDescription vmstate_virt_acpi_build = {
     },
 };
 
-void virt_acpi_setup(VirtMachineState *vms)
+void arm_virt_acpi_setup(VirtMachineState *vms)
 {
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
@@ -1570,7 +1570,7 @@ void virt_acpi_setup(VirtMachineState *vms)
         return;
     }
 
-    if (!virt_is_acpi_enabled(vms)) {
+    if (!arm_virt_is_acpi_enabled(vms)) {
         trace_virt_acpi_setup();
         return;
     }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3eecf094bcc..c3e256347f3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -768,7 +768,7 @@ static void fdt_add_cpu_nodes(VirtMachineState *vms)
                     &bottom_node,
                     CPU_TOPOLOGY_LEVEL_SOCKET);
             if (cache_at_topo_level) {
-                if (bottom_node == 1 && !virt_is_acpi_enabled(vms))
+                if (bottom_node == 1 && !arm_virt_is_acpi_enabled(vms))
                     error_setg(
                         &error_fatal,
                         "Cannot share L1 at socket_id %d."
@@ -808,7 +808,7 @@ static void fdt_add_cpu_nodes(VirtMachineState *vms)
                                                         top_cluster,
                                                         bottom_cluster, cpu,
                                                         &cluster_offset);
-                if (bottom_cluster == 1 && !virt_is_acpi_enabled(vms)) {
+                if (bottom_cluster == 1 && !arm_virt_is_acpi_enabled(vms)) {
                     error_setg(&error_fatal,
                         "Cannot share L1 at socket_id %d, cluster_id %d. "
                         "DT limitation on sharing at cache level = 1.",
@@ -2035,7 +2035,7 @@ static void create_smmuv3_dev_dtb(VirtMachineState *vms, DeviceState *dev,
     hwaddr base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
     MachineState *ms = MACHINE(vms);
 
-    if (!(vms->bootinfo.firmware_loaded && virt_is_acpi_enabled(vms))) {
+    if (!(vms->bootinfo.firmware_loaded && arm_virt_is_acpi_enabled(vms))) {
         if (object_property_get_bool(OBJECT(dev), "accel", &error_abort)) {
             error_setg(errp, "SMMUv3 with accel=on not supported for DT");
             return;
@@ -2445,7 +2445,7 @@ void virt_machine_done(Notifier *notifier, void *data)
     pci_bus_add_fw_cfg_extra_pci_roots(vms->fw_cfg, vms->bus,
                                        &error_abort);
 
-    virt_acpi_setup(vms);
+    arm_virt_acpi_setup(vms);
     virt_build_smbios(vms);
 }
 
@@ -3209,7 +3209,7 @@ static void machvirt_init(MachineState *machine)
     create_pcie(vms);
     create_cxl_host_reg_region(vms);
 
-    if (aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
+    if (aarch64 && firmware_loaded && arm_virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
         vms->generic_error_notifier.notify = virt_generic_error_req;
         notifier_list_add(&acpi_generic_error_notifiers,
@@ -3559,7 +3559,7 @@ static void virt_set_oem_table_id(Object *obj, const char *value,
 }
 
 
-bool virt_is_acpi_enabled(const VirtMachineState *vms)
+bool arm_virt_is_acpi_enabled(const VirtMachineState *vms)
 {
     if (vms->acpi == ON_OFF_AUTO_OFF) {
         return false;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 22e66d1a113..695e5d5728a 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -218,8 +218,8 @@ struct VirtMachineState {
 #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
 OBJECT_DECLARE_TYPE(VirtMachineState, VirtMachineClass, VIRT_MACHINE)
 
-void virt_acpi_setup(VirtMachineState *vms);
-bool virt_is_acpi_enabled(const VirtMachineState *vms);
+void arm_virt_acpi_setup(VirtMachineState *vms);
+bool arm_virt_is_acpi_enabled(const VirtMachineState *vms);
 
 #define CLIDR_CTYPE_NO_CACHE 0x00
 #define CLIDR_CTYPE_I_CACHE 0x01
-- 
2.52.0.windows.1


