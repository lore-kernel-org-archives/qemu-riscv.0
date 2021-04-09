Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUlti-0002Nz-8m
	for mharc-qemu-riscv@gnu.org; Fri, 09 Apr 2021 03:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUltf-0002HG-35; Fri, 09 Apr 2021 03:49:43 -0400
Received: from mail142-5.mail.alibaba.com ([198.11.142.5]:56791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUlta-0003ip-TZ; Fri, 09 Apr 2021 03:49:42 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436284|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0509276-0.000424076-0.948648;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047201; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JxL3BOG_1617954563; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JxL3BOG_1617954563) by smtp.aliyun-inc.com(10.147.40.7);
 Fri, 09 Apr 2021 15:49:26 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, wxy194768@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 08/11] target/riscv: Update CSR xnxti in CLIC mode
Date: Fri,  9 Apr 2021 15:48:54 +0800
Message-Id: <20210409074857.166082-9-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.5; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-5.mail.alibaba.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Fri, 09 Apr 2021 07:49:43 -0000

The CSR can be used by software to service the next horizontal interrupt
when it has greater level than the saved interrupt context
(held in xcause`.pil`) and greater level than the interrupt threshold of
the corresponding privilege mode,

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu_bits.h |  16 ++++++
 target/riscv/csr.c      | 114 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7922097776..494e41edc9 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -166,6 +166,7 @@
 #define CSR_MCAUSE          0x342
 #define CSR_MTVAL           0x343
 #define CSR_MIP             0x344
+#define CSR_MNXTI           0x345 /* clic-spec-draft */
 #define CSR_MINTSTATUS      0x346 /* clic-spec-draft */
 #define CSR_MINTTHRESH      0x347 /* clic-spec-draft */
 
@@ -187,6 +188,7 @@
 #define CSR_SCAUSE          0x142
 #define CSR_STVAL           0x143
 #define CSR_SIP             0x144
+#define CSR_SNXTI           0x145 /* clic-spec-draft */
 #define CSR_SINTSTATUS      0x146 /* clic-spec-draft */
 #define CSR_SINTTHRESH      0x147 /* clic-spec-draft */
 
@@ -596,10 +598,24 @@
 #define MINTSTATUS_SIL                     0x0000ff00 /* sil[7:0] */
 #define MINTSTATUS_UIL                     0x000000ff /* uil[7:0] */
 
+/* mcause */
+#define MCAUSE_MINHV                       0x40000000 /* minhv */
+#define MCAUSE_MPP                         0x30000000 /* mpp[1:0] */
+#define MCAUSE_MPIE                        0x08000000 /* mpie */
+#define MCAUSE_MPIL                        0x00ff0000 /* mpil[7:0] */
+#define MCAUSE_EXCCODE                     0x00000fff /* exccode[11:0] */
+
 /* sintstatus */
 #define SINTSTATUS_SIL                     0x0000ff00 /* sil[7:0] */
 #define SINTSTATUS_UIL                     0x000000ff /* uil[7:0] */
 
+/* scause */
+#define SCAUSE_SINHV                       0x40000000 /* sinhv */
+#define SCAUSE_SPP                         0x10000000 /* spp */
+#define SCAUSE_SPIE                        0x08000000 /* spie */
+#define SCAUSE_SPIL                        0x00ff0000 /* spil[7:0] */
+#define SCAUSE_EXCCODE                     0x00000fff /* exccode[11:0] */
+
 /* MIE masks */
 #define MIE_SEIE                           (1 << IRQ_S_EXT)
 #define MIE_UEIE                           (1 << IRQ_U_EXT)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e12222b77f..72cba080bf 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -774,6 +774,80 @@ static int rmw_mip(CPURISCVState *env, int csrno, target_ulong *ret_value,
     return 0;
 }
 
