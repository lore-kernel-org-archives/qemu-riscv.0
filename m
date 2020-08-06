Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dS9-0003AB-Px
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dS7-000388-TQ
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:51 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:36502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dS4-0007uv-Kw
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:51 -0400
Received: by mail-pf1-x434.google.com with SMTP id m8so17862467pfh.3
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7zatC+tzrXp+A9xuiZ1D/H6H+NHiImlD3B/njQwKS1Y=;
 b=Tx5ceoHWHCj94/uXuRO7PxRevgEQnI1EyAiP92OlMpfhQrEFqfMkrnWoZumbY9bj6V
 77R+5AZQOytzJU7q2ssDm37C+oW7BN/ehEihMgJCIgK7U06nIPO7ZqPcN24xjtc1MraN
 3tRw0+N81hq+5yFtkbExJWGQCd9DiHOHliQ84d4i+0XhL7qaBhOnJmN2vxpDM3NOkd0l
 kXnL9Y1BBSbHbxKrniizH0lYBGBSpOSiCrNeRvsVqN3cyKn+4ERS90OxFGztMNHiMizw
 MoCGlW6Wnp40Z9zNuCvFvBu7D9YGlLOZ/cduCiPbx1HBe4pimTAa0O2PLCAFy79MtIPu
 rM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7zatC+tzrXp+A9xuiZ1D/H6H+NHiImlD3B/njQwKS1Y=;
 b=A3uEm3pSvROcloS0MuOxkn5WRzrbsCUt0F4O3qg5NHJuwt1T3nBZE11OHujWZf1vcL
 24W4NHo4Y1IZHnAaYo4FC4UXnJjdQ5JT1DeSiujFj9AlUuNjjJtOtuusIrd65xsI++qz
 1u+ItTyZ0gOhP7g8NE9PR8NEheAvpKrvI38ftAr5iaalfQVRLSmVSTY36HCK14ngdHSr
 CrTvwIB+mWMaYR27KphQzI8XJzXZ8W6R2Cuzt+Xd4c+890xj/b2U+TlMj8kBVay9JUei
 ZpuXYbk3OoM4cfGMLIfMyZbFuFiaEhcaPm6ymjHP8NTv9LCVIcavQtOmm71KAD458k45
 yyXw==
X-Gm-Message-State: AOAM530YFDLugnohq2t0yOHUIpitCH2TPbjmEuepnUYXwD5h41WrzCIE
 d5VsHeleLGX3AX+rR2CHa6hzzw==
X-Google-Smtp-Source: ABdhPJzwl1xLErosET6KquJ9VcJInZFTMl1fwcmGFD/XnqZs9eg3aG+PYCf8nfhRVvwGxtrqhKujwQ==
X-Received: by 2002:a63:3c08:: with SMTP id j8mr6476159pga.82.1596710927490;
 Thu, 06 Aug 2020 03:48:47 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:48:47 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 35/71] target/riscv: rvv-1.0: allow load element with
 sign-extended
Date: Thu,  6 Aug 2020 18:46:32 +0800
Message-Id: <20200806104709.13235-36-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x434.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Aug 2020 10:48:52 -0000

From: Frank Chang <frank.chang@sifive.com>

For some vector instructions (e.g. vmv.s.x), the element is loaded with
sign-extended.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 26 ++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 62c6b469364..469d0bad056 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -3041,17 +3041,29 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
 /* Integer Extract Instruction */
 
 static void load_element(TCGv_i64 dest, TCGv_ptr base,
-                         int ofs, int sew)
+                         int ofs, int sew, bool sign)
 {
     switch (sew) {
     case MO_8:
-        tcg_gen_ld8u_i64(dest, base, ofs);
+        if (!sign) {
+            tcg_gen_ld8u_i64(dest, base, ofs);
+        } else {
+            tcg_gen_ld8s_i64(dest, base, ofs);
+        }
         break;
     case MO_16:
-        tcg_gen_ld16u_i64(dest, base, ofs);
+        if (!sign) {
+            tcg_gen_ld16u_i64(dest, base, ofs);
+        } else {
+            tcg_gen_ld16s_i64(dest, base, ofs);
+        }
         break;
     case MO_32:
-        tcg_gen_ld32u_i64(dest, base, ofs);
+        if (!sign) {
+            tcg_gen_ld32u_i64(dest, base, ofs);
+        } else {
+            tcg_gen_ld32s_i64(dest, base, ofs);
+        }
         break;
     case MO_64:
         tcg_gen_ld_i64(dest, base, ofs);
@@ -3106,7 +3118,7 @@ static void vec_element_loadx(DisasContext *s, TCGv_i64 dest,
 
     /* Perform the load. */
     load_element(dest, base,
-                 vreg_ofs(s, vreg), s->sew);
+                 vreg_ofs(s, vreg), s->sew, false);
     tcg_temp_free_ptr(base);
     tcg_temp_free_i32(ofs);
 
@@ -3124,9 +3136,9 @@ static void vec_element_loadx(DisasContext *s, TCGv_i64 dest,
 }
 
 static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
-                              int vreg, int idx)
+                              int vreg, int idx, bool sign)
 {
-    load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew);
+    load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew, sign);
 }
 
 static bool trans_vext_x_v(DisasContext *s, arg_r *a)
-- 
2.17.1


