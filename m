Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1muqfv-0002Ea-Ng
	for mharc-qemu-riscv@gnu.org; Wed, 08 Dec 2021 01:43:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=96943765b=alistair.francis@opensource.wdc.com>)
 id 1muqfo-0002Bi-1r
 for qemu-riscv@nongnu.org; Wed, 08 Dec 2021 01:43:32 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=96943765b=alistair.francis@opensource.wdc.com>)
 id 1muqfl-00068H-Dj
 for qemu-riscv@nongnu.org; Wed, 08 Dec 2021 01:43:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1638945803; x=1670481803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wm6huLeVSEvMGmiKKkK0H77PwZ+dV4Llc57yf7RGz7M=;
 b=Dsa7/Bf4EOGmJum7mdOp/pYfRTwPadPm5HyNDiJJwwYKlRmO9TPV9U4R
 wGDIwpYZzzfqL5UsxB7N13JRjDHS3wD+PeYwg/42SOph0qlgC3lpT1cCW
 A7COwVIqQ6iaO5Owmfq/44qgvBSx9boVm77jHR0S7Spw04uxDcJV/GIm+
 hI2XrOt5EyXzys2VeC1AsC4mkqSJICCHFfXgUS/3iIhREgtOj9BW80JLf
 RH1gYE7KbmB01jEd8ERi7lDhj0NI6s32coZ1QHNLV64he/adzs+4vg0sX
 r9JrhJAiJHzGjwGDXhFfiOqpAmtnXbMv+4bJOadBDzzGcGgwlpVZCvepp A==;
X-IronPort-AV: E=Sophos;i="5.87,296,1631548800"; d="scan'208";a="192503602"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2021 14:43:23 +0800
IronPort-SDR: 3LWrUist4CCgGXPLBj8bJqCTaLPb4nsCFS8D/wlWQCCXH4hMCgruW3TuNak28skoGOS8FHc1ZS
 hxsv0tCEM9NthCQF23ZQ53W7isDMAJm4CZYs1O50eUT2XyyV340QPW7uAPUoPVp7uMic31UfVV
 Ov6tdMB3xiGwdJ8M06DNPh+8NY1cSN4XjTyC4MM93yok26Jq/AYzTd1V3ZH6GStpvcmLW7DgPN
 7NRMg5zMn7T2UEAOqA9PqDNHA2r+jjPzS+yv6DexlSxG26NCohcIHmLwc7Sj3HFGnM+EhFAQUu
 84kHzSiBAwZLcf/rCkXs4Cqz
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:17:59 -0800
IronPort-SDR: GMu8ppguIchfwBxU+4OWjosKvIwH7SYhzUJepYssg+vbNwgjEkrfI/n83CA/HrP5WXg4W17+Ng
 OL19ZfWIzVMy88oQFgatbicaCe/zFhFwNcKhhNr4DixT5hpeFh0Lt2Y0mXnIL48Jv/VGjbTwPi
 aJWjXXmjLXjjkgkIxKGFy8btF+fFYdIGParGlxkYPTozMQgvvdijTmGs+tfnmqLXO61pJpxTQG
 NjoLH7BbEml0TCSAOUusOpTwFq7SlpV8T71Rv7VA6AeyFyo020QCIUxxTRlCnJYuYwNBqmu9+d
 lL0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:43:25 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J870W6gHMz1Rwnv
 for <qemu-riscv@nongnu.org>; Tue,  7 Dec 2021 22:43:23 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1638945803; x=1641537804; bh=Wm6huLeVSEvMGmiKKk
 K0H77PwZ+dV4Llc57yf7RGz7M=; b=K1bvYKOLYFxb4siX0fzhUsrOIKWskWvd9E
 GPPJnZanw/4NrO0riagJqY60pVpdc6jl+Pfm049+2C0wYsIraZJ21rcfiwKCUEqZ
 fq/tkUxmLdXTpPX/sz7fksqTafEqiUkPSLwUcHBRIhXjuxulbvKmjmnfqwONV2m/
 aEM9hPByGsmmed/O+jBFnZnBesavvcK+FUHu+fF31BzHFMYownLzzEV6dtRHyEF1
 U7zwkj9shdzSleHr9MQ+7xNWsL5adlc16WbZt47w1QknY//Ihf9qBnDCtI7AhQfC
 OoHuHOEJkXdzY9c9SH0f/wgKqswGHchBSMd3Q3XamON8M6uvQlYg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id nYdh37Olt2md for <qemu-riscv@nongnu.org>;
 Tue,  7 Dec 2021 22:43:23 -0800 (PST)
Received: from localhost.localdomain (unknown [10.225.165.65])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J870Q42dXz1RtVG;
 Tue,  7 Dec 2021 22:43:18 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH 2/7] hw/intc: sifive_plic: Cleanup the write function
Date: Wed,  8 Dec 2021 16:42:47 +1000
Message-Id: <20211208064252.375360-3-alistair.francis@opensource.wdc.com>
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
X-List-Received-Date: Wed, 08 Dec 2021 06:43:33 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/intc/sifive_plic.c | 82 +++++++++++++++++--------------------------
 1 file changed, 33 insertions(+), 49 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 35f097799a..c1fa689868 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -33,6 +33,17 @@
=20
 #define RISCV_DEBUG_PLIC 0
=20
+static bool addr_between(uint32_t addr, uint32_t base, uint32_t num)
+{
+    uint32_t end =3D base + num;
+
+    if (addr >=3D base && addr < end) {
+        return true;
+    }
+
+    return false;
+}
+
 static PLICMode char_to_mode(char c)
 {
     switch (c) {
@@ -269,80 +280,53 @@ static void sifive_plic_write(void *opaque, hwaddr =
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


