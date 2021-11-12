Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mlY2f-00044E-Pj
	for mharc-qemu-riscv@gnu.org; Fri, 12 Nov 2021 10:00:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mlY2G-0003pG-5E; Fri, 12 Nov 2021 10:00:14 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:41320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mlY2C-0005vz-Fz; Fri, 12 Nov 2021 10:00:11 -0500
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 5360E41DF9;
 Fri, 12 Nov 2021 16:00:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1636729201;
 bh=tda0lmeDPTiUIR4LZFmrf943/hS5Ae7s7Whh9vZ3wZc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1zBi1i2CaLDxGfQe4wBk6CfvB3iQ9Iz4tAHIMF2YYlA0jWCxTLpLb4E6voH7PI5RE
 meYPYnDmOQzKHx+XXEjnV8mesWfHmUoDvebJYD12cht1wuHodrtcZXVT0D/IqZNYXL
 9g7jIBBlp5aoIPy6z/8UvzmpkO9i+exgJXXFeXd8+iqpzif/HqCJHrjk+46Z/XAoLS
 PkdUlwyzdVxvu10UBz7I3ZdeBjInRemN8IMSzgLc/FxjbEI5iCzEpBxLD/D8kvMNjv
 9wPKW7SaCvXfTDtY9M0bD1euwQbFrSZW8jseW1cnCWZ4MdTvRbCrFIN57hhG0k3q1f
 YDue+S2vjhNzw==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 38ABF60066;
 Fri, 12 Nov 2021 16:00:01 +0100 (CET)
Received: from palmier.tima.u-ga.fr (unknown [217.114.201.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id EDF5214005C;
 Fri, 12 Nov 2021 16:00:00 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v5 06/18] target/riscv: array for the 64 upper bits of 128-bit
 registers
Date: Fri, 12 Nov 2021 15:58:50 +0100
Message-Id: <20211112145902.205131-7-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Nov 2021 15:00:22 -0000

The upper 64-bit of the 128-bit registers have now a place inside
the cpu state structure, and are created as globals for future use.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/cpu.h       |  2 ++
 target/riscv/cpu.c       |  9 +++++++++
 target/riscv/machine.c   | 20 ++++++++++++++++++++
 target/riscv/translate.c |  5 ++++-
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0760c0af93..53a295efb7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -110,6 +110,7 @@ FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
 
 struct CPURISCVState {
     target_ulong gpr[32];
+    target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */
     uint64_t fpr[32]; /* assume both F and D extensions */
 
     /* vector coprocessor state. */
@@ -339,6 +340,7 @@ static inline bool riscv_feature(CPURISCVState *env, int feature)
 #include "cpu_user.h"
 
 extern const char * const riscv_int_regnames[];
+extern const char * const riscv_int_regnamesh[];
 extern const char * const riscv_fpr_regnames[];
 
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f812998123..364140f5ff 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -42,6 +42,15 @@ const char * const riscv_int_regnames[] = {
   "x28/t3",  "x29/t4", "x30/t5", "x31/t6"
 };
 
+const char * const riscv_int_regnamesh[] = {
+  "x0h/zeroh", "x1h/rah",  "x2h/sph",   "x3h/gph",   "x4h/tph",  "x5h/t0h",
+  "x6h/t1h",   "x7h/t2h",  "x8h/s0h",   "x9h/s1h",   "x10h/a0h", "x11h/a1h",
+  "x12h/a2h",  "x13h/a3h", "x14h/a4h",  "x15h/a5h",  "x16h/a6h", "x17h/a7h",
+  "x18h/s2h",  "x19h/s3h", "x20h/s4h",  "x21h/s5h",  "x22h/s6h", "x23h/s7h",
+  "x24h/s8h",  "x25h/s9h", "x26h/s10h", "x27h/s11h", "x28h/t3h", "x29h/t4h",
+  "x30h/t5h",  "x31h/t6h"
+};
+
 const char * const riscv_fpr_regnames[] = {
   "f0/ft0",   "f1/ft1",  "f2/ft2",   "f3/ft3",   "f4/ft4",  "f5/ft5",
   "f6/ft6",   "f7/ft7",  "f8/fs0",   "f9/fs1",   "f10/fa0", "f11/fa1",
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 7b4c739564..7e2d02457e 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -92,6 +92,14 @@ static bool pointermasking_needed(void *opaque)
     return riscv_has_ext(env, RVJ);
 }
 
+static bool rv128_needed(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+
+    return env->misa_mxl_max == MXL_RV128;
+}
+
 static const VMStateDescription vmstate_vector = {
     .name = "cpu/vector",
     .version_id = 1,
@@ -164,6 +172,17 @@ static const VMStateDescription vmstate_hyper = {
     }
 };
 
+static const VMStateDescription vmstate_rv128 = {
+    .name = "cpu/rv128",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = rv128_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINTTL_ARRAY(env.gprh, RISCVCPU, 32),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
     .version_id = 3,
@@ -218,6 +237,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_hyper,
         &vmstate_vector,
         &vmstate_pointermasking,
+        &vmstate_rv128,
         NULL
     }
 };
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b4278a6a92..00a2cfa917 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -32,7 +32,7 @@
 #include "instmap.h"
 
 /* global register indices */
-static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
+static TCGv cpu_gpr[32], cpu_gprh[32], cpu_pc, cpu_vl;
 static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
 static TCGv load_res;
 static TCGv load_val;
@@ -777,10 +777,13 @@ void riscv_translate_init(void)
      * unless you specifically block reads/writes to reg 0.
      */
     cpu_gpr[0] = NULL;
+    cpu_gprh[0] = NULL;
 
     for (i = 1; i < 32; i++) {
         cpu_gpr[i] = tcg_global_mem_new(cpu_env,
             offsetof(CPURISCVState, gpr[i]), riscv_int_regnames[i]);
+        cpu_gprh[i] = tcg_global_mem_new(cpu_env,
+            offsetof(CPURISCVState, gprh[i]), riscv_int_regnamesh[i]);
     }
 
     for (i = 0; i < 32; i++) {
-- 
2.33.1


