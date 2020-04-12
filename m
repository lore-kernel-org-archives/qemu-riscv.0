Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlEg-0008Ty-HT
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48562)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEe-0008O8-5H
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:37:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEc-0003Gv-TZ
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:37:52 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39450)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEV-0003Ag-3y; Sun, 12 Apr 2020 18:37:43 -0400
Received: by mail-wr1-x444.google.com with SMTP id p10so8518564wrt.6;
 Sun, 12 Apr 2020 15:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p12zY90y1Bd/6q5GYHr9+QcqvAZOBpOvraHjQFK6FGo=;
 b=dQbz9LWP4CUHYwL9IsAzCeLPJ2Jnbwt3fEzV4t7GEE9SZjZ5dQ0dloPLYFDP81kDqO
 TPhuf/RRZL/VpaFz86QS5UAVBZVaThqxYy3jbnIeJ915sjz79HVXmwMlSIRLUMafZd82
 clRYp2SAQj2cEMSaHIwS/RVdMqHAkWYVRGA2L5TIHWsTVBzmHDJhgl6hFJowOW0sZxo/
 um7AcAEQ67ZUasBnJRxmnua9ZoEJ2H0MxfuA8G8yJgxSSkdekNA8A9Lo45bT7Cb0BNU0
 oOejyPdVtCRDaPolK3dqj1UzwqY7rTvU/uJfc5RlK5Pwby/Q/6QOhtVNHOtZKatObS9e
 8gmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p12zY90y1Bd/6q5GYHr9+QcqvAZOBpOvraHjQFK6FGo=;
 b=QoVdnERrIGoeMM2uG8hp7ZZAKfCDAFQjybkC/oaQMjNmtSsHmY6KJuup8TmwFqBwQP
 J/kFEcIIUazCN4DnVZfpNioHPBI0tmEmh38tnUlC4yAKPV/Qi2Jp+yl8v1CqQl/J8mWY
 mWk2euxZ9I+/w/wFsFreyEx4867uHdICE6nAeYYtwPeDgaB6GPrqvFkMaSNEEfgQdCYD
 9OsquUEJPGeraf1csV057L1ex/3tIwscwMd0fs9P257Clf7B6GP994NXGUB+Q/ddojSF
 /VBl9tWZYVY9c2q6y39e1BXh2tXc9WSZt69K7Y9lkgi84x1ltDyFM3r8xaHLBfwLzz5L
 r66Q==
X-Gm-Message-State: AGi0PuakwNbOhHMh8y3ro7oo45CIclZMF3tBQq7YiP+2IjhySHlINYuE
 4t0aYz+VY8vMKdO9sljoHtzoLVtTT9kxog==
X-Google-Smtp-Source: APiQypIdtklaWgF7eJbTP4PpyDPoa6GPetn8GiVPl4PwWG1TGQaRAKzqYHcgcV/+VC20LcQMgEGTsg==
X-Received: by 2002:a5d:45cf:: with SMTP id b15mr15479621wrs.274.1586731061947; 
 Sun, 12 Apr 2020 15:37:41 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id d13sm12563559wrv.34.2020.04.12.15.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:37:41 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-ppc@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Markus Armbruster <armbru@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Xie Changlong <xiechanglong.d@gmail.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>, Peter Chubb <peter.chubb@nicta.com.au>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-riscv@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH-for-5.1 v3 23/24] hw/riscv/sifive_u: Move some code from
 realize() to init()
Date: Mon, 13 Apr 2020 00:36:18 +0200
Message-Id: <20200412223619.11284-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412223619.11284-1-f4bug@amsat.org>
References: <20200412223619.11284-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
X-List-Received-Date: Sun, 12 Apr 2020 22:37:53 -0000

Coccinelle reported:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/riscv/sifive_u.c
  >>> possible moves from riscv_sifive_u_soc_init() to riscv_sifive_u_soc_realize() in ./hw/riscv/sifive_u.c:473

Move the calls using &error_abort which don't depend on input
updated before realize() to init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Typo 'depend of' -> 'depend on' (eblake)
---
 hw/riscv/sifive_u.c | 42 ++++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 96177c1977..7bf1f30a35 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -406,6 +406,8 @@ static void riscv_sifive_u_init(MachineState *machine)
 static void riscv_sifive_u_soc_init(Object *obj)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
+    const struct MemmapEntry *memmap = sifive_u_memmap;
+    MemoryRegion *system_memory = get_system_memory();
     SiFiveUSoCState *s = RISCV_U_SOC(obj);
 
     object_initialize_child(obj, "e-cluster", &s->e_cluster,
@@ -443,6 +445,26 @@ static void riscv_sifive_u_soc_init(Object *obj)
                           TYPE_CADENCE_GEM);
     object_property_set_int(OBJECT(&s->gem), GEM_REVISION, "revision",
                             &error_abort);
+
+    /* boot rom */
+    memory_region_init_rom(&s->mask_rom, obj, "riscv.sifive.u.mrom",
+                           memmap[SIFIVE_U_MROM].size, &error_fatal);
+    memory_region_add_subregion(system_memory, memmap[SIFIVE_U_MROM].base,
+                                &s->mask_rom);
+
+    /*
+     * Add L2-LIM at reset size.
+     * This should be reduced in size as the L2 Cache Controller WayEnable
+     * register is incremented. Unfortunately I don't see a nice (or any) way
+     * to handle reducing or blocking out the L2 LIM while still allowing it
+     * be re returned to all enabled after a reset. For the time being, just
+     * leave it enabled all the time. This won't break anything, but will be
+     * too generous to misbehaving guests.
+     */
+    memory_region_init_ram(&s->l2lim_mem, NULL, "riscv.sifive.u.l2lim",
+                           memmap[SIFIVE_U_L2LIM].size, &error_fatal);
+    memory_region_add_subregion(system_memory, memmap[SIFIVE_U_L2LIM].base,
+                                &s->l2lim_mem);
 }
 
 static bool sifive_u_get_start_in_flash(Object *obj, Error **errp)
@@ -500,26 +522,6 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
     object_property_set_bool(OBJECT(&s->u_cluster), true, "realized",
                              &error_abort);
 
-    /* boot rom */
-    memory_region_init_rom(&s->mask_rom, OBJECT(dev), "riscv.sifive.u.mrom",
-                           memmap[SIFIVE_U_MROM].size, &error_fatal);
-    memory_region_add_subregion(system_memory, memmap[SIFIVE_U_MROM].base,
-                                &s->mask_rom);
-
-    /*
-     * Add L2-LIM at reset size.
-     * This should be reduced in size as the L2 Cache Controller WayEnable
-     * register is incremented. Unfortunately I don't see a nice (or any) way
-     * to handle reducing or blocking out the L2 LIM while still allowing it
-     * be re returned to all enabled after a reset. For the time being, just
-     * leave it enabled all the time. This won't break anything, but will be
-     * too generous to misbehaving guests.
-     */
-    memory_region_init_ram(&s->l2lim_mem, NULL, "riscv.sifive.u.l2lim",
-                           memmap[SIFIVE_U_L2LIM].size, &error_fatal);
-    memory_region_add_subregion(system_memory, memmap[SIFIVE_U_L2LIM].base,
-                                &s->l2lim_mem);
-
     /* create PLIC hart topology configuration string */
     plic_hart_config_len = (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1) *
                            ms->smp.cpus;
-- 
2.21.1


