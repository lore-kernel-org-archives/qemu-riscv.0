Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E93C5475B
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 21:56:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1riiAz-0007fs-HY; Fri, 08 Mar 2024 16:54:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1riiAx-0007eo-RU
 for qemu-riscv@nongnu.org; Fri, 08 Mar 2024 16:54:47 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1riiAk-0001nN-IX
 for qemu-riscv@nongnu.org; Fri, 08 Mar 2024 16:54:47 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1dd611d5645so13977685ad.1
 for <qemu-riscv@nongnu.org>; Fri, 08 Mar 2024 13:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1709934873; x=1710539673; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2KV48rdBX7Wpw7Trw54RC0MJqWdDF+3+ZuGzrNO+LZU=;
 b=MtsPlEp5pXhXo+zhYhE5PiJUVvftKrq8waMVSTQH45g5BQmm5ruAy5h2mBi3UZW9bM
 QmgXcHoOqaUWmHw4ruvCP64n0OGSwCmk+7M3Qzkzu6WF+s4oUTIGR4aKLuVvl9jyj4qm
 bLFR/sNJ5PCp6LjeQvJYW7wGuDYgl8y3aUioQ16n55X9BgonLpbvY4htGdqWRAqugTQu
 kLv3gC24BihuomyFT8cUeRkRJ4rHo3Vl/ntOOh+P0m8SeBqYQVUPTWvlFQWQJSa0+FWf
 aqXP5YnnrSpXsL7MfjOEQ7w/NFl1m1I5sRxBB+E4nA9F7ZkIqEqGsnjOH95wjpPpJGzO
 sucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709934873; x=1710539673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2KV48rdBX7Wpw7Trw54RC0MJqWdDF+3+ZuGzrNO+LZU=;
 b=B03jirT7byefZBNI+IaJA2khkxI65npy63fqV1xUWPPWy0seD97SR0QklwjQz4Yul4
 P+zuBDm5eVQ03foLu4AprCzJwfmQEDchYx/wZAL/9NaAxVUAKeaQoSO9Ng5WE2/ItSFn
 AZnH6/zodlVUrGvy0g0GGnb9LhonyWwwvOd2uo84mVUj85mjYPcWhrn4+8KaFuo3c38s
 9BrenMNrDuX3hnKQUMcw1fgOCBtU1dhTqrPHkh2r5wGsdaJL7fOY8qZfa7b4VYjMLWX9
 6x/xNNFTPAoMl70HVLDVpO2s0wHZjsJvIRsfrNiSb7v9Xmi7nRbiOTw9WkZx6vA7NO83
 ePCA==
X-Gm-Message-State: AOJu0YwRvNZGzlVVkBFsi+TEdHZph1MPOSbc2vPhojSjK0+8EyUqqjeK
 HqfFxpZIbzG8CWOV2lzCPAoSbUP7/E7V5Y2qyeV+FstLq8hKoZTC/TLoQS+6WpA=
X-Google-Smtp-Source: AGHT+IEzrKTABVkVxMw0osFQbdOYEBAanPrGmHYhuiTJ+5RUWSTLrY7w3SmdI6zsumNpbGA4idXWxw==
X-Received: by 2002:a17:902:c942:b0:1dd:91c:249f with SMTP id
 i2-20020a170902c94200b001dd091c249fmr704600pla.24.1709934873308; 
 Fri, 08 Mar 2024 13:54:33 -0800 (PST)
Received: from grind.. ([177.94.15.159]) by smtp.gmail.com with ESMTPSA id
 d3-20020a170902b70300b001dd66e6ec91sm107702pls.140.2024.03.08.13.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Mar 2024 13:54:32 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 06/10] trans_rvv.c.inc: set vstart = 0 in int scalar move
 insns
Date: Fri,  8 Mar 2024 18:53:46 -0300
Message-ID: <20240308215402.117405-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240308215402.117405-1-dbarboza@ventanamicro.com>
References: <20240308215402.117405-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

trans_vmv_x_s, trans_vmv_s_x, trans_vfmv_f_s and trans_vfmv_s_f aren't
setting vstart = 0 after execution. This is usually done by a helper in
vector_helper.c but these functions don't use helpers.

We'll set vstart after any potential 'over' brconds, and that will also
mandate a mark_vs_dirty() too.

Fixes: dedc53cbc9 ("target/riscv: rvv-1.0: integer scalar move instructions")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index e42728990e..f3caabc101 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3356,6 +3356,13 @@ static void vec_element_storei(DisasContext *s, int vreg,
     store_element(val, tcg_env, endian_ofs(s, vreg, idx), s->sew);
 }
 
+static void vec_set_vstart_zero(void)
+{
+    TCGv_i32 t_zero = tcg_constant_i32(0);
+
+    tcg_gen_st_i32(t_zero, tcg_env, offsetof(CPURISCVState, vstart));
+}
+
 /* vmv.x.s rd, vs2 # x[rd] = vs2[0] */
 static bool trans_vmv_x_s(DisasContext *s, arg_vmv_x_s *a)
 {
@@ -3373,6 +3380,8 @@ static bool trans_vmv_x_s(DisasContext *s, arg_vmv_x_s *a)
         vec_element_loadi(s, t1, a->rs2, 0, true);
         tcg_gen_trunc_i64_tl(dest, t1);
         gen_set_gpr(s, a->rd, dest);
+        vec_set_vstart_zero();
+        mark_vs_dirty(s);
         return true;
     }
     return false;
@@ -3399,8 +3408,9 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
         s1 = get_gpr(s, a->rs1, EXT_NONE);
         tcg_gen_ext_tl_i64(t1, s1);
         vec_element_storei(s, a->rd, 0, t1);
-        mark_vs_dirty(s);
         gen_set_label(over);
+        vec_set_vstart_zero();
+        mark_vs_dirty(s);
         return true;
     }
     return false;
@@ -3427,6 +3437,8 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
         }
 
         mark_fs_dirty(s);
+        vec_set_vstart_zero();
+        mark_vs_dirty(s);
         return true;
     }
     return false;
@@ -3452,8 +3464,9 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
         do_nanbox(s, t1, cpu_fpr[a->rs1]);
 
         vec_element_storei(s, a->rd, 0, t1);
-        mark_vs_dirty(s);
         gen_set_label(over);
+        vec_set_vstart_zero();
+        mark_vs_dirty(s);
         return true;
     }
     return false;
-- 
2.43.2


