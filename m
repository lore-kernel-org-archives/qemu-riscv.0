Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471AFC98328
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 05:26:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xB3q9-00063Q-Hz; Mon, 28 Sep 2026 01:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3p2-0004Je-U3
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 01:22:42 -0400
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3p0-0007xU-HW
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 01:22:40 -0400
Received: by mail-dl1-x122c.google.com with SMTP id
 a92af1059eb24-13fc403e373so3618884c88.1
 for <qemu-riscv@nongnu.org>; Sun, 27 Sep 2026 22:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790572950; x=1791177750; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8pmxoMbXEOAbY5ho9GIQBnFCO5MxHEqBgNN23qjbjmk=;
 b=P/XaW1pY+KIX0db2BIKsDlpYN1Az7r50VMuaz4/tIj1rZ1srUp39mt1K3VKevI327O
 S+fF885NNKw/t1RglnUXr5MYXzTq0KccvFoLHuip05obqIGiwxFCDUzy9XqnTlyaXag0
 VIdz1ilTUwNMklmnQ++etO3a2fItwyM3tH/WrDX7VES1laTGIdR/MC0dUSfPXafEwjqs
 DVASbTfMFm87mD0mcoOOKvJBsF/zpL1xeZNniydwzg0MmYJVG01wvGuA7tlcscfCMfbN
 0OqBu768GFL4OJUTDc+v9aHue7N0EiSlxcJLTZqackEK+DSwKyG8YspC7F0k2MCQtJtQ
 N3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790572950; x=1791177750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8pmxoMbXEOAbY5ho9GIQBnFCO5MxHEqBgNN23qjbjmk=;
 b=EkQCEqXPo5L1dxWMvn8CKL/4VPBI933tS/jRlFn+jfj9qY12GD0y2Yhm/tUdZNNVio
 kEEIydsnxjOKb0d4uhjKjyBG3FDvnALWk/PuCGX60rgNNvF5gEgjBYZrKrT5FyTRsasz
 QLKP0ww3B41ns3a2IC99rNltlq13GWjHGumCVlq4rex2y5eiDtx7NOxExy/yZxWloRo4
 OcewMW8dkIdW2hXvUm92Y/cZew2kPg8EMzJKlvx1sOJj9G2/LQzaucEFJzjGliUDU4Wv
 OQ6m9e7pVmgt4kw8pkWyZ7JwQmR6LCO+5g5FvrWoiNNmfPd4jG+ESd89Qn+Phq+CqJCu
 hXcA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzOrfKj99AyNpc8S7yKNNOXilm+4rTj2E8aa+QEIBGZ/HvWuQoFqtMq6PPG1zx9JRYxcbCxrlQeQ9pj@nongnu.org
X-Gm-Message-State: AFuF++kxpBqdpol2NHhijAHf/OzKTx5YgxNT74Jg9m2R5wK6ck59GU6X
 nt3XF+fb7gpW5/e6e0Dl9VSAQBUqKUgqffff/BDdqVhStj7106X9XF83
X-Gm-Gg: AYBFou0MVZgOdI7ARW7Eq94fbX/y6blIZfMGg+U/J64tbovZHkqOMFLtC4KFj8+P+wZ
 zD3dYgax6bMjqcLe6h08xfHPssU7d1Qrz2HXMARx++dEWDA8SyINyHRsq3u2XtxURw6whgUXhGe
 38MF/PfYS+OMxjwbDw+VCpOtAZCSm6mdwLIwrx1kboOJCnkzmSgq8UAnbMqQuYopiPgSv1C55oE
 Co2VgIN3ePOHepgD2sZPRefkY6Wmtc7TTb9VonkekYVv4pZWGw0MWR9OEnml/FpNdiiWlEGZ/lQ
 vZ22LkCjZuyQw4Vu2sxD0hQd+glqzVYYbiPJfFDYkykzQ2oPqbPq7xglvZ6tjDsBppma4TnfAtL
 g8OAWv2MZMwoR4N9AC7xutC3uF9lfmLdFUxdaEPqNWCVCAMDbqS9GNJC9IK6p0wAW1TKbwzKWQ3
 8Dc3qp5aJAzuxv1/TLsc7MiAbMbcLwCe1/d/oYbwPGsYCa4kcjJDIjf0mFRWIfIu7H8IDmjd0sa
 KQ4qgkm8rYi2DsjJ8VJ2wJqLEZtyyc=
X-Received: by 2002:a05:701b:454e:20b0:148:bce6:429b with SMTP id
 a92af1059eb24-148bce64402mr4049554c88.8.1790572948987; 
 Sun, 27 Sep 2026 22:22:28 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-146bb6551d9sm14726248c88.9.2026.09.27.22.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 22:22:28 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Chao Liu <chao.liu@processmission.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>, Glenn Miles <milesg@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Song Gao <17746591750@163.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
