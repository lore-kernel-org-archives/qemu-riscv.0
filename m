Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXezN-0003px-PN
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 04:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezM-0003pU-1w
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 04:12:36 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezK-0004oD-FL
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 04:12:35 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 p3-20020a17090ad30300b0023a1cd5065fso2104013pju.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Mar 2023 01:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EoMLEEBeALy5RqHQol1x3kgq/xhZyhIr706Dydz1mcg=;
 b=bclyfFwvsYpJwq1IZXJYB1f9jfM4Pn+NW6Vn3zK3ZKvPpoqAGdUcCGNKIgkaEKbym9
 MDB9j/t+U1cjrakB2kx+DDysmyw3eJJxhJp6q+sn7IelMOZd56oGxKdUKQPSXyDoL47J
 nFeFzGwWShmqQkpvUmgKrqGQYwkFoIiwJquJYLMS0vnVTPNLI4uhnwykWbDJqnvRmnmB
 gPSqdrpCc3H3CpK/VYPp58nyL3HkIvZtyqkkVnsn+pjFBG6FbhTkUdCTt0vM3Of0KCCu
 phi/WkEprtcN94k3bkOdfRs8m3anBmmJCozDK4vhst6m4gHAxH7S+l++smlA1KHD7js0
 rJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EoMLEEBeALy5RqHQol1x3kgq/xhZyhIr706Dydz1mcg=;
 b=zML/O/NdNQF3qeur9La/RkgtiNJD78YaR/FarR2v8g+d7GXLLR7N67aSKAz1e//NGS
 GtnCaoNJnEY5fVBD/ZccISZD8E4ikY9Bcde2UNXc2570dbPQsx1utXztVQgXbnu9fu5I
 o0kulFyVrDzxa3iE5alEYu5db10FEURuPzEKVdx13ePRAOejslq4tgKR5n7vM6MLJk4n
 jc5mfVjlEOqOpRXnd52uDQ9JES2cRXoJbPfeLTFw/UDmfoeBDvGhgl/kuKONsQtDHOb2
 a0BgU0MDJW+mSJl85x86pV1c2gKOFFm13vEZXpGx2m3guPJKHmuwwsSqXYmsxrK4rthb
 j0JA==
X-Gm-Message-State: AO0yUKXrsM1gbuqWZ+NCD8UfCigVwV6w0x6mX6RfwudfPIeX8/2RuWSz
 CGJljx0yfbrO8EYiPfII60fPi/MR8UnswX23
X-Google-Smtp-Source: AK7set8G5aOiRnsTdEV3JQnWFsTdhm8E7hOivZ+Tbc3ZHU25TMyfb/iaS1DiBov1bNhW3YUKjngAlA==
X-Received: by 2002:a17:90a:1d1:b0:230:a1ce:f673 with SMTP id
 17-20020a17090a01d100b00230a1cef673mr11378681pjd.4.1677748352977; 
 Thu, 02 Mar 2023 01:12:32 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 iz12-20020a170902ef8c00b0019945535973sm9850692plb.63.2023.03.02.01.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 01:12:32 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Igor Mammedov <imammedo@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V5 2/8] hw/riscv/virt: Add a switch to disable ACPI
Date: Thu,  2 Mar 2023 14:42:06 +0530
Message-Id: <20230302091212.999767-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230302091212.999767-1-sunilvl@ventanamicro.com>
References: <20230302091212.999767-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 02 Mar 2023 09:12:36 -0000

ACPI will be enabled by default. Add a switch to turn off
for testing and debug purposes.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt.c         | 29 +++++++++++++++++++++++++++++
 include/hw/riscv/virt.h |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 1621278eb8..8df37cf3d6 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -50,6 +50,7 @@
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
 #include "hw/acpi/aml-build.h"
+#include "qapi/qapi-visit-common.h"
 
 /*
  * The virt machine physical address space used by some of the devices
@@ -1518,6 +1519,7 @@ static void virt_machine_instance_init(Object *obj)
 
     s->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     s->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
+    s->acpi = ON_OFF_AUTO_AUTO;
 }
 
 static char *virt_get_aia_guests(Object *obj, Error **errp)
@@ -1592,6 +1594,28 @@ static void virt_set_aclint(Object *obj, bool value, Error **errp)
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
@@ -1663,6 +1687,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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


