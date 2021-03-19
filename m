Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNL4L-0006oB-I0
	for mharc-qemu-riscv@gnu.org; Fri, 19 Mar 2021 15:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=705762e65=atish.patra@wdc.com>)
 id 1lNL4C-0006eT-GQ; Fri, 19 Mar 2021 15:45:54 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:41239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=705762e65=atish.patra@wdc.com>)
 id 1lNL49-0004R4-SQ; Fri, 19 Mar 2021 15:45:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616183150; x=1647719150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ElhLKrmzKeIoK6/zGLH5emZdtrgr3Hc4TYbOQPg9J8k=;
 b=PYkqAXOz3y+dRTCOvxdIC2vjJvTwVBNl+kGFVuQoiZw9GmcNqZw9aG6q
 s4itkw8iQKQYfMkuXJT9nKce4lL4Lj5TieZ/17F9Il8/azBMZMlAgKSjj
 VSaXELlqXXRPt5EbWZNr2/zGVFNCR4og+SIQxzkjHapNiTkX6Q/pImLiS
 gCV7QQHGQKdz3ZwRpOsFM5KKO0SEtV014QM5UT41usbiA9fcMQKwGQKoW
 7GzoopksOSYDv0gNP6oPpD41ez9oRU1sgfuRoN1/s6NulgIfqm2KEjhf9
 2huNugeMOoqwmpsz1yth2aAbRxDLZ3zERh+JPQdCkHa4oXjqqlyWY14ld A==;
IronPort-SDR: SV/yRWK/WL1Tw3AN7KV7apVUZ4Z9jChA0dpmTdlv2kXW+0z+eE+HCdvzLbttaWYtxOuZRUG/B2
 LA00BYEr8Hm6oZ6Vxoegh2IiU99znBuXgj1hhYqc8C8wZYZkN80a2b4cC3jkdXyBA3JPYmDwPY
 pKuob0hpdUNQ4OlzciFiZdLyRCO0lxA9kSomOtbnIcfXEnVOGCCaWBJoivMwga6SZpqxezuqJ0
 OqdIKRX4f40dttobJEQLpuVEfWWueok+KqoZdJdQ6anvhnqPpDYvoj3CeNDJFXJBMsqChuzZRQ
 dLI=
X-IronPort-AV: E=Sophos;i="5.81,262,1610380800"; d="scan'208";a="273319149"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2021 03:45:42 +0800
IronPort-SDR: useaK0QsLR2xYrDZ1J09ljkmXjcXE868bv7coDgptCZgd4Yowr2xpAeDGXb2UEFzt3qz300++S
 V1TAxRcQn7u9ONef/jaJRyBkZhar1ty3W5zxl+RVM+Dk5ZQMF7BsgizwZUsWDjezUkhZWGNBQm
 3K0mW7z4cwICvlx2zGYcfqxSrmLTO3mbxIg1mXUbv5SY6Resh/kqOOE1/dBuDfWCIcapfKmTeM
 E8x07cWTIE9M3hR9mumf/x4WrHKvOP7R/1189MYcJGNLJ2Urfx+7XLHk6yCdivNRyMzmg+V2CQ
 Z0VAe7BBSo+uPRtzX/1iHgP0
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 12:27:55 -0700
IronPort-SDR: lcnJtM0qFl1VYLY5qU+amovCOBqRdkT4GZ+lO1Re3sS2d1pA8KOuDxjYB9o/HPK5zAp5eaXhwJ
 o0cZ/+PTjDvrb1NkLxbisZEidSthZdrDca769RTlSrO8poYM0EUkSAnKiQibC5DoO5tHGibELn
 57iqp4awt3i8m1AzabIJtyi9eahompCpG7f51bXxmOl1w1Rhjv4Jj/t1YilkD/AAQzgY09b31r
 hzhqBlEBhgrn3iZuKinJPJAz8kptD6e1HkM5yi7BfNM7KyxzPcZj3SOXLRIpXyX5jG97i1pcjQ
 AN8=
WDCIronportException: Internal
Received: from ind002560.ad.shared (HELO jedi-01.hgst.com) ([10.86.48.105])
 by uls-op-cesaip01.wdc.com with ESMTP; 19 Mar 2021 12:45:43 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, anup.patel@wdc.com
Subject: [ RFC 3/6] target/riscv: Support mcycle/minstret write operation
Date: Fri, 19 Mar 2021 12:45:31 -0700
Message-Id: <20210319194534.2082397-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319194534.2082397-1-atish.patra@wdc.com>
References: <20210319194534.2082397-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=705762e65=atish.patra@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Fri, 19 Mar 2021 19:45:56 -0000

mcycle/minstret are actually WARL registers and can be written with any
given value. With SBI PMU extension, it will be used to store a initial
value provided from supervisor OS. The Qemu also need prohibit the counter
increment if mcountinhibit is set.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 target/riscv/cpu.h     |   8 +++
 target/riscv/csr.c     | 111 ++++++++++++++++++++++++++++++++++-------
 target/riscv/machine.c |   4 ++
 3 files changed, 105 insertions(+), 18 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ef2a7fdc3980..47d6caeb7354 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -216,6 +216,14 @@ struct CPURISCVState {
 
     target_ulong mcountinhibit;
 
+    /* Snapshot values for mcycle & minstret */
+    target_ulong mcycle_prev;
+    target_ulong minstret_prev;
+
+    /* for RV32 */
+    target_ulong mcycleh_prev;
+    target_ulong minstreth_prev;
+
     target_ulong sscratch;
     target_ulong mscratch;
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b9d795389532..61036649b044 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -319,31 +319,106 @@ static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
 }
 
 /* User Timers and Counters */
