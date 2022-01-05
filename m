Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5EEM-0000UU-DE
	for mharc-qemu-riscv@gnu.org; Wed, 05 Jan 2022 16:54:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5EEF-0000Qd-DT
 for qemu-riscv@nongnu.org; Wed, 05 Jan 2022 16:53:55 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:17254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5EED-0000wm-Hf
 for qemu-riscv@nongnu.org; Wed, 05 Jan 2022 16:53:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641419628; x=1672955628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OKeVXM7n1kl3vOCkJ/REqODiO5Ms05QqhnoF2DV6gIY=;
 b=hoUl2/3EdUqIb9vzn+7gal5EsNN5sIaadZt2655OKQzigJLwt+Ip0YLO
 +DgjkjRtuzUrm+lU93RTq+5GH/Gij/H4MOYtI44xY4ow6+onqUAeG2MPb
 ikFphsxFW6qQGDIqJUUpZkesarzJOyvCXVemuSk0aJZXLb3SQG9BTFeeq
 Inv9CQjVN58yAPODeseog01trbTtMAEV8NQk5KS2HuuVm0dZjLfVGqbNQ
 ZvZc86BPWfxZU3YspXUT9Hibg3ODNMetgoOnscW3xne375ydMHh+Ih/KG
 uHxfPWqp3CrjytvvVdwttbPpdIZ96/q7nw/PIfrn71rd3+KQ//eV0yqux g==;
X-IronPort-AV: E=Sophos;i="5.88,265,1635177600"; d="scan'208";a="194583073"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2022 05:40:12 +0800
IronPort-SDR: R/3DVFNUwLlgszTApKzXof3RYAb3xuxcgqzJpY2ZjA6uGY9J9aByRp5PK0j+9MGFDSSFh8aZRV
 MJThdenEwi7X+SBMuCtpE9xJfiDxVE1ZpunGefxGVwt4JemTcVKdBo5m1VGTw0GBdmEL/UBpIV
 /6YW96EYxmz5kcvgD7Mua4HpHIm1NXOIEL3f106AHOY0r84l3FECQq3HOZ9U6TTFGz5lfkzDCe
 9WjVPxU+lL3Y0V7VJEelcMXpMzFuAk3cpuYQCelaEBsEwmeCdeoNhtXYnhkOiD0BKV0bwXnUWu
 3PUIlYbLs3ENHlTuxevW30KS
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:14:04 -0800
IronPort-SDR: 8z5vaCoOMLu2Vki8tl3mlxTjo5+exau0R2GmyHVTrVxTjN0yEG1pKW/XODzAkA4hgnc3sVFjfu
 BzWZJSFAYlniSrpTfoFgmwwXkDpCn3Yf4tnioo0jzo0DUw2vgorIZA2O0eIBNKc2wiJNuFORg1
 ajb8xTs4DYypS7pYNPgAW9Oio2LGmFC48JaimFfEvMtlfcWF+uDNnWnYaj+MRZzs/Bv8Fxhzxg
 /nhRnDv0m9k7VS5kyNcPXZC7jBgQReZpqsmsvazgALmYXCzXRLhRATkDZo0vR4p5w1mAIS5JRf
 kEE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:40:13 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JTjZN4Rf3z1VSkj
 for <qemu-riscv@nongnu.org>; Wed,  5 Jan 2022 13:40:12 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641418811; x=1644010812; bh=OKeVXM7n1kl3vOCkJ/
 REqODiO5Ms05QqhnoF2DV6gIY=; b=WDsOAO5cz9wy8rliLV+z/nsJ9UojGhinHx
 MRqCqdz6hYhOEJYXvb6MlQCHOtDYmtKrjYL5WMkvpXmKWLBpr6AbNf0LDpnu8ZO9
 eJj8qQYGb58Kp6ep19+l8eX9jNQpchDLlxZSnwzilKerXjuM7llc4d+JZZRLlL6w
 D/OmIAr/GGHk2BT4/rmg/NB9MSS8vYHLgWOr8W68TCElZX6LT1B18Mds/qeKUoDi
 Bo0m7ogqE60J0rqdxK+FcWKDuyfM36s6IT39wn09rImoK0E+ljOb0xHKdZdTgBtf
 8g/xMvpvBJnql6OGkuSEYY/1WMsOOz5e9/Jad1dPMEvA4xAOvAsQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id nPlvGIrup0mH for <qemu-riscv@nongnu.org>;
 Wed,  5 Jan 2022 13:40:11 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.73])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JTjZH3jrgz1VSkV;
 Wed,  5 Jan 2022 13:40:07 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
 alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v4 4/8] hw/intc: sifive_plic: Cleanup remaining functions
