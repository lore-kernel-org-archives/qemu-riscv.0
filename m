Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWJb-0008CF-1p
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:44:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJO-0007FD-BJ
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:44:34 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJL-0005dz-KB
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:44:33 -0500
Received: by mail-pg1-x536.google.com with SMTP id 16so2831690pge.11
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/choyUiuVszNnrsokDt6HTpPjrDSeCtIo9k1KJDgu7s=;
 b=AF5C9Lmg0UhvnWdbZXvAZ+Lk7hBWs8CNaHQFImgWHxGk3E/5zvqoFakRYm42hjbT5M
 wqLwDp2G0QzETIHVUl4ILfTHqK7mGXlAaCT0EQ7j2yvEJLZDlaqlRvUMqahy9Oc5B9Gq
 LEK9etg0nY7f3RGVwiCSI/pix5QTYOBWqj8LYkNa6pSdAOO7H6kA9iBXs715hIfcVCja
 azdc7Fu2nDPdhGZMU5JwjwIjwjc9cNGOPWPxfemTPFS648vliLnRoPHqFJjKgbV0JHNT
 TZXmlhiA+l+Lwu/VnlOutczFHtP6AVMN3niAV2ybFJH3HnIbXh0co4e9SY2bb7b8a1H+
 7MPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/choyUiuVszNnrsokDt6HTpPjrDSeCtIo9k1KJDgu7s=;
 b=bgZ+QdH5sB3stCVn1jo2QoN+ZWEwikw16UoS2P/Bgj+tsbAXgTZPckAdNJAaXSaDwY
 tJQy+S9u3wf/N0y4hzIkn6psNSsFcobKl2M37l2TAfXAXhCpiQqEG0tUlvRaPRD5UxT8
 gRuItRvMGNTJSqM6Z7KTIjnzxARDrar1YMe7csR0MCAPS2ea+AcQgSrlzrrUdapYydf/
 sChfxJh2HwLRlDRD8Cy5jn1XjoNpET4tYN98XGopd5Wo0VkxK016sY50aC+MfwssGb5E
 CwfhWaBpKolZ8e7OSLJ7ztrtcNtlZfhFNssOrrNCGzx37GLbXTHHzmA1CnnHieiEOg+/
 fFAg==
X-Gm-Message-State: AO0yUKU/yKuNUYo5qLqxEfVJYVBUD/o5Tfsq+c7e9mxj5reYQKHIihr6
 xPpm5Y00VJGXdxXralPHvVVqrQ==
X-Google-Smtp-Source: AK7set9Mra0141Pwi3WsXNZkQW2rRwt/C/ZUmqdTWh5Ga1NZBGTnl8NhuZnHaALztXPyvaVIKNQ73A==
X-Received: by 2002:aa7:960c:0:b0:5a0:c4b6:edd6 with SMTP id
 q12-20020aa7960c000000b005a0c4b6edd6mr21247336pfg.0.1677476666887; 
 Sun, 26 Feb 2023 21:44:26 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:44:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 39/70] target/ppc: Avoid tcg_const_* in vsx-impl.c.inc
Date: Sun, 26 Feb 2023 19:42:02 -1000
Message-Id: <20230227054233.390271-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 27 Feb 2023 05:44:34 -0000

All remaining uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate/vsx-impl.c.inc | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 9916784e64..0f5b0056f1 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -154,7 +154,7 @@ static void gen_lxvdsx(DisasContext *ctx)
 static void gen_bswap16x8(TCGv_i64 outh, TCGv_i64 outl,
                           TCGv_i64 inh, TCGv_i64 inl)
 {
-    TCGv_i64 mask = tcg_const_i64(0x00FF00FF00FF00FF);
+    TCGv_i64 mask = tcg_constant_i64(0x00FF00FF00FF00FF);
     TCGv_i64 t0 = tcg_temp_new_i64();
     TCGv_i64 t1 = tcg_temp_new_i64();
 
@@ -825,7 +825,7 @@ static bool trans_XSCVQPDP(DisasContext *ctx, arg_X_tb_rc *a)
     REQUIRE_INSNS_FLAGS2(ctx, ISA300);
     REQUIRE_VSX(ctx);
 
-    ro = tcg_const_i32(a->rc);
+    ro = tcg_constant_i32(a->rc);
 
     xt = gen_avr_ptr(a->rt);
     xb = gen_avr_ptr(a->rb);
@@ -860,7 +860,7 @@ static void gen_##name(DisasContext *ctx)                                     \
         gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
         return;                                                               \
     }                                                                         \
