Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CAEC4345F
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 13:56:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rwjHx-0006vz-4E; Tue, 16 Apr 2024 09:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwjGz-0005UL-Hl
 for qemu-riscv@nongnu.org; Tue, 16 Apr 2024 09:54:57 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwjGt-0001yp-If
 for qemu-riscv@nongnu.org; Tue, 16 Apr 2024 09:54:54 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41881bce4b5so12534965e9.2
 for <qemu-riscv@nongnu.org>; Tue, 16 Apr 2024 06:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713275690; x=1713880490; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yRuCmU9cf0HsIcr2DFvli4GpYMIaf8UUti4fhCeSnNc=;
 b=qezkKTuHEPCFC4CgpalAcegtB7SbW5pAcgcGjdZ/q29HLN8mlpNuzNz68vzpkh42it
 JevJ8JN6lGh8pNt0tZ6QOImLSLXczRCcrZbTInfwMjHDEHYlP3QgB1ZbLiE7OT6L7TXQ
 6RGGO7HsTqh/o72u31YETt9Te54oQ6yNVH41hbhX70t4zyB+sBhOAZFLT0kB8C2QM9O7
 8UVNxUrsVbVWwRMmWy2VGIiMI5miH7WTp70wIHXLwfbWlvdHWOWEgWwpnvxS+A2xgO6y
 IjcIrOab0UQ3f1tIDQwKqETYMJAVE/sK2nwzC0A8JDWKHHzxZEz/bNEloWMiYW7iFLWh
 8N2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713275690; x=1713880490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yRuCmU9cf0HsIcr2DFvli4GpYMIaf8UUti4fhCeSnNc=;
 b=cjgdAkcppPiSgaWftl8S1FQzKDat7+vGQ71Sjr5XYnvlsZpZhC/rE5uv017Tdi113j
 eY+26Oxpip+B+6QkeEIWRCZOfwvDEN16y6YeMw7e1Oo/o6K6ITMyMtLY4tq++F5tzBRu
 h1Dz7/Kf5uK9VNO//3Rd6I/RUDc7POe/8DLryWgYXtNfWuK2T++CElxb1qLsCNpFCzLP
 LIHdXP3vNnZxmG4KCMy6Kwo5SyeSm6JMyPUkSoopSKEz0JTpEuzK6B2KxxHsNJKFdMZn
 1L0VUpFatsJVDlmI/bvQ01nLKF03uuHhX+2PLVLrbysuFJMyAEm+ISPBuCDClFCIbiLI
 ftMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfPR8EqIZebH9IXSI1QSld2UiOUmaskjvjGa+5OLjJguW5cYlKmhMfWZjT0tffM3VPy08eSPgaxS5iIsIU8YoEWEqecZg=
X-Gm-Message-State: AOJu0YwGJyuys8j8aUijpbKqMMebml1wfwLZb/zNnp/9jbF0WYzY7b6J
 I9JYoy9J/t37XqqeAUUOkK/AqXoYsQ0p/CikLbQeNLbjXTNBHJAsEyngm+CALMA=
X-Google-Smtp-Source: AGHT+IGVN22N0EsiFa4ZpRTULhNjAQipMCrQPE+zSjsBFO9e/Y+jdUwVFZKFsPsF4sFDPjIWHOqisg==
X-Received: by 2002:a05:6000:1d86:b0:347:e6ef:ea97 with SMTP id
 bk6-20020a0560001d8600b00347e6efea97mr4905335wrb.24.1713275690221; 
 Tue, 16 Apr 2024 06:54:50 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
 by smtp.gmail.com with ESMTPSA id
 jw9-20020a170906e94900b00a52241b823esm6640542ejb.109.2024.04.16.06.54.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 16 Apr 2024 06:54:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v3 18/22] hw/i386/pc: Remove PCMachineClass::rsdp_in_ram
Date: Tue, 16 Apr 2024 15:52:47 +0200
Message-ID: <20240416135252.8384-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240416135252.8384-1-philmd@linaro.org>
References: <20240416135252.8384-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

PCMachineClass::rsdp_in_ram was only used by the
pc-i440fx-2.2 machine, which got removed. It is
now always true. Remove it, simplifying acpi_setup().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20240305134221.30924-15-philmd@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 include/hw/i386/pc.h |  1 -
 hw/i386/acpi-build.c | 35 ++++-------------------------------
 hw/i386/pc.c         |  1 -
 3 files changed, 4 insertions(+), 33 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 10a8ffa0de..96ccb4583f 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -100,7 +100,6 @@ struct PCMachineClass {
 
     /* ACPI compat: */
     bool has_acpi_build;
-    bool rsdp_in_ram;
     unsigned acpi_data_size;
     int pci_root_uid;
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ab2d4d8dcb..ed0adb0e82 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2495,7 +2495,6 @@ static
 void acpi_build(AcpiBuildTables *tables, MachineState *machine)
 {
     PCMachineState *pcms = PC_MACHINE(machine);
-    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(machine);
     DeviceState *iommu = pcms->iommu;
     GArray *table_offsets;
@@ -2667,16 +2666,6 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
             .rsdt_tbl_offset = &rsdt,
         };
         build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
-        if (!pcmc->rsdp_in_ram) {
-            /* We used to allocate some extra space for RSDP revision 2 but
-             * only used the RSDP revision 0 space. The extra bytes were
-             * zeroed out and not used.
-             * Here we continue wasting those extra 16 bytes to make sure we
-             * don't break migration for machine types 2.2 and older due to
-             * RSDP blob size mismatch.
-             */
-            build_append_int_noprefix(tables->rsdp, 0, 16);
-        }
     }
 
     /* We'll expose it all to Guest so we want to reduce
@@ -2755,7 +2744,6 @@ static const VMStateDescription vmstate_acpi_build = {
 void acpi_setup(void)
 {
     PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
-    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
@@ -2817,25 +2805,10 @@ void acpi_setup(void)
                            tables.vmgenid);
     }
 
-    if (!pcmc->rsdp_in_ram) {
-        /*
-         * Keep for compatibility with old machine types.
-         * Though RSDP is small, its contents isn't immutable, so
-         * we'll update it along with the rest of tables on guest access.
-         */
-        uint32_t rsdp_size = acpi_data_len(tables.rsdp);
-
-        build_state->rsdp = g_memdup(tables.rsdp->data, rsdp_size);
-        fw_cfg_add_file_callback(x86ms->fw_cfg, ACPI_BUILD_RSDP_FILE,
-                                 acpi_build_update, NULL, build_state,
-                                 build_state->rsdp, rsdp_size, true);
-        build_state->rsdp_mr = NULL;
-    } else {
-        build_state->rsdp = NULL;
-        build_state->rsdp_mr = acpi_add_rom_blob(acpi_build_update,
-                                                 build_state, tables.rsdp,
-                                                 ACPI_BUILD_RSDP_FILE);
-    }
+    build_state->rsdp = NULL;
+    build_state->rsdp_mr = acpi_add_rom_blob(acpi_build_update,
+                                             build_state, tables.rsdp,
+                                             ACPI_BUILD_RSDP_FILE);
 
     qemu_register_reset(acpi_build_reset, build_state);
     acpi_build_reset(build_state);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c4a7885a3b..a1b0e94523 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1745,7 +1745,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
 
     pcmc->pci_enabled = true;
     pcmc->has_acpi_build = true;
-    pcmc->rsdp_in_ram = true;
     pcmc->smbios_defaults = true;
     pcmc->gigabyte_align = true;
     pcmc->has_reserved_memory = true;
-- 
2.41.0


