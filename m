Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmluW-0008HH-FN
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 17:56:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmluV-0008ER-92; Tue, 08 Dec 2020 17:56:43 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:31149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmluT-0004Ed-8r; Tue, 08 Dec 2020 17:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607468201; x=1639004201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hiO2Ys+5kcsdK9CHuz7hspAu0I9PXMJVRjIvNNwHqks=;
 b=DWrTt4btOTzARZvPdFfimLjT4ibMqIzqTE9iCLZaPbh9GBqo2O/9lLMr
 w8bWe4LW6J8lkh2MombGOIcRE/IuN6z8UzTmz5DBOXgFSwd+BaEGLLYXX
 OsIC5IFOi4P3eUD7sfydpqYaTutFgpcK1o6hlb+L8yTEoI62zwpqwN3/f
 Qrln9qd/5Qufs6cgRhUfqr620/aHQsenaVlzeVYH/9tsl9DK6a/7guXef
 Mnqu2YdKxu9SHlZo6hWlCP2Wl8AIKrD+YhVE/jTuX7u09EXMXxeDLDhm+
 rMUxx8TQYoPx43IfL5zwbYcxoNjuTmj7Bv7er5Rfxcy93WYHmw6SA0k1x g==;
IronPort-SDR: ZGc6T3sGGNpHj3Y1lO3099f5ULcw4Zg58DXoEZE6jc5CSP34a6oCRg3WmQmBslV5VSL4Cb25DQ
 Sy5eMq67lM+YA3y2S5UMgj61LE/zGkBRmHrk91TI688IndjnoZhQD91zwKMLPNaKIbhU1fXT/o
 rBfMx/vwNEQQ/TAgDeQ2UGX69tkb5X9+x8P7uX5XEJ04Sbco7KqZBMEc84Ffh3u5aMUdHrZCrw
 HYvGEkf3OiHE7QmBAFXM3Xk0gJF8Xf7nKqIwJB/BwJhREbcnXUhywe0f/zfvunozU9YLa0LrV2
 cqE=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; d="scan'208";a="154713831"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 06:56:39 +0800
IronPort-SDR: 9DKp9lmp0ep+O4IujW9vx05O+qqB/OwLVW8fPJMGdW+n6SjPdcx9fRqmvUUDbozeIY8rJER30E
 RBkjzzejSuOCZuLnxBHA2w3ncmSiIOztw=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 14:42:06 -0800
IronPort-SDR: 7ZwRT1bzBH7PawCxm2Vz9LurESsYpEf1+g2p9JBUDvedfytSyRgvwAwTpOBMZBFQPgF8bJ3ASa
 fjVwX2e0mVnQ==
WDCIronportException: Internal
Received: from usa001386.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.239])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Dec 2020 14:56:39 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 11/15] target/riscv: Specify the XLEN for CPUs
Date: Tue,  8 Dec 2020 14:56:39 -0800
Message-Id: <3f1ff73c70b003826bf436ae4c937b62cac79bdc.1607467819.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607467819.git.alistair.francis@wdc.com>
References: <cover.1607467819.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=6040d5def=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 08 Dec 2020 22:56:43 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
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


