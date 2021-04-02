Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSQ1i-0005N2-5j
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 16:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSQ1e-0005Kz-DT; Fri, 02 Apr 2021 16:04:14 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:6350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSQ1c-0003Gm-Fo; Fri, 02 Apr 2021 16:04:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617393852; x=1648929852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nnaOQM+2NcNv78g3fsut04z6oS8XvH1D2ko3Qc9EW6k=;
 b=JjiU6bQZOnj4L8LQwGD9fYTkMDRxrVcN3UQOY3Q1BP2s50hLv+AIlfbi
 zwgU9SDdy6Xy46hu+TFQR8nryu6ORVSfnHkoVaglg427E6avu/qUVvXrV
 xbUkVUg/Swb19gDNSNxSC9L1vOX4uoWtpFDt81otLqHtN6cRwTkrlUhyG
 sk6VIC2nmOYoOoIEdR1GTWIHnGEWWuP0mhSpNXIZxKqm/5OcnjCff6VVN
 mR7LwInyZtJ7oWOEwY618jNVFKf+mCL48Vkh+J8u5NiTw6ub8+Uqn0f+Y
 QtkIcxqYzWNrsFPAM+ZKEZGYdTvAEAhyWsmvkFJD9uVBkCtVl2ghbCB8M g==;
IronPort-SDR: hEUza6W47xqzdGgYEhTshYgGSdyRvL3I1Jayiqrbl1DHyF/tDSo0SgmDU+GjKGHOmjRlyRfZzt
 LSQ7kUUgSbSqPIMUZvHIFINYLjimQ2ouzT7m9t9/ylJNZaA6v6oitYFIncyn9LQMaaOss0ZJeH
 LNp5kJs1Sn6MLlWT3RagmBN6J5j5G8klMWhWfNkOGIWN7aQv1RzB+rjHotdTV5tX9/2RN13I/E
 VELTEscQN6eZ1LVTnsCrM1ND+PSVcG/Tq8cYWg7sQQABZLjTABxU9glGyHTUyckncgegOcJdwt
 2J0=
X-IronPort-AV: E=Sophos;i="5.81,300,1610380800"; d="scan'208";a="163694224"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Apr 2021 04:04:09 +0800
IronPort-SDR: rS8NT4MGU+1NF6fdD0N9WEJU4MIelFx6mqgKm/m52gruni7zx4bhNp/LpLz1s4cfs3LOOFWbii
 ziY8RXbOh7P2X0rkgHHEnVfK2ZtNtfTr15i6/kIU/a7lsWUCD+hlYLeT9Ox3DxYU8CnRikZKPp
 xvSCqnX+c3R1/gtL5tlUBeMmRJV8RVXLWxJRSoeJ6xEVmEkbd3SHVQvO6OCAGg7rsa7zSGUv9t
 E5vv6TxqwB7fy3Rz9bXzoEt1LUdMKnUNYQhjFqTVCqB30wC7jlaU1oMkZ9U7TK7LhsqzgUaeKA
 UYe9wLuQJFQ3/urI+5nVtZO6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 12:45:50 -0700
IronPort-SDR: PdYMQt0ROtMzFxgVD2xG1+dBYWE2T0xoYgQHr6whPQEt+yjzlwcE1mGIJDAjrHUnle9Nul/y/G
 hHAH+szafYIQjhnuet3aDrSb1KqXfGbxRRcnDmRiScNMG7LI11PMkzqgn8CW+MHWc53xA/bxfD
 lTDmptivkHLgdJgDrdQpFFRm8wQ06CUl7yhcKBOMg29suI4guc6JdqyZxhw4T0I0Th674C/NG7
 1adzAbTCChFBcaYy31uYSq8oTgUTv1rNtgz0jyqrZF/V6W51Y3kOhDJs3AuqbQI8lCqzdZY5H1
 xu8=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.80])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Apr 2021 13:04:10 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 2/8] target/riscv: Remove the hardcoded SSTATUS_SD macro
Date: Fri,  2 Apr 2021 16:02:19 -0400
Message-Id: <4b26392f1626590ee9064d43df4aef590472b72d.1617393702.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617393702.git.alistair.francis@wdc.com>
References: <cover.1617393702.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7197bd837=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 02 Apr 2021 20:04:15 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 6 ------
 target/riscv/csr.c      | 9 ++++++++-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index caf4599207..969dd05eae 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -423,12 +423,6 @@
 #define SSTATUS32_SD        0x80000000
 #define SSTATUS64_SD        0x8000000000000000ULL
 
-#if defined(TARGET_RISCV32)
-#define SSTATUS_SD SSTATUS32_SD
-#elif defined(TARGET_RISCV64)
-#define SSTATUS_SD SSTATUS64_SD
-#endif
-
 /* hstatus CSR bits */
 #define HSTATUS_VSBE         0x00000020
 #define HSTATUS_GVA          0x00000040
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d2585395bf..832c3bf7fd 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -418,7 +418,7 @@ static const target_ulong delegable_excps =
     (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT));
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
-    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
+    SSTATUS_SUM | SSTATUS_MXR;
 static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP;
 static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
@@ -738,6 +738,13 @@ static int rmw_mip(CPURISCVState *env, int csrno, target_ulong *ret_value,
 static int read_sstatus(CPURISCVState *env, int csrno, target_ulong *val)
 {
     target_ulong mask = (sstatus_v1_10_mask);
+
+    if (riscv_cpu_is_32bit(env)) {
+        mask |= SSTATUS32_SD;
+    } else {
+        mask |= SSTATUS64_SD;
+    }
+
     *val = env->mstatus & mask;
     return 0;
 }
-- 
2.31.0


