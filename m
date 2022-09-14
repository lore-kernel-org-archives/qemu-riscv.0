Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oYPN9-0001eO-Fy
	for mharc-qemu-riscv@gnu.org; Wed, 14 Sep 2022 06:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2494fb295=alistair.francis@wdc.com>)
 id 1oYPMz-0001Yh-2i; Wed, 14 Sep 2022 06:11:49 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:25183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2494fb295=alistair.francis@wdc.com>)
 id 1oYPMt-0005wA-Ub; Wed, 14 Sep 2022 06:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663150303; x=1694686303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vzPbS2HplCpXe09+xXDoXlh+mm4sUR6+M9HJOoGMZcQ=;
 b=h0SCjjMeRdUa7ZIY0AXNfxhATUdmOcXHfZzIWNiuecFwF83/ia0j5uzA
 IUq7XQ1zoZMcGkUW8Az0oeECJSPKaUb6Ur1cZWucTcs4gkjpREPPaQ+Qv
 7ndKoWx8jdKx1r1zR35+VtwOkyJyAnRHE3CcsBBO7CF9YYEzsQeU9rDB4
 OL9kFMMdRCscgEoIp+Mgzy/OTJzYj0LpBW2PePQNUTqDPQ1sAOPvfw3GR
 8XL/rGbPYzUZxkoYBMM7Im3kRIKsbUzBScqlK8PzMKK04VnNCY5qVpxlI
 aWm5ze7WnT8qNOPyaqqyGjetEYvoFs9o3iZ6jdxPfu5snCbT59epwNai6 Q==;
X-IronPort-AV: E=Sophos;i="5.93,315,1654531200"; d="scan'208";a="315604487"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Sep 2022 18:11:34 +0800
IronPort-SDR: 0mWV3ONn/ZkYGyXYY1NikcPW5PPxddDD2IyKcmsmTY99AbNIXwoDEVtZXP449y+NLJ2Oh97FkF
 aj0y0f3mBqXUIHFWagJCH9eyof/Vnew9gvtes7PUMWGR+6VQ4M2oLFp2tlNeIiJOwIrP8ITqMl
 0tzn1AnbQ2GsBDffGXdVQbQdUnNPwHsvfSWMqFzNSG95mUqAchcZQMpJAmcJwiGTAzFkHnkC5h
 KQA4fIU2oJMZNpm5wsris43l62TQPqr2rXY+0dDPfj29sKDe0n2QcywSXdsDvprM8/UFwjOqUH
 o2CfFYThvej+XNmQjNEYxtgC
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Sep 2022 02:26:20 -0700
IronPort-SDR: 4mY/Vy40kZfdZoZOI1K2qHHAReaUP0yWRN7F/mHsfqEPorYkduav2c5Qkc+63aYAB1ozLqCaoH
 La7JN5J6xpwh5c/9q6a1Sxw0jReyPurCI2ijnjhup6ZEIoUjO8f7lLriZpAF6YCRDQJ99ReirK
 UTy5QzS/6LWtZy446xU5wtxFr40jiVWE0SMbzwfEDqZePksK5jPJtJ7ftMmAoPo8VgzjETpSiJ
 he5PBNC6tfScsSq1J4jbrezzdnFYPxHWWl1wHKIxUCTIx4OKl1oDZT29QGvRIe93bW3DSFBDtm
 Xb4=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.107])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Sep 2022 03:11:33 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
Subject: [PATCH 1/3] target/riscv: Set the CPU resetvec directly
Date: Wed, 14 Sep 2022 12:11:06 +0200
Message-Id: <20220914101108.82571-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220914101108.82571-1-alistair.francis@wdc.com>
References: <20220914101108.82571-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=2494fb295=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 14 Sep 2022 10:11:54 -0000

Instead of using our properties to set a config value which then might
be used to set the resetvec (depending on your timing), let's instead
just set the resetvec directly in the env struct.

This allows us to set the reset vec from the command line with:
    -global driver=riscv.hart_array,property=resetvec,value=0x20000400

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h     |  3 +--
 target/riscv/cpu.c     | 13 +++----------
 target/riscv/machine.c |  6 +++---
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 06751e1e3e..22344a620b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -190,7 +190,7 @@ struct CPUArchState {
     /* This contains QEMU specific information about the virt state. */
     target_ulong virt;
     target_ulong geilen;
-    target_ulong resetvec;
+    uint64_t resetvec;
 
     target_ulong mhartid;
     /*
@@ -474,7 +474,6 @@ struct RISCVCPUConfig {
     bool pmp;
     bool epmp;
     bool debug;
-    uint64_t resetvec;
 
     bool short_isa_string;
 };
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index aee14a239a..b29c88b9f0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -228,13 +228,6 @@ static void set_vext_version(CPURISCVState *env, int vext_ver)
     env->vext_ver = vext_ver;
 }
 
-static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
-{
-#ifndef CONFIG_USER_ONLY
-    env->resetvec = resetvec;
-#endif
-}
-
 static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -336,7 +329,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
-    set_resetvec(env, DEFAULT_RSTVEC);
     cpu->cfg.mmu = false;
 }
 #endif
@@ -676,7 +668,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         riscv_set_feature(env, RISCV_FEATURE_DEBUG);
     }
 
-    set_resetvec(env, cpu->cfg.resetvec);
 
 #ifndef CONFIG_USER_ONLY
     if (cpu->cfg.ext_sstc) {
@@ -1079,7 +1070,9 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
     DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID),
 
-    DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
+#ifndef CONFIG_USER_ONLY
+    DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
+#endif
 
     DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 41098f6ad0..c4e6b3bba4 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -308,8 +308,8 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
 
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
-    .version_id = 4,
-    .minimum_version_id = 4,
+    .version_id = 5,
+    .minimum_version_id = 5,
     .post_load = riscv_cpu_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
@@ -331,7 +331,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINT32(env.features, RISCVCPU),
         VMSTATE_UINTTL(env.priv, RISCVCPU),
         VMSTATE_UINTTL(env.virt, RISCVCPU),
-        VMSTATE_UINTTL(env.resetvec, RISCVCPU),
+        VMSTATE_UINT64(env.resetvec, RISCVCPU),
         VMSTATE_UINTTL(env.mhartid, RISCVCPU),
         VMSTATE_UINT64(env.mstatus, RISCVCPU),
         VMSTATE_UINT64(env.mip, RISCVCPU),
-- 
2.37.2


