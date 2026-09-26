Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71238C98332
	for <qemu-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 11:11:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xAQHH-00087i-3r; Sat, 26 Sep 2026 07:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQH2-00084v-D8
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 07:08:57 -0400
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQH0-0002lJ-Nj
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 07:08:56 -0400
Received: by mail-dl2-x0f.google.com with SMTP id
 a92af1059eb24-1450541ab18so1801761c88.0
 for <qemu-riscv@nongnu.org>; Sat, 26 Sep 2026 04:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790420933; x=1791025733; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yuLyQ2iME3Jh3tk8X2X7FeLRyZxy/E6ddgF3RJjs1U0=;
 b=hKYUqUAKuphPGN+ztjCGYskrpaRJEBMVTvyPn0kZ+3BFHcB1E4eN2QnDaPvb6jrMTe
 pEHd/BW7YEu8vMT1rWQAk2vnr+Py7/QjJjV3raAnNmcrtk2omESbJb8t5g4Su8CkxNIP
 H/M9DGnLK2o735Fp5fZ8G9DNmrpkw/VwYCXqwGRIsPzgUwGGMznrxuGwbrZSQMAg9o/e
 Z849c0zGBQd3em9arojwyL3KBRWxsGvD2Qnilez+nnBOH24chuPjItWu4IbA80o+n5Mk
 eJ5uauI/EU0ZzZhvbZvN261xhz5csF5/URjLSUzr6oAkcR0yDlA0o7DPOliVnQh4FdV0
 lM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790420933; x=1791025733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yuLyQ2iME3Jh3tk8X2X7FeLRyZxy/E6ddgF3RJjs1U0=;
 b=Caw7ty18BkolcIHQcabe4ULHeWw1RM8juw3y86EkV03/gaiuB1twld885064Okko2j
 98AZ5u/msOnRoDNKRRNZYSw0Xpg7FBhmd9vSyLZ2A+tWLQj/Q4eOeJV3cGoHtY3dTJ0n
 aHF6tQgvfSctEn7+I64GiCEtNCkVyXzFP3dXtEsu//RecUcDeD8mG7kfo0ZgM3yXts+D
 71fh1hEHfZGpppZiMHJoZJlmSiAYYkyqG5cUOuLwUw+bTzQGiYb+zNftWei0llCNjShV
 j++OOfCk6RTGC+2oZq039+E9IMl+u0tSn0fgcANaggDKkozqB38+AKMJ2jY6L8XTkTsz
 aelw==
X-Forwarded-Encrypted: i=1;
 AKwUvByLhYsfSHjOQJ8oJvHlnMTkNLISCNaAktg1D5nf+sdNyJrNmn6SOPBlm0PKQYdADCKoLOdmVXkN5t9E@nongnu.org
X-Gm-Message-State: AFuF++k0BRtCZQjy8NIMK2FhEO2+zlW6hTfeVyZ0ZHJ1HPk/W5jalH2c
 kZ20jBceae2MxPhWf9gpDPvhUss0md52u+h/e7nriiLDY/Ch5UgmCNIN
X-Gm-Gg: AYBFou2ZN0WhE8DlT3LZiSUjpMLb1VCXBxrWXjxYAXUleOFm5OZCDaPVVclxDVwmssc
 d2HyFQfeoZUsIPaabc40IdW591st1ljG6xok7jzj5NobqnWi1ou88flFjI/8zYLF9NXFR84pXXN
 PkvAAEEYUU5BGyMGsvBJlm9h9UgmRLLa2Gs+BFkg7KcLnmd0ZEU3vZg4P8kpAMdx/Dk+IFNukxw
 rux1ISGcVl6L5qcfDcKMwZFl7jc+HT7n9GWhZa+yXQvJvjUDsda4EDZPPUMYG8dAV8GeUTFKICv
 DNSar9+xNohKibLEJxQRI921CkSpyE+f72GnBr4ettuSXv3i63amlGGrgHkYJHeY/Vuuk+Rmr72
 XC+YvqFjzn5NnJsDaTpKrzzffrGiioRRarC9cXl0Na+BfEbXmTYbHb6QC5sVaNVMz1MZkCgfF+t
 oe9rkntVHGPxSiDa0kKWZOfTdN47ag4W03EakAWbwKJTqoQYGgmrGi0EgH6VRacVnLC5/yaBD0a
 2g9FjEtj5h5in6AOQfuo8wUtlZhMi4=