Date: Thu,  6 Jan 2022 07:39:33 +1000
Message-Id: <20220105213937.1113508-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
References: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=9978dc08b=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 05 Jan 2022 21:53:55 -0000

From: Alistair Francis <alistair.francis@wdc.com>

We can remove the original sifive_plic_irqs_pending() function and
instead just use the sifive_plic_claim() function (renamed to
sifive_plic_claimed()) to determine if any interrupts are pending.

This requires move the side effects outside of sifive_plic_claimed(),
but as they are only invoked once that isn't a problem.

We have also removed all of the old #ifdef debugging logs, so let's
cleanup the last remaining debug function while we are here.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/intc/sifive_plic.c | 109 +++++++++---------------------------------
 1 file changed, 22 insertions(+), 87 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 44d24b3c59..746c0f0343 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -31,8 +31,6 @@
 #include "migration/vmstate.h"
 #include "hw/irq.h"
=20
-#define RISCV_DEBUG_PLIC 0
-
 static bool addr_between(uint32_t addr, uint32_t base, uint32_t num)
 {
     return addr >=3D base && addr - base < num;
@@ -51,47 +49,6 @@ static PLICMode char_to_mode(char c)
     }
 }
=20
-static char mode_to_char(PLICMode m)
-{
-    switch (m) {
-    case PLICMode_U: return 'U';
-    case PLICMode_S: return 'S';
-    case PLICMode_H: return 'H';
-    case PLICMode_M: return 'M';
-    default: return '?';
-    }
-}
-
-static void sifive_plic_print_state(SiFivePLICState *plic)
-{
-    int i;
-    int addrid;
-
-    /* pending */
-    qemu_log("pending       : ");
-    for (i =3D plic->bitfield_words - 1; i >=3D 0; i--) {
-        qemu_log("%08x", plic->pending[i]);
-    }
-    qemu_log("\n");
-
-    /* pending */
-    qemu_log("claimed       : ");
-    for (i =3D plic->bitfield_words - 1; i >=3D 0; i--) {
-        qemu_log("%08x", plic->claimed[i]);
-    }
-    qemu_log("\n");
-
-    for (addrid =3D 0; addrid < plic->num_addrs; addrid++) {
-        qemu_log("hart%d-%c enable: ",
-            plic->addr_config[addrid].hartid,
-            mode_to_char(plic->addr_config[addrid].mode));
-        for (i =3D plic->bitfield_words - 1; i >=3D 0; i--) {
-            qemu_log("%08x", plic->enable[addrid * plic->bitfield_words =
+ i]);
-        }
-        qemu_log("\n");
-    }
-}
-
 static uint32_t atomic_set_masked(uint32_t *a, uint32_t mask, uint32_t v=
alue)
 {
     uint32_t old, new, cmp =3D qatomic_read(a);
@@ -115,26 +72,34 @@ static void sifive_plic_set_claimed(SiFivePLICState =
*plic, int irq, bool level)
     atomic_set_masked(&plic->claimed[irq >> 5], 1 << (irq & 31), -!!leve=
l);
 }
