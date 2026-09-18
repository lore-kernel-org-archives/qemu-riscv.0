Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929E7C982D6
	for <qemu-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 00:46:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x7Mio-0001Ig-Mt; Thu, 17 Sep 2026 20:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7Mii-0000mu-Cj
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 20:44:52 -0400
Received: from mail-pz2-x0c.google.com ([2607:f8b0:4864:3b::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7Mie-0001sB-SX
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 20:44:52 -0400
Received: by mail-pz2-x0c.google.com with SMTP id
 41be03b00d2f7-cc515bef69dso71060a12.2
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 17:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789692287; x=1790297087; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EiZRDF3MvqH/zyAQIwrejC3deTg3BSLMstyg6mUml+k=;
 b=VbyHG7Hw8wQVGcTcamhWLUnulZGSeRfozFbvFSxPShAaojZQrGPxiZWEX5Ohc9shYA
 o6alFQ2h8HHUDqHhC2wsY9LLeLYdG8pjPQXknhrH3FMstdQxC4QdCHgelU4SKffS7kJx
 0LFBVhws4nDHmnNe8DJlGW3ofBqv6eTDrqvy+GChVZmO3Q+lI222aebL42gyMHPHitFf
 wFECt0wKI3CDGSyXnvIY59Wr9nvqXbPDawTcxOwlIOJxDqwUzO1U1IiucvHaiFC+xhPI
 bPhGIbllcryj7eEhzwRyUidOOFLrAheQJTHyGsTiZujYfcspjIetioliDLa9bTaimKeE
 DS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789692287; x=1790297087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EiZRDF3MvqH/zyAQIwrejC3deTg3BSLMstyg6mUml+k=;
 b=xKdNMuQ0Y6xTEnXvUbKlNbMWCRfkruC6Lp6LmXOQ1pUY+KdH2+I9uxXnYhE8DniqUD
 sQZDM2BoreFAKRkXyjJle81hQiTgGbS+d3uSbehc/2ipOLL6V78SMG943krQhqSObky+
 rEY6nAaw0iOAm2m05HPVQ2pHpDflxPV3OiiMDA+XolU5zAlrecdL1XXuyhhwIjFIHqsY
 UC0WqR4WCFify4EFE77joO9o2XAMc/ozPJPj/8EeKFr+yewOV9aCyKspjBvspxdiQBMm
 Y0O3j1MrY+fnjhJimxvNOzC8r+aCCbfTf4HiYfPv44jyuvWXOcH+3X2ATQwmNNN8wCFH
 GaeQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzCeNkzbcShSeMbZZ9qOyjY95fV3jU4qoFg4ZdwQkyOCJfXxVbjta2tclXO5RtRyXC0wQp+71spsmnN@nongnu.org
X-Gm-Message-State: AFuF++nLdxiF8e3KcJJMysSiWyJVqgGWwD3G357Rn9hGvkZLuaMVReex
 qurvirU5fyMG3WffeXgruubdvTYUechTU3kaxLvZD/6sJf55Vc0gDlEd
X-Gm-Gg: AYBFou28SrLQE4a8jSo3w+Jsm43LPF6B8YMeIJC6GU2lNmL5Z6ps3LPq6NQod0rPd6k
 mar0pDUH7QXcrJYd+/T8MEnbi2eKQ06a16WMzqqLuaB5zqM/oYkN4XuT4dGmM42fNvVSZWYcASk
 b1RbInUUqhj8OR7p4sBoebYiYatw0KrCuL5HD8ktap2c/eqNBmFcQFoMAwNccPkHwmrCr3AD0HU
 HomYRtr8Iyeizwstj5NWw++DCNjXMi98vDMSQ77u2B1cqj5No5toLhPPKEyQitDx2RhQT9FJh3g
 nV7YbB4g7O2p01Hcr3aLkXJZ8bJiiBmV2SR5nXXFpJYuoYYt7vzjmJY24Mh0Kjy97arkdQfC2zm
 Gtan63fydNfirJDDFxzPAqJAvL6c9HKodN+J3OuRWIMzZGwlbHB3DKHqU9tTeghHxvZGvbdQhiy
 /gzqSuJokv/keAtHAfcft6K7mSGxvMBblzwdBMUc2R8nB8VqQ3oMPvEB7pSOFLgRu8Kg5ujEkKC
 Z3fRVMNBrX0lccWifZ291UZ6T8Orz0z
X-Received: by 2002:a05:6a21:8cc8:b0:3d1:60d3:99f8 with SMTP id
 adf61e73a8af0-3dd8c3fbc65mr1606408637.5.1789692287471; 
 Thu, 17 Sep 2026 17:44:47 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-144cdfc3df2sm600286c88.5.2026.09.17.17.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 17:44:46 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Nicholas Piggin <npiggin@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Michael Rolnik <mrolnik@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, Bibo Mao <maobibo@loongson.cn>,
 Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Glenn Miles <milesg@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Song Gao <17746591750@163.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH 15/21] target/xtensa: convert exception to raise_excp
Date: Fri, 18 Sep 2026 08:42:17 +0800
Message-ID: <20260918004225.827-16-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260918004225.827-1-luoyonggang@gmail.com>
References: <20260918004225.827-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::c;
 envelope-from=luoyonggang@gmail.com; helo=mail-pz2-x0c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Store yield_needed = 0 when raising YIELD, then call
gen_helper_raise_excp with restore 0. Drop TCG exception. Keep
exception_cause helpers. C callers use xtensa_exception for the
old helper_exception body.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/xtensa/cpu.h        |  1 +
 target/xtensa/exc_helper.c | 13 +++++--------
 target/xtensa/helper.h     |  1 -
 target/xtensa/translate.c  |  7 ++++++-
 target/xtensa/win_helper.c | 12 ++++++------
 5 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 49d6ad9083d..0b2cb5a250d 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -601,6 +601,7 @@ int xtensa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 G_NORETURN void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                                MMUAccessType access_type, int mmu_idx,
                                                uintptr_t retaddr);
