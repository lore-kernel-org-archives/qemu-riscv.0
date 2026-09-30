Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BB2CA5FC2
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 07:40:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBoux-000185-3x; Wed, 30 Sep 2026 03:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBouv-00016X-0L
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 03:39:53 -0400
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBout-0003qV-9m
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 03:39:52 -0400
Received: by mail-dy2-x0f.google.com with SMTP id
 5a478bee46e88-33e46a15703so4810436eec.0
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 00:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790753990; x=1791358790; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=KDgtWhEVoiJABLd7WfqSeCDZ6rq9jHeJ8iMfYajRpUc=;
 b=gHXTYQX40ACef35DTO/83CS44JYND09xyIOLq8ZELjB+AV1pFjucX3C1b2ux/EBbqN
 3KjvGFv/vv5o9trCXFASFhxe8j+9EnBXFCGaHmaIr54RaDqXrVdHEz0iR6eQKqu0aYrl
 oab3wn3kPeM443Bb8kyR11pJdXOus+JiFiqW8Ewrp3p1x5KbxCxNOVmjbXcEp73myw93
 298WeWBKkIa8F6XmT3atMctY6MuW9MnMSYCDhnJf+lS/ry/rMBcvElLe059TXFaqMLRC
 eI4XxZz4hJ+Ox7Fg0sOSGN15+O34yKPwitMYyb/dOPZNZVwYGQixBTlrOvfDxnd6algT
 kgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790753990; x=1791358790;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=KDgtWhEVoiJABLd7WfqSeCDZ6rq9jHeJ8iMfYajRpUc=;
 b=PN92G4elyF1kIeR+bpJbih57OvG5YKlSnkdtwuTLpnTQRVeQMJ8PAe0xpNp4lO+WUP
 vxK8fu7+TZvx0rzHRJruOI8ifgfA4E1xFUlNGiQ+dlUt7pSmoe3nAd88uIiy74W5X7F9
 Jwq4MAzeks/AI+yS9rURsSS/uPLXN1vITANXFKaYGEreCtx00BYsZhx9CGQHsDlYHHpE
 Nki9HVMFX2GVVRe1QF3bp9+Ith7QkvjgPrrId1uzECxOLUPDMM/QHaCPcg/E53W8R+5L
 rKbOgJAjcGbLmiL9W/NpRU6i1KS6XqOEBB8g5SPsmDB7BrlgMOfDn59eKwg+JCvlouMm
 I7pQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwQ6DndP0VmcYoGfylxxDQMBaORqeC+RmuVAarMuyQCKnYkAHy4PlAlotvR74tJWMDOPCtsn8LrIj9U@nongnu.org
X-Gm-Message-State: AFq9FYKnjrRTc0UWFMqybozr1ZNiORoAI8hYbzbOfFAPEiZKDwe7n8Ge
 gjiFQDHm+uNlPWtk5V8rvIwxp/B3z2OfUccuPNgxviIOTYB8h/vlb7AP
X-Gm-Gg: AYBFou0a5KjPnCH84m81wQRzgSV6jvbKvQPtYpomkFWVBTpVEvrjO2Ng1kYAchfSXcI
 nTrF6P7GDHJ4QbXlHRPGwdzzhg13YI4iXYS4rWJbakonAMrzpiSz0W5NA68mAUllqVRyHlLMy1d
 b5ZvrDW/aS071ezlnrwvktWObmN5XmTCkHDqprrLGYldAlZZ/xmdVOdHl9QW+18BUt8NI+jBfha
 NZUmEQJh60nZ8IMmShhTJk0vTdpxxh1/TuXk7I+sAOtvva9rxP//lR6KqqsAqYDjsYP1GMdBdp/
 2o0wtqT93mrFMZ5+AgLSBcNpfc2RZNzy6/Ow5JMruCeDZU4Dxdi7k6CJ1BXcJ5AofH5jnfcRoV7
 eaZE5Cf2wmWCvfowCYsVCdvzmMh3Z/gVN9mdBePZri8J2P2BOBymqOKzFbneMs4snvUbPOEnGNg
 EMXbqi6XvPkPJGT1t9OJ6pQvM/3HAzo9aTErajyzjY4ct8QzrhzpxUhwPXhrppB1W/nqgMyPF7C
 vmsQcPbgNN9vhYcWQ==
