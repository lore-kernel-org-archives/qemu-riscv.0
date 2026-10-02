Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464E1CA5FDD
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 18:04:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xChWu-0004LI-Sk; Fri, 02 Oct 2026 13:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChRT-0005KT-3X
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 13:53:07 -0400
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChRO-0007ch-KG
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 13:53:06 -0400
Received: by mail-dy1-x1333.google.com with SMTP id
 5a478bee46e88-32efd24b2aeso429625eec.1
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2026 10:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790963581; x=1791568381; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZNU4PHC3hnUAQwnMHFav3xH/N5F8DnZib4Be85nEsJE=;
 b=WO1z/3b58eD7oxWYuAGjtApyj0b8M4InXR4bYmTAWEJ/6KFHE5xEiWTbqryHP4zjcA
 N/rEapXak+ybaqfRg0/AAYRIQtqRBzZJQYSAO4hltjdI+6K4xbA4Chej5oUomhd0thEO
 7fLjbCHUN5HQ8PcMu332SeLQhtuJy2J6CgX9ozyQ6h+saNhkTu0cZIp4W4za5Ms5j729
 j0Kj6EvwYMmW6OYtdMPw5FB3WB78YYa6Vdawr4bYRhGVrqiwo+yery3+t8GVZRzE+lv8
 8RJc1cUK+MOW4qidBxPX6JfanU0eJDR0uW7+hQRpYYerMYyrb4/b5Q1JkI8kW6g7vHa0
 7FQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790963581; x=1791568381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZNU4PHC3hnUAQwnMHFav3xH/N5F8DnZib4Be85nEsJE=;
 b=dvj5MZKYt6mBdy8c2CofuNey3L99bW5vgw24sxxktJppDWGXHZ2DEf0gqlVCNQ5+Ww
 doAHpfbMHRDcy536p4O9xvSLdSQeMjhbfrQUMkGXFsEKyTlFe9sVKkKS0atEbVn0zj32
 TBqbDJaIxIxNfrGSoLx40WNlDkNhaqKXlv+bwWJ3y5VaMclSnyGHheHLhOv9VkksLbzY
 Gvw6krKRkvYhX7NtMRLTRX3fVwcejovNTqhI8873YRBqUyVGr5e6r11owK85dOsCRZJx
 f7X8LnxIcbFncEiQaVLTT3aGxvp2N5YVSiFplBG22vCYqhguzJnsjIof4HFl17lSvRu/
 G/7w==
X-Forwarded-Encrypted: i=1;
 AKwUvByhTfa5mqV73MSJIKBFkigS6C/Nt83Tec87VWlquzekIqqOV3t4p0wHJMLy47HvZuLPt6YP9/wdv8Pu@nongnu.org
X-Gm-Message-State: AFuF++lK2Pu/gMHwtdoEKWcS+AON26ZLk7E+l8AKL5NscEMd0XGVdF+c
 ZDZSUdReDcp8YI57gsjPGGXIbA098azgqHOarPGNfDnPg9R7A5V3wBIL
X-Gm-Gg: AYBFou0PMeegtg9oH/13rYEfbfG9DKR28+To4mrlVzmaeYQ9zMly515948IojHhNvlm
 2WaM3rM79ncAgrsJaGtxK4W8Fa2Ocph1Xckp2XuLn+ecL7LwVIYj5KsfW8iRmN0I1D8ROjaOoTO
 QXcaWajMriMvURyCdj+b9e0d3QXVCkwU3JDMjBnhxwcuzwLMkU1I5I3DXj9RkcW6vxoTFuseOy0
 br9TCZivlQNSxJXbffWSTcCl+3SnSrdG64NZkyh7ycAKfW7fuJC8XSeAs/YvpdQkbjBI/wxeSJf
 tG1bvwJ+xoidu8pNRMAhpR6JxCNpJjR85hmAvanVgPjIUGuOHwudo0sF2FZsKXk9BHdiZGlekdr
 P1LlFcZ1Uhf+9uGRcf51lzzevNP7Ei10Vhg54egzVPbE+zVukgrvMEpytMGVkv+xazAAEiF5Q/f
 5CcAQ11R5Rzzw/NSKus3g1xddTfFQYFomwcuFwTI1cOs25PtmbJNdDUBmMWctb+iQxzsPZc7/J0
 X69uPDeN93fg0wL+e1c140DDY2KA3PVAxKfkJrbDA==
X-Received: by 2002:a05:693c:638f:10b0:34b:dde6:29c7 with SMTP id
 5a478bee46e88-351114568a1mr356247eec.19.1790963580723; 
 Fri, 02 Oct 2026 10:53:00 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34f14f9f2afsm18027361eec.18.2026.10.02.10.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 10:53:00 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, qemu-s390x@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Helge Deller <deller@gmx.de>, Chinmay Rath <rathc@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Glenn Miles <milesg@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 17/27] target/loongarch: convert raise_exception to
 raise_excp
