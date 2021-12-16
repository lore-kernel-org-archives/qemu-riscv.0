Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxinF-0002bT-PT
	for mharc-qemu-riscv@gnu.org; Wed, 15 Dec 2021 23:55:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinE-0002Ws-I9
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 23:55:00 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:6598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinC-0003pX-R8
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 23:55:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639630498; x=1671166498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4IZx9WjGfYJOYFMc1NhfAQRWWd90/x/xUALrZMkCDMQ=;
 b=lLD9NAaRbqzWyF7BmoscErGSNDC4YNG49wpQ39YIrHTlj+pBJpUuoLo7
 kLWrPs8b1UQgB3X2QH+1/tLzGXUfwFmqsXskes+gg54uWUv3x9mCAJC2F
 tNqKYRTHsS6H6evtfA64+OY1oKVW0SKfbW9FvtTqjv4DzWmbYRUuKgV+n
 ccQEae3w7DC+iILzZobZoOmgth+NWac8ZXnQlbnhBE8p6mqDZwGUkdl8H
 AqQHhhPRiF4rv30twDOOZmmDqO9loiq+GW1ud39l6pB65WWM9s8RseG8+
 dy0aS80H18CrhxNiguPumBYVWpraA0yBBKlz9paBHsGbtuY65g5/Vx0Mf w==;
X-IronPort-AV: E=Sophos;i="5.88,210,1635177600"; d="scan'208";a="300226944"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2021 12:54:54 +0800
IronPort-SDR: js5Qc23iFf7uRmwbcwFYLR4/F0QK8Hv/tG6XBU+UjxpT7ItW/HHRsLEY/h2gOx6bFym5mrBktG
 cOyBysGqtw8fgOYFiMry59tYi4+sj3tF7xelXd57grog0CSIAYp1T5258jA2WkK1rqxZyFaTfU
 LnepVqszR7/hw4pKkAUjmfnZLi8qxfBlPz+FyfJuoeXHyzcD4UC2+aNin94hVm3sa25SnZKPik
 zVGsqpolx6ws+yjTaBItzSxy10cyUZL8FfAOJ+d/UgbesDdWMGwY7+8H+SqUhO4d+1Vtn0bh3x
 aO2UbgD+E9NffaX0ooT0U56W
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:29:17 -0800
IronPort-SDR: REE3A4THC9qnk/lkfC1ZgIKwE9bDPXDD4Ytfhz6XwhxxoHOa2Z1gef/FSCxft+s+QlZ1R76en9
 gUDARbW2ZZ/JVY+TJj4QkLpzrMUxHOHUXat6ukGJ8xPOjDnji567SZTqmT+e5wOyMd5vyZPpI0
 tt+dFONbgaIQhLVV2bKPZAkZI85f3HsjTQh3rq3iS45IbMPoN51vMhQr3wQhlq8ZIVLS+0mNeb
 FMgWrvFVAjiEXqfPZjjDiHENv7KDi/9Fl7XO/NMThUiY43Yw7ChMzsAlT/PLx+ECNVypQHBAGA
 1xU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:54:56 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JF0Cf5Jwlz1Rwns
 for <qemu-riscv@nongnu.org>; Wed, 15 Dec 2021 20:54:54 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639630494; x=1642222495; bh=4IZx9WjGfYJOYFMc1N
 hfAQRWWd90/x/xUALrZMkCDMQ=; b=mMt7yH/HBgWZX5FJqQGmbpe8oBwPPe4ZN+
 OOCVGcJghyFrWfijXkB9i/vshmn/NI6Tm4/Tgd04svTO+3HlhGlP+Sg0DIm40sga
 cqclispZcceknkI3l8zwFvSNZnlicoXKH50PCBJ+FA1+8R8OqihjpuHgbjCGKNhB
 urL5Ts5c1J9Or2CTH+Ge3njYx1N3+bXEhCi0UrB1ZOvvuTIReDEEi+Zk1asqyZ0R
 h+Q+NxBTO6IWF+UUYv4OipwBX0EJdv2ybG4m7X7AtXT8qT7J19DMqXUy/6RfUllm
 7ShqYviNnBBZTe0YYTfOfiIMFCliAhv6PE7JEKwog/xS7m464J3Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id F6Kmat2axoQZ for <qemu-riscv@nongnu.org>;
 Wed, 15 Dec 2021 20:54:54 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.66])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JF0CY3msGz1RtVG;
 Wed, 15 Dec 2021 20:54:49 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v2 3/9] hw/intc: sifive_plic: Cleanup the read function
Date: Thu, 16 Dec 2021 14:54:21 +1000
Message-Id: <20211216045427.757779-4-alistair.francis@opensource.wdc.com>
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
X-List-Received-Date: Thu, 16 Dec 2021 04:55:00 -0000

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


