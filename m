Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscT-0005rM-1W
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqer-0005rp-T0
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:53:33 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:34323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqeq-0006u5-6Z
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:53:33 -0400
Received: by mail-pl1-x630.google.com with SMTP id o1so2111406plk.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tBnAJhAlit3EEk4IfkYd7FFS8r9QvZAaywDv+5JnQ7Q=;
 b=LagQYw+IagncTPgGcAlFm+IFVkta/5EeKu/6H8pf0Qep8R3oCZ/kI9OyBsiGxSRGV3
 XqH96f/h5DXQd8Mp56BuhAwz5ZBUU6kJNKAUqBZqtdin0SqD2PG90nIUZjS4YSYO4Dhf
 FfINVKRv+eQ8lO2rAUG1D0ENm3ZcAUh6MbSsp/SbB9AALMAn2BmUZGMiJzqrGUbSbMQ4
 XJIS3R14SqkQ43KDDlw3+2DAdwf1WWsdWWby0puxinAXEL1LewTJmU6tjeMa68tLRXIG
 cLpNKX+L5F6gKsJfpIiELJyFUOY57s5q3DyB4tTonoz8VEj7zrpZKw4jY8z4xHnkhH6M
 2v5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tBnAJhAlit3EEk4IfkYd7FFS8r9QvZAaywDv+5JnQ7Q=;
 b=J1lyfY4njRRUztYVPa1yFelnaHsRV7G9VES2uy8334zgGjjp3LGv6Ptb7otIVAqUzV
 SKimPFfqkzTRTNUgbUt+Ucw4v1qWIKFVq4gR5KW6PdOvUd7fUX3i6iSVEUK5gKsbd5qa
 xoIJhriPj/aA7NQEA3u3uzsMhJVeejaiKkkZuEMyJxQ5Ei+h0h10Z1ZFZxWfa+8LrKyP
 RAClEKy0RUOxK6ecTLxL1AyBpzlRwFtkzZyoXPsrE2JYDKjcNc7P4I5O4davrCG40X7F
 2kdH9Dhy8c+y40RQRT62YDkfc7FWxfxVLsGwx+6neJ1oOK/lw1DD2guzzfNO2Uovwphp
 vueg==
X-Gm-Message-State: AOAM531sdsjKlq6fnTMQ33gaaMZQ35pJZZWId5hW4rvxw6i5UD8cc1ns
 HB7pUAblVHmB7qHuIEo3qJyCAO7wBcqfqg==
X-Google-Smtp-Source: ABdhPJx0oG42neUAwxJRcYgy/v6vVZqwdVvptIUEFwjlApq6+Jhmuq3dOryyIDceU/lLNGnAsy/LAQ==
X-Received: by 2002:a17:902:524:: with SMTP id
 33mr38535288plf.218.1594378411028; 
 Fri, 10 Jul 2020 03:53:31 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:53:30 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 44/65] target/riscv: rvv-0.9: mask-register logical instructions
Date: Fri, 10 Jul 2020 18:48:58 +0800
Message-Id: <20200710104920.13550-45-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x630.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:59:04 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:53:34 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 30 ++++++++++++-------------
 target/riscv/vector_helper.c            |  7 ++++--
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index f441385f3a..59b25e17f8 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2774,22 +2774,22 @@ GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
 #define GEN_MM_TRANS(NAME)                                         \
 static bool trans_##NAME(DisasContext *s, arg_r *a)                \
 {                                                                  \
-    if (vext_check_isa_ill(s)) {                                   \
-        uint32_t data = 0;                                         \
-        gen_helper_gvec_4_ptr *fn = gen_helper_##NAME;             \
-        TCGLabel *over = gen_new_label();                          \
-        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+    REQUIRE_RVV;                                                   \
+    VEXT_CHECK_ISA_ILL(s);                                         \
                                                                    \
-        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
-        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
-        tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
-                           vreg_ofs(s, a->rs1),                    \
-                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
-                           s->vlen / 8, data, fn);                 \
-        gen_set_label(over);                                       \
-        return true;                                               \
-    }                                                              \
-    return false;                                                  \
+    uint32_t data = 0;                                             \
+    gen_helper_gvec_4_ptr *fn = gen_helper_##NAME;                 \
+    TCGLabel *over = gen_new_label();                              \
+    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);              \
+                                                                   \
+    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                 \
+    data = FIELD_DP32(data, VDATA, VMA, s->vma);                   \
+    tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),         \
+                       vreg_ofs(s, a->rs1),                        \
+                       vreg_ofs(s, a->rs2), cpu_env, 0,            \
+                       s->vlen / 8, data, fn);                     \
+    gen_set_label(over);                                           \
+    return true;                                                   \
 }
 
 GEN_MM_TRANS(vmand_mm)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 7a10b957df..6484c660c6 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4731,6 +4731,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   uint32_t desc)                          \
 {                                                         \
     uint32_t vlmax = env_archcpu(env)->cfg.vlen;          \
+    uint32_t vta = vext_vta(desc);                        \
     uint32_t vl = env->vl;                                \
     uint32_t i;                                           \
     int a, b;                                             \
@@ -4740,8 +4741,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
         b = vext_elem_mask(vs2, i);                       \
         vext_set_elem_mask(vd, i, OP(b, a));              \
     }                                                     \
-    for (; i < vlmax; i++) {                              \
-        vext_set_elem_mask(vd, i, 0);                     \
+    if (vta == 1) {                                       \
+        for (; i < vlmax; i++) {                          \
+            vext_set_elem_mask(vd, i, 0);                 \
+        }                                                 \
     }                                                     \
 }
 
-- 
2.17.1


