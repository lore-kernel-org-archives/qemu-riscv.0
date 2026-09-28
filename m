Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC495CA5FA1
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 05:28:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xB3tp-0002JE-1h; Mon, 28 Sep 2026 01:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3qB-0006Hw-8x
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 01:23:51 -0400
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3q7-0008AB-Me
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 01:23:50 -0400
Received: by mail-dl2-x0f.google.com with SMTP id
 a92af1059eb24-142dd05d97cso3040936c88.2
 for <qemu-riscv@nongnu.org>; Sun, 27 Sep 2026 22:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790573026; x=1791177826; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TMiiV36GFrwyzgJ2vCGHA2UMWPnrC1dDVw1vxHvYfWc=;
 b=dASwEdAg1MzdQiD891AholRW/LTGgmLkR8OTLaNRB+XVoLQffLUs5k2zYSOVXBi4ws
 URq3mVUhi6WVF7kNt4+0MN88PnvvTR4tiQXr6o+Cm/OPvonHYTYOdDuQ19HIh5ofe7Bn
 blLrZotCRCYXO562EhuwFNMpTm31xXH1li9aOVXthj0ta1YGgKn29GChCjn98jVMvm1C
 Thgq8AENFTwQxf8P25dj08rySKAuT9ZtuK4qe3whD5I0HSuV22IkPbiOQJV2cXBD3PgL
 3Y6kDuHL9RKYEIUbNa/nCca4OYYlGf7yOyJDTpacJBqR4w/x5uUCuj1JpDv5LbWcFwwZ
 Lzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790573026; x=1791177826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TMiiV36GFrwyzgJ2vCGHA2UMWPnrC1dDVw1vxHvYfWc=;
 b=x4I+2lYlp7rh57Ro3XM0MUVZlHrgERvS4KdoPtI7gd5SYJD4br/6D/tR6paYOcCGCi
 onPQ+DFXEynow2WKUlUiSACiQNv6HM56YoDIdIFXjhCs56i3HnbqSxmCC4RteLMyXfz8
 YUtPS4qjxIB+Dbb0AtKqlw592k+nvi3uSGr7L52US0Tc0pK7ZiHl9BATjf+nM0LweeEC
 1NXIoX8LZbqO1BviZ2BWvssL72ro+G4xEFXqu8O5oZVdpLBmvrx/Igzz9azP6bDGr1wh
 MtYi50NhccImaKveWamTZUhxguMSelXHgULiL4uiBWjKDnD8DGdy4VZx5A81OwQSgaYO
 C4sw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzH4rMQtlMT2+7j9RN7LOJzmPIMgBoQzSoTEEK958Ze+j5oPuel3UTi7o9sgQVRIniDDzqwMGhW2IxY@nongnu.org
X-Gm-Message-State: AFuF++mWD2QbwIL1N25HJpUfhxcPLrUhW4uUpnJR0bnpVsgJvEfxwjxD
 3Uyz0w9NBtbZ+K+GavX3pMO0zuZ3NP8Z6t04WdbeMlijBxG0DvNZy6NC
X-Gm-Gg: AYBFou3Sl7AIxWFgRea8lw8cOBQpFApmXM0jUvnLrUdUuJ/Yd8yHhBQpK6mATCzzR9F
 1Wvkq8r/qCes65auYHPp0hBcyfWqrCk3nKBt+cP8hjoykp8yfkcECWD1ialODBcc8aTF/AiOeEx
 T09FTehbaHcLFYEpLYNQvoGwADKd2bOBwcWXkOKXZNIF1la2aoki/BrqleMQkM30cViOos/qEkf
 F5S4Not6Wk+FVOCXG8KxwIeLaS7AUjaknx8bTwH44qAhSMURR0MV4IUbjrUoU+r5UoEs+wz7Q+A
 vjSdMLmaD9Qj3I1yj8BLkBAqz4n8aBmMNMuwHOdf1kMkyHLwPq7alE1lIhjlArGR+8hWGf8yP9s
 z8HJN6+rR8XIzamvS+yK2d4CNnV/lAohuuXQfcYNzmjEXMAp0gXJaoSQr0QstjMy7t6nNvPIdXv
 nT4dZq/3bg5uwncm9kE0q2c8RaFIyeqFlT0JQd2nna6I2Am8c93oLTNtCFImOWx6GrrANHxyopL
 7EoXB+Qjb+hrhnPhJeIQrWucZMKSqs=
X-Received: by 2002:a05:7022:b0c6:b0:145:4ef:e8de with SMTP id
 a92af1059eb24-146ce67f233mr8287670c88.6.1790573026184; 
 Sun, 27 Sep 2026 22:23:46 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-146bb6551d9sm14726248c88.9.2026.09.27.22.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 22:23:45 -0700 (PDT)
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
Subject: [PATCH v2 21/24] target/riscv: convert raise_exception to
 riscv_raise_exception
Date: Mon, 28 Sep 2026 13:20:47 +0800
Message-ID: <20260928052051.251-22-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260928052051.251-1-luoyonggang@gmail.com>
References: <20260928052051.251-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0f.google.com
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

