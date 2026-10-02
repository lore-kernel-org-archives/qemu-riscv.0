Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DB2CA5FDD
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 17:57:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xChV6-0001ew-Gk; Fri, 02 Oct 2026 13:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChRT-0005Ko-Ai
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 13:53:07 -0400
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChRO-0007bK-ME
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 13:53:06 -0400
Received: by mail-dy2-x0f.google.com with SMTP id
 5a478bee46e88-33e46a156f4so4907031eec.0
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2026 10:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790963573; x=1791568373; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WNFp+S7U4V1y7Qb+3VL79D1plTLvUAgf6A0U0toQ9Jw=;
 b=pD0sds4VCE7TUGVqmoTLIEwT8S1Jz/eoLrW2Q4Yiggs52BsXO1KvWMCbZ+X2zE7nHf
 9HIh1eyPEyqJxUTFsyL5Wn7d0s1Ks1v9bVP7EyVB8JJlpoJcmaCfszsLHzJmKaLKoR/y
 JscGN3iJEwx7T/ON9f9ldPYJOdPGmhOsVF4nvj2+IxLZkERocP+uGKKJPd/QlhtmJ3dD
 2uBN0ZrZduQYMTA0awWShrJi7OeG0OAm9XD6vpXnb5XANkA6AxA/ksqQviOHNt8R4Vri
 ACAUex+PzKUX1d8kHOM+6FjiPllEJFxs1puXozl3lderCw/7R7AXE1yf/fshvBvWYTn6
 Avsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790963573; x=1791568373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WNFp+S7U4V1y7Qb+3VL79D1plTLvUAgf6A0U0toQ9Jw=;
 b=Vl8HIkTsLV5ZHcPL1Lye+axcur3vIhM8ADS5HsSmoi7+mVmpbIJsPOFRiRCFiKqaFA
 iK07DIraeNt44GRNu3VMtqp/r42PxcoGVLB81i5IB1ewu9a6C8T6+J2zHrbR39krnydi
 8qq414UVN2cHlyehDmP0diUo5Edwd9uf7vu/VKxQ9i0xXT5hc+mMfgKVPstpuN2GpkF6
 3w5Pn6o0hU10vKnxnUUvLviCganbIdMu2ypxD4oNXIgOubQHiWHYWHD+RilgVugSimIE
 UxkzA5yC0BNzuagSuucUQilOlXTR4PesrbW6ISPu3drgx8RUaXwejFPqQp7kpnga0838
 EHxg==
X-Forwarded-Encrypted: i=1;
 AKwUvBy/18Uu8w6vewc/LGoSAbZSghj0V1ntIGpnVVbgk6wGPGlTLXDJUAJ5HCvBaG+vhjhU5W+jMtjham+B@nongnu.org
X-Gm-Message-State: AFuF++l7dkZG0ZSTM9jEFiz1BWynVTJDP4lhHW1Rpw6zOr4epmruVk71
 MO6DC07NrT+2T26UgSh41PzsWUyp8GufC2DQB4R06Cp4Pjoepe39OEZ9
X-Gm-Gg: AYBFou0ZQNAW3BVxE6iTunMI6iG1f+Q7zoZbfMpiwI66VZRvjCG0ZkU65rvSJIc8nXD
 JPe6zNCCXVJCshuh0HpdAOgaKjl4LT4H+lgV0h/T2AWsiMmVFA1W5QKOa7vVefxqvMeNZt1HB54
 3MDGzklMvRU8i7NQf7Xz8MDmwjdHQw2VyMy3+j/7L54idyax7XRSsB9RgiQSdHSaEsDNmrlxLRn
 /zNKqzqFPI7oi4qKfxkFRaapO3hxOZyNyHlHHq0WTn69/Xg3Rant64fS+v3HLKTg5bLlHwBkqcH
 TRJZ8u4Y4A/3mfvpFxty+Cj5AcHs1mBx5mslnUi0tQHefVqsHeVnFbT7uzEOnESNEe5NK3seOlw
 okC4rOxwDKoZglYrfxbj6ZfmXCGuKSNr7WK8IcG8GV6bttP8lLfb8hP8K2NB7kBdkeTJg2bcaCL
 DGy4/HhvwUFbhCfVKQ8n2T49buGIK2ZJ92xZPvGMLk/wlDVso2YDU3kSrnSS3kcm+EdCqflf1RZ
 dTVCfm+LYXcmOVk5L28oW0w2HfpNKUzG+LJ+xT68Q==
X-Received: by 2002:a05:7300:e5c2:b0:341:3ca2:de2d with SMTP id
 5a478bee46e88-34f15077edfmr3766742eec.6.1790963573128; 
 Fri, 02 Oct 2026 10:52:53 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34f14f9f2afsm18027361eec.18.2026.10.02.10.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 10:52:52 -0700 (PDT)
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
Subject: [PATCH v3 16/27] target/sparc: convert raise_exception to raise_excp
Date: Sat,  3 Oct 2026 01:50:24 +0800
Message-ID: <20261002175037.1747-17-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261002175037.1747-1-luoyonggang@gmail.com>
References: <20261002175037.1747-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0f.google.com
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

Use the shared raise_excp helper for translated exceptions and adapt
SPARC C exits to cpu_raise_excp() or cpu_raise_excp_restore() according
to the return-address contract. Keep cpu_raise_exception_ra().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/sparc/helper.c    | 21 +++------------------
 target/sparc/helper.h    |  2 --
 target/sparc/translate.c |  6 +++---
 3 files changed, 6 insertions(+), 23 deletions(-)

diff --git a/target/sparc/helper.c b/target/sparc/helper.c
index 8de261b0e30..dea908a8f7f 100644
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
+    cpu_raise_excp_restore(env_cpu(env), tt, ra);
 }
 
 void helper_debug(CPUSPARCState *env)
 {
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = EXCP_DEBUG;
-    cpu_loop_exit(cs);
+    cpu_raise_excp(env_cpu(env), EXCP_DEBUG);
 }
 
 #ifdef TARGET_SPARC64
@@ -208,10 +194,9 @@ void helper_power_down(CPUSPARCState *env)
     CPUState *cs = env_cpu(env);
 
     cs->halted = 1;
-    cs->exception_index = EXCP_HLT;
     env->pc = env->npc;
     env->npc = env->pc + 4;
-    cpu_loop_exit(cs);
+    cpu_raise_excp(cs, EXCP_HLT);
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


