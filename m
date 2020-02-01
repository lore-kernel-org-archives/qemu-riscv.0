Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ixhJF-0005R9-HR
	for mharc-qemu-riscv@gnu.org; Fri, 31 Jan 2020 20:10:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57494)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhJ6-0005Mp-Qu
 for qemu-riscv@nongnu.org; Fri, 31 Jan 2020 20:10:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhJ5-0007AI-2E
 for qemu-riscv@nongnu.org; Fri, 31 Jan 2020 20:10:44 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:17177)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhJ1-0006JU-G8; Fri, 31 Jan 2020 20:10:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1580519439; x=1612055439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=THmG6Z8Iy0AS7qhVhPSh/tjhQzN/1puYu98Jb+bF4F8=;
 b=ZQIZ0tH/IFLN8uAEeLss94i/Z9TKcnzTOSP452RKe+OY/cMBIFFOxnvt
 XLprp611yoFksH4NkB81TmfvfaG1rum6Jmjn97vtnjRyiK9ukMtT69arV
 YZ0KJKWPf/Gs7FYESQGtlHRlyUWNsAV1KMkjK9+1OPCi7XbXLWh0BH2QI
 3p6Qukhdam+GRRz/94/PFc0LtuCMWD/w9ICymclC5wop+sTKe/sXPyFje
 L1DyfJEYe04A7rNIrTDhZt50EIAhr5tfotdVGjliwC4cwBvhqhcauXMOl
 RFvwQY2PdtvbZlN2c+eSAk5bpusJup7Y8cm9D6OEtewrs5XJ22pcJV0qK w==;
IronPort-SDR: XCO6KQl7eP6KjazhChtjjNQf/oiS5wJPu8qErDM2YmmkJ07clX0uPWUXpC6nHpzmPGuoLdlF26
 UO1JYxnrwaO3/n7DZ5tb/1RxTZImcO1Hw4rXkFmXKbJf2nFQ0o9cTgC6Uaa23XmaUDVKLpnPWA
 1++CQpq2iCGj80601U/wsVXihcS+2NTo5J0GUWApeve9F4wgixLiNgSQ0xoavGpvewxiQ5pQu6
 3i0Vz/xZvgRmOEklLNqy5LPh87lyZqeBPh96XZWbaYh/8LfaTwK3uygVu8fMh32R/P0cP4XlZE
 pYc=
X-IronPort-AV: E=Sophos;i="5.70,388,1574092800"; d="scan'208";a="128872496"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Feb 2020 09:09:35 +0800
IronPort-SDR: 7+zEhE5I2GKWVfw58fdXyolLOEOlJynnolLx74CscgK4Wax1IOtg/LXZILObgsiv/w2wpfi2oX
 OHtKWZJKAv7/CNPKQOotBpdItrfn8htRX6Bl3P0qq0zf8xovuvyt18N99Lx/dNgeobxupeT/oZ
 Xbau8t6Me1TCVmNsyI9sGNhQJwnLeoVB0HAg6I5DF4M/QMuyUIJPiKNr17Qh/Gpwao7k1b/m76
 5N88AIG/6euawCuAeYSlug3rGRK8WwvfE4gRDbnS1V25jTRwnXGuA3ZMRQhPehpE1pu+64iDRh
 XEe0NhBGtCmecnfsQ4m8oOIJ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 17:02:44 -0800
IronPort-SDR: feceoVqIxADoaF8zJpF9lyUTvldpwBe8TsrWS78fBT8PPH2DAZg5O7iGgPaxa121bBZMnXt+ia
 Om53I7gnGNSNkDLw/BSwa47BFRaAZ6m/ERH91aPo9PkEsdqO7kolDHDafBXbKsYBMpAiCqWrVf
 rsjcdqsjpgfbBeIQQ/j30r1zTyYqAT5OSVLPtiA05m7THF57UPs0B50GaEyDqKpNz2S4mg/0ux
 HWO56DyZGcB/yzmBBepn+0PWh9Zj1Hh44sz0DAi2g3aYjCL5xccNXs/3b0hux2vvBgcrscGluk
 nIU=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip01.wdc.com with ESMTP; 31 Jan 2020 17:09:35 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v2 31/35] target/riscv: Raise the new execptions when 2nd
 stage translation fails
Date: Fri, 31 Jan 2020 17:02:59 -0800
Message-Id: <b13f9c636f3c9fde604a27140df328ee10305078.1580518859.git.alistair.francis@wdc.com>
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
X-List-Received-Date: Sat, 01 Feb 2020 01:10:47 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu_helper.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 5f96631637..da994aba57 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -585,16 +585,28 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
     }
     switch (access_type) {
     case MMU_INST_FETCH:
-        cs->exception_index = page_fault_exceptions ?
-            RISCV_EXCP_INST_PAGE_FAULT : RISCV_EXCP_INST_ACCESS_FAULT;
+        if (riscv_cpu_virt_enabled(env) && !first_stage) {
+            cs->exception_index = RISCV_EXCP_INST_GUEST_PAGE_FAULT;
+        } else {
+            cs->exception_index = page_fault_exceptions ?
+                RISCV_EXCP_INST_PAGE_FAULT : RISCV_EXCP_INST_ACCESS_FAULT;
+        }
         break;
     case MMU_DATA_LOAD:
-        cs->exception_index = page_fault_exceptions ?
-            RISCV_EXCP_LOAD_PAGE_FAULT : RISCV_EXCP_LOAD_ACCESS_FAULT;
+        if (riscv_cpu_virt_enabled(env) && !first_stage) {
+            cs->exception_index = RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT;
+        } else {
+            cs->exception_index = page_fault_exceptions ?
+                RISCV_EXCP_LOAD_PAGE_FAULT : RISCV_EXCP_LOAD_ACCESS_FAULT;
+        }
         break;
     case MMU_DATA_STORE:
-        cs->exception_index = page_fault_exceptions ?
-            RISCV_EXCP_STORE_PAGE_FAULT : RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
+        if (riscv_cpu_virt_enabled(env) && !first_stage) {
+            cs->exception_index = RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT;
+        } else {
+            cs->exception_index = page_fault_exceptions ?
+                RISCV_EXCP_STORE_PAGE_FAULT : RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
+        }
         break;
     default:
         g_assert_not_reached();
-- 
2.25.0


