Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vlF-0003Kx-Dz
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:50:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45191)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vke-0001yg-5G
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkc-0004Nb-QN
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:36 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:42860)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkc-0004NE-Jm
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:34 -0500
Received: by mail-pg1-x541.google.com with SMTP id h8so659988pgs.9
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=1qGfwsKWyBYxIvKWzkbg1ul+1GiM3tK10LjXLhO5Vwg=;
 b=JFj/yASJ1VDIlAMmpy/kOFdr40MDGYXlOyobybFSTCZJe2UqNIk6TX3K6EnBphdmA8
 Bz1lNThdQYivnqNnGM0yu/jrNEc+8y686NjsqkRpfuldnFwr3R6/OCwEbYbEMaDK5JHS
 elHZ/S2Fc0flVcBn1Dq5pZEwmPIlO6SEOc+cWO6P0yBL4NR8Y4ISiIu6RtC0VS/Xo8Kw
 ONT879II7Jni5a5upbKRy62hDoQrQcDZV2WemGcxXpPn+z2IH4mu0R0r5Xq2yIbsMouH
 kyl7sPG1CERcf9vrZczTDVpbIDJNKAge4TwN/yvAMwPxvxH41QBCd9axl+C62bc6EYqf
 zdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=1qGfwsKWyBYxIvKWzkbg1ul+1GiM3tK10LjXLhO5Vwg=;
 b=AEMHsfpMOSyWBSvH/Ss7AK2Il1aSIcqX1rYQ7rLIf/v7ey6aFemInEGONW0NDm5Ktq
 63bpL3yVTz5SoluEyOp5Qxg/ECW3A7uutt+25gB6vN5ezMFl30BoY5mCO+p6x0t3EbFT
 joQuJyYWnQ1gV9gekb5q7HuhsuugV6iKu0hF54HhvCJ2s4uRrk3GP0ndARrKQpXkO46x
 YH+fT7uDQlxsDBMFj2nntAil02/e/+GCYNNy4Aw6DD4lsHf6pUhDSBQ73DNzHxUYU/Bv
 paqSvobgTg54nC0Ihw5uJerlkXQhuA9nBvuJk3ssrE/A9iR5ZGacJVABUnEmRg5Izr72
 3jQg==
X-Gm-Message-State: ANhLgQ2K+V9mQH6UsffDhDOLxLtko8i5o9qUb9F5+cK2LnGZQaXimE0+
 F+HOWf/5giRwHCIZW4QNbkmT5dqH4IB+SQ==
X-Google-Smtp-Source: ADFU+vvViAr4xVkLM+WJfISm63A6yEXmJhDy2w5lddqp+NbQCUlRpqtppsnkNffqIUal2QSixYy2og==
X-Received: by 2002:a63:1e06:: with SMTP id e6mr1607568pge.134.1583196572975; 
 Mon, 02 Mar 2020 16:49:32 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id u6sm301786pjy.3.2020.03.02.16.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:32 -0800 (PST)
Subject: [PULL 21/38] target/riscv: Add hypvervisor trap support
Date: Mon,  2 Mar 2020 16:48:31 -0800
Message-Id: <20200303004848.136788-22-palmerdabbelt@google.com>
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
X-Received-From: 2607:f8b0:4864:20::541
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:37 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu_helper.c | 69 +++++++++++++++++++++++++++++++++------
 1 file changed, 59 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a8b114ae16..895b6ca25d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -641,6 +641,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
+    bool force_hs_execp = riscv_cpu_force_hs_excep_enabled(env);
+    target_ulong s;
 
     /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wide
      * so we mask off the MSB and separate into trap type and cause.
@@ -650,19 +652,14 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong deleg = async ? env->mideleg : env->medeleg;
     target_ulong tval = 0;
 
