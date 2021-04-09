Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUlth-0002Ls-Gj
	for mharc-qemu-riscv@gnu.org; Fri, 09 Apr 2021 03:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUlte-0002H1-Ij; Fri, 09 Apr 2021 03:49:42 -0400
Received: from mail142-31.mail.alibaba.com ([198.11.142.31]:13317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUlta-0003hc-Ms; Fri, 09 Apr 2021 03:49:42 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07439654|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.14363-0.000421398-0.855948;
 FP=8842789452891429954|1|1|1|0|-1|-1|-1; HT=ay29a033018047190;
 MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=6; RT=6; SR=0;
 TI=SMTPD_---.JxL3BOG_1617954563; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JxL3BOG_1617954563) by smtp.aliyun-inc.com(10.147.40.7);
 Fri, 09 Apr 2021 15:49:24 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, wxy194768@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 01/11] target/riscv: Add CLIC CSR mintstatus
Date: Fri,  9 Apr 2021 15:48:47 +0800
Message-Id: <20210409074857.166082-2-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.31; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-31.mail.alibaba.com
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
X-List-Received-Date: Fri, 09 Apr 2021 07:49:42 -0000

CSR mintstatus holds the active interrupt level for each supported
privilege mode. sintstatus, and user, uintstatus, provide restricted
views of mintstatus.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.h      |  2 ++
 target/riscv/cpu_bits.h | 11 +++++++++++
 target/riscv/csr.c      | 26 ++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0a33d387ba..1a44ca62c7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -159,6 +159,7 @@ struct CPURISCVState {
     target_ulong mip;
 
     uint32_t miclaim;
+    uint32_t mintstatus; /* clic-spec */
 
     target_ulong mie;
     target_ulong mideleg;
@@ -243,6 +244,7 @@ struct CPURISCVState {
 
     /* Fields from here on are preserved across CPU reset. */
     QEMUTimer *timer; /* Internal timer */
+    void *clic;       /* clic interrupt controller */
 };
 
 OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index caf4599207..c4ce6ec3d9 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -165,6 +165,7 @@
 #define CSR_MCAUSE          0x342
 #define CSR_MTVAL           0x343
 #define CSR_MIP             0x344
+#define CSR_MINTSTATUS      0x346 /* clic-spec-draft */
 
 /* Legacy Machine Trap Handling (priv v1.9.1) */
 #define CSR_MBADADDR        0x343
@@ -183,6 +184,7 @@
 #define CSR_SCAUSE          0x142
 #define CSR_STVAL           0x143
 #define CSR_SIP             0x144
+#define CSR_SINTSTATUS      0x146 /* clic-spec-draft */
 
 /* Legacy Supervisor Trap Handling (priv v1.9.1) */
 #define CSR_SBADADDR        0x143
@@ -585,6 +587,15 @@
 #define SIP_STIP                           MIP_STIP
 #define SIP_SEIP                           MIP_SEIP
 
+/* mintstatus */
+#define MINTSTATUS_MIL                     0xff000000 /* mil[7:0] */
+#define MINTSTATUS_SIL                     0x0000ff00 /* sil[7:0] */
+#define MINTSTATUS_UIL                     0x000000ff /* uil[7:0] */
+
+/* sintstatus */
+#define SINTSTATUS_SIL                     0x0000ff00 /* sil[7:0] */
+#define SINTSTATUS_UIL                     0x000000ff /* uil[7:0] */
+
 /* MIE masks */
 #define MIE_SEIE                           (1 << IRQ_S_EXT)
 #define MIE_UEIE                           (1 << IRQ_U_EXT)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d2585395bf..320b18ab60 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -188,6 +188,12 @@ static int pmp(CPURISCVState *env, int csrno)
 {
     return -!riscv_feature(env, RISCV_FEATURE_PMP);
 }
+
+static int clic(CPURISCVState *env, int csrno)
+{
+    return !!env->clic;
+}
+
 #endif
 
 /* User Floating-Point CSRs */
@@ -734,6 +740,12 @@ static int rmw_mip(CPURISCVState *env, int csrno, target_ulong *ret_value,
     return 0;
 }
 
+static int read_mintstatus(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mintstatus;
+    return 0;
+}
+
 /* Supervisor Trap Setup */
 static int read_sstatus(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -893,6 +905,13 @@ static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_value,
     return ret;
 }
 
+static int read_sintstatus(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    target_ulong mask = SINTSTATUS_SIL | SINTSTATUS_UIL;
+    *val = env->mintstatus & mask;
+    return 0;
+}
+
 /* Supervisor Protection and Translation */
 static int read_satp(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -1644,5 +1663,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MHPMCOUNTER29H] = { "mhpmcounter29h", any32,  read_zero },
     [CSR_MHPMCOUNTER30H] = { "mhpmcounter30h", any32,  read_zero },
     [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", any32,  read_zero },
+
+    /* Machine Mode Core Level Interrupt Controller */
+    [CSR_MINTSTATUS] = { "mintstatus", clic,  read_mintstatus },
+
+    /* Supervisor Mode Core Level Interrupt Controller */
+    [CSR_SINTSTATUS] = { "sintstatus", clic,  read_sintstatus },
+
 #endif /* !CONFIG_USER_ONLY */
 };
-- 
2.25.1