=20
-static int sifive_plic_irqs_pending(SiFivePLICState *plic, uint32_t addr=
id)
+static uint32_t sifive_plic_claimed(SiFivePLICState *plic, uint32_t addr=
id)
 {
+    uint32_t max_irq =3D 0;
+    uint32_t max_prio =3D plic->target_priority[addrid];
     int i, j;
+
     for (i =3D 0; i < plic->bitfield_words; i++) {
         uint32_t pending_enabled_not_claimed =3D
-            (plic->pending[i] & ~plic->claimed[i]) &
-            plic->enable[addrid * plic->bitfield_words + i];
+                        (plic->pending[i] & ~plic->claimed[i]) &
+                            plic->enable[addrid * plic->bitfield_words +=
 i];
+
         if (!pending_enabled_not_claimed) {
             continue;
         }
+
         for (j =3D 0; j < 32; j++) {
             int irq =3D (i << 5) + j;
             uint32_t prio =3D plic->source_priority[irq];
             int enabled =3D pending_enabled_not_claimed & (1 << j);
-            if (enabled && prio > plic->target_priority[addrid]) {
-                return 1;
+
+            if (enabled && prio > max_prio) {
+                max_irq =3D irq;
+                max_prio =3D prio;
             }
         }
     }
-    return 0;
+
+    return max_irq;
 }
=20
 static void sifive_plic_update(SiFivePLICState *plic)
@@ -145,7 +110,7 @@ static void sifive_plic_update(SiFivePLICState *plic)
     for (addrid =3D 0; addrid < plic->num_addrs; addrid++) {
         uint32_t hartid =3D plic->addr_config[addrid].hartid;
         PLICMode mode =3D plic->addr_config[addrid].mode;
-        int level =3D sifive_plic_irqs_pending(plic, addrid);
+        bool level =3D !!sifive_plic_claimed(plic, addrid);
=20
         switch (mode) {
         case PLICMode_M:
@@ -158,41 +123,6 @@ static void sifive_plic_update(SiFivePLICState *plic=
)
             break;
         }
     }
-
-    if (RISCV_DEBUG_PLIC) {
-        sifive_plic_print_state(plic);
-    }
-}
-
-static uint32_t sifive_plic_claim(SiFivePLICState *plic, uint32_t addrid=
)
-{
-    int i, j;
-    uint32_t max_irq =3D 0;
-    uint32_t max_prio =3D plic->target_priority[addrid];
-
-    for (i =3D 0; i < plic->bitfield_words; i++) {
-        uint32_t pending_enabled_not_claimed =3D
-            (plic->pending[i] & ~plic->claimed[i]) &
-            plic->enable[addrid * plic->bitfield_words + i];
-        if (!pending_enabled_not_claimed) {
-            continue;
-        }
-        for (j =3D 0; j < 32; j++) {
-            int irq =3D (i << 5) + j;
-            uint32_t prio =3D plic->source_priority[irq];
-            int enabled =3D pending_enabled_not_claimed & (1 << j);
-            if (enabled && prio > max_prio) {
-                max_irq =3D irq;
-                max_prio =3D prio;
-            }
-        }
-    }
-
-    if (max_irq) {
-        sifive_plic_set_pending(plic, max_irq, false);
-        sifive_plic_set_claimed(plic, max_irq, true);
-    }
-    return max_irq;
 }
=20
 static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned siz=
e)
@@ -223,10 +153,15 @@ static uint64_t sifive_plic_read(void *opaque, hwad=
dr addr, unsigned size)
         if (contextid =3D=3D 0) {
             return plic->target_priority[addrid];
         } else if (contextid =3D=3D 4) {
-            uint32_t value =3D sifive_plic_claim(plic, addrid);
+            uint32_t max_irq =3D sifive_plic_claimed(plic, addrid);
+
+            if (max_irq) {
+                sifive_plic_set_pending(plic, max_irq, false);
+                sifive_plic_set_claimed(plic, max_irq, true);
+            }
=20
             sifive_plic_update(plic);
-            return value;
+            return max_irq;
         }
     }
=20
--=20
2.31.1