+G_NORETURN void xtensa_exception(CPUXtensaState *env, uint32_t excp);
 
 #define CPU_RESOLVING_TYPE TYPE_XTENSA_CPU
 
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index 7cb67d179a8..3049432f4c4 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -35,15 +35,12 @@
 #include "qemu/atomic.h"
 #include "qemu/plugin.h"
 
-void HELPER(exception)(CPUXtensaState *env, uint32_t excp)
+void xtensa_exception(CPUXtensaState *env, uint32_t excp)
 {
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = excp;
     if (excp == EXCP_YIELD) {
         env->yield_needed = 0;
     }
-    cpu_loop_exit(cs);
+    cpu_loop_exit_excp(env_cpu(env), excp, 0);
 }
 
 void HELPER(exception_cause)(CPUXtensaState *env, uint32_t pc, uint32_t cause)
@@ -66,7 +63,7 @@ void HELPER(exception_cause)(CPUXtensaState *env, uint32_t pc, uint32_t cause)
     env->sregs[EXCCAUSE] = cause;
     env->sregs[PS] |= PS_EXCM;
 
-    HELPER(exception)(env, vector);
+    xtensa_exception(env, vector);
 }
 
 void HELPER(exception_cause_vaddr)(CPUXtensaState *env,
@@ -93,7 +90,7 @@ void HELPER(debug_exception)(CPUXtensaState *env, uint32_t pc, uint32_t cause)
     env->sregs[EPS2 + level - 2] = env->sregs[PS];
     env->sregs[PS] = (env->sregs[PS] & ~PS_INTLEVEL) | PS_EXCM |
         (level << PS_INTLEVEL_SHIFT);
-    HELPER(exception)(env, EXC_DEBUG);
+    xtensa_exception(env, EXC_DEBUG);
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -116,7 +113,7 @@ void HELPER(waiti)(CPUXtensaState *env, uint32_t pc, uint32_t intlevel)
     }
 
     cpu->halted = 1;
-    HELPER(exception)(env, EXCP_HLT);
+    xtensa_exception(env, EXCP_HLT);
 }
 
 void HELPER(check_interrupts)(CPUXtensaState *env)
diff --git a/target/xtensa/helper.h b/target/xtensa/helper.h
index ae938ceedb8..4640d0da59a 100644
--- a/target/xtensa/helper.h
+++ b/target/xtensa/helper.h
@@ -1,4 +1,3 @@
-DEF_HELPER_2(exception, noreturn, env, i32)
 DEF_HELPER_3(exception_cause, noreturn, env, i32, i32)
 DEF_HELPER_4(exception_cause_vaddr, noreturn, env, i32, i32, i32)
 DEF_HELPER_3(debug_exception, noreturn, env, i32, i32)
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 175fd4b5cfc..58fbe8496aa 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -305,7 +305,12 @@ static void gen_left_shift_sar(DisasContext *dc, TCGv_i32 sa)
 
 static void gen_exception(DisasContext *dc, int excp)
 {
-    gen_helper_exception(tcg_env, tcg_constant_i32(excp));
+    if (excp == EXCP_YIELD) {
+        tcg_gen_st_i32(tcg_constant_i32(0), tcg_env,
+                       offsetof(CPUXtensaState, yield_needed));
+    }
+    gen_helper_raise_excp(tcg_env, tcg_constant_i32(excp),
+                         tcg_constant_i32(0));
 }
 
 static void gen_exception_cause(DisasContext *dc, uint32_t cause)
diff --git a/target/xtensa/win_helper.c b/target/xtensa/win_helper.c
index 4b25f8f4de7..3e4d7c0f768 100644
--- a/target/xtensa/win_helper.c
+++ b/target/xtensa/win_helper.c
@@ -125,13 +125,13 @@ void HELPER(window_check)(CPUXtensaState *env, uint32_t pc, uint32_t w)
 
     switch (ctz32(windowstart >> n)) {
     case 0:
-        HELPER(exception)(env, EXC_WINDOW_OVERFLOW4);
+        xtensa_exception(env, EXC_WINDOW_OVERFLOW4);
         break;
     case 1:
-        HELPER(exception)(env, EXC_WINDOW_OVERFLOW8);
+        xtensa_exception(env, EXC_WINDOW_OVERFLOW8);
         break;
     default:
-        HELPER(exception)(env, EXC_WINDOW_OVERFLOW12);
+        xtensa_exception(env, EXC_WINDOW_OVERFLOW12);
         break;
     }
 }
@@ -174,11 +174,11 @@ void HELPER(test_underflow_retw)(CPUXtensaState *env, uint32_t pc)
         env->sregs[EPC1] = env->pc = pc;
 
         if (n == 1) {
-            HELPER(exception)(env, EXC_WINDOW_UNDERFLOW4);
+            xtensa_exception(env, EXC_WINDOW_UNDERFLOW4);
         } else if (n == 2) {
-            HELPER(exception)(env, EXC_WINDOW_UNDERFLOW8);
+            xtensa_exception(env, EXC_WINDOW_UNDERFLOW8);
         } else if (n == 3) {
-            HELPER(exception)(env, EXC_WINDOW_UNDERFLOW12);
+            xtensa_exception(env, EXC_WINDOW_UNDERFLOW12);
         }
     }
 }
-- 
2.52.0.windows.1


