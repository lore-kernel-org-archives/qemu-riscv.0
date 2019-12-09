Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ieNbc-0008Lp-DW
	for mharc-qemu-riscv@gnu.org; Mon, 09 Dec 2019 13:18:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35332)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNbY-0008Hh-1i
 for qemu-riscv@nongnu.org; Mon, 09 Dec 2019 13:17:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNbW-0007tg-Kz
 for qemu-riscv@nongnu.org; Mon, 09 Dec 2019 13:17:55 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:7465)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNbT-0007jP-K1; Mon, 09 Dec 2019 13:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1575915502; x=1607451502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A+A+Q0HtpYzUSkfIwe+ZwvJnPIeWrWvg4p5bgxfxeP8=;
 b=L3TncappFQBkaM/s99JpqlUgClKTAA4elmXz/I7qR5l4aXOTE/WRpF5k
 4eNMPFMSRyDui9i0y9ELCkqCLwQn8nWZ5dvnMQhAh2eLxXRn522UKLCaG
 qMwIGX5eetCyTlKWXFjqwKH+8gvzjMJArXd8UfS6d+Ect4kXB58xycAIP
 9bxgJw6PoG+KoHsKKoSwjnbOaptaBbXxFF9hKwkWl45j190KObzOkpcls
 3u0ZbzPR019mnVQ9cs83sFHeEixHADv1OImN1N/K1z98kQ4jeke1pzzdq
 TQKLAUkSL/nBrAm4RI1AcoCniKuK+EZnIfpzregqCR0n/9V+MsuEnDxWH w==;
IronPort-SDR: BUeoeLVBlNJxRMS4v65xiclvEqf3FVTMYby1yY1YWRdEjet6djkXwDjpHaT4oC96bA6i6hdiV8
 sGq37lLcbPmrytLwDOUf118Woarccns0iEDYqWv0HHh3kcfftdNR4OiM0ban/SCh8oUO8pgtoW
 jjg/Tuex8mxSqSo5foH4Z7EJSAcBelkR59FgDvtvoLPWP3G6Z+qs0NpCr1hDDQu2ZXuVIGV9id
 NJilS3bRx1jL1kXfadCYLkdlD1OOAK1EL5LPCNX3iV+x9i23bGwA8vb4ZuoSbOTZ6KAEWsgyYJ
 Bxo=
X-IronPort-AV: E=Sophos;i="5.69,296,1571673600"; d="scan'208";a="226412045"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2019 02:18:22 +0800
IronPort-SDR: y33n3lrE0ZUfep6/WBefKmWfbXUjT8IGNIEM2pQWcK4VyrnvrLoyOJbKMgticD379z4eGU17OR
 GM1ZPCAU8mNtV667+w5wSXf8/WTmcGp1ti0FxwKD6waWZpxAkjbWIoeLM+EM2IYxiQHyckLXCg
 pd6A4v+g9aMfEkvPX5zI6Oj3GNZnXT1HFo7g5KUyI/vJyUAnOivaCA7kj8vOkP1eh6rsJZqBp+
 Hvrzehf6Ce+q6RBrTDny7/mopR/kmCYSP1hFpr0f2/0fWF8pQlUs9bOyO4dApUgJyRQIec6pi8
 W1P4Ddw60OGCDGFL5jVmnr+3
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 10:12:29 -0800
IronPort-SDR: UASVBj0j3VMhE7jfzNR0oENMiM3pGXPFMABiK3jVJRi9GqsccZCb5VYnqMdS2stXkU3oACNcuT
 vqyvfyIUfppESZROxtVgeGpPpoLP1ZuOR75TW2w9aWcUiOb+dgwORt/9/pAH1mignSZ455HbBb
 6AyrGdw13YqujPHQNkJhGFabwdxtzlvCgBgrdu2mK0MqPH52ufTVstVmL2GAnkULAI8uuY1IO2
 WM79fO81P1DmbJ1aLjgjPdvmP/0zjUa0FE3vvLkjNaOgCsKJvo3JVQbtJN9+SU/7ydJNfH+20F
 zrY=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Dec 2019 10:17:52 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v1 34/36] target/riscv: Add support for the 32-bit MSTATUSH CSR
