Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ixhHm-0002m0-OO
	for mharc-qemu-riscv@gnu.org; Fri, 31 Jan 2020 20:09:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56904)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhHk-0002fH-El
 for qemu-riscv@nongnu.org; Fri, 31 Jan 2020 20:09:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhHj-0006Qw-Ce
 for qemu-riscv@nongnu.org; Fri, 31 Jan 2020 20:09:20 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:17180)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhHf-0006KL-UZ; Fri, 31 Jan 2020 20:09:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1580519355; x=1612055355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JV9LwbirVJAgAd8SMVcXTJ8ffCWBRCIDZLnAyTyEOMs=;
 b=e2wVNVIuu7W2uVzhSNrPTSDycrbKvC+ybHARQcmdg9nOPqY/PNkjMZpD
 VFdYRnAF/0etOPRQwtIdKRurg7ma7p/NjKSLzwinF697G4w+XU2LGgYK0
 TWLmL1YpBegBXYnBsHUieyVOGsL+ZK/uWL72NJNsq2wwvngbILyf2yYKb
 O8ZFZciMlM4btV1P5eYRUW5HmDOHQ93+cDf7nRqVRw7VX47VOAtEiLjtJ
 ZbfhtY47rNG/5GizcbrTSnLn0Ko2sLi2n9VlGHSioEVsOdtyRHqIuKohR
 lJD/z0kINAHPD0TDU0rcCsil7ApyVRjCdHHep8Iklnbhl6EM2voTJX5Cc Q==;
IronPort-SDR: ePaoIcrbhwnV/JQ/0pvrORpfRYCXRva4yrj+1OB7uOa1VkMK5Lg3pmV6iD024dzb5FIoKo+nyU
 5sPF/9PqoE/KDzsLYwkzUAMUfvILa2sVBec2SpZqKlpuwcwXBU//P9GvV7d4uffzed98dcgLAk
 kbkGqBs+HnT80jfOKoIyqdcxXb5MUcrYes6HVOolM8pcLrAA/yc3NRikIV0pn+8gsX9mSfY1rL
 JIjPusV8zKgRhT3gCRh6+hUZJRXuL85wfpluO2v3orUN/fR9WF/z2MFHjpYOFTBCzbewyuuQ9D
 RSE=
X-IronPort-AV: E=Sophos;i="5.70,388,1574092800"; d="scan'208";a="128872462"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Feb 2020 09:08:54 +0800
IronPort-SDR: nqLmzl9vdmJ6D8KISY3Irma4fOUUfncSqVZeuw8XZgYfCBM6V7KOVSFfgwO7kFziRWCPF3kpch
 cyte7OmaZKxS9K4f4t8PLdwax2iGQH/6e3K4DhISLi4+kWdwMe9nqnzW5Q6AGFMGHjBAZzrwlt
 WAL5zp8g1ClcvsOahDLobHsf/6TPzQEzVXb0sxbxk08emV2DWnrOrjbL1CVtxQuLSSWKWkU1y9
 LwgKe4I3c7t9XcuFik9C6c0G7QME4C6R+cMbJjY2K+3F4CM5fq6fSUQ2wZUeYGFO5uabbaj6uA
 C55btBUpWybr3cBUwp29Ua/F
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 17:02:03 -0800
IronPort-SDR: jxC2OjS2FoJegBU5dMO/n8mqIirbEmr9jQXwrs77nMgZrya7tJ2Hugu7KXdyIEmb4mphOuZIGv
 bHgYOGbEeJv0Shtzkd7wGt5VHRIDj4azogv4e+j05i75XJA+zlfmOxVB5aQw8BjWPNuPUpmJh+
 FGUw2Z4Ds1xKti4YOm+UnewRKs7vVI3NF7lLLbdHwa4T0JvtPACHfFPB1qy3iJQoBgQM1HONYR
 koLupTuQdSI5LowBLrJCQnFuPqTVJxSqKWI83l0jXS20dncOGUMHQRgcbT4L2UXbq+S+8wZpru
 I9I=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip01.wdc.com with ESMTP; 31 Jan 2020 17:08:54 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v2 16/35] target/riscv: Extend the MIE CSR to support
 virtulisation
Date: Fri, 31 Jan 2020 17:02:17 -0800
Message-Id: <2c7b5ae2fe313be30565f8370a039595607605cc.1580518859.git.alistair.francis@wdc.com>
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
X-List-Received-Date: Sat, 01 Feb 2020 01:09:21 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/csr.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c0e942684d..918678789a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -244,8 +244,10 @@ static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
 #define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP)
 #define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
 
-static const target_ulong delegable_ints = S_MODE_INTERRUPTS;
-static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS;
+static const target_ulong delegable_ints = S_MODE_INTERRUPTS |
+                                           VS_MODE_INTERRUPTS;
+static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
+                                     VS_MODE_INTERRUPTS;
 static const target_ulong delegable_excps =
     (1ULL << (RISCV_EXCP_INST_ADDR_MIS)) |
     (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) |
@@ -630,13 +632,27 @@ static int write_sstatus(CPURISCVState *env, int csrno, target_ulong val)
 
 static int read_sie(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    *val = env->mie & env->mideleg;
+    if (riscv_cpu_virt_enabled(env)) {
+        /* Tell the guest the VS bits, shifted to the S bit locations */
+        *val = (env->mie & env->mideleg & VS_MODE_INTERRUPTS) >> 1;
+    } else {
+        *val = env->mie & env->mideleg;
+    }
     return 0;
 }
 
 static int write_sie(CPURISCVState *env, int csrno, target_ulong val)
 {
-    target_ulong newval = (env->mie & ~env->mideleg) | (val & env->mideleg);
+    target_ulong newval;
+
+    if (riscv_cpu_virt_enabled(env)) {
+        /* Shift the guests S bits to VS */
+        newval = (env->mie & ~VS_MODE_INTERRUPTS) |
+                 ((val << 1) & VS_MODE_INTERRUPTS);
+    } else {
+        newval = (env->mie & ~S_MODE_INTERRUPTS) | (val & S_MODE_INTERRUPTS);
+    }
+
     return write_mie(env, CSR_MIE, newval);
 }
 
-- 
2.25.0


