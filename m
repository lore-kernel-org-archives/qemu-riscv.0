Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrLvZ-0004lC-Ar
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 10:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1lrLvX-0004h2-6z; Thu, 10 Jun 2021 10:44:59 -0400
Received: from exmail.andestech.com ([60.248.187.195]:42446
 helo=ATCSQR.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1lrLvT-0000CB-Vc; Thu, 10 Jun 2021 10:44:58 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 15AEiVC1035892;
 Thu, 10 Jun 2021 22:44:31 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 10 Jun 2021
 22:44:33 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <alistair23@gmail.com>, <wangjunqiang@iscas.ac.cn>,
 <bin.meng@windriver.com>, <alankao@andestech.com>,
 <dylan@andestech.com>, Ruinaldn ChuanTzu Tsai <ruinland@andestech.com>
Subject: [RFC PATCH v3 1/2] Adding Andes AX25 CPU model
Date: Thu, 10 Jun 2021 22:44:23 +0800
Message-ID: <20210610144424.8658-2-ruinland@andestech.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20210610144424.8658-1-ruinland@andestech.com>
References: <20210610144424.8658-1-ruinland@andestech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 15AEiVC1035892
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
X-List-Received-Date: Thu, 10 Jun 2021 14:44:59 -0000

From: Ruinaldn ChuanTzu Tsai <ruinland@andestech.com>

Adding the skeleton of Andes Technology AX25 CPU model for the future commits,
which will utilize custom/vendor CSR handling mechaism.
---
 target/riscv/cpu.c | 8 ++++++++
 target/riscv/cpu.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddea8fbeeb..4ae21cbf9b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -159,6 +159,13 @@ static void rv64_base_cpu_init(Object *obj)
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
@@ -705,6 +712,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
 #elif defined(TARGET_RISCV64)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_AX25,             ax25_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0edb2826a2..bff9af7f3f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -37,6 +37,7 @@
 #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
+#define TYPE_RISCV_CPU_AX25             RISCV_CPU_TYPE_NAME("andes-ax25")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
 #define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
-- 
2.31.1


