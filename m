Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vmM-0005TX-B4
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45458)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vl0-0002p3-LQ
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:50:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkz-0004Zx-5r
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:58 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:39799)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vky-0004YH-Vo
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:57 -0500
Received: by mail-pf1-x42c.google.com with SMTP id l7so559595pff.6
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=ViExW4PQXJd7LO12BUgC9KxGCs6Dko/AcFtuayQex/Y=;
 b=dwNgsOseV7Yy/ByVayKIBP7v1+S44/hqWYlOVSEpEI/emU6U9mYThlAI2I9TDDmqi4
 2jsSnSZHztrx/dh8zBR9uQG5C6f9PCkuMulMOc9hkrNdc+ORBB0kMLUetFLLvJ0nf4S2
 2VKkdzPjQnsbCH3nqZX1cfzQyoOaFrkJ2K4BK1A/KpO7Vczb0Su8DHL8z/9er+Pa61tV
 sItpLymQVsRaBEb7uLzNkJt8Hv2UjjbpnXeL+Ac27EP/FhNm4FRwY0Z7F0g6jYTcMSpR
 cWgl/pob+XisJQ2jA3BkrCdxO5JWTCpTTYasSfHsoqrsp9c1S640fECDmoFJ/CfR6REE
 Uq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=ViExW4PQXJd7LO12BUgC9KxGCs6Dko/AcFtuayQex/Y=;
 b=oWEa+3qKc4/Y+SuyY4dPHPHlsq+KU/yd2yV8z6sCgqAB+VLuImhb55TMd7i6ryRgSo
 KALvvWg18gMHHduJYm9d6j5TPAOOXt1Z8sldzqcSb+0B15jbuNlHs77mDw4XU3hclLhg
 kDC9nRJDOeUtmFxJ4IjZCj64aNplZ2i9HfBBNzEbhATAIp8NvLwG7Q3SZdWjrHROoNX2
 Nt9mvzNBmxD30JOqsx7JBViVf9rsK3WiKYpRn/hQ2Vz0D9oJTobPV/K6nEKz8p4/FjtD
 pk/DR4G9I53t35KZQ6h0XBf2dGfJ8vfQyavLuYZ+V4tPgurrp72gHqhybrafu2eRn/+l
 NOjg==
X-Gm-Message-State: ANhLgQ2hxX01OS5gSyL/sjOu8GocHRxfN+7IV61Qy1QYxaf0stwNSgnu
 aLrkDmxFu1JkY+VZsyH3B7j1M2VTDU+/nQ==
X-Google-Smtp-Source: ADFU+vtt9UpaViHVKRvJ+5dlGp5uamh5CvGjC4/TuCbjnCV1VLc2upZryUbHAmbEQIj5+10NwuLTFA==
X-Received: by 2002:a63:564d:: with SMTP id g13mr1485288pgm.157.1583196595567; 
 Mon, 02 Mar 2020 16:49:55 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id c2sm100071pjo.28.2020.03.02.16.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:55 -0800 (PST)
