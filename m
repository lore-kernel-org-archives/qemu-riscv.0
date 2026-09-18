Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA6CC982D2
	for <qemu-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 00:47:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x7Mjh-0003hs-BB; Thu, 17 Sep 2026 20:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7MjR-0002us-JR
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 20:45:39 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7MjN-0002F9-SA
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 20:45:37 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-39647184c73so1158362a91.1
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 17:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789692332; x=1790297132; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2ZQlCritT5ST6lAKH65v6Q2V3oGgF6pb76UAV2239hY=;
 b=a5e2T1zKwW7UwCiOBHxtCz+dd6IRqDtePWDaV83M7bUdm3gc0WhBto2ykkyk6vSgSx
 ABWTdWHv8zQdFJcbCxtgoq4RzsLKE0x1cNg57optXbN5VU93yLdGE1hMEl1wOxF+g8xp
 15EHsnHHypy2+XuBTAOCkRSc4tsL1LCGO//uufhWD+o+q1ZUrDssuwYVI32i1y1n09Eu
 YJr4b3nPD6Ztt90tUbQRa09uiL1VqsMcLZPHu3DTp+6/ppsImc9NsVzIVV+CuInn1rpi
 jQXmgdLr9fqJU/GGSpRteTuO098UgtphI/Y9SeiUvMc/FsxtBKYjWkV1r1X4Cti0KMjb
 sQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789692332; x=1790297132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2ZQlCritT5ST6lAKH65v6Q2V3oGgF6pb76UAV2239hY=;
 b=X4sy9j4qN7evYH8H6kFnh5oc+iDOFrHOKbTnd59ooj5G6rADwgeyfnpLbR96uY3DuA
 kSymUAwebtz0jBBUyjnJad8EyPu9BqNTqBd1zvlAt8tcj5kCvorC+814A63s8OyK6LUh
 2Pe0yzl8BilhF4cxaSMXRjemOtnJGcOZ+ojpmO2xZkJKBczeL0SoNpUnoXCkM8OvKdIE
 VHJVBu3ccJWhInbnJOfAND/z0qyUkR+1g5JZLMzgHudA9EPoZpNt45rsvMicjGL5Ujwx
 jDf7KgK7nR8ydgqgP7NMkaJdN0aFJN8ZZqxJkQHZc/msfGR+ZXQTuM6fI2Ie+78X69T2
 Bl6A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwjAHLHxJL/5tgv+wQ3aSc+UNnk9tzxD6qiCeR9yaB0LaUmd2qpP89SkNdMhJ7P4cAVEPkYeeQFtBWV@nongnu.org
X-Gm-Message-State: AFuF++lvykYzZOyRK7LhxYkPOrALxB+tOcm8dOTv5CuPDw3VUb0DEorg
 WPoBANIFzt8BpT0lojkbUv8eJAcgo32RJze4Ry4VYdrjv7HnsGHn3zb8
X-Gm-Gg: AYBFou19JehlT1o6iOXjJ76o0AXV0DP8JaTPJne7lItBDufiToXlhpxREcluW+hX5g9
 rljoW3g00KmUahGoPGzat3QaX0cBHe4YtH0GUi3RxMV0JXAvWd59bKt3mLKO9kgQ3mX1/Bh7qp0
 0iUqZwz7gBeXPaimcyuu0Q8DxQrB/UIjl6tjL2UG6gPZi50kDCHJ6f7Gyfb2zSc3ql3jKkUZWqH
 m6siT9fGxhE0Bhi08rY4HuVqxdZRSBJ1ZsBkPEqzBb5fKss/JggpxXLMqdFHz4agcUPFhEunBu9
 WMVIJO/H4tzk6Bbe8jute4AdeUiXB6lFS46wwIXcd7Gw2Y+O0tZZcRf0rMvsJ5UyorvxJ3Vw9Sd
 GV1lx0K5XVZgUpYGYHLwtjVmtvZfyoh6D7nvbayWo8GZhtvFySWoMmUFGxa3BjPnODND5Q3m9zR
 zLcjuGkkRDFFx+Wot0kufOM70P+OBIGQneXwNQJBUXLif2x9Iy9rYBpsKRsSnEtArypXm1dqDif
 4FCVRxeXq0rtDgiKgcDiN9p0lJAv52U
X-Received: by 2002:a17:90b:58c4:b0:39d:e445:1d44 with SMTP id
 98e67ed59e1d1-39e361afbe1mr7663811a91.31.1789692331866; 
 Thu, 17 Sep 2026 17:45:31 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-144cdfc3df2sm600286c88.5.2026.09.17.17.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 17:45:31 -0700 (PDT)
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
Subject: [PATCH 20/21] target/ppc: convert raise_exception to raise_excp
Date: Fri, 18 Sep 2026 08:42:22 +0800
Message-ID: <20260918004225.827-21-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260918004225.827-1-luoyonggang@gmail.com>
References: <20260918004225.827-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Store error_code then call raise_excp with restore 0. Drop TCG
raise_exception and raise_exception_err. Move C
raise_exception_err_ra to static inline in internal.h, and remove
the cpu.h prototype. Callers include internal.h.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/ppc/cpu.h             |  3 ---
 target/ppc/helper.h          |  2 --
 target/ppc/internal.h        |  9 +++++++++
 target/ppc/misc_helper.c     |  1 +
 target/ppc/tcg-excp_helper.c | 21 ---------------------
 target/ppc/timebase_helper.c |  1 +
 target/ppc/translate.c       | 23 ++++++++++-------------
 7 files changed, 21 insertions(+), 39 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 3fb51bbeb82..217b4f334e5 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2819,9 +2819,6 @@ void cpu_write_xer(CPUPPCState *env, target_ulong xer);
  */
 #define is_book3s_arch2x(ctx) (!!((ctx)->insns_flags & PPC_SEGMENT_64B))
 
