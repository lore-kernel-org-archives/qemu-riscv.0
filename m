Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B11FC982D2
	for <qemu-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 00:47:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x7Miu-0001qx-19; Thu, 17 Sep 2026 20:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7Mir-0001bW-78
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 20:45:01 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x7Min-0001u4-Qb
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 20:45:00 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 d9443c01a7336-2dd53691be5so1550155ad.1
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 17:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789692296; x=1790297096; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rlwPQXKJ16ikMSgsqLAMeiC2pR6ZzncxZZTTxR3by0Q=;
 b=dfunNiax7VeOV8zlLrVJaXHcMLeKXLmdcGoCHZSDRSLnDFmWhtPceuple2CT+jcyfR
 G9ceaxvRpCzm6e43W9MWUR2jem0bytCQIF5s3J1teciJGj4y0WUvTv4vHqgpD/8rczgo
 Z1RCU17Mpu5ys8cL1yF8DCw7dzWZrQcghuRpTPH3ZcIZZy9w7wNYBkvnw7DOGSbGL4os
 2xKzzd8kZgvgiPs0ePdrudkh/M4E7NEvGwYxi8A2hoL7HxrXUX+J/ZNMG42zDg0pr5no
 VJM3r7lu+EMlULL4NEf71zz/62vBbPOoqxPRi03Y02a1lwKrhYdTbKZEWSAcSFQUyE90
 JpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789692296; x=1790297096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rlwPQXKJ16ikMSgsqLAMeiC2pR6ZzncxZZTTxR3by0Q=;
 b=Kka5XRIBw/N79kXte3KAySnu5Gk9cUwSOtk6EjKwPtFDmgAWb6+jI60yqshct1shWb
 xnOy/FYwcM8pdqY5Dq/1pbEOoRC5ii9EkTa015Ag71tx8pg0WY2R0FyM0dmrhaSqbSya
 FksBapVJa6UCw/5hA4ZG/cgzodsbDjEtWECODB2WLfO9iMu4oojLazBajttJPJMToz/N
 he6VQ01OtLdRe98wqpt2nHmGNK3n0D3rk5/2gkDDtJ378CgpbXjknLaVZKJVCFAGb80b
 HUVluwrMOV4GjIalWdZPimqLElEWN1eiJNqvdGxZZGqnAXHwSXKbeW0QzQxBUF11TtHd
 Wb9A==
X-Forwarded-Encrypted: i=1;
 AKwUvBx+zezmB2Cq2WVn9VSgSSejTgjOPFfxaMAM7+u9QYCNb7kWpE2IGZN1iyLRo+UUny7XQJsZJOrCrHUI@nongnu.org
X-Gm-Message-State: AFuF++kH7Rfbywzlbng3sp3Nluba0hxQ1zNlnuVEWQ+HnirBvEHWvlQu
 2tRyzOzGJiKzSzDGeXxPOrp6973I/slWfc4Hu4Ggl3hOXlBeHd5pDYzG
X-Gm-Gg: AYBFou2JUmVBPaSCwJ/zp3iHgYzzqSVoI2ZB3Yxs9p1qodPzYSEq9RvLPFwVuYEplYQ
 u8KJbY0fgSi2xgWIp3+uSeouCYUbAvxP+KxXmyVBVozwW/CpuGAqgQjjpPjXDehtY57uAjk/JOk
 Sp4hqZ1eKAT1IB5+aSVKoXzdUSEEiMrQDjIeC96lx2m6JkbGUJnbk725tFc6vNa2FlieFJmdujr
 RqCx2AAZgQyErblm62gcyisIn+tj3NeR2tpID+OHVjCPvHovzjEPo73YgpkSGW5YIU+s00+16QG
 0OkVxCdZx3pbyD5c0vD3hz8HumWo8huju+oG7q2Tj3FoE/e7sW8LgV8BLmaXRUWZ9wqf0eVc0b3
 c8Z9I296WM3U8+3f6W0mYw4IoDHsus0HBPZVIz26EcYOUvcEMxuoa0BUrVUb7Ph7loj3boN3QCW
 m09yrb/DWQdqJuZw1/Nm2OGcPO1zfthrVkgmpTjQhImjfRH369lZ4cbmSWaOb722bPVAYgjPorE
 cZ/WDS8XPiWhyBUQXQSk8C7mFU6tht5