Subject: [PULL 33/38] target/riscv: Add support for the 32-bit MSTATUSH CSR
Date: Mon,  2 Mar 2020 16:48:43 -0800
Message-Id: <20200303004848.136788-34-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::42c
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
X-List-Received-Date: Tue, 03 Mar 2020 00:50:01 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu.c        |  3 +++
 target/riscv/cpu.h        | 10 ++++++++++
 target/riscv/cpu_bits.h   |  3 +++
 target/riscv/cpu_helper.c | 17 +++++++++++++++++
 target/riscv/csr.c        | 25 +++++++++++++++++++++++++
 target/riscv/op_helper.c  |  4 ++++
 6 files changed, 62 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 44ad768a84..b27066f6a7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -237,6 +237,9 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #ifndef CONFIG_USER_ONLY
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", env->mstatus);
+#ifdef TARGET_RISCV32
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatush ", env->mstatush);
+#endif
     if (riscv_has_ext(env, RVH)) {
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ", env->hstatus);
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ", env->vsstatus);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a8534fdf2b..6f9c29322a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -127,6 +127,10 @@ struct CPURISCVState {
 
     target_ulong mip;
 
+#ifdef TARGET_RISCV32
+    target_ulong mstatush;
+#endif
+
     uint32_t miclaim;
 
     target_ulong mie;
@@ -164,6 +168,9 @@ struct CPURISCVState {
     target_ulong vscause;
     target_ulong vstval;
     target_ulong vsatp;
+#ifdef TARGET_RISCV32
+    target_ulong vsstatush;
+#endif
 
     target_ulong mtval2;
     target_ulong mtinst;
@@ -176,6 +183,9 @@ struct CPURISCVState {
     target_ulong stval_hs;
     target_ulong satp_hs;
     target_ulong mstatus_hs;
+#ifdef TARGET_RISCV32
+    target_ulong mstatush_hs;
+#endif
 
     target_ulong scounteren;
     target_ulong mcounteren;
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
index d3b764e694..10f246ddf8 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -126,6 +126,11 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
         env->mstatus &= ~mstatus_mask;
         env->mstatus |= env->mstatus_hs;
 
+#if defined(TARGET_RISCV32)
+        env->vsstatush = env->mstatush;
+        env->mstatush |= env->mstatush_hs;
+#endif
+
         env->vstvec = env->stvec;
         env->stvec = env->stvec_hs;
 
@@ -149,6 +154,11 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
         env->mstatus &= ~mstatus_mask;
         env->mstatus |= env->vsstatus;
 
+#if defined(TARGET_RISCV32)
+        env->mstatush_hs = env->mstatush;
+        env->mstatush |= env->vsstatush;
+#endif
+
         env->stvec_hs = env->stvec;
         env->stvec = env->vstvec;
 
@@ -939,10 +949,17 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             if (riscv_cpu_virt_enabled(env)) {
                 riscv_cpu_swap_hypervisor_regs(env);
             }
+#ifdef TARGET_RISCV32
+            env->mstatush = set_field(env->mstatush, MSTATUS_MPV,
+                                       riscv_cpu_virt_enabled(env));
+            env->mstatush = set_field(env->mstatush, MSTATUS_MTL,
+                                       riscv_cpu_force_hs_excep_enabled(env));
+#else
             env->mstatus = set_field(env->mstatus, MSTATUS_MPV,
                                       riscv_cpu_virt_enabled(env));
             env->mstatus = set_field(env->mstatus, MSTATUS_MTL,
                                       riscv_cpu_force_hs_excep_enabled(env));
+#endif
 
             mtval2 = env->guest_phys_fault_addr;
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 2e6700bbeb..572a478e8c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -371,6 +371,27 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+#ifdef TARGET_RISCV32
+static int read_mstatush(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mstatush;
+    return 0;
+}
+
+static int write_mstatush(CPURISCVState *env, int csrno, target_ulong val)
+{
+    if ((val ^ env->mstatush) & (MSTATUS_MPV)) {
+        tlb_flush(env_cpu(env));
+    }
+
+    val &= MSTATUS_MPV | MSTATUS_MTL;
+
+    env->mstatush = val;
+
+    return 0;
+}
+#endif
+
 static int read_misa(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = env->misa;
@@ -1214,6 +1235,10 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
index 804936e9d5..dca68fa96e 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -153,7 +153,11 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
         get_field(mstatus, MSTATUS_MPIE));
     mstatus = set_field(mstatus, MSTATUS_MPIE, 1);
     mstatus = set_field(mstatus, MSTATUS_MPP, PRV_U);
+#ifdef TARGET_RISCV32
+    env->mstatush = set_field(env->mstatush, MSTATUS_MPV, 0);
+#else
     mstatus = set_field(mstatus, MSTATUS_MPV, 0);
+#endif
     env->mstatus = mstatus;
     riscv_cpu_set_mode(env, prev_priv);
 
-- 
2.25.0.265.gbab2e86ba0-goog