-    opc = tcg_const_i32(ctx->opcode);                                         \
+    opc = tcg_constant_i32(ctx->opcode);                                      \
     gen_helper_##name(cpu_env, opc);                                          \
 }
 
@@ -900,7 +900,7 @@ static void gen_##name(DisasContext *ctx)                                     \
         gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
         return;                                                               \
     }                                                                         \
-    opc = tcg_const_i32(ctx->opcode);                                         \
+    opc = tcg_constant_i32(ctx->opcode);                                      \
     xa = gen_vsr_ptr(xA(ctx->opcode));                                        \
     xb = gen_vsr_ptr(xB(ctx->opcode));                                        \
     gen_helper_##name(cpu_env, opc, xa, xb);                                  \
@@ -915,7 +915,7 @@ static void gen_##name(DisasContext *ctx)                                     \
         gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
         return;                                                               \
     }                                                                         \
-    opc = tcg_const_i32(ctx->opcode);                                         \
+    opc = tcg_constant_i32(ctx->opcode);                                      \
     xb = gen_vsr_ptr(xB(ctx->opcode));                                        \
     gen_helper_##name(cpu_env, opc, xb);                                      \
 }
@@ -929,7 +929,7 @@ static void gen_##name(DisasContext *ctx)                                     \
         gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
         return;                                                               \
     }                                                                         \
-    opc = tcg_const_i32(ctx->opcode);                                         \
+    opc = tcg_constant_i32(ctx->opcode);                                      \
     xt = gen_vsr_ptr(rD(ctx->opcode) + 32);                                   \
     xa = gen_vsr_ptr(rA(ctx->opcode) + 32);                                   \
     xb = gen_vsr_ptr(rB(ctx->opcode) + 32);                                   \
@@ -945,7 +945,7 @@ static void gen_##name(DisasContext *ctx)                                     \
         gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
         return;                                                               \
     }                                                                         \
-    opc = tcg_const_i32(ctx->opcode);                                         \
+    opc = tcg_constant_i32(ctx->opcode);                                      \
     xt = gen_vsr_ptr(rD(ctx->opcode) + 32);                                   \
     xb = gen_vsr_ptr(rB(ctx->opcode) + 32);                                   \
     gen_helper_##name(cpu_env, opc, xt, xb);                                  \
@@ -960,7 +960,7 @@ static void gen_##name(DisasContext *ctx)                                     \
         gen_exception(ctx, POWERPC_EXCP_VSXU);                                \
         return;                                                               \
     }                                                                         \
-    opc = tcg_const_i32(ctx->opcode);                                         \
+    opc = tcg_constant_i32(ctx->opcode);                                      \
     xa = gen_vsr_ptr(rA(ctx->opcode) + 32);                                   \
     xb = gen_vsr_ptr(rB(ctx->opcode) + 32);                                   \
     gen_helper_##name(cpu_env, opc, xa, xb);                                  \
@@ -1994,8 +1994,8 @@ static void gen_xsxsigdp(DisasContext *ctx)
     exp = tcg_temp_new_i64();
     t0 = tcg_temp_new_i64();
     t1 = tcg_temp_new_i64();
-    zr = tcg_const_i64(0);
-    nan = tcg_const_i64(2047);
+    zr = tcg_constant_i64(0);
+    nan = tcg_constant_i64(2047);
 
     get_cpu_vsr(t1, xB(ctx->opcode), true);
     tcg_gen_extract_i64(exp, t1, 52, 11);
@@ -2026,8 +2026,8 @@ static void gen_xsxsigqp(DisasContext *ctx)
     get_cpu_vsr(xbl, rB(ctx->opcode) + 32, false);
     exp = tcg_temp_new_i64();
     t0 = tcg_temp_new_i64();
-    zr = tcg_const_i64(0);
-    nan = tcg_const_i64(32767);
+    zr = tcg_constant_i64(0);
+    nan = tcg_constant_i64(32767);
 
     tcg_gen_extract_i64(exp, xbh, 48, 15);
     tcg_gen_movi_i64(t0, 0x0001000000000000);
@@ -2193,8 +2193,8 @@ static void gen_xvxsigdp(DisasContext *ctx)
     get_cpu_vsr(xbl, xB(ctx->opcode), false);
     exp = tcg_temp_new_i64();
     t0 = tcg_temp_new_i64();
-    zr = tcg_const_i64(0);
-    nan = tcg_const_i64(2047);
+    zr = tcg_constant_i64(0);
+    nan = tcg_constant_i64(2047);
 
     tcg_gen_extract_i64(exp, xbh, 52, 11);
     tcg_gen_movi_i64(t0, 0x0010000000000000);
-- 
2.34.1


