Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iP7Pj-0005V4-07
	for mharc-qemu-riscv@gnu.org; Mon, 28 Oct 2019 11:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34759)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iP7Pf-0005O1-3B
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iP7Pd-0003tg-OK
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:34 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:42999)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iP7Pd-0003tN-HP
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:33 -0400
Received: by mail-pg1-x543.google.com with SMTP id f14so7152436pgi.9
 for <qemu-riscv@nongnu.org>; Mon, 28 Oct 2019 08:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=WP8Cy2LjfUyKbvj4Exi5IKEff9PRhXsowYLykTeYI5E=;
 b=kORLJ6z6gEe/Ceo8UQOBHOKCOnfw6s2wmPE7QEw9n/qWGkJQup48aRtedF8UQBrMtY
 9aElaVJLm517nJ0cFsA7r71GYN+GINEu30pEo8MRm/DhLnsTqDx8dEIWnqBNF7KdpH7g
 6M3IG7p4wtHA87Ae0EA+Uk1mdwM2qDUBOzZ8BseTEburU1bGLuefQVsm66kjUTCe7C/A
 4hu8ct1bfdn+evh6oszyDmUG6bNXZ4A+IikKeCZ90ofN7esFAaGMxfspCE+jZ3mWVPQ/
 SuFqLuW8Yh9Ou3yAg7f7hsDqUxPj7Z0J2GADsr5i21TSSiQmmNagYV7ehhiewxRmE/La
 x87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=WP8Cy2LjfUyKbvj4Exi5IKEff9PRhXsowYLykTeYI5E=;
 b=dDGYut+e1jazapcpjW3XAb6r0y8VkMe6wgvRjiKnrtt3n6dtfeOGy9nuTj1/BfdnjO
 XBuUO6xUXHBgyRQaSX0afn8eIEPXRZKTi/tGLNpJNkQ7xiaKnpIyGnr3ir8w12Az2jO/
 +5i3Doc8s/b/Jmm145Yr0T3sdhElNnMLYWIievdME/Ev5C9y6fpJHNoRsHPxrAF+Q8l3
 BlOAl3jrTbzQtADrzpcQmbJb7C9FhllwgL7S2dk1zRKc34f5eQNkL9cS7UWx993+BQ5y
 A7dDQWI7Jx+vxyuTpA/qoy7WquN4J52siL0mQ+S9mYD9TcrEDrPqIbAIFIqHGArx038m
 F91w==
X-Gm-Message-State: APjAAAW6TbGrwb7vbFABffDyqTurEKHHB55rhIs3kKDBWQmXBRBTxKaP
 XIaFTHudbiu4Wtaf03cuxt/B4A==
X-Google-Smtp-Source: APXvYqzNElE53svNMF4biWhIynm8Rhq2pOSIu6Ieo3h91imlrRepPCKHzaYLSz5dKK5z+AheHfQpZg==
X-Received: by 2002:a17:90b:914:: with SMTP id bo20mr17886pjb.6.1572278312458; 
 Mon, 28 Oct 2019 08:58:32 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id y20sm12374138pge.48.2019.10.28.08.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 08:58:31 -0700 (PDT)
Subject: [PULL 09/18] riscv/sifive_u: Manually define the machine
Date: Mon, 28 Oct 2019 08:48:53 -0700
Message-Id: <20191028154902.32491-10-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028154902.32491-1-palmer@sifive.com>
References: <20191028154902.32491-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
X-List-Received-Date: Mon, 28 Oct 2019 15:58:37 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Instead of using the DEFINE_MACHINE() macro to define the machine let's
do it manually. This allows us to specify machine properties.

This patch is no functional change.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c         | 44 ++++++++++++++++++++++++++-----------
 include/hw/riscv/sifive_u.h |  7 +++++-
 2 files changed, 37 insertions(+), 14 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index a32d6773a8..eb4124f5b4 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -311,8 +311,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
 static void riscv_sifive_u_init(MachineState *machine)
 {
     const struct MemmapEntry *memmap = sifive_u_memmap;
-
-    SiFiveUState *s = g_new0(SiFiveUState, 1);
+    SiFiveUState *s = RISCV_U_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
     MemoryRegion *flash0 = g_new(MemoryRegion, 1);
@@ -434,6 +433,10 @@ static void riscv_sifive_u_soc_init(Object *obj)
                           TYPE_CADENCE_GEM);
 }
 
+static void riscv_sifive_u_machine_instance_init(Object *obj)
+{
+}
+
 static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -547,17 +550,6 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
         memmap[SIFIVE_U_GEM_MGMT].base, memmap[SIFIVE_U_GEM_MGMT].size);
 }
 
-static void riscv_sifive_u_machine_init(MachineClass *mc)
-{
-    mc->desc = "RISC-V Board compatible with SiFive U SDK";
-    mc->init = riscv_sifive_u_init;
-    mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
-    mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
-    mc->default_cpus = mc->min_cpus;
-}
-
-DEFINE_MACHINE("sifive_u", riscv_sifive_u_machine_init)
-
 static void riscv_sifive_u_soc_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -581,3 +573,29 @@ static void riscv_sifive_u_soc_register_types(void)
 }
 
 type_init(riscv_sifive_u_soc_register_types)
+
+static void riscv_sifive_u_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "RISC-V Board compatible with SiFive U SDK";
+    mc->init = riscv_sifive_u_init;
+    mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
+    mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
+    mc->default_cpus = mc->min_cpus;
+}
+
+static const TypeInfo riscv_sifive_u_machine_typeinfo = {
+    .name       = MACHINE_TYPE_NAME("sifive_u"),
+    .parent     = TYPE_MACHINE,
+    .class_init = riscv_sifive_u_machine_class_init,
+    .instance_init = riscv_sifive_u_machine_instance_init,
+    .instance_size = sizeof(SiFiveUState),
+};
+
+static void riscv_sifive_u_machine_init_register_types(void)
+{
+    type_register_static(&riscv_sifive_u_machine_typeinfo);
+}
+
+type_init(riscv_sifive_u_machine_init_register_types)
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 0062276190..794b958dcc 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -44,12 +44,17 @@ typedef struct SiFiveUSoCState {
     CadenceGEMState gem;
 } SiFiveUSoCState;
 
+#define TYPE_RISCV_U_MACHINE MACHINE_TYPE_NAME("sifive_u")
+#define RISCV_U_MACHINE(obj) \
+    OBJECT_CHECK(SiFiveUState, (obj), TYPE_RISCV_U_MACHINE)
+
 typedef struct SiFiveUState {
     /*< private >*/
-    SysBusDevice parent_obj;
+    MachineState parent_obj;
 
     /*< public >*/
     SiFiveUSoCState soc;
+
     void *fdt;
     int fdt_size;
 } SiFiveUState;
-- 
2.21.0


