Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1muqfy-0002Ht-2S
	for mharc-qemu-riscv@gnu.org; Wed, 08 Dec 2021 01:43:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=96943765b=alistair.francis@opensource.wdc.com>)
 id 1muqfu-0002D8-5v
 for qemu-riscv@nongnu.org; Wed, 08 Dec 2021 01:43:34 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:42051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=96943765b=alistair.francis@opensource.wdc.com>)
 id 1muqfr-0006B9-S2
 for qemu-riscv@nongnu.org; Wed, 08 Dec 2021 01:43:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1638945810; x=1670481810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1nZXyKteUXqi1CCV0mCtgioLAXBXnj1AjAfzLFp/9tI=;
 b=H4pEcP6hmDjIfqlh/8uUzjL0NAgefRwzdCb0MC4y1HMMJIwipH1Dubt8
 at2kL1+c5J6PHUXVGcQaJEibtImRlPD3viPH/2cxRFmowAU6Exjy1PtOR
 GxbAcTh/h+nzeXSIQDKkl0yi7G5hBtrhrrnMOW94pPCrJpA9SDWdm0xMJ
 mRsaWQvPEjrlyiN5sS04pVmx0Wa1gnvW+HH3qT5DNbAW5WbAuchkMgxxc
 aXSntBikXH1h059trk7tNx8v+/nQT3wFxLsM04xEjW//3gg6SERFzCPSn
 GccctVYsEOUh4a7MEW262yjjWRIrflFpLZCn3gQiOOTNNmShE/gBXPESN Q==;
X-IronPort-AV: E=Sophos;i="5.87,296,1631548800"; d="scan'208";a="187722814"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2021 14:43:29 +0800
IronPort-SDR: 1JUurgHg3Dg8rgGZpBfxb3LrQpbCPHFfQff6X+rt9ShEIuDoNVfyCiQEPrQR86doEm3mdgQJr3
 iJW2IrjiBbOeY1v96Kk7QYvArx7ugrBYMAfYjJH1qsCCxGt1jr+ZFKodPWxoZ4slUCVj77DANE
 K6ZycIcyOKWNPQVxlGU2KXW4BW9WSRGIYt88qup0flLXCGGkkU16gbkPBBstPYpDjzX4QhpmKu
 tjvoWWDq62UIGHhSBkRvG/ZRDdsSCZcTa9m8Ry3xSSrgs7Ga0fMo0ZksbhCbwwjkfshWRyBZFB
 6ZQgXoh1bxrQbK4R4OB9EtwF
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:16:33 -0800
IronPort-SDR: Q4jJpAH35vBSlE8mtN+XsZqlssejFfw1Yr5KBBoQvr7MXEOanDKRTnu2YCg7LhZSmHY9hT7MPx
 rRuIy4HQHEh91X6+DgaAfpRWdvciaZvyAmupUSo5nQzX0Qiigcqe7ehMZsxn5T2y0AICvPMrn0
 aMccphsp5rNnS+RG7fg6dSuk8fsbDdcvhwHrDWmL7IGGUTm+b9flNg8rBgfbX4cY3U0xNeu9rn
 U7xIeXYsxSfXgat8vXwmVRBb64VR6+vgrAyj1zWDOB+OLLdxhVkuBzE1FEn19JbOEQO48+3P9P
 2xY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:43:30 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J870d1mDkz1RvTh
 for <qemu-riscv@nongnu.org>; Tue,  7 Dec 2021 22:43:29 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1638945808; x=1641537809; bh=1nZXyKteUXqi1CCV0m
 CtgioLAXBXnj1AjAfzLFp/9tI=; b=pkquyoV1tHaPUW7Dkbs0qa7Qj1XpHgis9f
 FScDohRh+/BvtUZ4sJfXFr3y1PUbgISxAe/jO54c5vFw9A3TWY27bQiALr98sXCf
 UJHrkm3dCqRW+DhegUSgPXhpOEeMnVsUWADbWUDiKiOD+MBFWgGjq9ou1/+kDc6I
 45N3tU4AAJ7p7adbZLkLH5CbIqUINr3pSn2+foCz2Z4BY8TW+klN4E54QU5Yd0Xh
 joGuGhfhzdpCe5GC8BWh5z+9Kvr2CrP5Ay2PlNsoR274ozbiWK9VoB1LEkwBUwCL
 JaNIaFyhPl1xqpn1XRanYCZDzgYoEsIxTGINpMAfgcCn9rneSjvQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id gZWaHXvWNKGd for <qemu-riscv@nongnu.org>;
 Tue,  7 Dec 2021 22:43:28 -0800 (PST)
