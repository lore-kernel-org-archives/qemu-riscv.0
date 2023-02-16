Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pShKJ-0004Ot-Op
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 11:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pShKI-0004HZ-5Z
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 11:41:42 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pShKG-0000W2-AL
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 11:41:41 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 d13-20020a17090ad3cd00b0023127b2d602so2693040pjw.2
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 08:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EoMLEEBeALy5RqHQol1x3kgq/xhZyhIr706Dydz1mcg=;
 b=ANBJwgPCNC6PbcfccAbxrHtxoSvqLoi80pDNv0YL5fb+C5flauy9u1vHjc0dEM9Njx
 SS7B5onBKUc3NmdznYAc3oNOwPQ0E1GdIeOWuJAySZcBRK3MtypMz3VwdvYCWtMCPWtx
 dr35tCYP8pVxVQfCqSOXlX2XhC89uiSwvxbaAtRJF6jEpNA8HyEHzT9nZHyMwucAustD
 6BNK7S+7rGeHUqgAprP/00olah4g+Foey+wSC+SRCmkCOlcKjiLz1I5/AyGn3j3GqCVQ
 bscMjDYs1gphBi+kykJwaJ75c5jLpRfFuNIR3HT6eKZ/75AIgVm4+EFWLwMvddMGQ9Bd
 bSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EoMLEEBeALy5RqHQol1x3kgq/xhZyhIr706Dydz1mcg=;
 b=nbBCExVQ6XwQNYyB2BYlQzKcyD/Ig7jOGYbzqXdk5NNjs97+YL//LStJ5EXxzZ23yM
 rnIXvkAKBnNIiGOqPzjQ/iFGwsPFFCApwTJyQx0noxvcvfFF6Mvsb5N1XonYrp81qpES
 nNNmd4cCGP+z2sI3OxHSM1WIkkhMj8+H9VCA0ZXmg+mqqU2DlkBr+2NZgY2+6SHNCE2F
 H3YicFNIG+Ae83vgXeG2PMSE6ppnVanKA3rb11u1d8/tVYuiGQExvFzit0xNxVPgeHzi
 QgPU9dTL4vc9+teaXDuFDgA+i973Ku/kl4HNGEpnjXG4xYswHvRs5Dnd/6C2fW3smTYd
 eBTQ==
X-Gm-Message-State: AO0yUKVWYyZ1JiPf4K9R5G6A+g3EkwJX8GaCm3KjKNsVqYVqj3fg225R
 llz4UJKws0ufJ/Mu1BQHIM730w==
X-Google-Smtp-Source: AK7set96TadgyeuAadPBG/2PYEBLzHT4t3cBwnGEfL1yCFmuloVcH+zhipQOI161SxzEFOzLl+8x+A==
X-Received: by 2002:a17:90b:1a88:b0:234:b964:5707 with SMTP id
 ng8-20020a17090b1a8800b00234b9645707mr821815pjb.16.1676565698843; 
 Thu, 16 Feb 2023 08:41:38 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 q20-20020a638c54000000b004fbd10af99asm1385243pgn.60.2023.02.16.08.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:41:38 -0800 (PST)
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
Subject: [PATCH V3 2/8] hw/riscv/virt: Add a switch to disable ACPI
Date: Thu, 16 Feb 2023 22:11:19 +0530
Message-Id: <20230216164125.1945633-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
References: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Thu, 16 Feb 2023 16:41:42 -0000

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


