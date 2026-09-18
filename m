Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C10C982DA
	for <qemu-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 00:46:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x7MiW-0008Sv-MC; Thu, 17 Sep 2026 20:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7Mhs-0007qn-Io
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 20:44:02 -0400
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7Mho-0001jF-VP
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 20:43:59 -0400
Received: by mail-pj2-x10.google.com with SMTP id
 98e67ed59e1d1-398a1676000so174868a91.2
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 17:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789692236; x=1790297036; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7UFceSXCS3RPlb3lAXyqQ273MCixivvVOLwpnsOeXhk=;
 b=qvcSQJoosFLjh6CrHn1zbzAYg1UVZJtrefvO7QF2rAug6LjzSDR0w1dP8cw56AuF/b
 GxTSpMOmOAtjd8H1PUl3t/JDC6reD4pDrzXDBTTFP6TDFeHRRsnMfK/4etHnMR5qpvqw
 kT93SlUZW4q7fAkt7939UiZg0bCZGHLbZ1Sw8sHjEihDWNvQuAm8nB4b64fWK7zOpvTF
 84BUZbyj6Bow9Xq2wjx0FJCd0OY09as4MxRxEkv9kwFq64LSJsnS3rbHpdeCanOH9W8s
 icF455NVcFdZ7VCX5GWqbzUYw7Kgz4OIuKi2jjbQHX/HZpoaj5yGUwcY+qF/8RC+QQDh
 eLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789692236; x=1790297036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7UFceSXCS3RPlb3lAXyqQ273MCixivvVOLwpnsOeXhk=;
 b=q6O+7ZxQmWkMYV6g0MkQhJ4KiFrQj3q32GTFyxNJMDTsD/orK6WRgiCFmM/gFNobI7
 jjHvwcxFjYUyOy+YOqKB5/ipT1nLtrSbovlbbxsd7Hvoxikg5G/VNaO4c9UdbvS4jO8/
 /c98PZMbJ40peJjcQ/FZ2RK2SQ9jqGstqR/WpxnZdJBEK/z+7DNWzUFvwUM7VUwZxPv/
 B95mNPcoV47a0o/eKIgpT/jk+JWORmLJv69ZHVwlGqH25UMQzT2niHfVWjvTTHtPBhuw
 IBZRbjLinTtGb93OGU09uLcbxctTK+Gpl2nxEXpFVF3vfoviepbG/lQ0KwoMGmGdSSZL
 9quw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxeo0B54YCrgsqqKCpRw3AdFUIRuhSPpTtSl/rSrHV9ZQLttjOGn+Wwi/6vi33M0/lPldXJBCrHSDTo@nongnu.org
X-Gm-Message-State: AFuF++ntC3QY17RaKQQRBNCnkAp6lXrEazDeFr8Uw9HLGejjkZqJHyWL
 w+UIOU5MleveCWnFU8MV8KWAq+DoXjGXVHo09Xt/bOGETNI8mMuyKV4U
X-Gm-Gg: AYBFou2CLL3UsMhesu5+IqpKFKRBe6t6DRtWxhv/9Ch8/bRBfTGWP81Cufl+zKblAxC
 PiPrf+N3NiTHaQKZ51T53uMhViwEIiSwFlRXHyZekbFgmyIvVqiA5GMfa/qmd0U4VlCYnnEuvGz
 PepndnlspGUppi8wkT9tx79K7yxDoGvpJy6/iOVLvOPDikccvl97mi4TLMIv+n8dxCuW9zJTztj
 3lvh2zWG7BKxRfRTcwAnD3G47LYfJXsR6+EBs5kbBNqLwA2SIgzhynaRK+P/Z4PmZqZ1h8yt0EW
 l9ilHovZd8XPrdNrrgBpZfImXoJ2NNyMP3VO7Q1TLnAJAnhFqo+WtKVPGDSl6BXWe4z6f5C/r4S
 RmckMFw+4hqFyzbmMdW/lGl/OAUNykAnhyNsN3tf06la5BIuNEcy6AGk49i7z2aaulEaWlLwHU5
 Z0VT0ev211dOoUkzdWRQXwVy2hgvvNBfPSLV07IATAKig8G1kOIqGFueGsgkczoHBTEh7NtcFAk
 VwJIGWhAB7JPIr3BUdZ51FkTnZaqnpZLE4+6HW6/FQ=
X-Received: by 2002:a17:90b:53c3:b0:39d:f130:8f13 with SMTP id
 98e67ed59e1d1-39e54e3c624mr1735699a91.21.1789692235617; 
 Thu, 17 Sep 2026 17:43:55 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-144cdfc3df2sm600286c88.5.2026.09.17.17.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 17:43:54 -0700 (PDT)
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
Subject: [PATCH 09/21] target/sparc: convert raise_exception to raise_excp
Date: Fri, 18 Sep 2026 08:42:11 +0800
Message-ID: <20260918004225.827-10-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260918004225.827-1-luoyonggang@gmail.com>
References: <20260918004225.827-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj2-x10.google.com
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

Translate through gen_helper_raise_excp with restore 0 after
save_state. Drop TCG raise_exception. Keep C cpu_raise_exception_ra.
Exit DEBUG and HLT through cpu_loop_exit_excp.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/sparc/helper.c    | 21 +++------------------
 target/sparc/helper.h    |  2 --
 target/sparc/translate.c |  7 ++++---
 3 files changed, 7 insertions(+), 23 deletions(-)

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
index 3156be6a94c..8b22b8e54db 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -1048,7 +1048,8 @@ static void gen_exception(DisasContext *dc, int which)
 {
     finishing_insn(dc);
     save_state(dc);
-    gen_helper_raise_exception(tcg_env, tcg_constant_i32(which));
+    gen_helper_raise_excp(tcg_env, tcg_constant_i32(which),
+                          tcg_constant_i32(0));
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -2811,7 +2812,7 @@ static bool do_tcc(DisasContext *dc, int cond, int cc,
     /* Trap always.  */
     if (cond == 8) {
         save_state(dc);
-        gen_helper_raise_exception(tcg_env, trap);
+        gen_helper_raise_excp(tcg_env, trap, tcg_constant_i32(0));
         dc->base.is_jmp = DISAS_NORETURN;
         return true;
     }
@@ -5833,7 +5834,7 @@ static void sparc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         if (e->npc % 4 == 0) {
             tcg_gen_movi_tl(cpu_npc, e->npc);
         }
-        gen_helper_raise_exception(tcg_env, e->excp);
+        gen_helper_raise_excp(tcg_env, e->excp, tcg_constant_i32(0));
 
         e_next = e->next;
         g_free(e);
-- 
2.52.0.windows.1


