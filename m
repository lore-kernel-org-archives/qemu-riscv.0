Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5ER6-00086e-K4
	for mharc-qemu-riscv@gnu.org; Wed, 05 Jan 2022 17:07:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5ER3-00081e-0r
 for qemu-riscv@nongnu.org; Wed, 05 Jan 2022 17:07:09 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:1936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5EQv-0007tB-Hf
 for qemu-riscv@nongnu.org; Wed, 05 Jan 2022 17:07:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641420421; x=1672956421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4IZx9WjGfYJOYFMc1NhfAQRWWd90/x/xUALrZMkCDMQ=;
 b=JHnz8OGqBuVOIQ5hz3bLkX0lKQmbn6TYmZGSgSQrqdQ8uPF9fnqUzqxn
 sqYW+XKfCInUqZtbywoyDHGzanMrx7sYtim7AfjEBfK1SOP6G39DIwr6Q
 Ms+lp+TAX0EmR7xo6CAc8Yh0PqeQNzXlHBBS92CnD5T9RqWUcCpZlcyXf
 XFbhaowj3c91XLJufCjLCbUh78bQZd3FpYFLIp5/6ZlvZnzFUQxIANE0Y
 e70vCTNYctQ/GthPjq7PjhNvNT8WE1aQXh8YnWX31wxl8CWJaeYGKZuxU
 uuima6TN69cCcz9w+C1NjzqmAnBGbUnduVxYlTQ7B9ZpLBsgXwipYeS2G g==;
X-IronPort-AV: E=Sophos;i="5.88,265,1635177600"; d="scan'208";a="188746555"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2022 05:40:07 +0800
IronPort-SDR: gMF5NQwNLmpvXXQxnTgY5eDrROCzV7cFdUpuH3ifbcBpJxo48gqEKcjhhGdVPhks/d6kP6zxtk
 7dTO2rvBHCMC5MCa9zJ6FbZ4ax/EGOv90JFbnY1cbVb/bxl8iAgdnPZ2DxfeokOjydwV0bZvcf
 JWRcCNpUt4xF5yld5ZflN8NCxYgiDBKLwtFPAhhz+6VR1FuWEOuzRBqY2zV5hPKaXzuyYJv19s
 p6vIdNeWzZAmJ+6ClUXqPwDR1BZGwWLUIKmSlhdA0/3xGXQSiquoXrhvugI9tm8035IBb6jqBd
 KyTP7o7YQNAYHl1BOMxaLmof
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:13:59 -0800
IronPort-SDR: hzLvX39LIOPqfiy+qJNBxbaDA+4hjCiXXnIVd8k/Im1aFwILaoA/KA641ovswL3rbqGRuCMI8m
 qsiBOwRFUM8+WYkxeE6dTIX8vfMJ2zNN506BkLJTD1609Zzdha61/bTCNWUwOYGQ22eWE1/IPe
 2wgspXEc5adkHdYmFb6Vi8COmWMamY4XixlnsrcJ29K3C3UhSQxF61DnPQ32oXeRcP1Gx+A6ky
 FLJ0tuI+ZQ9hql5OpBww4gyu5Ca+4hMms6OutKZOQ2r09IkXJVrwtuEOZ/JebXDM8L+dqvnR2J
 nsY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:40:08 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JTjZH1qgGz1VSm2
 for <qemu-riscv@nongnu.org>; Wed,  5 Jan 2022 13:40:07 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641418806; x=1644010807; bh=4IZx9WjGfYJOYFMc1N
 hfAQRWWd90/x/xUALrZMkCDMQ=; b=d3nbcVUsaa2fvkXwj3VdXN8TQ2JW+zO4Aa
 ktyuRJDAra29SwPTNo4I9cJW8luowucIzdNUN1umxwcwKWDaRQsMoIOxuCTJK1eC
 IwM87NaQYyHROf2lqkJak9zcyIq5bj9FipvE7Pg/UYRbIgdQhpw48x89FYppaKhC
 Xl99x3nFz7gxfvBwsX74xvZK0JKrXfH1FOtVF4HLTu0ZlfdqrKE+uFoFqgQC6VQo
 ZccFM5TY4qdoEk0qPwleGgfWvhUz6Rk7QzhaYSgioaIcWc56L7uF+aRP4CyCbWam
 0e32pQe2R/NyN5cbnntpb6eR31Y+yuNGAxUKFqebBMrPXcyWAd9Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 6FIDM0g0mu8e for <qemu-riscv@nongnu.org>;
 Wed,  5 Jan 2022 13:40:06 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.73])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JTjZ970Jbz1VSkV;
 Wed,  5 Jan 2022 13:40:01 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
 alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v4 3/8] hw/intc: sifive_plic: Cleanup the read function
Date: Thu,  6 Jan 2022 07:39:32 +1000
Message-Id: <20220105213937.1113508-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
References: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9978dc08b=alistair.francis@opensource.wdc.com;
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
X-List-Received-Date: Wed, 05 Jan 2022 22:07:09 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/intc/sifive_plic.c | 55 +++++++++----------------------------------
 1 file changed, 11 insertions(+), 44 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 698492ce77..44d24b3c59 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -199,70 +199,37 @@ static uint64_t sifive_plic_read(void *opaque, hwad=
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


