Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpbS6-0005qh-4R
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 13:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbS0-0005mU-56; Wed, 16 Dec 2020 13:23:02 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:19131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRw-0000Mi-MS; Wed, 16 Dec 2020 13:22:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608142976; x=1639678976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T3BMTi955AQgyuWVuVPGYtk2E2wUw4FfzH/P2U82/hc=;
 b=oYEltYjcz57KfxF8HRtyi2nC4vsvXtDj8s9l2PXxxUi9BqfRmqerxo2L
 ld3ZezFv29m0Bw5/nh3WRU9k9tkiU9QL+BFTr04jhwwEcnBFBM7IDm6/w
 xtXRq5QEfEeO8aoOK1ONp0rDcg8QmVpRN+ImWJH7hjMjDY8AhqyW7UTNE
 P4p1hOykgkW2aOFClFkJfYTEPlv7YGhysSE7cc5iTYsy9xw8U2SGfueYf
 7TkhoOgZCIPX6hZBvbcHwQ2eWaLjqLvGt2YWMvTK/MgUUK5Uv5kLzN2ZB
 s6TelVUOZAXQ6SayP9OG673p/12l31sFu5LeJ6srXBoXOy7t6TqKS4T3T w==;
IronPort-SDR: PSXbTeYgXqOJlbc92hufD7tGQI9euEM6SfyYGKNZ19VUTwTQxuhYcjx4rg4o8fJ1BS0D90X+Nj
 nNoWyQM5MW7hiES2huI8O7vYA+UEsnhY6cNlwtQBB5L57eTQuZBJV5txesl8kvTFScAC5rLV4G
 xbDd1T2btmVnbWWr0ZmrgOWGKVsKBL24d4WXbacBuVvzbgzcKn9RBwfq4YF8itYjRpRIm5qGQ9
 WCNXYq2rFKcY09irhVZF4eNNEzS+mm7q0VljOFr4bxCjelfpz0ZdB1Cuu0OY8yNZ72eni4XAvr
 j6U=
X-IronPort-AV: E=Sophos;i="5.78,425,1599494400"; d="scan'208";a="159755928"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 02:22:54 +0800
IronPort-SDR: paHlylp3ZoTPVlPvYzCyNH+uBMyqOAUCBxksIyoTPso/rOs+kBHXxSGCcAk7yAKio8pi6PzOA6
 t2mpj2JvYN+TRp8ia8t6rPAHTmRQ5QdH4l82B22TvRaHCXG6L/FuDHBKnlflSzKf1Tc4yEGPwv
 nANuOwmvX2v1nxf0f07tTDBfvhVnPmpkbDWIQM3iICHiSIbA4Oca3/WyWjThIx0t4g5V7yOF3O
 VvdzBSLG9DGH6uyCQ4YYmr853SuNl1mbmnEWherbxvLNir6IRpzTESBVkuaoUD1uRMWbrbmTXB
 GjUEGwY3l9sLFhYE8h7fxDa5
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 10:08:11 -0800
IronPort-SDR: oOA6FZxwW2yKKtGhnjpbFqRPG/60ar0+PlDGl3EujrCkDqGwbI+i5gtmdK1j9a8A2Z/33JAVmh
 b2jVxc6NYwZXUrjpEyb2W6hN5NgmQIzJgrBoZeGYRFjfvCLO+zVn5qjV0ZIXmUYLu8BLXEf2rs
 xG12WvIgifmXW9OQb/FB0ynHuCOtT5DYZHTMCUy9EOMiUvuBUxuksdgIM/i3I8P+2GBtdTDuXu
 ORHvFlYQyOzvUMvfrkLYLyTEa3cXUo0v+ny48z2OGiWc3gv+55YrSF6wSsUcT6V0NqqwGnKsTh
 MVw=
WDCIronportException: Internal
Received: from 1996l72.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.67])
 by uls-op-cesaip01.wdc.com with ESMTP; 16 Dec 2020 10:22:55 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 11/16] target/riscv: Specify the XLEN for CPUs
Date: Wed, 16 Dec 2020 10:22:54 -0800
Message-Id: <c1da66affbb83ec4a2fbeb0194293bd24d65f5dc.1608142916.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608142916.git.alistair.francis@wdc.com>
References: <cover.1608142916.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=612374860=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Wed, 16 Dec 2020 18:23:04 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 32a6916b8a..7d6f032122 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -158,22 +158,36 @@ static void riscv_base_cpu_init(Object *obj)
     set_misa(env, 0);
 }
 
-static void rvxx_sifive_u_cpu_init(Object *obj)
+#ifdef TARGET_RISCV64
+static void rv64_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
 }
 
-static void rvxx_sifive_e_cpu_init(Object *obj)
+static void rv64_sifive_e_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RVXLEN | RVI | RVM | RVA | RVC | RVU);
+    set_misa(env, RV64 | RVI | RVM | RVA | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
+#else
+static void rv32_sifive_u_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_priv_version(env, PRIV_VERSION_1_10_0);
+}
 
-#if defined(TARGET_RISCV32)
+static void rv32_sifive_e_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    set_misa(env, RV32 | RVI | RVM | RVA | RVC | RVU);
+    set_priv_version(env, PRIV_VERSION_1_10_0);
+    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
+}
 
 static void rv32_ibex_cpu_init(Object *obj)
 {
@@ -191,7 +205,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     set_resetvec(env, DEFAULT_RSTVEC);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
-
 #endif
 
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
@@ -643,13 +656,13 @@ static const TypeInfo riscv_cpu_type_infos[] = {
 #if defined(TARGET_RISCV32)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           riscv_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rvxx_sifive_e_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rvxx_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
 #elif defined(TARGET_RISCV64)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           riscv_base_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rvxx_sifive_e_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rvxx_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
 #endif
 };
 
-- 
2.29.2


