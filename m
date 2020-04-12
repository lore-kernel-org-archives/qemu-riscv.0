Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jNlET-0007sC-QC
	for mharc-qemu-riscv@gnu.org; Sun, 12 Apr 2020 18:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48333)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEQ-0007l1-KN
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:37:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEP-00037l-GF
 for qemu-riscv@nongnu.org; Sun, 12 Apr 2020 18:37:38 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:46748)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlEI-00032n-EP; Sun, 12 Apr 2020 18:37:30 -0400
Received: by mail-wr1-x444.google.com with SMTP id f13so8492739wrm.13;
 Sun, 12 Apr 2020 15:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BasB+g8nzHU9NqlorXFhvA0RjIUcriXJQANOu1FTC+I=;
 b=JvMtQoy5jGVm+8GTmlMuiC1ueHzc7rwT5p0KjyN+hsDtCP4Cn/JcNRjyihyWdj1Xss
 dtTI7Fv3AEEkUCxM+MBsr8py6lEmOfl88MiFeO/9zQb/EyYfaYfoCy6GWOS1uPW4/k7Y
 ytJwyS6D3FPLDQoAuwh+9v1qQjJEv+RlWs6ZB3SigBk8RzVjtqOYmZzrGu/5PW1uyLWB
 8oEd5a2rHSAe48/FO0M0iiZchZXc20+ui+IDOBXDnkBiARaT4gt5hXqcgdCwCBac3SVL
 JZ2STQPPOH3UJiG8R3nbAuw90HN5yYwEBUy9ARd1rv71Sg3xu0pVpJzxlcPyhOGL9pmp
 91Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BasB+g8nzHU9NqlorXFhvA0RjIUcriXJQANOu1FTC+I=;
 b=YyzVNNnS+e9uLAiKw9pXEB9e+K0RjnW8ZbKsiLNJ9TiBvUrC+IwGx9vheAyngQTJgX
 MOZpM5oWD5m+rbEy0xLPK5i1dKdfzsLh7m03lxe7oo49uFHNqzBcnS+YvhdFX/VgyBB3
 5BRf1g1Q1vhiLl0B2sAF5pFruIdEmUbtLts7L4BYy0GonX0P4aLq+s2Ki1aMxdGeyWsL
 h6ukY8phJDqgKjttlMcQIM6i9JKSDzii2Sb1bl+5PX6OwVow5XJIW7c981M3yL1vm2mz
 gD/OnC1hP8iFlKGBtXKogprputafQzcULwsvydFaQG1HcCDkkJn5KEwLRXEMt+suOIpX
 ucCA==
X-Gm-Message-State: AGi0Puaa7CY8uWUPXwxBqTxkGQ6CloHONXt2urQYs2aD539viAg2UPtf
 /0Mg94zWmzCr9AiZy90nfOp4yg/RhcuDmg==
X-Google-Smtp-Source: APiQypLA5twQlR1QLyc7VGDBinqgnLuFOZKnSZQ7eellH4Zuc9qupRB7hrNAyIMdmkRXKazdyeiW8A==
X-Received: by 2002:a5d:4b49:: with SMTP id w9mr15981211wrs.359.1586731049029; 
 Sun, 12 Apr 2020 15:37:29 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id d13sm12563559wrv.34.2020.04.12.15.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:37:28 -0700 (PDT)
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
Subject: [PATCH-for-5.1 v3 19/24] hw/riscv/sifive_e: Move some code from
 realize() to init()
Date: Mon, 13 Apr 2020 00:36:14 +0200
Message-Id: <20200412223619.11284-20-f4bug@amsat.org>
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
X-List-Received-Date: Sun, 12 Apr 2020 22:37:40 -0000

Coccinelle reported:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/riscv/sifive_e.c
  >>> possible moves from riscv_sifive_e_soc_init() to riscv_sifive_e_soc_realize() in ./hw/riscv/sifive_e.c:135

Move the calls using &error_fatal which don't depend on input
updated before realize() to init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Typo 'depend of' -> 'depend on' (eblake)
---
 hw/riscv/sifive_e.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 646553a7c3..0be8b52147 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -118,7 +118,9 @@ static void riscv_sifive_e_init(MachineState *machine)
 static void riscv_sifive_e_soc_init(Object *obj)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
+    const struct MemmapEntry *memmap = sifive_e_memmap;
     SiFiveESoCState *s = RISCV_E_SOC(obj);
+    MemoryRegion *sys_mem = get_system_memory();
 
     object_initialize_child(obj, "cpus", &s->cpus,
                             sizeof(s->cpus), TYPE_RISCV_HART_ARRAY,
@@ -130,6 +132,18 @@ static void riscv_sifive_e_soc_init(Object *obj)
     sysbus_init_child_obj(obj, "riscv.sifive.e.gpio0",
                           &s->gpio, sizeof(s->gpio),
                           TYPE_SIFIVE_GPIO);
+
+    /* Mask ROM */
+    memory_region_init_rom(&s->mask_rom, obj, "riscv.sifive.e.mrom",
+                           memmap[SIFIVE_E_MROM].size, &error_fatal);
+    memory_region_add_subregion(sys_mem,
+        memmap[SIFIVE_E_MROM].base, &s->mask_rom);
+
+    /* Flash memory */
+    memory_region_init_rom(&s->xip_mem, obj, "riscv.sifive.e.xip",
+                           memmap[SIFIVE_E_XIP].size, &error_fatal);
+    memory_region_add_subregion(sys_mem, memmap[SIFIVE_E_XIP].base,
+        &s->xip_mem);
 }
 
 static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
@@ -144,12 +158,6 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
     object_property_set_bool(OBJECT(&s->cpus), true, "realized",
                             &error_abort);
 
-    /* Mask ROM */
-    memory_region_init_rom(&s->mask_rom, OBJECT(dev), "riscv.sifive.e.mrom",
-                           memmap[SIFIVE_E_MROM].size, &error_fatal);
-    memory_region_add_subregion(sys_mem,
-        memmap[SIFIVE_E_MROM].base, &s->mask_rom);
-
     /* MMIO */
     s->plic = sifive_plic_create(memmap[SIFIVE_E_PLIC].base,
         (char *)SIFIVE_E_PLIC_HART_CONFIG,
@@ -206,12 +214,6 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
         memmap[SIFIVE_E_QSPI2].base, memmap[SIFIVE_E_QSPI2].size);
     create_unimplemented_device("riscv.sifive.e.pwm2",
         memmap[SIFIVE_E_PWM2].base, memmap[SIFIVE_E_PWM2].size);
-
-    /* Flash memory */
-    memory_region_init_rom(&s->xip_mem, OBJECT(dev), "riscv.sifive.e.xip",
-                           memmap[SIFIVE_E_XIP].size, &error_fatal);
-    memory_region_add_subregion(sys_mem, memmap[SIFIVE_E_XIP].base,
-        &s->xip_mem);
 }
 
 static void riscv_sifive_e_machine_init(MachineClass *mc)
-- 
2.21.1


