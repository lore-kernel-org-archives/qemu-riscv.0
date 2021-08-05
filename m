Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBhcA-0007xR-7P
	for mharc-qemu-riscv@gnu.org; Thu, 05 Aug 2021 13:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mBhc5-0007gt-LZ; Thu, 05 Aug 2021 13:57:01 -0400
Received: from exmail.andestech.com ([60.248.187.195]:61474
 helo=ATCSQR.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mBhc0-0007tv-9N; Thu, 05 Aug 2021 13:57:01 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 175HuewN055963;
 Fri, 6 Aug 2021 01:56:41 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Fri, 6 Aug 2021 01:56:43 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <ruinland@andestech.com>, <wangjunqiang@iscas.ac.cn>,
 <bin.meng@windriver.com>, Dylan Jhong <dylan@andestech.com>
Subject: [RFC PATCH v4 3/4] Adding Andes AX25 and A25 CPU model
Date: Fri, 6 Aug 2021 01:56:25 +0800
Message-ID: <20210805175626.11573-4-ruinland@andestech.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20210805175626.11573-1-ruinland@andestech.com>
References: <20210805175626.11573-1-ruinland@andestech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 175HuewN055963
Received-SPF: pass client-ip=60.248.187.195;
 envelope-from=ruinland@andestech.com; helo=ATCSQR.andestech.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 05 Aug 2021 17:57:02 -0000

From: Ruinalnd ChuanTzu Tsai <ruinland@andestech.com>

Adding Andes AX25 and A25 CPU model into cpu.h and cpu.c without
enhanced features (yet).

Signed-off-by: Dylan Jhong <dylan@andestech.com>
---
 target/riscv/cpu.c | 16 ++++++++++++++++
 target/riscv/cpu.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3a638b5..9eb1e3a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -182,6 +182,13 @@ static void rv64_base_cpu_init(Object *obj)
     set_misa(env, RV64);
 }
 
+static void ax25_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_priv_version(env, PRIV_VERSION_1_10_0);
+}
+
 static void rv64_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -235,6 +242,13 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     set_resetvec(env, DEFAULT_RSTVEC);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
+
+static void a25_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_priv_version(env, PRIV_VERSION_1_10_0);
+}
 #endif
 
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
@@ -726,8 +740,10 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_A25,              a25_cpu_init),
 #elif defined(TARGET_RISCV64)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_AX25,             ax25_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 52df9bb..bd79d63 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -37,6 +37,8 @@
 #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
+#define TYPE_RISCV_CPU_A25              RISCV_CPU_TYPE_NAME("andes-a25")
+#define TYPE_RISCV_CPU_AX25             RISCV_CPU_TYPE_NAME("andes-ax25")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
 #define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
-- 
2.32.0


