Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DC4C982D2
	for <qemu-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 00:46:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x7Mjj-0003wq-Gs; Thu, 17 Sep 2026 20:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7MjY-0003B2-AN
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 20:45:44 -0400
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7MjV-0002J1-QO
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 20:45:43 -0400
Received: by mail-pj2-x0f.google.com with SMTP id
 98e67ed59e1d1-39b910bdf2eso128588a91.2
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 17:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789692340; x=1790297140; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4eesfdmRkhMU+wZpTSQiOdW3SKXScTF3aj/NWSnvq2A=;
 b=n7AJaEcQSOH4rUer3CbopSivSGcU/AQW8vl6dwTLKwXin9eGRA6byYlWL7xziy6e7f
 sdL81eTsCwY59M4z1G6TAi67RAvjY3cMrsGbJ6zyBhFUmvxXqYIJk8EXddnJvfSG8fow
 kU7KhjTM2dNHHvaaeqzE3VoOc1W88BMscrtxXwrUx6XRjH4aYcyR6d7BSKPHltehjVTJ
 NpK0zJNLA6IVzNEDeRswRn89Ix/fYdBOaHhV+uYIX1KMN8RcsUwxj0WK41FyWKb/kCBt
 VE6prdYvr+wHm9dCV7ZKzGVOjKTbPxpquKSvClpEF/I6pBErVrtAcUaWIPzA5RBtIxn3
 Y+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789692340; x=1790297140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4eesfdmRkhMU+wZpTSQiOdW3SKXScTF3aj/NWSnvq2A=;
 b=N8teMZYdMU3mtkVH5Fn9PXlll126EV9YLsVn4yemfqjMpyCUTCQNQhkjstPG5ebAIw
 QKa2y8cAKWPRvTEtPaChZH8hTuolX+aoEaU+NaMPUomjLabW7OrbTafPEiAp/oqp/ad6
 2pv78jkzAeDwUf6166c0Tk1B4nM0oHIK66oymK7bN4xcxGz8UOIWwW//5NqNF4FOIP3/
 QzcTST7THpMeZMZsSw/CitGWkTGjGYwpZfw2FVt4yLHm/SfiCGC65w9rlcSUI0pmgnp7
 jCGiYF+/WmwB7WhjgGRFqdfK/gEqRGAAkCPZOE5rTCFrAVPqwXApQ562s1weZRGP+p+n
 EuNg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwXBuIdL4QkjmNK/PEXamOuySx2iIxUYa6ihHfuG8JGTYm/ZKyiywrN0cPRCKhf9fvsI7hWoEfcQ38j@nongnu.org
X-Gm-Message-State: AFuF++kfruYEf6qaOoNUYII2C0zmJDragzKEx1mbJmYw2zmjyH27A2sx
 NFwiDGOLwll0r0ijbK4NlnI109DYt3j/lJ8Q4QywrSkxcLolc497mn/H
X-Gm-Gg: AYBFou08Rg69MUhwCy3kkJLGku9AIc1Px+jJhuW+gfbqwFuEA8bywB/WL2iVpPa/xKo
 J75d1BpDbA2W5nrIV+NKDtyTlmIdZcssP8lip8iYR/OvetRm/GT/9FffhtqhOy1/XULS5/1zAK2
 eMPQa2ahUwfVCsIfEN3qK7dxZukRgFXCPx+I4LcrLOHhtA7IBJyo5nJ4XmoKVyA8VxlieMwArYY
 BXuvZyXHtRUM0v4uOEFjjjdpCkPvaO1V2SOUSmzESs+e6Llw6KfJWwMVhZryNSF9GDs03NG4zHW
 j1hoNF2cxuZIYQCf7Cm1FMu8Y7YCoDY8EMNJk4JR+ht+Zm8SCzJb7+nEAijKUpTcISDGTL3ELy2
 KMwlz8cH2g/FPWsRpBNox3qZEuvBgjHaE3K3u210RtBTl9wTuC3Po3u2tn9xOhGSKFaN5zOBhJQ
 O6d8sB/NEENECRGxiuWgYp4PIDW9tt0UmKRlzwynW3JJU/j7x7O0F4MF+qGg7totTeQVUAqrefa
 j/Awb2lM2OrBLBz21/UaqiouUhdySZD
X-Received: by 2002:a17:90b:5305:b0:39e:4c81:6c63 with SMTP id
 98e67ed59e1d1-39e54dbe3c1mr1614944a91.30.1789692340229; 
 Thu, 17 Sep 2026 17:45:40 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-144cdfc3df2sm600286c88.5.2026.09.17.17.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 17:45:39 -0700 (PDT)
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
Subject: [PATCH 21/21] target/i386: convert raise_exception to
 i386_raise_exception
Date: Fri, 18 Sep 2026 08:42:23 +0800
Message-ID: <20260918004225.827-22-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260918004225.827-1-luoyonggang@gmail.com>
References: <20260918004225.827-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj2-x0f.google.com
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

Prefix leftover TCG raise_exception to i386_raise_exception. Rename
C raise_exception family globals to i386_raise_exception*, and keep
the short names as static inline wrappers in helper-tcg.h. Wrappers
still call raise_interrupt2.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/i386/helper.h          |  2 +-
 target/i386/tcg/excp_helper.c | 18 +++++++--------
 target/i386/tcg/helper-tcg.h  | 42 +++++++++++++++++++++++++++++------
 target/i386/tcg/translate.c   |  2 +-
 4 files changed, 46 insertions(+), 18 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index 3f67098f11f..cf643e820a6 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -56,7 +56,7 @@ DEF_HELPER_2(syscall, void, env, int)
 DEF_HELPER_2(sysret, void, env, int)
 DEF_HELPER_FLAGS_1(pause, TCG_CALL_NO_WG, noreturn, env)
 DEF_HELPER_FLAGS_3(raise_interrupt, TCG_CALL_NO_WG, noreturn, env, int, int)
-DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, int)
+DEF_HELPER_FLAGS_2(i386_raise_exception, TCG_CALL_NO_WG, noreturn, env, int)
 DEF_HELPER_FLAGS_1(icebp, TCG_CALL_NO_WG, noreturn, env)
 DEF_HELPER_3(boundw, void, env, tl, int)
 DEF_HELPER_3(boundl, void, env, tl, int)
diff --git a/target/i386/tcg/excp_helper.c b/target/i386/tcg/excp_helper.c
index 1eaa602c91d..ab3aa17a870 100644
--- a/target/i386/tcg/excp_helper.c
+++ b/target/i386/tcg/excp_helper.c
@@ -32,9 +32,9 @@ G_NORETURN void helper_raise_interrupt(CPUX86State *env, int intno,
     raise_interrupt(env, intno, next_eip_addend);
 }
 
-G_NORETURN void helper_raise_exception(CPUX86State *env, int exception_index)
+G_NORETURN void helper_i386_raise_exception(CPUX86State *env, int exception_index)
 {
-    raise_exception(env, exception_index);
+    i386_raise_exception(env, exception_index);
 }
 
 /*
@@ -120,25 +120,25 @@ G_NORETURN void raise_interrupt(CPUX86State *env, int intno, int next_eip_addend
     raise_interrupt2(env, intno, 1, 0, next_eip_addend, 0);
 }
 
-G_NORETURN void raise_exception_err(CPUX86State *env, int exception_index,
-                                    int error_code)
+G_NORETURN void i386_raise_exception_err(CPUX86State *env, int exception_index,
+                                         int error_code)
 {
     raise_interrupt2(env, exception_index, 0, error_code, 0, 0);
 }
 
-G_NORETURN void raise_exception_err_ra(CPUX86State *env, int exception_index,
-                                       int error_code, uintptr_t retaddr)
+G_NORETURN void i386_raise_exception_err_ra(CPUX86State *env, int exception_index,
+                                            int error_code, uintptr_t retaddr)
 {
     raise_interrupt2(env, exception_index, 0, error_code, 0, retaddr);
 }
 
-G_NORETURN void raise_exception(CPUX86State *env, int exception_index)
+G_NORETURN void i386_raise_exception(CPUX86State *env, int exception_index)
 {
     raise_interrupt2(env, exception_index, 0, 0, 0, 0);
 }
 
-G_NORETURN void raise_exception_ra(CPUX86State *env, int exception_index,
-                                   uintptr_t retaddr)
+G_NORETURN void i386_raise_exception_ra(CPUX86State *env, int exception_index,
+                                        uintptr_t retaddr)
 {
     raise_interrupt2(env, exception_index, 0, 0, 0, retaddr);
 }
diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index f4b2ff740d5..430e49efe0e 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -60,13 +60,41 @@ void x86_translate_code(CPUState *cs, TranslationBlock *tb,
                         int *max_insns, vaddr pc, void *host_pc);
 
 /* excp_helper.c */
-G_NORETURN void raise_exception(CPUX86State *env, int exception_index);
-G_NORETURN void raise_exception_ra(CPUX86State *env, int exception_index,
-                                   uintptr_t retaddr);
-G_NORETURN void raise_exception_err(CPUX86State *env, int exception_index,
-                                    int error_code);
-G_NORETURN void raise_exception_err_ra(CPUX86State *env, int exception_index,
-                                       int error_code, uintptr_t retaddr);
+G_NORETURN void i386_raise_exception(CPUX86State *env, int exception_index);
+G_NORETURN void i386_raise_exception_ra(CPUX86State *env, int exception_index,
+                                        uintptr_t retaddr);
+G_NORETURN void i386_raise_exception_err(CPUX86State *env, int exception_index,
+                                         int error_code);
+G_NORETURN void i386_raise_exception_err_ra(CPUX86State *env,
+                                            int exception_index,
+                                            int error_code, uintptr_t retaddr);
+
+static inline G_NORETURN
+void raise_exception(CPUX86State *env, int exception_index)
+{
+    i386_raise_exception(env, exception_index);
+}
+
+static inline G_NORETURN
+void raise_exception_ra(CPUX86State *env, int exception_index,
+                        uintptr_t retaddr)
+{
+    i386_raise_exception_ra(env, exception_index, retaddr);
+}
+
+static inline G_NORETURN
+void raise_exception_err(CPUX86State *env, int exception_index,
+                         int error_code)
+{
+    i386_raise_exception_err(env, exception_index, error_code);
+}
+
+static inline G_NORETURN
+void raise_exception_err_ra(CPUX86State *env, int exception_index,
+                            int error_code, uintptr_t retaddr)
+{
+    i386_raise_exception_err_ra(env, exception_index, error_code, retaddr);
+}
 G_NORETURN void raise_interrupt(CPUX86State *nenv, int intno, int next_eip_addend);
 G_NORETURN void handle_unaligned_access(CPUX86State *env, vaddr vaddr,
                                         MMUAccessType access_type,
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index d8de290acb6..379af59ea71 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -1506,7 +1506,7 @@ static void gen_exception(DisasContext *s, int trapno)
 {
     gen_update_cc_op(s);
     gen_update_eip_cur(s);
-    gen_helper_raise_exception(tcg_env, tcg_constant_i32(trapno));
+    gen_helper_i386_raise_exception(tcg_env, tcg_constant_i32(trapno));
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.52.0.windows.1


