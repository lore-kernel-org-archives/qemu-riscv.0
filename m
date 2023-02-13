Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRa0l-00066x-8Q
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 09:40:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0k-00066c-Hq
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 09:40:54 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0i-0005S5-W3
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 09:40:54 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 r9-20020a17090a2e8900b00233ba727724so5769671pjd.1
 for <qemu-riscv@nongnu.org>; Mon, 13 Feb 2023 06:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6hwFanLgG46y9VdtBJOixXPpVviBQoYKFFHS0ZT/nyg=;
 b=Eq1n3mFJLK9Fx8wZkCFBhF3uAhlaerhVpk3PgECXb5IgeQ/Zx7Sx4NcXTYXcA59rB8
 5cbgdhgcmay5vW5DClIIb8kaDpe76d9baVF7lQAWzLfNtXjups8/ZITaN/11/YGjs1iH
 7wUofesJ2YCXBfXOll/Zi6/N47Tl8VMIkQutfdZOzADBCbzc2+GDpZyvMiOjHNAc+YXl
 +dvATswltdGdRyTBgI/G+Vn3qCPERFL/ZydFdeeuJ/RmA7zQoVwsD8Cp+/lsZyfiDFOI
 H2C0n4D6SWIiLNzjGfJjpQp71jEtmBCGD2Lnx9J8OAt7UoHC4MxXVq45GIUI6rOIOyKQ
 ziiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6hwFanLgG46y9VdtBJOixXPpVviBQoYKFFHS0ZT/nyg=;
 b=UGYz5jpcehx0IOHWJXKw5I4GexJm0YYgT1EfXfl6ymQxDqiirrKZxcFG7ihg36GdUs
 0MkbfuLfQ9QAbDJxW00f4zS1L4oM5u7yfQyHJHtPUvlAljoor5ASRv3pQOH2V+PygUYv
 JelWXmwveqrtZOz4iZmhyE7UHeU7g2B68ceNkE47oPe7hrQ8LkLK2kJbTwboz5zaVGwY
 fSs7ZdoxJ2tJMHhMhq5cbFqkG7ftpdfzjcahqzHgRlkamqwm6q/VQNIXEABQuCSdwuQF
 x028/+QlQ2mfXpejbmzK261ZA2PuBqAA8vyaZhi0UpL8wsjlq+ZvBOIAeU7XZIwSbaVm
 Iolw==
X-Gm-Message-State: AO0yUKW1uXpgpgMqySZJosOY7aSvNA+Ny7KTSVi+CgPFBXgcylGB1H6w
 xRgmtM4a2tet3a6er5lzL9/8vw==
X-Google-Smtp-Source: AK7set+AIadOMj+pHiIIBYyuT9nN1M1R/XtKJlVucYQGhc8Y/opY+Lzjf1g2Hhiux8+miLisxdFXtA==
X-Received: by 2002:a05:6a21:9985:b0:b6:597f:66a1 with SMTP id
 ve5-20020a056a21998500b000b6597f66a1mr31194045pzb.60.1676299251546; 
 Mon, 13 Feb 2023 06:40:51 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 y23-20020a63de57000000b004fb8732a2f9sm3777757pgi.88.2023.02.13.06.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:40:51 -0800 (PST)
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
Subject: [PATCH V2 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
Date: Mon, 13 Feb 2023 20:10:30 +0530
Message-Id: <20230213144038.2547584-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Mon, 13 Feb 2023 14:40:54 -0000

ACPI is enabled by default. Add a switch to turn off
for testing and debug purposes.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt.c         | 35 +++++++++++++++++++++++++++++++++++
 include/hw/riscv/virt.h |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index fb68cf81e9..58d3765b6d 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -50,6 +50,7 @@
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
 #include "hw/acpi/aml-build.h"
+#include "qapi/qapi-visit-common.h"
 
 /*
  * The virt machine physical address space used by some of the devices
@@ -1517,6 +1518,9 @@ static void virt_machine_init(MachineState *machine)
 
 static void virt_machine_instance_init(Object *obj)
 {
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
+    s->acpi = ON_OFF_AUTO_AUTO;
 }
 
 static char *virt_get_aia_guests(Object *obj, Error **errp)
@@ -1591,6 +1595,32 @@ static void virt_set_aclint(Object *obj, bool value, Error **errp)
     s->have_aclint = value;
 }
 
+bool virt_is_acpi_enabled(RISCVVirtState *s)
+{
+    if (s->acpi == ON_OFF_AUTO_OFF) {
+        return false;
+    }
+    return true;
+}
+
+static void virt_get_acpi(Object *obj, Visitor *v, const char *name,
+                          void *opaque, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
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
@@ -1662,6 +1692,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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


