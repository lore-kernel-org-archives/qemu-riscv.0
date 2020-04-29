Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jTtO3-0006vr-Ou
	for mharc-qemu-riscv@gnu.org; Wed, 29 Apr 2020 16:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53400)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTtNM-0006MH-27
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 16:32:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTtJz-00066o-41
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 16:32:11 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:7549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTtJy-00065w-5x; Wed, 29 Apr 2020 16:28:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1588192122; x=1619728122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rDvUZn6Dr4DaGqqRa1/NFJ5b/JU2P35tZuaKi4QQJjI=;
 b=jcxCP6dvUMWwGTV+zziJ/Kk/Zhzb/qT9IjboPkLNS+pV99PZGnqk3PeR
 ZOcnN86ZvuTuioI83Rhhb9lgS5soQm0BrZpEk9WV2lVrUyLRUHCuoz7pq
 fIe9idfsJFyV5Y7FxJhttjxPp35McuV60UGnyxEiFswoNHWAw3gglJfgc
 wndElJvGEDnpCzaD08Cjzahkv6bHVcG8xS06mbFqjEx8OZ01wW0WiuEP1
 Er4v1z4Rm2M4j2Lh2Cse9bnpjgPKAo1QY1wvVY4IeWHqD5m0L7A6HRG9j
 Y6AFKNH7eJ7KQ6r35qEA8sik6lr/f1z2+BBXvEOGhuw4cqe6VZDNNwEFE g==;
IronPort-SDR: cyHNNzjE5dxyaoOBMCMKOPaSA77L/ib14mKpzhXlLfNzLuBMUB9ExxVmhnm3nfxWLqv4fKMxoY
 kiHqENKp1l2LcJmHbzLlk89npRS/q44lfZQ7GPY0WVKIQZpnfz2WlCNfXXogpj3DehudxiPZJX
 liYKoWL+Q0ToX98TdToj24b2tsfWZFtAckOgJq1+uWG/gNpucNesGFc6/0MmKEbsUBXNlGIuze
 ekQd+6gyT2Xza+4P9t7blJGx0ikY0XQof2qWWSTq0wZ93t+CD2jmKpAAUIq2UA8hKt8zLr18Jr
 0XU=
X-IronPort-AV: E=Sophos;i="5.73,333,1583164800"; d="scan'208";a="136507031"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Apr 2020 04:28:37 +0800
IronPort-SDR: czB2uXG5Am4w0utk6o1IiFdmUGHx/RFbram6MG4qE1zPZm6QIIDUZEms8gH4Hlqv7HqJXBqX7J
 1ztGfUvOyn0hsRG1Dj9MhsIb8KNUkSOzA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 13:18:42 -0700
IronPort-SDR: N0HD1fd4RSC5vwqzyKxKY1ZHL8P4JqS0eLuS6V5+yWnOowoFzHvROD4zMVA8CYHnYWdrYdC2Xv
 zn5i8EA30P+w==
WDCIronportException: Internal
Received: from usa004631.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.56.145])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Apr 2020 13:28:37 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Cc: palmerdabbelt@google.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL v2 01/14] riscv/sifive_u: Fix up file ordering
Date: Wed, 29 Apr 2020 13:19:53 -0700
Message-Id: <20200429202006.775322-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429202006.775322-1-alistair.francis@wdc.com>
References: <20200429202006.775322-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=381fbd49e=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 16:28:37
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 216.71.154.42
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Apr 2020 20:32:54 -0000

Split the file into clear machine and SoC sections.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/riscv/sifive_u.c | 108 ++++++++++++++++++++++----------------------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 998666c91f..7f6a3c6c15 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -312,7 +312,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     g_free(nodename);
 }
 
-static void riscv_sifive_u_init(MachineState *machine)
+static void sifive_u_machine_init(MachineState *machine)
 {
     const struct MemmapEntry *memmap = sifive_u_memmap;
     SiFiveUState *s = RISCV_U_MACHINE(machine);
@@ -403,6 +403,59 @@ static void riscv_sifive_u_init(MachineState *machine)
                           &address_space_memory);
 }
 