X-Received: by 2002:a05:7301:19a7:b0:315:afc1:72db with SMTP id
 5a478bee46e88-34cdb6ed605mr1154166eec.9.1790753989770; 
 Wed, 30 Sep 2026 00:39:49 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34cf5b4349bsm1825773eec.25.2026.09.30.00.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 00:39:49 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Song Gao <17746591750@163.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v2 1/6] hw/arm/virt: prefix ACPI helpers with arm_virt_
Date: Wed, 30 Sep 2026 15:39:28 +0800
Message-ID: <20260930073935.712-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260930073935.712-1-luoyonggang@gmail.com>
References: <20260930073935.712-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0f.google.com
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
index d368913e76..5737c3a8fa 100644
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
index bdac33a1de..87d4345411 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -763,7 +763,7 @@ static void fdt_add_cpu_nodes(VirtMachineState *vms)
                     &bottom_node,
                     CPU_TOPOLOGY_LEVEL_SOCKET);
             if (cache_at_topo_level) {
-                if (bottom_node == 1 && !virt_is_acpi_enabled(vms))
+                if (bottom_node == 1 && !arm_virt_is_acpi_enabled(vms))
                     error_setg(
                         &error_fatal,
                         "Cannot share L1 at socket_id %d."
@@ -803,7 +803,7 @@ static void fdt_add_cpu_nodes(VirtMachineState *vms)
                                                         top_cluster,
                                                         bottom_cluster, cpu,
                                                         &cluster_offset);
-                if (bottom_cluster == 1 && !virt_is_acpi_enabled(vms)) {
+                if (bottom_cluster == 1 && !arm_virt_is_acpi_enabled(vms)) {
                     error_setg(&error_fatal,
                         "Cannot share L1 at socket_id %d, cluster_id %d. "
                         "DT limitation on sharing at cache level = 1.",
@@ -2030,7 +2030,7 @@ static void create_smmuv3_dev_dtb(VirtMachineState *vms, DeviceState *dev,
     hwaddr base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
     MachineState *ms = MACHINE(vms);
 
-    if (!(vms->bootinfo.firmware_loaded && virt_is_acpi_enabled(vms))) {
+    if (!(vms->bootinfo.firmware_loaded && arm_virt_is_acpi_enabled(vms))) {
         if (object_property_get_bool(OBJECT(dev), "accel", &error_abort)) {
             error_setg(errp, "SMMUv3 with accel=on not supported for DT");
             return;
@@ -2440,7 +2440,7 @@ void virt_machine_done(Notifier *notifier, void *data)
     pci_bus_add_fw_cfg_extra_pci_roots(vms->fw_cfg, vms->bus,
                                        &error_abort);
 
-    virt_acpi_setup(vms);
+    arm_virt_acpi_setup(vms);
     virt_build_smbios(vms);
 }
 
@@ -3204,7 +3204,7 @@ static void machvirt_init(MachineState *machine)
     create_pcie(vms);
     create_cxl_host_reg_region(vms);
 
-    if (aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
+    if (aarch64 && firmware_loaded && arm_virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
         vms->generic_error_notifier.notify = virt_generic_error_req;
         notifier_list_add(&acpi_generic_error_notifiers,
@@ -3554,7 +3554,7 @@ static void virt_set_oem_table_id(Object *obj, const char *value,
 }
 
 
-bool virt_is_acpi_enabled(const VirtMachineState *vms)
+bool arm_virt_is_acpi_enabled(const VirtMachineState *vms)
 {
     if (vms->acpi == ON_OFF_AUTO_OFF) {
         return false;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 22e66d1a11..695e5d5728 100644
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
2.55.0.windows.3


