Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxinF-0002ay-JW
	for mharc-qemu-riscv@gnu.org; Wed, 15 Dec 2021 23:55:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinC-0002VD-Gc
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 23:54:58 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:6598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinA-0003pX-9v
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 23:54:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639630496; x=1671166496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P58rSH9FYVGMWJye9pB0DBdQcbydJZIVFxFrCQLsVdI=;
 b=LVf672aaFvQiIMzy0Lx+IwTHsjHhEG/c3M+aD05Y7XEwswuEKYXl7s9/
 cI8TWFcUOBI050A0EHo2vG5Fe9dCf43+kT1PmcfeH9lBB69sOV0GZjeu+
 CTuo5DZoDYH+oWvzwse/pUwXSgcb4GUxH8oGthMs5OHWGq8hl8DwG8bx4
 W0fCehfT6ozoTVPSqD6wV0xJU5u6yC0yJv+tkCZEomXF1Rz82Vc27Mh33
 LDuM0iuvjgKJLEwZaz9lvTlJHADfmwnNKouEJxLTx0y0AR+rkgWF0A92o
 uGneUjruuWcTjsW5lBvlffMXRDwbResKoWwc7LlX1f/belSD1C/l1dNxA A==;
X-IronPort-AV: E=Sophos;i="5.88,210,1635177600"; d="scan'208";a="300226943"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2021 12:54:49 +0800
IronPort-SDR: W2GySoqTMwjudR+74WY9LuFpYaV/KS1BWwlPBDLhag3fMCE65CMB5aUQEcC8THosZuXjrzvq7s
 U0pxPhGthuYgW/tpdwj6TWz9jBIPYymc5CvjBjHe6pKuocdERdF1s+BBdgpjUAhzhPwVEVgNKu
 NFYfDeu2vkUTc6BRS6v6jAsDJvKqDJkwZqLugFPALd7Z7Sy4fzoSAdIKZ658kSqOS9VtiW4Lrq
 onRrdvRcAdBucOHNAWu8B3LUaZEYNC3H2fG/P//tS5uXICkbwyGR4NLyBrUy/ZKgnp0DbrZfDC
 0b8aopR9IMOlgMyjh7lUYvuy
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:29:12 -0800
IronPort-SDR: RkHr9yJxugPu1IRtkn5SBd8qbWOpiGLnYKQLkRSUadvJVGXWzgpC6iRxFQEHis36m3qybPqUIW
 8K38nkkUUEjVGrthvaG3iEG51fm1M+m/fjEc+DcL0CgcCNcXpc7f+zROq5Q/EfLWbynIGj8p06
 265p80y0k65hwOMJ7B4jCQ2SJpU+9InKzmO5MeIg2dVj29FBqsA7272ThB/cGEFP7Hx1RFO5o/
 efPJGVeWzmNdWQkWAcAEcTc1t/TZpvDn61t6vJjVTF5PD5Xqhzjv7NGoiG0w3DRoXbcIH5eVM5
 gyM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:54:50 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JF0CY1swrz1RwFN
 for <qemu-riscv@nongnu.org>; Wed, 15 Dec 2021 20:54:49 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639630488; x=1642222489; bh=P58rSH9FYVGMWJye9p
 B0DBdQcbydJZIVFxFrCQLsVdI=; b=OLxBPOcOzjfpSmOwSGOYMq7qeVEzKoGUE0
 F8Ha09sZ6GQq+Jj44h1Qc9glQfcDVei8WuW6i6N6otKpGJsMKdRW1IAvTf52yudk
 lN+yigAIQ09vrzExFrwbE4GISzBePLw0mcBs7S1Et7LRdvLMb39lPQmSCQg5gPKj
 EealKQp440kn7NeWxhHzwz7kuDtWuOYoF5Job2AZOVf33nbIJucD1CZmoCSYGCOQ
 CzLN63guoDQ43HfkBYvvo77pPIrCYmiFPBfgI25f1Ix94vlhQ+WcaGXg1/wJOjQg
 WTat6U7QUGXeqprbD9lbkkj6USHoa8+dFQ2G/WWHSILXQmIZiSEQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id bBj42Mdv5_J1 for <qemu-riscv@nongnu.org>;
 Wed, 15 Dec 2021 20:54:48 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.66])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JF0CS0ntRz1RtVG;
 Wed, 15 Dec 2021 20:54:43 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v2 2/9] hw/intc: sifive_plic: Cleanup the write function
Date: Thu, 16 Dec 2021 14:54:20 +1000
Message-Id: <20211216045427.757779-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=977d27bfe=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Thu, 16 Dec 2021 04:54:58 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/intc/sifive_plic.c | 76 +++++++++++++++----------------------------
 1 file changed, 27 insertions(+), 49 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index a9f7a1bfb0..698492ce77 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -33,6 +33,11 @@
