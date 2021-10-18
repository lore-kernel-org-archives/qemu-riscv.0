Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcIZz-0005bR-Gp
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 22:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIZv-0005WE-Hi
 for qemu-riscv@nongnu.org; Sun, 17 Oct 2021 22:40:44 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:44058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIZt-0007Sy-Ia
 for qemu-riscv@nongnu.org; Sun, 17 Oct 2021 22:40:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634524841; x=1666060841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1m7J+EWLpgNUJYKB7xLFfPNSYtLKUKeNayE5sUz+na0=;
 b=c4SRIh6jBhCFLHe7w1lSTWbByFFydw+egr4ncW+ppLrUrXgV8YG+THdS
 iVeR/j5TSxA3ALB26IaPAeSNVK+0eUtuYN18LhqNGLElgwaiT9RHFlaCY
 YQ0AXx9DXNmE8Zbztx8+B1zWKSze8icQS34Edh+rujf3GHwJgFaCyOdkW
 7axHcUBjcpSNQN62mkpRsERtx8en3gxEytohWH7GixghJ1CK6JNw0XGRU
 IaMrTBQXf0THzjCQCZdL5S93B6Va4kfM+WFurp1ybT3oUgbI2T1u7SGsA
 Yory/DQYXZClws7NKOnW0RBLt1xGobt6UaK7tsAwssRq9YEHZMK3Cd2qe A==;
X-IronPort-AV: E=Sophos;i="5.85,381,1624291200"; d="scan'208";a="184083953"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2021 10:40:40 +0800
IronPort-SDR: 7v2bPYYJmDcpAWNJGzI+V06X/nHSfrGLVucL1NlZlEI2dOa7UWqTrr0f7v3jFWXQKKSNIOqWc0
 rniOas7FjhWo60SkGPT3QKaCGiO27KAhqZZQ4h1K+6P2QROowrhVW+Dlw0TLf2UJxdqkym7QBX
 Vz6MLtsbdnx67ixgE4fUE3YSt5ZF8sYBu4zIuaUpmJrufc5Rw8jgYZdALpCD31DrFuLPVqavQi
 uppZMWoHTX7VNgpZnq1oy4nmh40nVxN0+m5kQL5aGTp+3hnLT1RKha5bGSfiPpxCiB+US0ouL8
 +xjsgDeDmNocUA62j2vwLS1h
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:16:20 -0700
IronPort-SDR: 2TTcLUZV0wrfq2cCRzY/hbjyitcXHqKVhDZ1wV6kLxQv/f5LLNQ3NVEcs7twXLo16oywoZV7cL
 J2AynxX3iW5k/HEXKfIrGsIbGIvuNiQZz0h9QxvGcRFg0cFDby8O+D0zVZbTI6EmOc46g2Z6fW
 l0yfMqUjfgQ3ELNWGPTkeFFSIrjFdegg98sHqdKm2u7S1rWGzRPW/4Cjo9pZz46jBjNPMkI8Ui
 IPr+LMUkb7ApjTZDYfrKZ3M0yxEZXu7d2xHerOYyoJCaQdItKr/mMKOS394RT+eWxaOpdGztKd
 yG8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:40:41 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HXh1z6Xx2z1Rvm0
 for <qemu-riscv@nongnu.org>; Sun, 17 Oct 2021 19:40:39 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634524839; x=1637116840; bh=1m7J+EWLpgNUJYKB7x
 LFfPNSYtLKUKeNayE5sUz+na0=; b=BeNRiyBsBIe+Ij+ybhmIVP7/E8DlLz8+x+
 fOXvQS6MLoGb73cigyDS3K5ikkK+YYrEpjCqi2n5hicyXOyc9S1gYa9iA7r43aUV
 K+G0J1AEqaS7qJHNUeU11WZXNmrb21MXniJ/yfplUHZ9H+9WrRr62d4wqxo6sxYS
 Zr8m7d/eJoRiZogY/9GpSDI3e9my7z38eAhzGB6fBl5jYcoYsc+5c5RpCH9fVcDM
 WfyUmZC1xM6aCBLUXpxsj6sdmP4r8FaEEe66mgJc+RnqQ+UM5eyxx1FxQ7Kntnnt
 OZ6zPadn8abTStkRI659r0i7GTOO3/1uoIfISbizeX06Q8L4xZEA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id LhdbZgKJBUNc for <qemu-riscv@nongnu.org>;
 Sun, 17 Oct 2021 19:40:39 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HXh1t3wbjz1RvTm;
 Sun, 17 Oct 2021 19:40:33 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 8/9] hw/intc: sifive_plic: Cleanup the read function
Date: Mon, 18 Oct 2021 12:40:27 +1000
Message-Id: <e4d22f1fd96cf821f6c400736a5dc20334e932b5.1634524691.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=918244500=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 18 Oct 2021 02:40:44 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 55 +++++++++----------------------------------
 1 file changed, 11 insertions(+), 44 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 49e566a76f..d73503cea4 100644
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


