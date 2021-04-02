Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSQ1g-0005MH-Rx
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 16:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSQ1c-0005KY-7t; Fri, 02 Apr 2021 16:04:12 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:6345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSQ1X-0003EZ-L0; Fri, 02 Apr 2021 16:04:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617393847; x=1648929847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bygf+OHJhJfY5LvvCxjl/+QUgctAvU4eartH1WhfniI=;
 b=bwvm+juValKvMaEWvTtadcD+/Oi8SWmrEynDc/p1OjTt5BlV2lFoTOcI
 SRnbt0deJtVfmBsnhWdLK6cCtY1uvSXYbhY3ALMZ/oZ2SM8bzgjORgpmu
 7tCP3jiyNURfoVlaTWuLDmEbOUiGuHQ14pqQBsfH9xkJFnXDwC96BE2jM
 U0k2DqROG82GDxYNxiqqncjFHtMllK1Ov81nxj6Hg0J3pbsloDjoSl/Wo
 BuywBq1L8wSjjg1Rqipp5qpmhym5FPYtDFULQeuXWgM4VUE6kl0b3oWx5
 0K7feof7QhXj+W8MuI5egHAZ7y+vqkqmMZXsDVB25eNDRaOKC04z+Xwzo Q==;
IronPort-SDR: +XqvMjbCa/YxldMZgVbZW12spkIqagb1e4XjYIpJ0PxY9UOqXz5B3svch6hC45Nnyp5Yl8WiV3
 KdKZ+mDdKRdtHqKYNEYrkwQy2znEDlVmaUp6nF3437lcjg16Q82QN6tsYHImpbIVqY1GhotVmw
 ENuB230ONgFUU/FCQggV2O5BqXT+UHvV5xgIgjxnaZ9QVfY7PPccDZa+tvtgu80ZsCJfyaMmpF
 v2baDuysvm49VG31a5nf/kW/u/RDAJb+yybIxfU1og+Il6KCgCUsYnPEGr4WAazoXnRwq7w8CZ
 uvE=
X-IronPort-AV: E=Sophos;i="5.81,300,1610380800"; d="scan'208";a="163694215"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Apr 2021 04:04:06 +0800
IronPort-SDR: 6WMUEecxhazucP8hcryXfeGDAyfa0RJ4YJ+EascE0epVMBiCnX+BNxj+ry86/E8pHuduclv+SE
 Gw0j8mBPhMockZ9AOxh2HV8qSFy7kulZp0X/uplaPg5AQoTQRJeLIiwJQNapfxR9NNiOjlrSPg
 2rSMTpF0bPGFyyrMr3cw4nITAFQhwh4IZnW7B+pSILvoJ0HQ/XVt1y/LQjomFGzhwdqsWDT0ce
 zoScGsR8dUdnByWhdWZaNYU5SGFs6SGHFIo+VURuibi2UndjqZaEags/egbuh/E0L3HGpOo1r2
 /DnO3bAqgJG4ZnHqyXQt6DAV
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 12:45:46 -0700
IronPort-SDR: wCIwtsxgHxP8a3BfMwTRRZJA/1P1J+R4hpukvSRUMcB6rnAv5amWqPqUGXnBZqCocVIzwl+ZOz
 qxEUa2HkMFbpzeAYSRFBYWDnhBfKoErhcOwBrVXUIIrZ/MYXccuuC8jRP2w9aEqnCenZgtBKue
 OXl8hgC4Km5FMVeumpyoW/B5qebLSz8kYcoUpoOYJ+IjLnXNzrLdANz9sMvKt3x/Knm9ixtlqB
 UgZ7gNCrU1EWTlw/G+6vSHxo4ciCjwStgsP50Et6/dKDg+1OeG50krB+5hDJQcQYWaDP2jN9t6
 fa0=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.80])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Apr 2021 13:04:06 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/8] target/riscv: Remove the hardcoded RVXLEN macro
Date: Fri,  2 Apr 2021 16:02:15 -0400
Message-Id: <8c175fde1809d8ca97409eb86cd3e92216e115d6.1617393702.git.alistair.francis@wdc.com>
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
X-List-Received-Date: Fri, 02 Apr 2021 20:04:13 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 6 ------
 target/riscv/cpu.c | 6 +++++-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0a33d387ba..ef838f5fbf 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -53,12 +53,6 @@
 #define RV32 ((target_ulong)1 << (TARGET_LONG_BITS - 2))
 #define RV64 ((target_ulong)2 << (TARGET_LONG_BITS - 2))
 
-#if defined(TARGET_RISCV32)
-#define RVXLEN RV32
-#elif defined(TARGET_RISCV64)
-#define RVXLEN RV64
-#endif
-
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
 #define RVI RV('I')
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d6ed80f6b..92c3195531 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -147,7 +147,11 @@ static void set_resetvec(CPURISCVState *env, int resetvec)
 static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+#if defined(TARGET_RISCV32)
+    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+#elif defined(TARGET_RISCV64)
+    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+#endif
     set_priv_version(env, PRIV_VERSION_1_11_0);
 }
 
-- 
2.31.0