Date: Sat,  3 Oct 2026 01:50:25 +0800
Message-ID: <20261002175037.1747-18-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261002175037.1747-1-luoyonggang@gmail.com>
References: <20261002175037.1747-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1333;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x1333.google.com
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

Inline do_raise_exception as it's used by other arch.

Use the shared raise_excp_restore helper for translated exceptions and
adapt the logging C exception path to cpu_raise_excp() or
cpu_raise_excp_restore() according to the return-address contract.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/loongarch/internals.h     | 12 +++++++++---
 target/loongarch/tcg/helper.h    |  2 --
 target/loongarch/tcg/op_helper.c |  6 ------
 target/loongarch/tcg/tcg_cpu.c   | 10 ++++------
 target/loongarch/tcg/translate.c |  2 +-
 5 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index ff956823fd7..885d516fe52 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -19,9 +19,15 @@ void loongarch_translate_init(void);
 void loongarch_translate_code(CPUState *cs, TranslationBlock *tb,
                               int *max_insns, vaddr pc, void *host_pc);
 
-void G_NORETURN do_raise_exception(CPULoongArchState *env,
-                                   uint32_t exception,
-                                   uintptr_t pc);
+void G_NORETURN loongarch_do_raise_exception(CPULoongArchState *env,
+                                             uint32_t exception,
+                                             uintptr_t pc);
+static inline void G_NORETURN do_raise_exception(CPULoongArchState *env,
+                                                 uint32_t exception,
+                                                 uintptr_t pc)
+{
+    loongarch_do_raise_exception(env, exception, pc);
+}
 
 #ifdef CONFIG_TCG
 int ieee_ex_to_loongarch(int xcpt);
diff --git a/target/loongarch/tcg/helper.h b/target/loongarch/tcg/helper.h
index e76c73c7755..e3a7bc9e9da 100644
--- a/target/loongarch/tcg/helper.h
+++ b/target/loongarch/tcg/helper.h
@@ -3,8 +3,6 @@
  * Copyright (c) 2021 Loongson Technology Corporation Limited
  */
 
-DEF_HELPER_2(raise_exception, noreturn, env, i32)
-
 DEF_HELPER_FLAGS_3(asrtle_d, TCG_CALL_NO_WG, void, env, tl, tl)
 DEF_HELPER_FLAGS_3(asrtgt_d, TCG_CALL_NO_WG, void, env, tl, tl)
 
diff --git a/target/loongarch/tcg/op_helper.c b/target/loongarch/tcg/op_helper.c
index f98fe4d4a16..109417b7503 100644
--- a/target/loongarch/tcg/op_helper.c
+++ b/target/loongarch/tcg/op_helper.c
@@ -16,12 +16,6 @@
 #include <zlib.h> /* for crc32 */
 #include "cpu-csr.h"
 
-/* Exceptions helpers */
-void helper_raise_exception(CPULoongArchState *env, uint32_t exception)
-{
-    do_raise_exception(env, exception, GETPC());
-}
-
 /* loongarch assert op */
 void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
 {
diff --git a/target/loongarch/tcg/tcg_cpu.c b/target/loongarch/tcg/tcg_cpu.c
index 4b1d44a1644..0a1115721c0 100644
--- a/target/loongarch/tcg/tcg_cpu.c
+++ b/target/loongarch/tcg/tcg_cpu.c
@@ -59,9 +59,9 @@ static const char *loongarch_exception_name(int32_t exception)
     return "Unknown";
 }
 
-void G_NORETURN do_raise_exception(CPULoongArchState *env,
-                                   uint32_t exception,
-                                   uintptr_t pc)
+void G_NORETURN loongarch_do_raise_exception(CPULoongArchState *env,
+                                             uint32_t exception,
+                                             uintptr_t pc)
 {
     CPUState *cs = env_cpu(env);
 
@@ -69,9 +69,7 @@ void G_NORETURN do_raise_exception(CPULoongArchState *env,
                   __func__,
                   exception,
                   loongarch_exception_name(exception));
-    cs->exception_index = exception;
-
-    cpu_loop_exit_restore(cs, pc);
+    cpu_raise_excp_restore(cs, exception, pc);
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/loongarch/tcg/translate.c b/target/loongarch/tcg/translate.c
index 124dce62695..b7e8ce8a653 100644
--- a/target/loongarch/tcg/translate.c
+++ b/target/loongarch/tcg/translate.c
@@ -95,7 +95,7 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
 void generate_exception(DisasContext *ctx, int excp)
 {
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
-    gen_helper_raise_exception(tcg_env, tcg_constant_i32(excp));
+    gen_helper_raise_excp_restore(tcg_env, tcg_constant_i32(excp));
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.52.0.windows.1