Subject: [PATCH v2 11/24] target/sparc: convert raise_exception to raise_excp
Date: Mon, 28 Sep 2026 13:20:37 +0800
Message-ID: <20260928052051.251-12-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260928052051.251-1-luoyonggang@gmail.com>
References: <20260928052051.251-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122c;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122c.google.com
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

Translate through raise_excp after save_state. Drop TCG
raise_exception. Keep C cpu_raise_exception_ra. Exit DEBUG and HLT
through cpu_loop_exit_excp.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/sparc/helper.c    | 21 +++------------------
 target/sparc/helper.h    |  2 --
 target/sparc/translate.c |  6 +++---
 3 files changed, 6 insertions(+), 23 deletions(-)

diff --git a/target/sparc/helper.c b/target/sparc/helper.c
index 8de261b0e30..411a8dfe359 100644
--- a/target/sparc/helper.c
+++ b/target/sparc/helper.c
@@ -27,26 +27,12 @@
 
 void cpu_raise_exception_ra(CPUSPARCState *env, int tt, uintptr_t ra)
 {
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = tt;
-    cpu_loop_exit_restore(cs, ra);
-}
-
-void helper_raise_exception(CPUSPARCState *env, int tt)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = tt;
-    cpu_loop_exit(cs);
+    cpu_loop_exit_excp(env_cpu(env), tt, ra);
 }
 
 void helper_debug(CPUSPARCState *env)
 {
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = EXCP_DEBUG;
-    cpu_loop_exit(cs);
+    cpu_loop_exit_excp(env_cpu(env), EXCP_DEBUG, 0);
 }
 
 #ifdef TARGET_SPARC64
@@ -208,10 +194,9 @@ void helper_power_down(CPUSPARCState *env)
     CPUState *cs = env_cpu(env);
 
     cs->halted = 1;
-    cs->exception_index = EXCP_HLT;
     env->pc = env->npc;
     env->npc = env->pc + 4;
-    cpu_loop_exit(cs);
+    cpu_loop_exit_excp(cs, EXCP_HLT, 0);
 }
 
 target_ulong helper_rdasr17(CPUSPARCState *env)
diff --git a/target/sparc/helper.h b/target/sparc/helper.h
index 3a7f7dc1296..9fc38f5706a 100644
--- a/target/sparc/helper.h
+++ b/target/sparc/helper.h
@@ -53,8 +53,6 @@ DEF_HELPER_FLAGS_3(fcmpq, TCG_CALL_NO_WG, i32, env, i128, i128)
 DEF_HELPER_FLAGS_3(fcmpeq, TCG_CALL_NO_WG, i32, env, i128, i128)
 DEF_HELPER_FLAGS_3(flcmps, TCG_CALL_NO_RWG_SE, i32, env, f32, f32)
 DEF_HELPER_FLAGS_3(flcmpd, TCG_CALL_NO_RWG_SE, i32, env, f64, f64)
-DEF_HELPER_2(raise_exception, noreturn, env, int)
-
 DEF_HELPER_FLAGS_3(faddd, TCG_CALL_NO_WG, f64, env, f64, f64)
 DEF_HELPER_FLAGS_3(fsubd, TCG_CALL_NO_WG, f64, env, f64, f64)
 DEF_HELPER_FLAGS_3(fmuld, TCG_CALL_NO_WG, f64, env, f64, f64)
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 3156be6a94c..6dae5da7157 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -1048,7 +1048,7 @@ static void gen_exception(DisasContext *dc, int which)
 {
     finishing_insn(dc);
     save_state(dc);
-    gen_helper_raise_exception(tcg_env, tcg_constant_i32(which));
+    gen_helper_raise_excp(tcg_env, tcg_constant_i32(which));
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -2811,7 +2811,7 @@ static bool do_tcc(DisasContext *dc, int cond, int cc,
     /* Trap always.  */
     if (cond == 8) {
         save_state(dc);
-        gen_helper_raise_exception(tcg_env, trap);
+        gen_helper_raise_excp(tcg_env, trap);
         dc->base.is_jmp = DISAS_NORETURN;
         return true;
     }
@@ -5833,7 +5833,7 @@ static void sparc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         if (e->npc % 4 == 0) {
             tcg_gen_movi_tl(cpu_npc, e->npc);
         }
-        gen_helper_raise_exception(tcg_env, e->excp);
+        gen_helper_raise_excp(tcg_env, e->excp);
 
         e_next = e->next;
         g_free(e);
-- 
2.52.0.windows.1


