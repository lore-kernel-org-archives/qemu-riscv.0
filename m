Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUltk-0002Tl-8i
	for mharc-qemu-riscv@gnu.org; Fri, 09 Apr 2021 03:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUltg-0002Iz-B4; Fri, 09 Apr 2021 03:49:44 -0400
Received: from mail142-32.mail.alibaba.com ([198.11.142.32]:2846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUlta-0003ih-W8; Fri, 09 Apr 2021 03:49:43 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0745143|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.170168-0.000410475-0.829421;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047199; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JxL3BOG_1617954563; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JxL3BOG_1617954563) by smtp.aliyun-inc.com(10.147.40.7);
 Fri, 09 Apr 2021 15:49:25 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, wxy194768@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 07/11] target/riscv: Update CSR xtvt in CLIC mode
Date: Fri,  9 Apr 2021 15:48:53 +0800
Message-Id: <20210409074857.166082-8-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.32; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-32.mail.alibaba.com
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
X-List-Received-Date: Fri, 09 Apr 2021 07:49:44 -0000

The xtvt WARL XLEN-bit CSR holds the base address of the trap vector table,
aligned on a 64-byte or greater power-of-two boundary.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.h      |  2 ++
 target/riscv/cpu_bits.h |  2 ++
 target/riscv/csr.c      | 28 ++++++++++++++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9e389d7bbf..b5fd796f98 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -173,11 +173,13 @@ struct CPURISCVState {
     target_ulong medeleg;
 
     target_ulong stvec;
+    target_ulong stvt; /* clic-spec */
     target_ulong sepc;
     target_ulong scause;
     target_ulong sintthresh; /* clic-spec */
 
     target_ulong mtvec;
+    target_ulong mtvt; /* clic-spec */
     target_ulong mepc;
     target_ulong mcause;
     target_ulong mtval;  /* since: priv-1.10.0 */
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 9447801d22..7922097776 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -149,6 +149,7 @@
 #define CSR_MIE             0x304
 #define CSR_MTVEC           0x305
 #define CSR_MCOUNTEREN      0x306
+#define CSR_MTVT            0x307 /* clic-spec-draft */
 
 /* 32-bit only */
 #define CSR_MSTATUSH        0x310
@@ -178,6 +179,7 @@
 #define CSR_SIE             0x104
 #define CSR_STVEC           0x105
 #define CSR_SCOUNTEREN      0x106
+#define CSR_STVT            0x107 /* clic-spec-draft */
 
 /* Supervisor Trap Handling */
 #define CSR_SSCRATCH        0x140
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 39ff72041a..e12222b77f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -667,6 +667,18 @@ static int write_mcounteren(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+static int read_mtvt(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mtvt;
+    return 0;
+}
+
+static int write_mtvt(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mtvt = val & ~((1ULL << 6) - 1);
+    return 0;
+}
+
 /* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */
 static int read_mscounteren(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -876,6 +888,18 @@ static int write_scounteren(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+static int read_stvt(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->stvt;
+    return 0;
+}
+
+static int write_stvt(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->stvt = val & ~((1ULL << 6) - 1);
+    return 0;
+}
+
 /* Supervisor Trap Handling */
 static int read_sscratch(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -1730,6 +1754,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", any32,  read_zero },
 
     /* Machine Mode Core Level Interrupt Controller */
+    [CSR_MTVT] = { "mtvt", clic,  read_mtvt,  write_mtvt      },
     [CSR_MINTSTATUS] = { "mintstatus", clic,  read_mintstatus },
     [CSR_MINTTHRESH] = { "mintthresh", clic,  read_mintthresh,
                          write_mintthresh },
@@ -1739,5 +1764,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_SINTTHRESH] = { "sintthresh", clic,  read_sintthresh,
                          write_sintthresh },
 
+    /* Supervisor Mode Core Level Interrupt Controller */
+    [CSR_STVT] = { "stvt", clic,  read_stvt, write_stvt       },
+
 #endif /* !CONFIG_USER_ONLY */
 };
-- 
2.25.1


