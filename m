Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdZly-00083V-HE
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 11:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mdZln-0007wN-A5; Thu, 21 Oct 2021 11:14:16 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:24329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mdZli-0007Ch-A1; Thu, 21 Oct 2021 11:14:14 -0400
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 19LFDCAM088677;
 Thu, 21 Oct 2021 23:13:12 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from APC301.andestech.com (10.0.12.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 21 Oct 2021
 23:13:15 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <alistair23@gmail.com>, <wangjunqiang@iscas.ac.cn>, <bmeng.cn@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>, <ycliang@andestech.com>, 
 <alankao@andestech.com>, <dylan@andestech.com>, Ruinland Chuan-Tzu Tsai
 <ruinland@andestech.com>
Subject: [RFC PATCH v5 1/3] riscv: Adding Andes A25 and AX25 cpu models
Date: Thu, 21 Oct 2021 23:09:19 +0800
Message-ID: <20211021150921.721630-2-ruinland@andestech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021150921.721630-1-ruinland@andestech.com>
References: <20211021150921.721630-1-ruinland@andestech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.12.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 19LFDCAM088677
Received-SPF: pass client-ip=60.248.187.195;
 envelope-from=ruinland@andestech.com; helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 21 Oct 2021 15:14:17 -0000

Introduce A25 and AX25 CPU model designed by Andes Technology.

Signed-off-by: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
---
 target/riscv/cpu.c | 16 ++++++++++++++++
 target/riscv/cpu.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7c626d89cd..0c93b7edd7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -168,6 +168,13 @@ static void rv64_base_cpu_init(Object *obj)
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
@@ -222,6 +229,13 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
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
@@ -789,8 +803,10 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_A25,              a25_cpu_init),
 #elif defined(TARGET_RISCV64)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_AX25,             ax25_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5896aca346..3bef0d1265 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -37,6 +37,8 @@
 #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
+#define TYPE_RISCV_CPU_A25             RISCV_CPU_TYPE_NAME("andes-a25")
+#define TYPE_RISCV_CPU_AX25             RISCV_CPU_TYPE_NAME("andes-ax25")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
 #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
-- 
2.25.1