Received: from localhost.localdomain (unknown [10.225.165.65])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J870X12zQz1RtVG;
 Tue,  7 Dec 2021 22:43:23 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH 3/7] hw/intc: sifive_plic: Cleanup the read function
Date: Wed,  8 Dec 2021 16:42:48 +1000
Message-Id: <20211208064252.375360-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
References: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=96943765b=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Wed, 08 Dec 2021 06:43:35 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/intc/sifive_plic.c | 55 +++++++++----------------------------------
 1 file changed, 11 insertions(+), 44 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index c1fa689868..7f9715a584 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -205,70 +205,37 @@ static uint64_t sifive_plic_read(void *opaque, hwad=
dr addr, unsigned size)
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
-        if (RISCV_DEBUG_PLIC) {
-            qemu_log("plic: read priority: irq=3D%d priority=3D%d\n",
-                irq, plic->source_priority[irq]);
-        }
+
         return plic->source_priority[irq];
-    } else if (addr >=3D plic->pending_base && /* 1 bit per source */
-               addr < plic->pending_base + (plic->num_sources >> 3))
-    {
+    } else if (addr_between(addr, plic->pending_base, plic->num_sources =
>> 3)) {
         uint32_t word =3D (addr - plic->pending_base) >> 2;
-        if (RISCV_DEBUG_PLIC) {
-            qemu_log("plic: read pending: word=3D%d value=3D%d\n",
-                word, plic->pending[word]);
-        }
+
         return plic->pending[word];
-    } else if (addr >=3D plic->enable_base && /* 1 bit per source */
-             addr < plic->enable_base + plic->num_addrs * plic->enable_s=
tride)
-    {
+    } else if (addr_between(addr, plic->enable_base,
+                            plic->num_addrs * plic->enable_stride)) {
         uint32_t addrid =3D (addr - plic->enable_base) / plic->enable_st=
ride;
         uint32_t wordid =3D (addr & (plic->enable_stride - 1)) >> 2;
+
         if (wordid < plic->bitfield_words) {
-            if (RISCV_DEBUG_PLIC) {
-                qemu_log("plic: read enable: hart%d-%c word=3D%d value=3D=
%x\n",
-                    plic->addr_config[addrid].hartid,
-                    mode_to_char(plic->addr_config[addrid].mode), wordid=
,
-                    plic->enable[addrid * plic->bitfield_words + wordid]=
);
-            }
             return plic->enable[addrid * plic->bitfield_words + wordid];
         }
-    } else if (addr >=3D plic->context_base && /* 1 bit per source */
-             addr < plic->context_base + plic->num_addrs * plic->context=
_stride)
-    {
+    } else if (addr_between(addr, plic->context_base,
+                            plic->num_addrs * plic->context_stride)) {
         uint32_t addrid =3D (addr - plic->context_base) / plic->context_=
stride;
         uint32_t contextid =3D (addr & (plic->context_stride - 1));
+
         if (contextid =3D=3D 0) {
-            if (RISCV_DEBUG_PLIC) {
-                qemu_log("plic: read priority: hart%d-%c priority=3D%x\n=
",
-                    plic->addr_config[addrid].hartid,
-                    mode_to_char(plic->addr_config[addrid].mode),
-                    plic->target_priority[addrid]);
-            }
             return plic->target_priority[addrid];
         } else if (contextid =3D=3D 4) {
             uint32_t value =3D sifive_plic_claim(plic, addrid);
-            if (RISCV_DEBUG_PLIC) {
-                qemu_log("plic: read claim: hart%d-%c irq=3D%x\n",
-                    plic->addr_config[addrid].hartid,
-                    mode_to_char(plic->addr_config[addrid].mode),
-                    value);
-            }
+
             sifive_plic_update(plic);
             return value;
         }
     }
=20
-err:
     qemu_log_mask(LOG_GUEST_ERROR,
                   "%s: Invalid register read 0x%" HWADDR_PRIx "\n",
                   __func__, addr);
--=20
2.31.1


