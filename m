Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcIaL-00068J-Oq
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 22:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIaD-0005zj-R5
 for qemu-riscv@nongnu.org; Sun, 17 Oct 2021 22:41:02 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:27490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIaC-0007lo-1w
 for qemu-riscv@nongnu.org; Sun, 17 Oct 2021 22:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634524859; x=1666060859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IF95yCjcmo5ithRIKZNKlYhdANKqLsOj4GLv3lakdIg=;
 b=EF+psmD/+m57tCc3PPx09zKsENaHsokuovz9y+IbFohp64RBTqg8s3JU
 e43aYXWPDqNB8g7mQOLUwuA2ciPmHLLZq6AXzJ0nLlQ+WmNyvrVb44mr4
 RVqnpzndzNICqOTHC/YZq4uN7gyca7GsUaH0KwRkLS8oxwEJzOv7+lCnG
 sF2cd+ztlAr3faZpr8qSHNfKhFs/s1JSgniIwmZpg2n2mnnBEr5pM3Vu8
 efTNleGPB+ywgQd2lTBnGaYqi6rV9HauBc0c+hBn0P2EemkmNfiElelzR
 ldFlueDrGGZnVF6qtTKMGeO52gmePWt/4Ay8T9u3UBImU5vL+mnyajv9L w==;
X-IronPort-AV: E=Sophos;i="5.85,381,1624291200"; d="scan'208";a="187913868"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2021 10:40:55 +0800
IronPort-SDR: y3CSR1TuVE2CQK6fsUo31YGrIciiY+EfMv4jooQVL1X+yZ6+pGpt8GmzAGCwi5SfQ/XExmVyCR
 QUd0SQmvy2CQreeXLBrQOzSSBh9anik9S2/ruwHvbgJ4C+jxWzex0frxfxuEmzfIY2ueRtHPUl
 MxeRWxJMcNbf1N0xVFg9qt+n3dkC2rmpKChBzJxhg0XEWsQ8Pay+sKJ36P5uTnBy+mOvfBSFLH
 82f5xaiY3jDI1I1ajH44L464RDk/nWpqW1ubL3O0tTBlOM1HvcQOVzUgtJ6XFVL6dU6KJLrYp/
 abXDJGgo3973849g4KUONabc
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:15:03 -0700
IronPort-SDR: xKVnf/AGd/IXzNQJzY9yVvr66xe/mCt4KvcyoQWSPNp8JwJBUStaSKPeLmhmranhQyhAU+igzK
 RwzUB3xFOF0rb6m3kS70wD1R91Uh9UnUFGVo3jZICQeqc3ryhpr9z781Xg8ycA4XXEwbH3Hi5j
 W5Ac55PNniUFRWLN9E+tYs8NErqCCK6tk25XOyoibYGh/8OLaZ8Itr1T02KbgX+kvY82CeAeN3
 9wuIPaz7F2jAMygSDS+Ikb5RiHBKQ+vV2Hole6ftH4aay0f+MsZxPhmJVG2F5dKK9VdntDdPfO
 yVA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:40:56 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HXh2H3sklz1Rvm1
 for <qemu-riscv@nongnu.org>; Sun, 17 Oct 2021 19:40:55 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634524854; x=1637116855; bh=IF95yCjcmo5ithRIKZ
 NKlYhdANKqLsOj4GLv3lakdIg=; b=Jd/fsWIgIl/b8jmMWJPKed9c7djYfK7xin
 AATg2rIwG/LogByoGgBMaJIpDIKZkpyWN7TlAOxC3MzONfvBHlJaf6PohKYQ+ipg
 5BoBZnEFlIXMuyCli+neBOX9wEvDGSJG7zYd2m2Vn9I9Ag//fHLeCwmsiSoJqxYT
 wBCKJspWUUefooSn+u9NnlCyYvS+oNuPD3WSQA2C6/glqoMkpkW8RPIVFwh9rAnx
 9XnrR6xr9IDjxb1kHsS4sGeYaUE1R7M3tgP+VXulkDy0NUCvk1cAWiJtbH1dAzHa
 Ja6wc8XZ8218/OFmfoaD29Gcd+KutqqQ2gNnfoXjklxVgbVTq/Qw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 8PlruTXzoFGj for <qemu-riscv@nongnu.org>;
 Sun, 17 Oct 2021 19:40:54 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HXh296gmCz1RvTm;
 Sun, 17 Oct 2021 19:40:49 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 9/9] hw/intc: sifive_plic: Cleanup remaining functions
Date: Mon, 18 Oct 2021 12:40:42 +1000
Message-Id: <e66367ce1b4ab64aab545916ad6818dac7b1f8ec.1634524691.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=918244500=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 18 Oct 2021 02:41:02 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 109 +++++++++---------------------------------
 1 file changed, 22 insertions(+), 87 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index d73503cea4..3f56223554 100644
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
     uint32_t end =3D base + num;
@@ -57,47 +55,6 @@ static PLICMode char_to_mode(char c)
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
@@ -121,26 +78,34 @@ static void sifive_plic_set_claimed(SiFivePLICState =
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
@@ -151,7 +116,7 @@ static void sifive_plic_update(SiFivePLICState *plic)
     for (addrid =3D 0; addrid < plic->num_addrs; addrid++) {
         uint32_t hartid =3D plic->addr_config[addrid].hartid;
         PLICMode mode =3D plic->addr_config[addrid].mode;
-        int level =3D sifive_plic_irqs_pending(plic, addrid);
+        bool level =3D !!sifive_plic_claimed(plic, addrid);
=20
         switch (mode) {
         case PLICMode_M:
@@ -164,41 +129,6 @@ static void sifive_plic_update(SiFivePLICState *plic=
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
@@ -229,10 +159,15 @@ static uint64_t sifive_plic_read(void *opaque, hwad=
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


