Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxinM-0002uZ-97
	for mharc-qemu-riscv@gnu.org; Wed, 15 Dec 2021 23:55:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinK-0002p4-8H
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 23:55:06 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:18147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinI-0003rR-1z
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 23:55:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639630504; x=1671166504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CJtqDU6sPemWcmNX1wfyiQbcFiKIABpaeUjMPTCGpig=;
 b=EJ6jFPryoyb57XcRL5AlDQU0wXLqP3dgr/dp7UXOELc+Pv3vUQiaPRuf
 LiCFMUZ2FNRbO2KF5eqzffEWspLRfJiYeL1wW5ShEh/2QEWXxBDO1RCiI
 XAzWE7FYL1/BdyxVz/4ZdLpUwIKPcF0u9SCyOAz58nbm273SYvVUmGdhL
 G72MCzNaa20T4YC86E/Ee5Vk+0xE/lPJmwXHBSGLShBwD4sQyK/2d0Ir7
 1pbAG8ObE24YNvFSsUrN5XCHAk4yqgw8I6h1V48gei3P/oKiKZ6UXfpuT
 lvH90GWNW0nNucJgTz/x1wtvSlg+OdTXnlPXcBu/AYkk39GjXfcqk4Zse w==;
X-IronPort-AV: E=Sophos;i="5.88,210,1635177600"; d="scan'208";a="187354571"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2021 12:55:00 +0800
IronPort-SDR: Qqelh8ocGyCimLZPE5x1JDavHjwQ+A6fZ2iF6sOv0uAYjg4l93oY+lWts0sv09zDlK6ufjcGih
 a0fGutk7DwhRr+2xHRi34aUp+84UiQ2WY5lSTRMriUVcvVfoWYkY9/HWZ01HeugCAf40WvlXSI
 fhqPfbXxJ/Cxm31V470rreNPirstsN7rsV0VS3psgvdesm933cqbIUi0cD0mBkZ2KYNJ06vlf+
 v7SkeZ/4xySuCeqoFod1pako5iVFIy0gE+VL0mlH37HX2hSDyaqqaUhOjJce5V16UFndCHypux
 pC/M4yBl0cdsRboLfjuhexkB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:27:55 -0800
IronPort-SDR: J2fJ28vlfpN34Dty0C9cSeG4fDUEXoZqAcCueQ2xkpQC50ay/Hw40qmSmt8QdDjpUbRizfGy4o
 oDTLrFe6uHXyUgXAvgKgRiYQLUdOGH7mosRdIt9N0Fupf28HFkrlWTIsFWbPlAWab4tSE+xk7S
 FmrHWZXmYef1olXohqu/ugLad7mvy3vhhHK36I+GvO5FmcjgcCrwioQuSW1qBiwTFp10C5jPPn
 Iuy7mQWnyoHqMm/SCesAeOyGmY91ruRp38uc68X921+wcMXMSWY+aPUUnYkuYZxoB+Kct0ESJK
 IQw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:55:02 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JF0Cm3s76z1Rwnx
 for <qemu-riscv@nongnu.org>; Wed, 15 Dec 2021 20:55:00 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639630499; x=1642222500; bh=CJtqDU6sPemWcmNX1w
 fyiQbcFiKIABpaeUjMPTCGpig=; b=pz8tFgGBuNfAeHXB/riSMcbUOj9qGaG3Gp
 S2fLvxcyvDkYPyPKQOYP15FAfy/dbLZ/5P/DJRFVm/QwtzWsLyBWy6BJ3hFYLHV1
 yHo4wEjMDw+70Y9q3orqTfn1OkcWn6IyMcZKXKwOq2FOr0vb//wVVs6Ce8dah6rs
 SJuDl0xdYxzFMw7rFMGhvJyG3sO4TNz2uqewb494roM3Uhtf/mcF02AagVSfJMFw
 nOfA+T3DxNzq2l5jMDqYP6vi4gv58/8Q6AnFV32wY8sDfBPG7HhmYDWpPcd1VrfX
 O3Ue27ci6PdQzugP+nLqa2HnBbcWd5PxKbm1H+dZcpwoSr2ze2IQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id kQDX3C2Vz64p for <qemu-riscv@nongnu.org>;
 Wed, 15 Dec 2021 20:54:59 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.66])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JF0Cg13Dxz1RtVG;
 Wed, 15 Dec 2021 20:54:54 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v2 4/9] hw/intc: sifive_plic: Cleanup remaining functions
Date: Thu, 16 Dec 2021 14:54:22 +1000
Message-Id: <20211216045427.757779-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=977d27bfe=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Thu, 16 Dec 2021 04:55:06 -0000

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


