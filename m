Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWSXM-000744-DI
	for mharc-qemu-riscv@gnu.org; Tue, 13 Apr 2021 19:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lWSXK-00072O-BO; Tue, 13 Apr 2021 19:33:38 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:43243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lWSXI-0003yU-J8; Tue, 13 Apr 2021 19:33:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618356816; x=1649892816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2GP2KkOuRhA++79Wsb/FTaH9FJ2JNd2BOptkSzBRgUg=;
 b=f28hg8UVSC9Ncpl7sIBKyyvtGDCIe36W7N1jOHsFgaZMOrSqFE/KtcfG
 vVtZ6yCdaRLxn/OQbxEPgeg+MDvfDnbf1yKs/D4g8vioM2cqG6uAAXMMG
 ZPo2IYNy4+1iffKQpuz1CbrxPYPKJOsfpeWw6g4v/POy9AhXu0jaKnkcg
 f5ZEx8N/BiWpPb/qS0ZYlxt03gkCcIc9qJnl3GwAVgZnPDV1jdLrGJg0D
 g7g2/gAGWsXxev74hv2OHbwZBvL1yxBsDAjJ8GzlOEzllvixuUgT5l7eD
 PrYDCDdynOvuVtWJY54Ans997D6mdrIQLBWRJ/XJphnJ0IkRRpft2vfmB Q==;
IronPort-SDR: jTjy182L8rZ9J4gcz9C1cJFervWfUpjfdoTOIlwKyjyZV53TGBUJ4fgvF3UfLRT+89U1YTKFH+
 3WwxrV5bHmxlHKIuckE44JeU6LKa7iVxuo3OcCAjGrbKO4OxAsIS1lEzjCl+c7kKMZuxGCjkOa
 uv0x7y6FVgRmvaNT1mZJU44OeseEneQ+jLdhK8/nlP5t8YhZ64Nu4OaCnyTNHPQLtgmGbqYp+w
 VwVh2o52l6TFE39xcPAzZU8f81Trn+DZT5/MS5rnJFmz7VjqAsc6PorEmxwYX6fTDrPZbEzscF
 3ZQ=
X-IronPort-AV: E=Sophos;i="5.82,220,1613404800"; d="scan'208";a="275608563"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Apr 2021 07:33:34 +0800
IronPort-SDR: 0De7v0hMyxKkNWhJzT5scsNOIUhnPLJbg71WiSRO+u4uNlvnO/BTsZQUvxjIldS4KR04UrAR1r
 tvao8yEiVhfBRCnVB9g/O4uCvlXgPtrn1nDmVV16quFH/cxQ+HSl8zvw5DPrUVJlnpiFE83czn
 eBNQpAPQmHmIy6SSacMszmLJnFDlujm+XN3nwg6U0HsEeYtDjfw/jX8liwIlUgFrg6Ll0Jyfdu
 lTaNhqTyLXZ2gWW73KVw1yrizjARnhEXmfxSDG0ugTjvZFxT1/ID9IhRCMuJFJ/AdeR9BBM9Kb
 nKMQMcY5EMCeBahGksS04ts0
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 16:13:00 -0700
IronPort-SDR: BI2cj0kNZh5SCY942/CWMnn7+2LXJRtim4yuYrJ7nck/SIruVk9DItKpMX4rWz1NV88ODIJio3
 mLYi+5lCVIu4nBL7LLZvF4LU2JsqiY0WLHYdii3myLUAPbs3Xd/xZIiNYVOHe0sGtNdmUbvBSx
 gwJLsxVoQB/gk9JfUhr1KX+IJUUlRMmN0h9LQTFLFhU5wpe4qeR1iqariLrpqbIYQ+icR5ZDsp
 lR3kHgEtOqoCiAs6B2+EW5+XurMcRzqUcORTWLhEmHymK5aanjFSnZbLVqzkvvkr3lWEM0VGjK
 1Kg=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.17])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Apr 2021 16:33:32 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 2/9] target/riscv: Remove the hardcoded SSTATUS_SD macro
Date: Wed, 14 Apr 2021 09:33:29 +1000
Message-Id: <c699df25d8349bf9fef71c940501bff98d5f21c1.1618356725.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618356725.git.alistair.francis@wdc.com>
References: <cover.1618356725.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=730c0c5bd=alistair.francis@wdc.com;
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
X-List-Received-Date: Tue, 13 Apr 2021 23:33:38 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
2.31.1