+static bool get_xnxti_status(CPURISCVState *env)
+{
+    CPUState *cs = env_cpu(env);
+    int clic_irq, clic_priv, clic_il, pil;
+
+    if (!env->exccode) { /* No interrupt */
+        return false;
+    }
+    /* The system is not in a CLIC mode */
+    if (!riscv_clic_is_clic_mode(env)) {
+        return false;
+    } else {
+        riscv_clic_decode_exccode(env->exccode, &clic_priv, &clic_il,
+                                  &clic_irq);
+
+        if (env->priv == PRV_M) {
+            pil = MAX(get_field(env->mcause, MCAUSE_MPIL), env->mintthresh);
+        } else if (env->priv == PRV_S) {
+            pil = MAX(get_field(env->scause, SCAUSE_SPIL), env->sintthresh);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "CSR: rmw xnxti with unsupported mode\n");
+            exit(1);
+        }
+
+        if ((clic_priv != env->priv) || /* No horizontal interrupt */
+            (clic_il <= pil) || /* No higher level interrupt */
+            (riscv_clic_shv_interrupt(env->clic, clic_priv, cs->cpu_index,
+                                      clic_irq))) { /* CLIC vector mode */
+            return false;
+        } else {
+            return true;
+        }
+    }
+}
+
+static int rmw_mnxti(CPURISCVState *env, int csrno, target_ulong *ret_value,
+                     target_ulong new_value, target_ulong write_mask)
+{
+    int clic_priv, clic_il, clic_irq;
+    bool ready;
+    CPUState *cs = env_cpu(env);
+    if (write_mask) {
+        env->mstatus |= new_value & (write_mask & 0b11111);
+    }
+
+    qemu_mutex_lock_iothread();
+    ready = get_xnxti_status(env);
+    if (ready) {
+        riscv_clic_decode_exccode(env->exccode, &clic_priv, &clic_il,
+                                  &clic_irq);
+        if (write_mask) {
+            bool edge = riscv_clic_edge_triggered(env->clic, clic_priv,
+                                                  cs->cpu_index, clic_irq);
+            if (edge) {
+                riscv_clic_clean_pending(env->clic, clic_priv,
+                                         cs->cpu_index, clic_irq);
+            }
+            env->mintstatus = set_field(env->mintstatus,
+                                        MINTSTATUS_MIL, clic_il);
+            env->mcause = set_field(env->mcause, MCAUSE_EXCCODE, clic_irq);
+        }
+        if (ret_value) {
+            *ret_value = (env->mtvt & ~0x3f) + sizeof(target_ulong) * clic_irq;
+        }
+    } else {
+        if (ret_value) {
+            *ret_value = 0;
+        }
+    }
+    qemu_mutex_unlock_iothread();
+    return 0;
+}
+
 static int read_mintstatus(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = env->mintstatus;
@@ -982,6 +1056,44 @@ static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_value,
     return ret;
 }
 
+static int rmw_snxti(CPURISCVState *env, int csrno, target_ulong *ret_value,
+                     target_ulong new_value, target_ulong write_mask)
+{
+    int clic_priv, clic_il, clic_irq;
+    bool ready;
+    CPUState *cs = env_cpu(env);
+    if (write_mask) {
+        env->mstatus |= new_value & (write_mask & 0b11111);
+    }
+
+    qemu_mutex_lock_iothread();
+    ready = get_xnxti_status(env);
+    if (ready) {
+        riscv_clic_decode_exccode(env->exccode, &clic_priv, &clic_il,
+                                  &clic_irq);
+        if (write_mask) {
+            bool edge = riscv_clic_edge_triggered(env->clic, clic_priv,
+                                                  cs->cpu_index, clic_irq);
+            if (edge) {
+                riscv_clic_clean_pending(env->clic, clic_priv,
+                                         cs->cpu_index, clic_irq);
+            }
+            env->mintstatus = set_field(env->mintstatus,
+                                        MINTSTATUS_SIL, clic_il);
+            env->scause = set_field(env->scause, SCAUSE_EXCCODE, clic_irq);
+        }
+        if (ret_value) {
+            *ret_value = (env->stvt & ~0x3f) + sizeof(target_ulong) * clic_irq;
+        }
+    } else {
+        if (ret_value) {
+            *ret_value = 0;
+        }
+    }
+    qemu_mutex_unlock_iothread();
+    return 0;
+}
+
 static int read_sintstatus(CPURISCVState *env, int csrno, target_ulong *val)
 {
     target_ulong mask = SINTSTATUS_SIL | SINTSTATUS_UIL;
@@ -1755,6 +1867,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
 
     /* Machine Mode Core Level Interrupt Controller */
     [CSR_MTVT] = { "mtvt", clic,  read_mtvt,  write_mtvt      },
+    [CSR_MNXTI] = { "mnxti", clic,  NULL,  NULL,  rmw_mnxti   },
     [CSR_MINTSTATUS] = { "mintstatus", clic,  read_mintstatus },
     [CSR_MINTTHRESH] = { "mintthresh", clic,  read_mintthresh,
                          write_mintthresh },
@@ -1766,6 +1879,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
 
     /* Supervisor Mode Core Level Interrupt Controller */
     [CSR_STVT] = { "stvt", clic,  read_stvt, write_stvt       },
+    [CSR_SNXTI] = { "snxti", clic,  NULL,  NULL,  rmw_snxti   },
 
 #endif /* !CONFIG_USER_ONLY */
 };
-- 
2.25.1


