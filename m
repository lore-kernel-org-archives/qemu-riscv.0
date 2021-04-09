Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUlto-0002fT-Aw
	for mharc-qemu-riscv@gnu.org; Fri, 09 Apr 2021 03:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUlti-0002Pk-PU; Fri, 09 Apr 2021 03:49:46 -0400
Received: from mail142-22.mail.alibaba.com ([198.11.142.22]:31561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUltb-0003hJ-2R; Fri, 09 Apr 2021 03:49:46 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07452568|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.246224-0.00021039-0.753566;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047187; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JxL3BOG_1617954563; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JxL3BOG_1617954563) by smtp.aliyun-inc.com(10.147.40.7);
 Fri, 09 Apr 2021 15:49:24 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, wxy194768@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 02/11] target/riscv: Update CSR xintthresh in CLIC mode
Date: Fri,  9 Apr 2021 15:48:48 +0800
Message-Id: <20210409074857.166082-3-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.22; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-22.mail.alibaba.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 09 Apr 2021 07:49:47 -0000

The interrupt-level threshold (xintthresh) CSR holds an 8-bit field
for the threshold level of the associated privilege mode.

For horizontal interrupts, only the ones with higher interrupt levels
than the threshold level are allowed to preempt.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.h      |  2 ++
 target/riscv/cpu_bits.h |  2 ++
 target/riscv/csr.c      | 28 ++++++++++++++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1a44ca62c7..a5eab26a69 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -160,6 +160,7 @@ struct CPURISCVState {
 
     uint32_t miclaim;
     uint32_t mintstatus; /* clic-spec */
+    target_ulong mintthresh; /* clic-spec */
 
     target_ulong mie;
     target_ulong mideleg;
@@ -173,6 +174,7 @@ struct CPURISCVState {
     target_ulong stvec;
     target_ulong sepc;
     target_ulong scause;
+    target_ulong sintthresh; /* clic-spec */
 
     target_ulong mtvec;
     target_ulong mepc;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index c4ce6ec3d9..9447801d22 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -166,6 +166,7 @@
 #define CSR_MTVAL           0x343
 #define CSR_MIP             0x344
 #define CSR_MINTSTATUS      0x346 /* clic-spec-draft */
+#define CSR_MINTTHRESH      0x347 /* clic-spec-draft */
 
 /* Legacy Machine Trap Handling (priv v1.9.1) */
 #define CSR_MBADADDR        0x343
@@ -185,6 +186,7 @@
 #define CSR_STVAL           0x143
 #define CSR_SIP             0x144
 #define CSR_SINTSTATUS      0x146 /* clic-spec-draft */
+#define CSR_SINTTHRESH      0x147 /* clic-spec-draft */
 
 /* Legacy Supervisor Trap Handling (priv v1.9.1) */
 #define CSR_SBADADDR        0x143
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 320b18ab60..4c31364967 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -746,6 +746,18 @@ static int read_mintstatus(CPURISCVState *env, int csrno, target_ulong *val)
     return 0;
 }
 
+static int read_mintthresh(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mintthresh;
+    return 0;
+}
+
+static int write_mintthresh(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mintthresh = val;
+    return 0;
+}
+
 /* Supervisor Trap Setup */
 static int read_sstatus(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -912,6 +924,18 @@ static int read_sintstatus(CPURISCVState *env, int csrno, target_ulong *val)
     return 0;
 }
 
+static int read_sintthresh(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->sintthresh;
+    return 0;
+}
+
+static int write_sintthresh(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->sintthresh = val;
+    return 0;
+}
+
 /* Supervisor Protection and Translation */
 static int read_satp(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -1666,9 +1690,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
 
     /* Machine Mode Core Level Interrupt Controller */
     [CSR_MINTSTATUS] = { "mintstatus", clic,  read_mintstatus },
+    [CSR_MINTTHRESH] = { "mintthresh", clic,  read_mintthresh,
+                         write_mintthresh },
 
     /* Supervisor Mode Core Level Interrupt Controller */
     [CSR_SINTSTATUS] = { "sintstatus", clic,  read_sintstatus },
+    [CSR_SINTTHRESH] = { "sintthresh", clic,  read_sintthresh,
+                         write_sintthresh },
 
 #endif /* !CONFIG_USER_ONLY */
 };
-- 
2.25.1


