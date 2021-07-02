Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lzBb8-0004vh-VD
	for mharc-qemu-riscv@gnu.org; Fri, 02 Jul 2021 01:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8103b7a7b=alistair.francis@wdc.com>)
 id 1lzBb6-0004sB-Pc; Fri, 02 Jul 2021 01:20:16 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:49442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8103b7a7b=alistair.francis@wdc.com>)
 id 1lzBb4-0000nJ-JQ; Fri, 02 Jul 2021 01:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1625203216; x=1656739216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L5/2XTtnypOpyLaq2mlybZl4M7VFrYo69Jw/vMdSO24=;
 b=FATVIwUylgODBeD5dCxDFQCNk5imMgV6RTz1yfxZ1frw/ZVnTxFXJvwu
 F4w/jkEH+n3i6PNA9zrDmzo19P1lit8zOUwIKP22AWb8t0/koJcnR0jnp
 z5QmLhgB3kZI8BmeXMYhYlY7yU3OBZZ1e7fclL6tQkKhGEQVvWW9hLoFW
 CEd1kixaSDuBDjnxWYAA9G5OnsgnrcESFf1w1rEXVDuvDKEh1eiprdFwV
 ByceCy28WwzZLKBQBWZ3O6kX3Ucmz1qyYv+pE48BTGWlqkJVi9/l4nMYW
 iFBLbIqbobC+FARlY3DcNWmB9CcD1WhkmDDWk58OmWDzHU5DPYsViWk1y g==;
IronPort-SDR: jUlhmDbu5rQqeoxygXIN9OK+jRFYbbzH5uEHa6pLiKYGoWx0uozc7kjnobebBsD33PsmHmBAn1
 IO6BjutUwnV+0A/r4uFUevjLtNIn/m4SjErJOTMx13t0VomXGozDIln+dF9fpBJx8T+9NC2sXg
 WHGZEScYQQHIDZfPz4sqmNdta9EGjh0V6Qu47LhFg8qko1CPASaNdUONL6tBZcrpW/OH30yBoT
 i87gpNkJulpfNaydlw5U8a8ZsQ6SJ7JZjOMpqnWggz1z/10OOr9cuIVT+TUp5bVDOVVuo2WufY
 SuM=
X-IronPort-AV: E=Sophos;i="5.83,316,1616428800"; d="scan'208";a="277327945"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Jul 2021 13:20:12 +0800
IronPort-SDR: DU4+55IX0eTn61WaEOi3WcYFRN18PlA3TDTez/AfQ24M+uJCI5BzO5Cd8u0RS6T4sqyQHgR8Ys
 jXl6fXBeAXIfhllrcvPAuJca3U3sV/zg1sokuaF42AWTpgwZf0fBtdXF0aJY6ZRx9ibw5Zv+Iu
 a5z0mcHXxnCyR+0rqVj+Vb4LX1AE/WWsuyT3AvflKMEI2kB5AHwHxUoqwA6RIsJzN7bhlWrdf2
 x9Bz/8srGOij5qnR7FTDpNlwKEL5pwO3OblmIXtO6SxBKGFPKITwSiP81Ek1Bro7V31SqbstsD
 hDJgGFba7R06HrGXojluQ8xO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 21:58:34 -0700
IronPort-SDR: 9muDPsHM39LlqiDqcxlOKgmhODvcJV18HxCqwOjfQvw5J8HwdyeQ94RoYmhm6KJcqrN7MrXd0l
 XY0QsrCAL8sgwRZ/T2xAh7wrZiyEZ9D9+5oKzues/TihdpBwKJvZZHB+wWbyN2HBkynuSyjACA
 DSQ5rBrUDHKB16gc03qHdya49ePLV4TFxSb3OfWiek+nuZqteUIptpoQKlHm12YGmAJaA4jnAL
 E0/36fXsN2NYb69caS386+jSGaVUXRvXn0GFMwwROb3qu7GsEBJDjNt9kHWKt0blZ8/DmVaB2W
 NjA=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Jul 2021 22:20:07 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 2/3] hw/riscv: opentitan: Add the unimplement
 rv_core_ibex_peri
Date: Fri,  2 Jul 2021 15:19:49 +1000
Message-Id: <2675adc73be8ed35dd9d36198c519e4f46b285c2.1625202999.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625202999.git.alistair.francis@wdc.com>
References: <cover.1625202999.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=8103b7a7b=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Fri, 02 Jul 2021 05:20:17 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/opentitan.h | 1 +
 hw/riscv/opentitan.c         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 86cceef698..a488f5e8ec 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -81,6 +81,7 @@ enum {
     IBEX_DEV_ALERT_HANDLER,
     IBEX_DEV_NMI_GEN,
     IBEX_DEV_OTBN,
+    IBEX_DEV_PERI,
 };
 
 enum {
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index c5a7e3bacb..933c211b11 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -58,6 +58,7 @@ static const MemMapEntry ibex_memmap[] = {
     [IBEX_DEV_ALERT_HANDLER] =  {  0x411b0000,  0x1000  },
     [IBEX_DEV_NMI_GEN] =        {  0x411c0000,  0x1000  },
     [IBEX_DEV_OTBN] =           {  0x411d0000,  0x10000 },
+    [IBEX_DEV_PERI] =           {  0x411f0000,  0x10000 },
 };
 
 static void opentitan_board_init(MachineState *machine)
@@ -217,6 +218,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
         memmap[IBEX_DEV_NMI_GEN].base, memmap[IBEX_DEV_NMI_GEN].size);
     create_unimplemented_device("riscv.lowrisc.ibex.otbn",
         memmap[IBEX_DEV_OTBN].base, memmap[IBEX_DEV_OTBN].size);
+    create_unimplemented_device("riscv.lowrisc.ibex.peri",
+        memmap[IBEX_DEV_PERI].base, memmap[IBEX_DEV_PERI].size);
 }
 
 static void lowrisc_ibex_soc_class_init(ObjectClass *oc, void *data)
-- 
2.31.1


