Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ixhIR-0004Ih-NY
	for mharc-qemu-riscv@gnu.org; Fri, 31 Jan 2020 20:10:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57230)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhIO-0004BA-Ov
 for qemu-riscv@nongnu.org; Fri, 31 Jan 2020 20:10:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhIN-0006iC-Lx
 for qemu-riscv@nongnu.org; Fri, 31 Jan 2020 20:10:00 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:17177)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhIL-0006JU-AS; Fri, 31 Jan 2020 20:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1580519396; x=1612055396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BKj4+XG8YW0q5cgQbIAIcsOQyLvJBI4Rl5XMrfwJLkE=;
 b=hqdULqlLHlArIwkFYVAk57O6GURLR+4TsbUWpK43CzQk0bvoOlkzKrwT
 o3mVsdIwdZDVPO+URAf9+WOeUY//WyDQ3Rl5KVUIFgBVzdHUXdz9lnOOF
 X0t1UhDULzTaU7qY9rHnKU24LnvKTIWN+otLKagSZmbS/8mH/KTzIbmYI
 N3NdGoi+YxBp7JIXh7kCN09wDRH7lM5v5TrF4WMp3fUmz0lRlilamIaqw
 Gik+ngOoSGEmjc4nQLo9LfA6yI1cgEUFF6GBiprNM3q6yDZ8i0V9l4cNa
 vgfJ6/vjpxxiRDRjstXLQK5bDAM1P3prbthO0kONStAw8Q7C24/b5dMEW w==;
IronPort-SDR: a/S5ajjofxy+CZ8PZt1cm6SB6I4hXmRPszn3JRGS+iWba8JgzDGa+hS3cSI/RFG8gUcSt/9Fhm
 iHIusxzdB2h2WbfGT/56MNaprhofd7WF+fKpu8T4gv2FLOusjjXMeTR9G7IZBs5gj7cugDdx3Z
 41qjpIGdYAOD+QumHQ//86bzN4vl/JexGamHEuAXYBalu4NcAd2aFZ5Hl0L5HVdwLB2U+sEy9y
 6ynfDhDaDlo7uGKXt9hIS2ulMBYPyx2nY9P4u3GZ2lhLf8CHWvOZLHdXg2BQGffZRPfoJCxwT5
 lMU=
X-IronPort-AV: E=Sophos;i="5.70,388,1574092800"; d="scan'208";a="128872483"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Feb 2020 09:09:15 +0800
IronPort-SDR: 78vd74HWmLlC8o1jerZJhtFBYA2TOA3POhLV3bm4Jr5rnzx+RjRUIxMXMagbPhtOSvoi6SHQ5L
 9aB1ckefT/sl3qBGwtbVy5zDByodJZWKBzWR60zNxJh49AJyfLgCd0+ALbq2pntQr2sHa/+IQe
 DRYJzTS20ZO0nXm7mmeUuOut5ZXnQLU4QtT1h5HiN0GQLp8uYHCiDxYBh+3UJozH6qe9b/hnUE
 HbFgdn0yyYfAFdkYM6tVLi7gXIv7g42C3A5D23TLzZ44TdBDp0HYUuYuWXwrNoizjtNqbLebjA
 N1LHB9d6dL0ZcMCAKLfF90wG
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 17:02:24 -0800
IronPort-SDR: rUmK1oE+zeiXw6gyVE7UZwWLDTywwi7lC0pm07A78awcq5d+9K8Rykx7uqvY6nKrVwUffzQFU0
 /qLMC+TC6skaAD7+46TJVNsXnqC6Y+pDKk4NgRAI9Hw3CZuFOV7AHT3ovdx02+GrPUWyy7VfJq
 3AnVu7X4PnLJOlQnWhvOF0S9beHII39Py/HVyiwQahqUNQYURa6FOloMzbQCn5U7ZHft5ZCUPM
 JZx5rDZ54kmd1SegkL/W2taAfEgmuGosecU2Oydr8+PuX9jYSQdD3iLtZoRlN0VgyAsMcmqT/W
 VP0=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip02.wdc.com with ESMTP; 31 Jan 2020 17:09:15 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v2 24/35] target/riscv: Remove the hret instruction
Date: Fri, 31 Jan 2020 17:02:38 -0800
Message-Id: <39083deec532135287402aab20ab370f4cad68e3.1580518859.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580518859.git.alistair.francis@wdc.com>
References: <cover.1580518859.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 216.71.154.42
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
X-List-Received-Date: Sat, 01 Feb 2020 01:10:02 -0000

The hret instruction does not exist in the new spec versions, so remove
it from QEMU.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/insn32.decode                     | 1 -
 target/riscv/insn_trans/trans_privileged.inc.c | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index cfd9ca6d2b..b883672e63 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -75,7 +75,6 @@ ecall       000000000000     00000 000 00000 1110011
 ebreak      000000000001     00000 000 00000 1110011
 uret        0000000    00010 00000 000 00000 1110011
 sret        0001000    00010 00000 000 00000 1110011
-hret        0010000    00010 00000 000 00000 1110011
 mret        0011000    00010 00000 000 00000 1110011
 wfi         0001000    00101 00000 000 00000 1110011
 hfence_gvma 0110001    ..... ..... 000 00000 1110011 @hfence_gvma
diff --git a/target/riscv/insn_trans/trans_privileged.inc.c b/target/riscv/insn_trans/trans_privileged.inc.c
index b9b5a89b52..76c2fad71c 100644
--- a/target/riscv/insn_trans/trans_privileged.inc.c
+++ b/target/riscv/insn_trans/trans_privileged.inc.c
@@ -58,11 +58,6 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 #endif
 }
 
-static bool trans_hret(DisasContext *ctx, arg_hret *a)
-{
-    return false;
-}
-
 static bool trans_mret(DisasContext *ctx, arg_mret *a)
 {
 #ifndef CONFIG_USER_ONLY
-- 
2.25.0


