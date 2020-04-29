Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jTraC-0008LU-BQ
	for mharc-qemu-riscv@gnu.org; Wed, 29 Apr 2020 14:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37380)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTra8-0008DR-B6
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 14:37:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTra5-0003Se-V2
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 14:37:16 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:2049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTra5-0003Ps-8D; Wed, 29 Apr 2020 14:37:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1588185434; x=1619721434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H3Rf0GK2uIFQ8+W/s2BSGxfdGYDmRN5HO2AJN6YT9+s=;
 b=gLvfl+mUoF6QViAfi0TQRNW9BxVhhhwwSqTPVcl7QXNxoZNkT+Ds6MFO
 AHon52DbrAeS9OURcv+oHsZXBheX6BSGut2JHMZ3ocIPgSg/Cji/nlkrI
 V079Z/iKZ2LshAIuawMD2TGAbeVwIowSRDpx2WLWjjDvnypAK7Z0yYYpB
 JCtbpW46mAJv6jepSj9ycaIodfeRHWnpZJdUEJyOWX5LA2k/6oojHmhN2
 lTrA23zJDsydjKcPatVZNGZiY/7ZsWTFQ3v5u0gYazizCqYLacdbKRPWq
 b2MQUMrdBRJue6QRQt4m4M1mgozIJLDrhie6xp7HKwKUUBguQGzZO/Kvb Q==;
IronPort-SDR: Odtz9RtK4yukYFjLkl7PPCBAXAcQYRKgeiGfVWnvO4Btfsl+ZeIhicSJ3OrJfEwkFTWUtijMAP
 gXXY2OWGcEmrWRBN/CZbZJd8Ma0ZEekr8y4MRaCbWP99Y/QKhqaBFQolPoKetc3fpv3S5wJ+bB
 8Cf2iUjk5EjRW+5OB6YGzE9IAu8fhAF8lsM9nRZd8+1Bsqqb6817T0ZgnvQVA265We2uaF20B+
 tVObTrLV9m5MhAqVee5Rbjl5qYmL4FraOYxz2KsbBnuDyfpBKqOXmfOXWz6dYtUsKulyUATwJ9
 qZ8=
X-IronPort-AV: E=Sophos;i="5.73,332,1583164800"; d="scan'208";a="137935142"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Apr 2020 02:37:06 +0800
IronPort-SDR: UXb1/ASlPfPPHstv3Tk3GT+kdTbkLEcq10ZQkC4eQsFmPBN1sntJkXq0PNg9UNJ33lzVeF9Pm4
 wR0F6HqOKrP4pRLB4oEJffI/oUOY96uSw=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 11:27:10 -0700
IronPort-SDR: oacbIocZ4C1rRt/d5AjOi+jHqCXiVXYBwKJrxI1Y2JpdI9i3/LTVFOhvRzjRQM8jQQvhX+Kbke
 MNy5oH+WvOiA==
WDCIronportException: Internal
Received: from cnf007834.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.55.253])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Apr 2020 11:37:04 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Cc: palmerdabbelt@google.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 06/14] riscv: Fix Stage2 SV32 page table walk
Date: Wed, 29 Apr 2020 11:28:48 -0700
Message-Id: <20200429182856.2588202-7-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429182856.2588202-1-alistair.francis@wdc.com>
References: <20200429182856.2588202-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=381fbd49e=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 14:37:03
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 216.71.154.45
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
X-List-Received-Date: Wed, 29 Apr 2020 18:37:19 -0000

From: Anup Patel <anup.patel@wdc.com>

As-per RISC-V H-Extension v0.5 draft, the Stage2 SV32 page table has
12bits of VPN[1] and 10bits of VPN[0]. The additional 2bits in VPN[1]
is required to handle the 34bit intermediate physical address coming
from Stage1 SV32 page table. The 12bits of VPN[1] implies that Stage2
SV32 level-0 page table will be 16KB in size with total 4096 enteries
where each entry maps 4MB of memory (same as Stage1 SV32 page table).

The get_physical_address() function is broken for Stage2 SV32 level-0
page table because it incorrectly computes output physical address for
Stage2 SV32 level-0 page table entry.

The root cause of the issue is that get_physical_address() uses the
"widened" variable to compute level-0 physical address mapping which
changes level-0 mapping size (instead of 4MB). We should use the
"widened" variable only for computing index of Stage2 SV32 level-0
page table.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20200330082724.120444-1-anup.patel@wdc.com
Message-Id: <20200330082724.120444-1-anup.patel@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 50e13a064f..bc80aa87cf 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -559,12 +559,7 @@ restart:
             /* for superpage mappings, make a fake leaf PTE for the TLB's
                benefit. */
             target_ulong vpn = addr >> PGSHIFT;
-            if (i == 0) {
-                *physical = (ppn | (vpn & ((1L << (ptshift + widened)) - 1))) <<
-                             PGSHIFT;
-            } else {
-                *physical = (ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT;
-            }
+            *physical = (ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT;
 
             /* set permissions on the TLB entry */
             if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
-- 
2.26.2


