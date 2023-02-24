Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVTZt-0006nv-RV
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 03:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVTZs-0006lx-6L
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 03:37:16 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVTZq-00019S-Jb
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 03:37:15 -0500
Received: by mail-pj1-x102a.google.com with SMTP id c23so10824109pjo.4
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 00:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N+OOzZTd+FgUwUMI1igucgMgF0Wi5ScBHpBGkkd0FxA=;
 b=T6VyJvMPJpkmiqs5yn+RyLjZ3YIY8YR22lyINN8sQmZ1Vx+tpGDf8B7WKjPYdj08bJ
 GasKWj5aNUBiILx90y29UBY7/lCv/pvNg52lvYKx9gd/sc1ldzaZ8+SNq+M1oMvEyVXm
 hnrX8pl1O7DNWtBnHVXDPbDJBjcc3Cp0xwKQVr8EWQCRz506mfj5hgtLyCKeLLL/QXZK
 IJM1RU6aFjyvlmXH27Eo/Jd8sgcfOx9ISGMHOW7luLS3Bbw8cGa/GEx4jZJTMLWgx8dY
 6Ylr8zoI0dyfw4Evfr1O8YD33+AOxFoS/wBmDeRfA0jxQ/NpV9iq9Uq1cRVdJdbvkHQK
 4vhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N+OOzZTd+FgUwUMI1igucgMgF0Wi5ScBHpBGkkd0FxA=;
 b=SUozOwLtAiBAobGw5k5vmWSEJZTxC8UoAzQ2mpYEAJ7yvJ1EGL8sBwyadKODtX1ETn
 w3te/kgNUK1xf5wetff/hYPyiSr5bedTVMjxJ+ehmeeudktEiwnSgumXDMG/RBSoul22
 Dz8YHcqTGP2EZjQ08d/hBVtC13ruTk3BOlRLypvaiBERZRT/grEwylW6xuy0yxEUeeTV
 VZSYjpL0+Ya9PrlNQeJKyYkctuO6HybKSV5HX6KPtW+9hxvk1/HzRXf7cphUlcb1Sgjq
 PA3Pb0mTzmqYFcHXUkZdJNESOrKbHiAqbwJoAxAbPk2UqEmtZ+AqXrZ7mf3CyawCT37m
 HzmQ==
X-Gm-Message-State: AO0yUKXOLdgNbO1gl4LzsrgldHBQSPnkUp2PnKLqrUEWq9RdM/WxSvyc
 polXXLKHAWkIdET2uACO2b26iw==
X-Google-Smtp-Source: AK7set8MCtb8r4Al9kMxOSm9lhJ4Pm8kB9npr9XJ3xUKUsQbP052j/9JlXgPNBj+I1IT4P4hQ4oVcQ==
X-Received: by 2002:a05:6a20:ba87:b0:c7:6c26:48b7 with SMTP id
 fb7-20020a056a20ba8700b000c76c2648b7mr13141109pzb.15.1677227833856; 
 Fri, 24 Feb 2023 00:37:13 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 e3-20020aa78243000000b005dd98927cc5sm2507945pfn.76.2023.02.24.00.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 00:37:13 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V4 2/8] hw/riscv/virt: Add a switch to disable ACPI
Date: Fri, 24 Feb 2023 14:06:55 +0530
Message-Id: <20230224083701.2657063-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
References: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Fri, 24 Feb 2023 08:37:16 -0000

ACPI will be enabled by default. Add a switch to turn off
for testing and debug purposes.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt.c         | 29 +++++++++++++++++++++++++++++
 include/hw/riscv/virt.h |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4118d28468..89d5b9d8aa 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -50,6 +50,7 @@
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
 #include "hw/acpi/aml-build.h"
+#include "qapi/qapi-visit-common.h"
 
 /*
  * The virt machine physical address space used by some of the devices
@@ -1526,6 +1527,7 @@ static void virt_machine_instance_init(Object *obj)
 
     s->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     s->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
+    s->acpi = ON_OFF_AUTO_AUTO;
 }
 
 static char *virt_get_aia_guests(Object *obj, Error **errp)
@@ -1600,6 +1602,28 @@ static void virt_set_aclint(Object *obj, bool value, Error **errp)
     s->have_aclint = value;
 }
 
+bool virt_is_acpi_enabled(RISCVVirtState *s)
+{
+    return s->acpi != ON_OFF_AUTO_OFF;
+}
+
+static void virt_get_acpi(Object *obj, Visitor *v, const char *name,
+                          void *opaque, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+    OnOffAuto acpi = s->acpi;
+
+    visit_type_OnOffAuto(v, name, &acpi, errp);
+}
+
+static void virt_set_acpi(Object *obj, Visitor *v, const char *name,
+                          void *opaque, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
+    visit_type_OnOffAuto(v, name, &s->acpi, errp);
+}
+
 static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
                                                         DeviceState *dev)
 {
@@ -1671,6 +1695,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     sprintf(str, "Set number of guest MMIO pages for AIA IMSIC. Valid value "
                  "should be between 0 and %d.", VIRT_IRQCHIP_MAX_GUESTS);
     object_class_property_set_description(oc, "aia-guests", str);
+    object_class_property_add(oc, "acpi", "OnOffAuto",
+                              virt_get_acpi, virt_set_acpi,
+                              NULL, NULL);
+    object_class_property_set_description(oc, "acpi",
+                                          "Enable ACPI");
 }
 
 static const TypeInfo virt_machine_typeinfo = {
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 6c7885bf89..62efebaa32 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -58,6 +58,7 @@ struct RISCVVirtState {
     int aia_guests;
     char *oem_id;
     char *oem_table_id;
+    OnOffAuto acpi;
 };
 
 enum {
@@ -123,4 +124,5 @@ enum {
 #define FDT_APLIC_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
                                  1 + FDT_APLIC_INT_CELLS)
 
+bool virt_is_acpi_enabled(RISCVVirtState *s);
 #endif
-- 
2.34.1


