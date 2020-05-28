Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jeGLn-0006Gb-66
	for mharc-qemu-riscv@gnu.org; Thu, 28 May 2020 07:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jeGLW-0005y8-Ia
 for qemu-riscv@nongnu.org; Thu, 28 May 2020 07:05:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31847
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jeGLH-0006pL-Lt
 for qemu-riscv@nongnu.org; Thu, 28 May 2020 07:05:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590663894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L//IVDXLIRjMfn0cHcrOfivCgO41+dzR/XIeCVVH65g=;
 b=CY/2Kyg2QyB67Y8ew5o1pXpUv2g2HOu13mZ6S+n1gXWQhbGtj8dVpbH9JTFcQiNb7DRqT+
 jFsy8BhZJKiBFUCroOsG//77kK1jy3lPsiQsSgGTlN4idiydcGwHDZ2goeuopDFo5PI8+5
 2eySc85OZQI0xbXz5UZO/aCHfv1KKvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-JoNcjOr7P5edMry9zmjZLQ-1; Thu, 28 May 2020 07:04:51 -0400
X-MC-Unique: JoNcjOr7P5edMry9zmjZLQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDA6B107ACF7;
 Thu, 28 May 2020 11:04:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C4FF5D9F5;
 Thu, 28 May 2020 11:04:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1D8BB11358D2; Thu, 28 May 2020 13:04:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 19/24] riscv: Fix to put "riscv.hart_array" devices on
 sysbus
Date: Thu, 28 May 2020 13:04:39 +0200
Message-Id: <20200528110444.20456-20-armbru@redhat.com>
In-Reply-To: <20200528110444.20456-1-armbru@redhat.com>
References: <20200528110444.20456-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 01:51:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Thu, 28 May 2020 11:05:12 -0000

riscv_sifive_e_soc_init(), riscv_sifive_u_soc_init(),
spike_board_init(), spike_v1_10_0_board_init(),
spike_v1_09_1_board_init(), and riscv_virt_board_init() create
"riscv-hart_array" sysbus devices in a way that leaves them unplugged.

Create them the common way that puts them into the main system bus.
Affects machines sifive_e, sifive_u, spike, spike_v1.10, spike_v1.9.1,
and virt.  Visible in "info qtree", here's the change for sifive_e:

     bus: main-system-bus
       type System
    +  dev: riscv.hart_array, id ""
    +    num-harts = 1 (0x1)
    +    hartid-base = 0 (0x0)
    +    cpu-type = "sifive-e31-riscv-cpu"
       dev: sifive_soc.gpio, id ""

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: qemu-riscv@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_e.c |  5 ++---
 hw/riscv/sifive_u.c | 14 ++++++--------
 hw/riscv/spike.c    | 12 ++++++------
 hw/riscv/virt.c     |  4 ++--
 4 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index b53109521e..8831e6728e 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -120,9 +120,8 @@ static void riscv_sifive_e_soc_init(Object *obj)
     MachineState *ms = MACHINE(qdev_get_machine());
     SiFiveESoCState *s = RISCV_E_SOC(obj);
 
-    object_initialize_child(obj, "cpus", &s->cpus,
-                            sizeof(s->cpus), TYPE_RISCV_HART_ARRAY,
-                            &error_abort, NULL);
+    sysbus_init_child_obj(obj, "cpus", &s->cpus,
+                          sizeof(s->cpus), TYPE_RISCV_HART_ARRAY);
     object_property_set_int(OBJECT(&s->cpus), ms->smp.cpus, "num-harts",
                             &error_abort);
     sysbus_init_child_obj(obj, "riscv.sifive.e.gpio0",
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 4299bdf480..bb69fd8e48 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -491,10 +491,9 @@ static void riscv_sifive_u_soc_init(Object *obj)
                             &error_abort, NULL);
     qdev_prop_set_uint32(DEVICE(&s->e_cluster), "cluster-id", 0);
 
-    object_initialize_child(OBJECT(&s->e_cluster), "e-cpus",
-                            &s->e_cpus, sizeof(s->e_cpus),
-                            TYPE_RISCV_HART_ARRAY, &error_abort,
-                            NULL);
+    sysbus_init_child_obj(OBJECT(&s->e_cluster), "e-cpus",
+                          &s->e_cpus, sizeof(s->e_cpus),
+                          TYPE_RISCV_HART_ARRAY);
     qdev_prop_set_uint32(DEVICE(&s->e_cpus), "num-harts", 1);
     qdev_prop_set_uint32(DEVICE(&s->e_cpus), "hartid-base", 0);
     qdev_prop_set_string(DEVICE(&s->e_cpus), "cpu-type", SIFIVE_E_CPU);
@@ -504,10 +503,9 @@ static void riscv_sifive_u_soc_init(Object *obj)
                             &error_abort, NULL);
     qdev_prop_set_uint32(DEVICE(&s->u_cluster), "cluster-id", 1);
 
-    object_initialize_child(OBJECT(&s->u_cluster), "u-cpus",
-                            &s->u_cpus, sizeof(s->u_cpus),
-                            TYPE_RISCV_HART_ARRAY, &error_abort,
-                            NULL);
+    sysbus_init_child_obj(OBJECT(&s->u_cluster), "u-cpus",
+                          &s->u_cpus, sizeof(s->u_cpus),
+                          TYPE_RISCV_HART_ARRAY);
     qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus - 1);
     qdev_prop_set_uint32(DEVICE(&s->u_cpus), "hartid-base", 1);
     qdev_prop_set_string(DEVICE(&s->u_cpus), "cpu-type", SIFIVE_U_CPU);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index d0c4843712..01d52e758e 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -169,8 +169,8 @@ static void spike_board_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
 
     /* Initialize SOC */
-    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
-                            TYPE_RISCV_HART_ARRAY, &error_abort, NULL);
+    sysbus_init_child_obj(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
+                          TYPE_RISCV_HART_ARRAY);
     object_property_set_str(OBJECT(&s->soc), machine->cpu_type, "cpu-type",
                             &error_abort);
     object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
@@ -275,8 +275,8 @@ static void spike_v1_10_0_board_init(MachineState *machine)
     }
 
     /* Initialize SOC */
-    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
-                            TYPE_RISCV_HART_ARRAY, &error_abort, NULL);
+    sysbus_init_child_obj(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
+                          TYPE_RISCV_HART_ARRAY);
     object_property_set_str(OBJECT(&s->soc), SPIKE_V1_10_0_CPU, "cpu-type",
                             &error_abort);
     object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
@@ -365,8 +365,8 @@ static void spike_v1_09_1_board_init(MachineState *machine)
     }
 
     /* Initialize SOC */
-    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
-                            TYPE_RISCV_HART_ARRAY, &error_abort, NULL);
+    sysbus_init_child_obj(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
+                          TYPE_RISCV_HART_ARRAY);
     object_property_set_str(OBJECT(&s->soc), SPIKE_V1_09_1_CPU, "cpu-type",
                             &error_abort);
     object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 7ce28895bc..0c5bcdc37f 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -485,8 +485,8 @@ static void riscv_virt_board_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
 
     /* Initialize SOC */
-    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
-                            TYPE_RISCV_HART_ARRAY, &error_abort, NULL);
+    sysbus_init_child_obj(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
+                          TYPE_RISCV_HART_ARRAY);
     object_property_set_str(OBJECT(&s->soc), machine->cpu_type, "cpu-type",
                             &error_abort);
     object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
-- 
2.21.3