-G_NORETURN void raise_exception_err_ra(CPUPPCState *env, uint32_t exception,
-                                       uint32_t error_code, uintptr_t raddr);
-
 /* PERFM EBB helper*/
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
 void raise_ebb_perfm_exception(CPUPPCState *env);
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 80d6616bab4..8a804d326ac 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -1,5 +1,3 @@
-DEF_HELPER_FLAGS_3(raise_exception_err, TCG_CALL_NO_WG, noreturn, env, i32, i32)
-DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)
 DEF_HELPER_FLAGS_4(TW, TCG_CALL_NO_WG, void, env, tl, tl, i32)
 #if defined(TARGET_PPC64)
 DEF_HELPER_FLAGS_4(TD, TCG_CALL_NO_WG, void, env, tl, tl, i32)
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index a20a0f9f7e0..14c08c23ffc 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -320,8 +320,17 @@ static inline int ger_pack_masks(int pmsk, int ymsk, int xmsk)
 
 #ifdef CONFIG_TCG
 #include "accel/tcg/tb-cpu-state.h"
+#include "accel/tcg/cpu-loop.h"
 
 TCGTBCPUState ppc_get_tb_cpu_state(CPUState *cs);
+
+static inline G_NORETURN
+void raise_exception_err_ra(CPUPPCState *env, uint32_t excp,
+                            uint32_t err, uintptr_t ra)
+{
+    env->error_code = err;
+    cpu_loop_exit_excp(env_cpu(env), excp, ra);
+}
 #endif
 
 #endif /* PPC_INTERNAL_H */
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index 0e625cbb704..527af513f92 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
+#include "internal.h"
 #include "exec/cputlb.h"
 #include "exec/helper-proto.h"
 #include "qemu/error-report.h"
diff --git a/target/ppc/tcg-excp_helper.c b/target/ppc/tcg-excp_helper.c
index 93aedb0c8e2..6289ca7dfd5 100644
--- a/target/ppc/tcg-excp_helper.c
+++ b/target/ppc/tcg-excp_helper.c
@@ -34,27 +34,6 @@
 /*****************************************************************************/
 /* Exceptions processing helpers */
 
-void raise_exception_err_ra(CPUPPCState *env, uint32_t exception,
-                            uint32_t error_code, uintptr_t raddr)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = exception;
-    env->error_code = error_code;
-    cpu_loop_exit_restore(cs, raddr);
-}
-
-void helper_raise_exception_err(CPUPPCState *env, uint32_t exception,
-                                uint32_t error_code)
-{
-    raise_exception_err_ra(env, exception, error_code, 0);
-}
-
-void helper_raise_exception(CPUPPCState *env, uint32_t exception)
-{
-    raise_exception_err_ra(env, exception, 0, 0);
-}
-
 #ifndef CONFIG_USER_ONLY
 
 static G_NORETURN void raise_exception_err(CPUPPCState *env, uint32_t exception,
diff --git a/target/ppc/timebase_helper.c b/target/ppc/timebase_helper.c
index 7209b418fb6..d0986ff261a 100644
--- a/target/ppc/timebase_helper.c
+++ b/target/ppc/timebase_helper.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "internal.h"
 #include "hw/ppc/ppc.h"
 #include "exec/helper-proto.h"
 #include "qemu/log.h"
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 467b8f3d4ec..e4695c18728 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -308,12 +308,11 @@ static inline void gen_update_nip(DisasContext *ctx, target_ulong nip)
 static void gen_exception_err_nip(DisasContext *ctx, uint32_t excp,
                                   uint32_t error, target_ulong nip)
 {
-    TCGv_i32 t0, t1;
-
     gen_update_nip(ctx, nip);
-    t0 = tcg_constant_i32(excp);
-    t1 = tcg_constant_i32(error);
-    gen_helper_raise_exception_err(tcg_env, t0, t1);
+    tcg_gen_st_i32(tcg_constant_i32(error), tcg_env,
+                   offsetof(CPUPPCState, error_code));
+    gen_helper_raise_excp(tcg_env, tcg_constant_i32(excp),
+                          tcg_constant_i32(0));
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -330,12 +329,7 @@ static inline void gen_exception_err(DisasContext *ctx, uint32_t excp,
 static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
                               target_ulong nip)
 {
-    TCGv_i32 t0;
-
-    gen_update_nip(ctx, nip);
-    t0 = tcg_constant_i32(excp);
-    gen_helper_raise_exception(tcg_env, t0);
-    ctx->base.is_jmp = DISAS_NORETURN;
+    gen_exception_err_nip(ctx, excp, 0, nip);
 }
 
 static inline void gen_exception(DisasContext *ctx, uint32_t excp)
@@ -377,8 +371,11 @@ static void gen_debug_exception(DisasContext *ctx, bool rfi_type)
         gen_load_spr(t0, SPR_BOOKE_DBSR);
         tcg_gen_ori_tl(t0, t0, dbsr);
         gen_store_spr(SPR_BOOKE_DBSR, t0);
-        gen_helper_raise_exception(tcg_env,
-                                   tcg_constant_i32(POWERPC_EXCP_DEBUG));
+        tcg_gen_st_i32(tcg_constant_i32(0), tcg_env,
+                       offsetof(CPUPPCState, error_code));
+        gen_helper_raise_excp(tcg_env,
+                              tcg_constant_i32(POWERPC_EXCP_DEBUG),
+                              tcg_constant_i32(0));
         ctx->base.is_jmp = DISAS_NORETURN;
     } else {
         if (!rfi_type) { /* BookS does not single step rfi type instructions */
-- 
2.52.0.windows.1


