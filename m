Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1muqg8-0002Lw-J1
	for mharc-qemu-riscv@gnu.org; Wed, 08 Dec 2021 01:43:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=96943765b=alistair.francis@opensource.wdc.com>)
 id 1muqg5-0002Ip-59
 for qemu-riscv@nongnu.org; Wed, 08 Dec 2021 01:43:45 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=96943765b=alistair.francis@opensource.wdc.com>)
 id 1muqfw-0006Bc-RC
 for qemu-riscv@nongnu.org; Wed, 08 Dec 2021 01:43:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1638945815; x=1670481815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aCfA01cp4jNgHVFtBwXK+eDf0TJojAxCJS4r83LTGPU=;
 b=Nt9yoF+OzB6NI9CjVMrzCzB06fXAj4Zw2A9/QmYpTR/po5jkDOQurroB
 z43Lbm87XdnMfrPeriiSqu6UX+502aWTiw6ibEpvtZI7hOJ/fsxaeTrGI
 cp9r6ODcmy4SpmUtow8EKLWV9D+3M4qUE+6Q+od3bYodqSC5WDKR1xsuz
 qwo1aHZVS1xY6J8EWu3FJ8ID9E+iCmQvSbZuImXccZzXZrIWmQsu0k2Sn
 BmXCJ9CHwihWTUGroPGkHjKxAx9qILA2c5KRqUv+0Y4VTQ8rHo8rPa3Pl
 00VijOo1sAD3vn4zwvbCmdnPbJTA3JLI3BUSYCGb8evSdeYS0R5N3Ju0X A==;
X-IronPort-AV: E=Sophos;i="5.87,296,1631548800"; d="scan'208";a="192503610"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2021 14:43:34 +0800
IronPort-SDR: oDP84QRmnKjyBGjxJ3g1zKpSTUqe2iSvGX+Qpv0T6ceTuKpqKUYUdiz9aJuaJxIqT5B032Porn
 UN5y8oyNSR7Q6FvYnGTSujFLxE141GrcBO5ziP737Q/4yJMKC7GCalDz3wpfFbzqKF40HVYaso
 JsQq1BEiCwL1P8b+IS35MPCc+NKdaGFIubA/fvgF3NKNTIFTQjI1biWpQxIAhVB0Mg1n1i1zHO
 JREQOoLMExspUEYf64BhwOs4H6AQ+4l/iCmendfROiAnEw4YrZjJjzZu+vqjNtNXVbBFNxfxdE
 /Gq8U64tTPHhXl7UQDkpTj5J
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:16:39 -0800
IronPort-SDR: 6ZOiXleMs+hBv3b8M3UQ6TLdV5buzqGhC/4FoZZcQQD4wF2gyDOQX1Uzs0Nbq9IuAAR9zuE11U
 dKnzSEBzYvpigKZMbniaTqMXIuJqiBpXHJ7NBNGD3hMJtoWwNiXJ5mvFNtCtS6Rl5nCZZzt10j
 J4GUVSoYMQBPG0Xm7LiAqJQE3DP9LaLG08iCivrOQSxtZT4Oe+Yl6NO0sfOkoFHz0o+Qcn4CVv
 evIQ9okLRfNi8uCoDjr3kUnamwEv3ZJT6Os5CM4fkPk25g8FSfkNvzAb7qEYdzH4ZGiAG3g74R
 //w=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:43:36 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J870l23Nxz1RwFN
 for <qemu-riscv@nongnu.org>; Tue,  7 Dec 2021 22:43:35 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1638945814; x=1641537815; bh=aCfA01cp4jNgHVFtBw
 XK+eDf0TJojAxCJS4r83LTGPU=; b=OYjV2KH9evfFlp33UoHnvrfEVlEuz28pjL
 /ITWEe+lkRkIh8R7o8HyH2RtXNcZKEkPL19ye94QSImfOrcvlS6Z/CctM8bf8V+n
 8tu47vk9cmUjiAB+4d3PCHY0p7kjYJ4uLm88YqWYv2qh81sMhs5PS4mgDGQQLL9d
 bfld5CbwJ/z/yQ2Ka60nR+3l4WsHqRnD6LGIpTZt+iRuqu627zsT5AtSYiIicury
 qASjlYfBoVPErZXymcj4YypYEcc4WprCIZEauRp5GypFUqJQiFOWbTVptJC2Yvkn
 AyOVEc5RQJxTQ5kUaGbBSVRjMQJUShgZ0fL2y83+ETQ+b2syaDSg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 7K6NM3zV5hXB for <qemu-riscv@nongnu.org>;
 Tue,  7 Dec 2021 22:43:34 -0800 (PST)
Received: from localhost.localdomain (unknown [10.225.165.65])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J870d59gZz1RtVG;
 Tue,  7 Dec 2021 22:43:29 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH 4/7] hw/intc: sifive_plic: Cleanup remaining functions
Date: Wed,  8 Dec 2021 16:42:49 +1000
Message-Id: <20211208064252.375360-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
References: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=96943765b=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 08 Dec 2021 06:43:45 -0000

From: Alistair Francis <alistair.francis@wdc.com>

We can remove the original sifive_plic_irqs_pending() function and
instead just use the sifive_plic_claim() function (renamed to
sifive_plic_claimed()) to determine if any interrupts are pending.

This requires move the side effects outside of sifive_plic_claimed(),
but as they are only invoked once that isn't a problem.

We have also removed all of the old #ifdef debugging logs, so let's
cleanup the last remaining debug function while we are here.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 109 +++++++++---------------------------------
 1 file changed, 22 insertions(+), 87 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 7f9715a584..d9bf01b647 100644
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


