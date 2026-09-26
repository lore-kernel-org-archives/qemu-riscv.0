Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FE9C98332
	for <qemu-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 11:08:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xAQGm-00080c-Vy; Sat, 26 Sep 2026 07:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQGj-000808-2L
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 07:08:37 -0400
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQGh-0002jd-Bu
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 07:08:36 -0400
Received: by mail-dl2-x0f.google.com with SMTP id
 a92af1059eb24-144f7915355so1428062c88.3
 for <qemu-riscv@nongnu.org>; Sat, 26 Sep 2026 04:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790420914; x=1791025714; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ei+93PBPbdzLguBqNeI9eNNYO5EhUGD8hANYTlo5Qxw=;
 b=LvgYMXp2r4QD8Mdz9+HWUpZFlwV0cDrJC64ydCs8kqfYP2FmzKvr7cQh8djJJ31UcK
 4V/uPXc/cCHgwOK9Ll5H+cjkK02UXsPZ9fMXJUo1AGDedmND/lJ/otuUFyOVK/1LGl+O
 fvQfsHaTSVb/EfHh3WvVJZJMgGWX8+iL04n5ip4y5lKqnDjqJj8zr44oPP6D+83qWNeH
 BvNllh1MpWqtNNLhO/Ly2mHXTs1+ToSGr0zCiM4woUFdtLPimKtO7Y2rt56ZYJyPhU4M
 TDiyVB6Wi0Qi8BytBlhwFpNKm4oQjLV0OIKAfjIzv5PLp+9Tb6Re/phSN6qcvczwULih
 pAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790420914; x=1791025714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ei+93PBPbdzLguBqNeI9eNNYO5EhUGD8hANYTlo5Qxw=;
 b=AyMXxnijk64O6IJn210unc83AB9HW7XlSDf7mM6zCPoJl87EsVlo2B+1zeOnDDLtiS
 qPR42akGFx6DH1/BM2mZrxcSHM/0IVD7JvYz+ZHi6aTq9ZRyPVrWhozIuar5iGEjZlG6
 Oovs4+Grozih76+7fijhiEFH533K/A8tr+xUafWqz7e7RgdkTAjGHhPLzB4H6WATY9Y0
 9Q6iZE0MIJaP4/LY6EJnAmz9I6jPgbNVL23Y+XNY+9HLGH7X9E0YM3VYt3ihUgpQgQLr
 BqsLfYRBDeZ458UMartMG8imcbamsWq6B0LCdR0lSHVayHbUeqaJT6+dhz9uPtu/LMex
 SpCA==
X-Forwarded-Encrypted: i=1;
 AKwUvBws9I0D7QldOMRYeG+g+2lfCp5i6cABxG/xBBOYTvAqglanWF+uud3NB1gDKc3LU7sCCIPyfXyQpqd+@nongnu.org
X-Gm-Message-State: AFuF++kmvjn2y+7+R7vPcXG52U3kHYLoNYNwWSoBsQfO/igmbNjs80xm
 0qEEHhVEI47xPEWDxF+dJMtjkywH7fGgViju4nPDhDOE1nx3X2BaBTda
X-Gm-Gg: AYBFou0p4GWKx0+CXKC1wp+N7gx3+B2+G1MrbdvORxE599FpfnJ6MJQMP9xPevYLtv+
 ZTJoVX0PZXXAo8+ZMxwv4aHnnN6PLx67ldfVCGaaFNznj6v9qfpRg3TWzOugm/7+MFaRLuv8gLy
 y/RnTPhItM3+mqCRHw6zi91E5D7yluwe5gU5jTNo7PrbMSSvylDofkI5c5mlNVgo2ItvtvqKFhg
 AfTht501a6ihXNDV7vZXiLGOAIC6+iTyEFEaaHWahy1HVKrFt8dmu3KWL6lvAFgbXMYbwMy1S4K
 n32vM+2oEwBJ6YyxHoWo5lIdmIP9cVfNp5U9zpcNWA9zCOH6LNmNGGr8/iBHpbeOqREh7PKgWyY
 2pt2UdSs2jcL8+VX5LIP1GnWJB5IpnFNU8U1EpNNtVW253AcN+pqAVLYs+IemcTwpY4b5JmXh7Y
 ke3mH0NH/d//N3NoyiIkYhpTP9nBELFEsw34TqEcmeZ6H1skj76AwPgc6CR0HKDx/nSqSBjRRxj
 VSCnLIlT3Mwhg2hQ8XxZ/Ltfd5xEHw=
X-Received: by 2002:a05:701b:4344:b0:143:5d6f:555c with SMTP id
 a92af1059eb24-146ce6810c4mr2771756c88.20.1790420913876; 
 Sat, 26 Sep 2026 04:08:33 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-145a7318afcsm11414045c88.0.2026.09.26.04.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 04:08:32 -0700 (PDT)
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
Subject: [PATCH 1/9] target/i386: convert raise_exception to
 i386_raise_exception
Date: Sat, 26 Sep 2026 19:08:09 +0800
Message-ID: <20260926110818.1912-2-luoyonggang@gmail.com>
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
index 192cf43215e..1425a45ad39 100644
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