=20
 #define RISCV_DEBUG_PLIC 0
=20
+static bool addr_between(uint32_t addr, uint32_t base, uint32_t num)
+{
+    return addr >=3D base && addr - base < num;
+}
+
 static PLICMode char_to_mode(char c)
 {
     switch (c) {
@@ -269,80 +274,53 @@ static void sifive_plic_write(void *opaque, hwaddr =
addr, uint64_t value,
 {
     SiFivePLICState *plic =3D opaque;
=20
-    /* writes must be 4 byte words */
-    if ((addr & 0x3) !=3D 0) {
-        goto err;
-    }
-
-    if (addr >=3D plic->priority_base && /* 4 bytes per source */
-        addr < plic->priority_base + (plic->num_sources << 2))
-    {
+    if (addr_between(addr, plic->priority_base, plic->num_sources << 2))=
 {
         uint32_t irq =3D ((addr - plic->priority_base) >> 2) + 1;
+
         plic->source_priority[irq] =3D value & 7;
-        if (RISCV_DEBUG_PLIC) {
-            qemu_log("plic: write priority: irq=3D%d priority=3D%d\n",
-                irq, plic->source_priority[irq]);
-        }
         sifive_plic_update(plic);
-        return;
-    } else if (addr >=3D plic->pending_base && /* 1 bit per source */
-               addr < plic->pending_base + (plic->num_sources >> 3))
-    {
+    } else if (addr_between(addr, plic->pending_base,
+                            plic->num_sources >> 3)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid pending write: 0x%" HWADDR_PRIx "",
                       __func__, addr);
-        return;
-    } else if (addr >=3D plic->enable_base && /* 1 bit per source */
-        addr < plic->enable_base + plic->num_addrs * plic->enable_stride=
)
-    {
+    } else if (addr_between(addr, plic->enable_base,
+                            plic->num_addrs * plic->enable_stride)) {
         uint32_t addrid =3D (addr - plic->enable_base) / plic->enable_st=
ride;
         uint32_t wordid =3D (addr & (plic->enable_stride - 1)) >> 2;
+
         if (wordid < plic->bitfield_words) {
             plic->enable[addrid * plic->bitfield_words + wordid] =3D val=
ue;
-            if (RISCV_DEBUG_PLIC) {
-                qemu_log("plic: write enable: hart%d-%c word=3D%d value=3D=
%x\n",
-                    plic->addr_config[addrid].hartid,
-                    mode_to_char(plic->addr_config[addrid].mode), wordid=
,
-                    plic->enable[addrid * plic->bitfield_words + wordid]=
);
-            }
-            return;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Invalid enable write 0x%" HWADDR_PRIx "\n=
",
+                          __func__, addr);
         }
-    } else if (addr >=3D plic->context_base && /* 4 bytes per reg */
-        addr < plic->context_base + plic->num_addrs * plic->context_stri=
de)
-    {
+    } else if (addr_between(addr, plic->context_base,
+                            plic->num_addrs * plic->context_stride)) {
         uint32_t addrid =3D (addr - plic->context_base) / plic->context_=
stride;
         uint32_t contextid =3D (addr & (plic->context_stride - 1));
+
         if (contextid =3D=3D 0) {
-            if (RISCV_DEBUG_PLIC) {
-                qemu_log("plic: write priority: hart%d-%c priority=3D%x\=
n",
-                    plic->addr_config[addrid].hartid,
-                    mode_to_char(plic->addr_config[addrid].mode),
-                    plic->target_priority[addrid]);
-            }
             if (value <=3D plic->num_priorities) {
                 plic->target_priority[addrid] =3D value;
                 sifive_plic_update(plic);
             }
-            return;
         } else if (contextid =3D=3D 4) {
-            if (RISCV_DEBUG_PLIC) {
-                qemu_log("plic: write claim: hart%d-%c irq=3D%x\n",
-                    plic->addr_config[addrid].hartid,
-                    mode_to_char(plic->addr_config[addrid].mode),
-                    (uint32_t)value);
-            }
             if (value < plic->num_sources) {
                 sifive_plic_set_claimed(plic, value, false);
                 sifive_plic_update(plic);
             }
-            return;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Invalid context write 0x%" HWADDR_PRIx "\=
n",
+                          __func__, addr);
         }
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
     }
-
-err:
-    qemu_log_mask(LOG_GUEST_ERROR,
-                  "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
-                  __func__, addr);
 }
=20
 static const MemoryRegionOps sifive_plic_ops =3D {
--=20
2.31.1