X-Received: by 2002:a17:90b:3bc8:b0:39e:237c:50e0 with SMTP id
 98e67ed59e1d1-39e54c05010mr1954495a91.13.1789692296221; 
 Thu, 17 Sep 2026 17:44:56 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-144cdfc3df2sm600286c88.5.2026.09.17.17.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 17:44:55 -0700 (PDT)
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
Subject: [PATCH 16/21] target/avr: convert debug/break/sleep to raise_excp
Date: Fri, 18 Sep 2026 08:42:18 +0800
Message-ID: <20260918004225.827-17-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260918004225.827-1-luoyonggang@gmail.com>
References: <20260918004225.827-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj2-x11.google.com
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

Replace debug, break, and sleep TCG helpers with
gen_helper_raise_excp. Keep unsupported.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/avr/helper.c    | 24 ------------------------
 target/avr/helper.h    |  3 ---
 target/avr/translate.c |  6 ++++--
 3 files changed, 4 insertions(+), 29 deletions(-)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index f452c9d9040..ca58a0191fd 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -152,14 +152,6 @@ bool avr_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
  *  helpers
  */
 
-void helper_sleep(CPUAVRState *env)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = EXCP_HLT;
-    cpu_loop_exit(cs);
-}
-
 void helper_unsupported(CPUAVRState *env)
 {
     CPUState *cs = env_cpu(env);
@@ -176,22 +168,6 @@ void helper_unsupported(CPUAVRState *env)
     cpu_loop_exit(cs);
 }
 
-void helper_debug(CPUAVRState *env)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = EXCP_DEBUG;
-    cpu_loop_exit(cs);
-}
-
-void helper_break(CPUAVRState *env)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = EXCP_DEBUG;
-    cpu_loop_exit(cs);
-}
-
 void helper_wdr(CPUAVRState *env)
 {
     qemu_log_mask(LOG_UNIMP, "WDG reset (not implemented)\n");
diff --git a/target/avr/helper.h b/target/avr/helper.h
index e8d13e925f4..09ce0624915 100644
--- a/target/avr/helper.h
+++ b/target/avr/helper.h
@@ -19,8 +19,5 @@
  */
 
 DEF_HELPER_1(wdr, void, env)
-DEF_HELPER_1(debug, noreturn, env)
-DEF_HELPER_1(break, noreturn, env)
-DEF_HELPER_1(sleep, noreturn, env)
 DEF_HELPER_1(unsupported, noreturn, env)
 DEF_HELPER_3(fullwr, void, env, i32, i32)
diff --git a/target/avr/translate.c b/target/avr/translate.c
index 3c576060970..d259ee90963 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -2554,7 +2554,8 @@ static bool trans_BREAK(DisasContext *ctx, arg_BREAK *a)
 
 #ifdef BREAKPOINT_ON_BREAK
     tcg_gen_movi_tl(cpu_pc, ctx->npc - 1);
-    gen_helper_debug(tcg_env);
+    gen_helper_raise_excp(tcg_env, tcg_constant_i32(EXCP_DEBUG),
+                         tcg_constant_i32(0));
     ctx->base.is_jmp = DISAS_EXIT;
 #else
     /* NOP */
@@ -2580,7 +2581,8 @@ static bool trans_NOP(DisasContext *ctx, arg_NOP *a)
  */
 static bool trans_SLEEP(DisasContext *ctx, arg_SLEEP *a)
 {
-    gen_helper_sleep(tcg_env);
+    gen_helper_raise_excp(tcg_env, tcg_constant_i32(EXCP_HLT),
+                         tcg_constant_i32(0));
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
-- 
2.52.0.windows.1