-    static const int ecall_cause_map[] = {
-        [PRV_U] = RISCV_EXCP_U_ECALL,
-        [PRV_S] = RISCV_EXCP_S_ECALL,
-        [PRV_H] = RISCV_EXCP_VS_ECALL,
-        [PRV_M] = RISCV_EXCP_M_ECALL
-    };
-
     if (!async) {
         /* set tval to badaddr for traps with address information */
         switch (cause) {
         case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
         case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
         case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
+            force_hs_execp = true;
+            /* fallthrough */
         case RISCV_EXCP_INST_ADDR_MIS:
         case RISCV_EXCP_INST_ACCESS_FAULT:
         case RISCV_EXCP_LOAD_ADDR_MIS:
@@ -680,7 +677,16 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         /* ecall is dispatched as one cause so translate based on mode */
         if (cause == RISCV_EXCP_U_ECALL) {
             assert(env->priv <= 3);
-            cause = ecall_cause_map[env->priv];
+
+            if (env->priv == PRV_M) {
+                cause = RISCV_EXCP_M_ECALL;
+            } else if (env->priv == PRV_S && riscv_cpu_virt_enabled(env)) {
+                cause = RISCV_EXCP_VS_ECALL;
+            } else if (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) {
+                cause = RISCV_EXCP_S_ECALL;
+            } else if (env->priv == PRV_U) {
+                cause = RISCV_EXCP_U_ECALL;
+            }
         }
     }
 
@@ -690,7 +696,36 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     if (env->priv <= PRV_S &&
             cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
         /* handle the trap in S-mode */
-        target_ulong s = env->mstatus;
+        if (riscv_has_ext(env, RVH)) {
+            target_ulong hdeleg = async ? env->hideleg : env->hedeleg;
+
+            if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1) &&
+                !force_hs_execp) {
+                /* Trap to VS mode */
+            } else if (riscv_cpu_virt_enabled(env)) {
+                /* Trap into HS mode, from virt */
+                riscv_cpu_swap_hypervisor_regs(env);
+                env->hstatus = set_field(env->hstatus, HSTATUS_SP2V,
+                                         get_field(env->hstatus, HSTATUS_SPV));
+                env->hstatus = set_field(env->hstatus, HSTATUS_SP2P,
+                                         get_field(env->mstatus, SSTATUS_SPP));
+                env->hstatus = set_field(env->hstatus, HSTATUS_SPV,
+                                         riscv_cpu_virt_enabled(env));
+
+                riscv_cpu_set_virt_enabled(env, 0);
+                riscv_cpu_set_force_hs_excep(env, 0);
+            } else {
+                /* Trap into HS mode */
+                env->hstatus = set_field(env->hstatus, HSTATUS_SP2V,
+                                         get_field(env->hstatus, HSTATUS_SPV));
+                env->hstatus = set_field(env->hstatus, HSTATUS_SP2P,
+                                         get_field(env->mstatus, SSTATUS_SPP));
+                env->hstatus = set_field(env->hstatus, HSTATUS_SPV,
+                                         riscv_cpu_virt_enabled(env));
+            }
+        }
+
+        s = env->mstatus;
         s = set_field(s, MSTATUS_SPIE, env->priv_ver >= PRIV_VERSION_1_10_0 ?
             get_field(s, MSTATUS_SIE) : get_field(s, MSTATUS_UIE << env->priv));
         s = set_field(s, MSTATUS_SPP, env->priv);
@@ -704,7 +739,21 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         riscv_cpu_set_mode(env, PRV_S);
     } else {
         /* handle the trap in M-mode */
-        target_ulong s = env->mstatus;
+        if (riscv_has_ext(env, RVH)) {
+            if (riscv_cpu_virt_enabled(env)) {
+                riscv_cpu_swap_hypervisor_regs(env);
+            }
+            env->mstatus = set_field(env->mstatus, MSTATUS_MPV,
+                                      riscv_cpu_virt_enabled(env));
+            env->mstatus = set_field(env->mstatus, MSTATUS_MTL,
+                                      riscv_cpu_force_hs_excep_enabled(env));
+
+            /* Trapping to M mode, virt is disabled */
+            riscv_cpu_set_virt_enabled(env, 0);
+            riscv_cpu_set_force_hs_excep(env, 0);
+        }
+
+        s = env->mstatus;
         s = set_field(s, MSTATUS_MPIE, env->priv_ver >= PRIV_VERSION_1_10_0 ?
             get_field(s, MSTATUS_MIE) : get_field(s, MSTATUS_UIE << env->priv));
         s = set_field(s, MSTATUS_MPP, env->priv);
-- 
2.25.0.265.gbab2e86ba0-goog