Date: Mon,  9 Dec 2019 10:12:09 -0800
Message-Id: <2c161240299cf0f78fe676ec6b1c59e94203c324.1575914822.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1575914822.git.alistair.francis@wdc.com>
References: <cover.1575914822.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 68.232.143.124
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
X-List-Received-Date: Mon, 09 Dec 2019 18:17:58 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c        |  6 ++++++
 target/riscv/cpu.h        |  7 +++++++
 target/riscv/cpu_bits.h   |  3 +++
 target/riscv/cpu_helper.c |  7 +++++++
 target/riscv/csr.c        | 25 +++++++++++++++++++++++++
 target/riscv/op_helper.c  |  4 ++++
 6 files changed, 52 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e61cf46a73..ac8f53a49d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -237,6 +237,9 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #ifndef CONFIG_USER_ONLY
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", *env->mstatus);
+#ifdef TARGET_RISCV32
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatush ", *env->mstatush);
+#endif
     if (riscv_has_ext(env, RVH)) {
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ", env->hstatus);
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ", env->vsstatus);
@@ -473,6 +476,9 @@ static void riscv_cpu_init(Object *obj)
 
 #ifndef CONFIG_USER_ONLY
     env->mstatus = &env->mstatus_novirt;
+# ifdef TARGET_RISCV32
+    env->mstatush = &env->mstatush_novirt;
+# endif
 #endif
 }
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index b411a1f900..84a07971dc 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -127,6 +127,10 @@ struct CPURISCVState {
 
     target_ulong mip;
 
+#ifdef TARGET_RISCV32
+    target_ulong *mstatush;
+#endif
+
     uint32_t miclaim;
 
     target_ulong mie;
@@ -153,6 +157,9 @@ struct CPURISCVState {
      * required to handle the Hypervisor register swapping.
      */
     target_ulong mstatus_novirt;
+#ifdef TARGET_RISCV32
+    target_ulong mstatush_novirt;
+#endif
 
     /* Hypervisor CSRs */
     target_ulong hstatus;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index a24654d137..049032f2ae 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -135,6 +135,9 @@
 #define CSR_MTVEC           0x305
 #define CSR_MCOUNTEREN      0x306
 
+/* 32-bit only */
+#define CSR_MSTATUSH        0x310
+
 /* Legacy Counter Setup (priv v1.9.1) */
 /* Update to #define CSR_MCOUNTINHIBIT 0x320 for 1.11.0 */
 #define CSR_MUCOUNTEREN     0x320
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index aa033b8590..c2ad0bbce7 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -938,10 +938,17 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             if (riscv_cpu_virt_enabled(env)) {
                 riscv_cpu_swap_hypervisor_regs(env);
             }
+#ifdef TARGET_RISCV32
+            *env->mstatush = set_field(*env->mstatush, MSTATUS_MPV,
+                                       riscv_cpu_virt_enabled(env));
+            *env->mstatush = set_field(*env->mstatush, MSTATUS_MTL,
+                                       riscv_cpu_force_hs_excep_enabled(env));
+#else
             *env->mstatus = set_field(*env->mstatus, MSTATUS_MPV,
                                       riscv_cpu_virt_enabled(env));
             *env->mstatus = set_field(*env->mstatus, MSTATUS_MTL,
                                       riscv_cpu_force_hs_excep_enabled(env));
+#endif
 
             mtval2 = env->guest_phys_fault_addr;
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d028dfb60b..b28058f9d5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -372,6 +372,27 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+#ifdef TARGET_RISCV32
+static int read_mstatush(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = *env->mstatush;
+    return 0;
+}
+
+static int write_mstatush(CPURISCVState *env, int csrno, target_ulong val)
+{
+    if ((val ^ *env->mstatush) & (MSTATUS_MPV)) {
+        tlb_flush(env_cpu(env));
+    }
+
+    val &= MSTATUS_MPV | MSTATUS_MTL;
+
+    *env->mstatush = val;
+
+    return 0;
+}
+#endif
+
 static int read_misa(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = env->misa;
@@ -1215,6 +1236,10 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVEC] =               { any,  read_mtvec,       write_mtvec       },
     [CSR_MCOUNTEREN] =          { any,  read_mcounteren,  write_mcounteren  },
 
+#if defined(TARGET_RISCV32)
+    [CSR_MSTATUSH] =            { any,  read_mstatush,    write_mstatush    },
+#endif
+
     /* Legacy Counter Setup (priv v1.9.1) */
     [CSR_MUCOUNTEREN] =         { any,  read_mucounteren, write_mucounteren },
     [CSR_MSCOUNTEREN] =         { any,  read_mscounteren, write_mscounteren },
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index e5128570e6..a0a631d722 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -153,7 +153,11 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
         get_field(mstatus, MSTATUS_MPIE));
     mstatus = set_field(mstatus, MSTATUS_MPIE, 1);
     mstatus = set_field(mstatus, MSTATUS_MPP, 0);
+#ifdef TARGET_RISCV32
+    *env->mstatush = set_field(*env->mstatush, MSTATUS_MPV, 0);
+#else
     mstatus = set_field(mstatus, MSTATUS_MPV, 0);
+#endif
     *env->mstatus = mstatus;
     riscv_cpu_set_mode(env, prev_priv);
 
-- 
2.24.0