-static int read_instret(CPURISCVState *env, int csrno, target_ulong *val)
+
+static target_ulong get_icount_ticks(bool brv32)
 {
+    int64_t val;
+    target_ulong result;
+
 #if !defined(CONFIG_USER_ONLY)
     if (icount_enabled()) {
-        *val = icount_get();
+        val = icount_get();
     } else {
-        *val = cpu_get_host_ticks();
+        val = cpu_get_host_ticks();
     }
 #else
-    *val = cpu_get_host_ticks();
+    val = cpu_get_host_ticks();
 #endif
+
+    if (brv32) {
+        result = val >> 32;
+    } else {
+        result = val;
+    }
+
+    return result;
+}
+
+static int read_cycle(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    if (get_field(env->mcountinhibit, HCOUNTEREN_CY)) {
+        /**
+         * Counter should not increment if inhibit bit is set. We can't really
+         * stop the icount counting. Just return the previous value to indicate
+         * that counter was not incremented.
+         */
+        *val = env->mcycle_prev;
+        return 0;
+    }
+
+    *val = get_icount_ticks(false);
+
+    if (*val > env->mcycle_prev)
+        *val = *val - env->mcycle_prev + env->mphmcounter_val[0];
+    else
+        /* Overflow scenario */
+        *val = UINT64_MAX - env->mcycle_prev + 1 + env->mphmcounter_val[0] + *val;
+
+    return 0;
+}
+
+static int read_instret(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    if (get_field(env->mcountinhibit, HCOUNTEREN_IR)) {
+        *val = env->minstret_prev;
+        return 0;
+    }
+
+    *val = get_icount_ticks(false);
+
+    if (*val > env->minstret_prev)
+        *val = *val - env->minstret_prev + env->mphmcounter_val[2];
+    else
+        /* Overflow scenario */
+        *val = UINT64_MAX - env->minstret_prev + 1 + env->mphmcounter_val[2] + *val;
+
+    return 0;
+}
+
+static int read_cycleh(CPURISCVState *env, int csrno, target_ulong *val)
+{
+
+    if (get_field(env->mcountinhibit, HCOUNTEREN_CY)) {
+        *val = env->mcycleh_prev;
+        return 0;
+    }
+
+    *val = get_icount_ticks(true);
+
+    if (*val > env->mcycleh_prev)
+        *val = *val - env->mcycleh_prev + env->mphmcounterh_val[0];
+    else
+        /* Overflow scenario */
+        *val = UINT32_MAX - env->mcycleh_prev + 1 + env->mphmcounterh_val[0] + *val;
+
     return 0;
 }
 
 static int read_instreth(CPURISCVState *env, int csrno, target_ulong *val)
 {
-#if !defined(CONFIG_USER_ONLY)
-    if (icount_enabled()) {
-        *val = icount_get() >> 32;
-    } else {
-        *val = cpu_get_host_ticks() >> 32;
+    if (get_field(env->mcountinhibit, HCOUNTEREN_IR)) {
+        *val = env->minstreth_prev;
+        return 0;
     }
-#else
-    *val = cpu_get_host_ticks() >> 32;
-#endif
+
+    *val = get_icount_ticks(true);
+
+    if (*val > env->minstreth_prev)
+        *val = *val - env->minstreth_prev + env->mphmcounterh_val[2];
+    else
+        /* Overflow scenario */
+        *val = UINT32_MAX - env->minstreth_prev + 1 + env->mphmcounterh_val[2] + *val;
+
     return 0;
 }
 
@@ -1383,9 +1458,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VL]       = { "vl",       vs,     read_vl                    },
     [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
     /* User Timers and Counters */
-    [CSR_CYCLE]    = { "cycle",    ctr,    read_instret  },
+    [CSR_CYCLE]    = { "cycle",    ctr,    read_cycle  },
     [CSR_INSTRET]  = { "instret",  ctr,    read_instret  },
-    [CSR_CYCLEH]   = { "cycleh",   ctr32,  read_instreth },
+    [CSR_CYCLEH]   = { "cycleh",   ctr32,  read_cycleh },
     [CSR_INSTRETH] = { "instreth", ctr32,  read_instreth },
 
     /*
@@ -1397,10 +1472,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
 
 #if !defined(CONFIG_USER_ONLY)
     /* Machine Timers and Counters */
-    [CSR_MCYCLE]    = { "mcycle",    any,   read_instret  },
-    [CSR_MINSTRET]  = { "minstret",  any,   read_instret  },
-    [CSR_MCYCLEH]   = { "mcycleh",   any32, read_instreth },
-    [CSR_MINSTRETH] = { "minstreth", any32, read_instreth },
+    [CSR_MCYCLE]    = { "mcycle",    any,   read_cycle  , write_mhpmcounter},
+    [CSR_MINSTRET]  = { "minstret",  any,   read_instret, write_mhpmcounter},
+    [CSR_MCYCLEH]   = { "mcycleh",   any32, read_cycleh , write_mhpmcounterh},
+    [CSR_MINSTRETH] = { "minstreth", any32, read_instreth , write_mhpmcounterh},
 
     /* Machine Information Registers */
     [CSR_MVENDORID] = { "mvendorid", any,   read_zero    },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index cb7ec8a4c656..b1410419cc1f 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -178,6 +178,10 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.scounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
+        VMSTATE_UINTTL(env.mcycle_prev, RISCVCPU),
+        VMSTATE_UINTTL(env.mcycleh_prev, RISCVCPU),
+        VMSTATE_UINTTL(env.minstret_prev, RISCVCPU),
+        VMSTATE_UINTTL(env.minstreth_prev, RISCVCPU),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
         VMSTATE_UINTTL(env.mscratch, RISCVCPU),
         VMSTATE_UINT64(env.mfromhost, RISCVCPU),
-- 
2.25.1