+static bool sifive_u_machine_get_start_in_flash(Object *obj, Error **errp)
+{
+    SiFiveUState *s = RISCV_U_MACHINE(obj);
+
+    return s->start_in_flash;
+}
+
+static void sifive_u_machine_set_start_in_flash(Object *obj, bool value, Error **errp)
+{
+    SiFiveUState *s = RISCV_U_MACHINE(obj);
+
+    s->start_in_flash = value;
+}
+
+static void sifive_u_machine_instance_init(Object *obj)
+{
+    SiFiveUState *s = RISCV_U_MACHINE(obj);
+
+    s->start_in_flash = false;
+    object_property_add_bool(obj, "start-in-flash", sifive_u_machine_get_start_in_flash,
+                             sifive_u_machine_set_start_in_flash, NULL);
+    object_property_set_description(obj, "start-in-flash",
+                                    "Set on to tell QEMU's ROM to jump to "
+                                    "flash. Otherwise QEMU will jump to DRAM",
+                                    NULL);
+}
+
+static void sifive_u_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "RISC-V Board compatible with SiFive U SDK";
+    mc->init = sifive_u_machine_init;
+    mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
+    mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
+    mc->default_cpus = mc->min_cpus;
+}
+
+static const TypeInfo sifive_u_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("sifive_u"),
+    .parent     = TYPE_MACHINE,
+    .class_init = sifive_u_machine_class_init,
+    .instance_init = sifive_u_machine_instance_init,
+    .instance_size = sizeof(SiFiveUState),
+};
+
+static void sifive_u_machine_init_register_types(void)
+{
+    type_register_static(&sifive_u_machine_typeinfo);
+}
+
+type_init(sifive_u_machine_init_register_types)
+
 static void riscv_sifive_u_soc_init(Object *obj)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -443,33 +496,6 @@ static void riscv_sifive_u_soc_init(Object *obj)
                           TYPE_CADENCE_GEM);
 }
 
-static bool sifive_u_get_start_in_flash(Object *obj, Error **errp)
-{
-    SiFiveUState *s = RISCV_U_MACHINE(obj);
-
-    return s->start_in_flash;
-}
-
-static void sifive_u_set_start_in_flash(Object *obj, bool value, Error **errp)
-{
-    SiFiveUState *s = RISCV_U_MACHINE(obj);
-
-    s->start_in_flash = value;
-}
-
-static void riscv_sifive_u_machine_instance_init(Object *obj)
-{
-    SiFiveUState *s = RISCV_U_MACHINE(obj);
-
-    s->start_in_flash = false;
-    object_property_add_bool(obj, "start-in-flash", sifive_u_get_start_in_flash,
-                             sifive_u_set_start_in_flash, NULL);
-    object_property_set_description(obj, "start-in-flash",
-                                    "Set on to tell QEMU's ROM to jump to "
-                                    "flash. Otherwise QEMU will jump to DRAM",
-                                    NULL);
-}
-
 static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -607,29 +633,3 @@ static void riscv_sifive_u_soc_register_types(void)
 }
 
 type_init(riscv_sifive_u_soc_register_types)
-
-static void riscv_sifive_u_machine_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-
-    mc->desc = "RISC-V Board compatible with SiFive U SDK";
-    mc->init = riscv_sifive_u_init;
-    mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
-    mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
-    mc->default_cpus = mc->min_cpus;
-}
-
-static const TypeInfo riscv_sifive_u_machine_typeinfo = {
-    .name       = MACHINE_TYPE_NAME("sifive_u"),
-    .parent     = TYPE_MACHINE,
-    .class_init = riscv_sifive_u_machine_class_init,
-    .instance_init = riscv_sifive_u_machine_instance_init,
-    .instance_size = sizeof(SiFiveUState),
-};
-
-static void riscv_sifive_u_machine_init_register_types(void)
-{
-    type_register_static(&riscv_sifive_u_machine_typeinfo);
-}
-
-type_init(riscv_sifive_u_machine_init_register_types)
-- 
2.26.2