X-Received: by 2002:a05:7022:b0c6:b0:143:26ee:4203 with SMTP id
 a92af1059eb24-146d00b7377mr2147547c88.30.1790420932940; 
 Sat, 26 Sep 2026 04:08:52 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-145a7318afcsm11414045c88.0.2026.09.26.04.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 04:08:50 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Brian Cain <brian.cain@oss.qualcomm.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Song Gao <17746591750@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>, Ani Sinha <anisinha@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chao Liu <chao.liu@processmission.com>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 4/9] target/arm: rename raise_exception to arm_raise_exception
Date: Sat, 26 Sep 2026 19:08:12 +0800
Message-ID: <20260926110818.1912-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926110818.1912-1-luoyonggang@gmail.com>
References: <20260926110818.1912-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

raise_exception is a global C symbol. Prefix it so one binary can
keep that short name free for another target, and keep the short
name as a static inline wrapper.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/arm/internals.h     | 27 ++++++++++++++++++++-------
 target/arm/tcg-stubs.c     |  4 ++--
 target/arm/tcg/op_helper.c | 10 +++++-----
 3 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1efda543270..672fec7d52a 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -333,20 +333,33 @@ FIELD(FPMR, LSCALE2, 32, 6)
 #define M_FAKE_FSR_SFAULT 0xe /* SecureFault INVTRAN, INVEP or AUVIOL */
 
 /**
- * raise_exception: Raise the specified exception.
+ * arm_raise_exception: Raise the specified exception.
  * Raise a guest exception with the specified value, syndrome register
  * and target exception level. This should be called from helper functions,
  * and never returns because we will longjump back up to the CPU main loop.
  */
-G_NORETURN void raise_exception(CPUARMState *env, uint32_t excp,
-                                uint64_t syndrome, uint32_t target_el);
-
+G_NORETURN void arm_raise_exception(CPUARMState *env, uint32_t excp,
+                                    uint64_t syndrome, uint32_t target_el);
 /*
  * Similarly, but also use unwinding to restore cpu state.
  */
-G_NORETURN void raise_exception_ra(CPUARMState *env, uint32_t excp,
-                                   uint64_t syndrome, uint32_t target_el,
-                                   uintptr_t ra);
+G_NORETURN void arm_raise_exception_ra(CPUARMState *env, uint32_t excp,
+                                       uint64_t syndrome, uint32_t target_el,
+                                       uintptr_t ra);
+
+static inline G_NORETURN
+void raise_exception(CPUARMState *env, uint32_t excp,
+                     uint64_t syndrome, uint32_t target_el)
+{
+    arm_raise_exception(env, excp, syndrome, target_el);
+}
+
+static inline G_NORETURN
+void raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
+                        uint32_t target_el, uintptr_t ra)
+{
+    arm_raise_exception_ra(env, excp, syndrome, target_el, ra);
+}
 
 /*
  * For AArch64, map a given EL to an index in the banked_spsr array.
diff --git a/target/arm/tcg-stubs.c b/target/arm/tcg-stubs.c
index aeeede80661..7f9f684ed70 100644
--- a/target/arm/tcg-stubs.c
+++ b/target/arm/tcg-stubs.c
@@ -16,8 +16,8 @@ void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
     g_assert_not_reached();
 }
 
-void raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
-                        uint32_t target_el, uintptr_t ra)
+void arm_raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
+                            uint32_t target_el, uintptr_t ra)
 {
     g_assert_not_reached();
 }
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 643b1482523..040aeabddd5 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -45,8 +45,8 @@ int exception_target_el(CPUARMState *env)
     return target_el;
 }
 
-void raise_exception(CPUARMState *env, uint32_t excp,
-                     uint64_t syndrome, uint32_t target_el)
+void arm_raise_exception(CPUARMState *env, uint32_t excp,
+                         uint64_t syndrome, uint32_t target_el)
 {
     CPUState *cs = env_cpu(env);
 
@@ -70,8 +70,8 @@ void raise_exception(CPUARMState *env, uint32_t excp,
     cpu_loop_exit(cs);
 }
 
-void raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
-                        uint32_t target_el, uintptr_t ra)
+void arm_raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
+                            uint32_t target_el, uintptr_t ra)
 {
     CPUState *cs = env_cpu(env);
 
@@ -81,7 +81,7 @@ void raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
      * the caller passed us, and cannot use cpu_loop_exit_restore().
      */
     cpu_restore_state(cs, ra);
-    raise_exception(env, excp, syndrome, target_el);
+    arm_raise_exception(env, excp, syndrome, target_el);
 }
 
 uint64_t HELPER(neon_tbl)(CPUARMState *env, uint32_t desc,
-- 
2.52.0.windows.1