Prefix leftover TCG raise_exception to riscv_raise_exception so
translate still decrements instret then exits with restore 0. Keep
C riscv_raise_exception via cpu_loop_exit_excp.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/helper.h                             |  2 +-
 target/riscv/tcg/insn_trans/trans_rvi.c.inc       |  6 ++----
 target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc |  3 +--
 target/riscv/tcg/op_helper.c                      |  5 ++---
 target/riscv/tcg/translate.c                      | 10 +++++++---
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index aab92bf132a..9458a5152be 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1,5 +1,5 @@
 /* Exceptions */
-DEF_HELPER_2(raise_exception, noreturn, env, i32)
+DEF_HELPER_2(riscv_raise_exception, noreturn, env, i32)
 
 /* Floating Point - rounding mode */
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
diff --git a/target/riscv/tcg/insn_trans/trans_rvi.c.inc b/target/riscv/tcg/insn_trans/trans_rvi.c.inc
index 40b4c9aa4ab..b9b554f4e5d 100644
--- a/target/riscv/tcg/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvi.c.inc
@@ -55,8 +55,7 @@ static bool trans_lpad(DisasContext *ctx, arg_lpad *a)
          */
         tcg_gen_st8_i32(tcg_constant_i32(RISCV_EXCP_SW_CHECK_FCFI_TVAL),
                         tcg_env, offsetof(CPURISCVState, sw_check_code));
-        gen_helper_raise_exception(tcg_env,
-                      tcg_constant_i32(RISCV_EXCP_SW_CHECK));
+        gen_raise_exception(RISCV_EXCP_SW_CHECK);
         return true;
     }
 
@@ -68,8 +67,7 @@ static bool trans_lpad(DisasContext *ctx, arg_lpad *a)
         tcg_gen_brcondi_tl(TCG_COND_EQ, tmp, a->label, skip);
         tcg_gen_st8_i32(tcg_constant_i32(RISCV_EXCP_SW_CHECK_FCFI_TVAL),
                         tcg_env, offsetof(CPURISCVState, sw_check_code));
-        gen_helper_raise_exception(tcg_env,
-                      tcg_constant_i32(RISCV_EXCP_SW_CHECK));
+        gen_raise_exception(RISCV_EXCP_SW_CHECK);
         gen_set_label(skip);
     }
 
diff --git a/target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc b/target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc
index d47a9f9c7d2..087328a12ef 100644
--- a/target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvzicfiss.c.inc
@@ -43,8 +43,7 @@ static bool trans_sspopchk(DisasContext *ctx, arg_sspopchk *a)
     tcg_gen_brcond_tl(TCG_COND_EQ, data, rs1, skip);
     tcg_gen_st8_i32(tcg_constant_i32(RISCV_EXCP_SW_CHECK_BCFI_TVAL),
                     tcg_env, offsetof(CPURISCVState, sw_check_code));
-    gen_helper_raise_exception(tcg_env,
-                  tcg_constant_i32(RISCV_EXCP_SW_CHECK));
+    gen_raise_exception(RISCV_EXCP_SW_CHECK);
     gen_set_label(skip);
     tcg_gen_addi_tl(addr, addr, tmp);
     tcg_gen_ext_tl_i64(wide_addr, addr);
diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index b67c7718db4..a00370a7973 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -47,11 +47,10 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
                           riscv_cpu_get_trap_name(exception, false),
                           env->pc);
 
-    cs->exception_index = exception;
-    cpu_loop_exit_restore(cs, pc);
+    cpu_loop_exit_excp(cs, exception, pc);
 }
 
-void helper_raise_exception(CPURISCVState *env, uint32_t exception)
+void HELPER(riscv_raise_exception)(CPURISCVState *env, uint32_t exception)
 {
 #ifndef CONFIG_USER_ONLY
     riscv_pmu_decr_instret(env);
diff --git a/target/riscv/tcg/translate.c b/target/riscv/tcg/translate.c
index cce3b6dc721..08640c4ebd1 100644
--- a/target/riscv/tcg/translate.c
+++ b/target/riscv/tcg/translate.c
@@ -257,10 +257,15 @@ static void gen_update_pc(DisasContext *ctx, target_long diff)
     ctx->pc_save = ctx->base.pc_next + diff;
 }
 
+static void gen_raise_exception(uint32_t excp)
+{
+    gen_helper_riscv_raise_exception(tcg_env, tcg_constant_i32(excp));
+}
+
 static void generate_exception(DisasContext *ctx, RISCVException excp)
 {
     gen_update_pc(ctx, 0);
-    gen_helper_raise_exception(tcg_env, tcg_constant_i32(excp));
+    gen_raise_exception(excp);
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -1424,8 +1429,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         tcg_ctx->emit_before_op = QTAILQ_NEXT(ctx->base.insn_start, link);
         tcg_gen_st8_i32(tcg_constant_i32(RISCV_EXCP_SW_CHECK_FCFI_TVAL),
                         tcg_env, offsetof(CPURISCVState, sw_check_code));
-        gen_helper_raise_exception(tcg_env,
-                      tcg_constant_i32(RISCV_EXCP_SW_CHECK));
+        gen_raise_exception(RISCV_EXCP_SW_CHECK);
         tcg_ctx->emit_before_op = NULL;
         ctx->base.is_jmp = DISAS_NORETURN;
     }
-- 
2.52.0.windows.1


