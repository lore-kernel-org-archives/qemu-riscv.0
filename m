Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscq-0006gS-9S
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqf5-0005xK-1H
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:53:47 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:39917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqf3-0006vr-82
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:53:46 -0400
Received: by mail-pg1-x52b.google.com with SMTP id z5so2372001pgb.6
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dXTMaAytKPgGZOYeyuxp0EWgMM3z2nIrmJVAFe7+Hao=;
 b=KBB/zwv5c6qxCKaKAn9hZDdnGprEAOI7k/HC1dJr85VrzU6Enx56RRMEljq4se79wA
 mqglcCMLByHGhwC330W67z5AfRAXzjmUFRMB12+t99LkXbVrk11FzXaPauhOQJDC7tin
 mtMud9V0NGxsPYG/R9EoPuEpOmK4ctkulRJ3tfvpmcNhiVdL6rHiA0kmIlB+eho2S9al
 2wdAu1rQR2Q5xd4giTsjofBZ3URH7nW9RScD8q+xkmfeAtf3jR17KsBy6A+MYtADEeT8
 2XoRTYXwYyBfdkU5PPGJdxGc6II3FQemmZYdk0QGyFIhK56h+Z5fx/YC81cWUkw20MKT
 TndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dXTMaAytKPgGZOYeyuxp0EWgMM3z2nIrmJVAFe7+Hao=;
 b=WfTZ5lEstc2F/on/s2TD8psVtmzYwbp62G9kr9RI7IBOAolYZ0XFynAY8tTMWNUZKi
 eGKKImi6ceflwwIOoVy8JIG9COvOxbGjwij5uUu+7DDUvgs5XS5Ogtbw/YKrvYphxz29
 L2i8IQD/xr18YCAiHRFdflGm5gJ7zjQ7M9R5DuXww2cB0pCuQ4B4RQ4MuSIbcrxoFn7x
 LFv+Ek00Jcvw6lyVpHuMiR4A0/jsvzsQU5CYOLkj6zpj+V2rbmAB6eWg+HMJJK4iLglw
 IFsBaZmkp56W5UF9vna2SU6G8lIHmxfnYArXX3Erlv3mchis0aYi+nFrhVxTX4ct+/HB
 KWmA==
X-Gm-Message-State: AOAM531UUUPRFzLtp9AmPXAgKmvZkQ7MhuGb/oN2xM89mZcHeiPMw3lK
 Wx4eYUcrYZq0slOPpHznYjaArg==
X-Google-Smtp-Source: ABdhPJzpCzypn7STcLlHGeGT+U4vaGkyo4jBY5Lf96pVIX+YY5YbTvxKOStaZndzxQTxfqOnVJxzJw==
X-Received: by 2002:a63:4b44:: with SMTP id k4mr60185561pgl.305.1594378424063; 
 Fri, 10 Jul 2020 03:53:44 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:53:43 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 47/65] target/riscv: rvv-0.9: floating-point slide instructions
Date: Fri, 10 Jul 2020 18:49:01 +0800
Message-Id: <20200710104920.13550-48-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 10:53:47 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vfslide1up.vf
* vfslide1down.vf

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |  7 ++++
 target/riscv/insn32.decode              |  2 +
 target/riscv/insn_trans/trans_rvv.inc.c |  4 ++
 target/riscv/vector_helper.c            | 51 +++++++++++++++++++++++++
 4 files changed, 64 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 2a4e1ea773..d2bf9be551 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1114,6 +1114,13 @@ DEF_HELPER_6(vslide1down_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vslide1down_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vslide1down_vx_d, void, ptr, ptr, tl, ptr, env, i32)
 
+DEF_HELPER_6(vfslide1up_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfslide1up_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfslide1up_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfslide1down_vf_h, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfslide1down_vf_w, void, ptr, ptr, i64, ptr, env, i32)
+DEF_HELPER_6(vfslide1down_vf_d, void, ptr, ptr, i64, ptr, env, i32)
+
 DEF_HELPER_6(vrgather_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vrgather_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vrgather_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index acd65cb3a7..ed34ccd0e3 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -530,6 +530,8 @@ vfsgnjn_vv      001001 . ..... ..... 001 ..... 1010111 @r_vm
 vfsgnjn_vf      001001 . ..... ..... 101 ..... 1010111 @r_vm
 vfsgnjx_vv      001010 . ..... ..... 001 ..... 1010111 @r_vm
 vfsgnjx_vf      001010 . ..... ..... 101 ..... 1010111 @r_vm
+vfslide1up_vf   001110 . ..... ..... 101 ..... 1010111 @r_vm
+vfslide1down_vf 001111 . ..... ..... 101 ..... 1010111 @r_vm
 vmfeq_vv        011000 . ..... ..... 001 ..... 1010111 @r_vm
 vmfeq_vf        011000 . ..... ..... 101 ..... 1010111 @r_vm
 vmfne_vv        011100 . ..... ..... 001 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index dab642ab7a..f46cccc9bb 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -3248,6 +3248,10 @@ GEN_OPIVX_TRANS(vslidedown_vx, slidedown_check)
 GEN_OPIVX_TRANS(vslide1down_vx, slidedown_check)
 GEN_OPIVI_TRANS(vslidedown_vi, 1, vslidedown_vx, slidedown_check)
 
+/* Vector Floating-Point Slide Instructions */
+GEN_OPFVF_TRANS(vfslide1up_vf, slideup_check)
+GEN_OPFVF_TRANS(vfslide1down_vf, slidedown_check)
+
 /* Vector Register Gather Instruction */
 static bool vrgather_vv_check(DisasContext *s, arg_rmrr *a)
 {
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 050f4fd895..cf245e0145 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -5016,6 +5016,57 @@ GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_h, uint16_t, H2)
 GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_w, uint32_t, H4)
 GEN_VEXT_VSLIDE1DOWN_VX(vslide1down_vx_d, uint64_t, H8)
 
+/* Vector Floating-Point Slide Instructions */
+#define GEN_VEXT_VFSLIDE1UP_VF(NAME, ETYPE, H)                            \
+void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,             \
+                  CPURISCVState *env, uint32_t desc)                      \
+{                                                                         \
+    uint32_t vm = vext_vm(desc);                                          \
+    uint32_t vl = env->vl;                                                \
+    uint32_t i;                                                           \
+                                                                          \
+    for (i = 0; i < vl; i++) {                                            \
+        if (!vm && !vext_elem_mask(v0, i)) {                              \
+            continue;                                                     \
+        }                                                                 \
+        if (i == 0) {                                                     \
+            *((ETYPE *)vd + H(i)) = s1;                                   \
+        } else {                                                          \
+            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - 1));           \
+        }                                                                 \
+    }                                                                     \
+}
+
+/* vfslide1up.vf vd, vs2, rs1, vm # vd[0]=f[rs1], vd[i+1] = vs2[i] */
+GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_h, uint16_t, H1)
+GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_w, uint32_t, H1)
+GEN_VEXT_VFSLIDE1UP_VF(vfslide1up_vf_d, uint64_t, H1)
+
+#define GEN_VEXT_VFSLIDE1DOWN_VF(NAME, ETYPE, H)                          \
+void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,             \
+                  CPURISCVState *env, uint32_t desc)                      \
+{                                                                         \
+    uint32_t vm = vext_vm(desc);                                          \
+    uint32_t vl = env->vl;                                                \
+    uint32_t i;                                                           \
+                                                                          \
+    for (i = 0; i < vl; i++) {                                            \
+        if (!vm && !vext_elem_mask(v0, i)) {                              \
+            continue;                                                     \
+        }                                                                 \
+        if (i == vl - 1) {                                                \
+            *((ETYPE *)vd + H(i)) = s1;                                   \
+        } else {                                                          \
+            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + 1));           \
+        }                                                                 \
+    }                                                                     \
+}
+
+/* vfslide1down.vf vd, vs2, rs1, vm # vd[i] = vs2[i+1], vd[vl-1]=f[rs1] */
+GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_h, uint16_t, H1)
+GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_w, uint32_t, H1)
+GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_d, uint64_t, H1)
+
 /* Vector Register Gather Instruction */
 #define GEN_VEXT_VRGATHER_VV(NAME, ETYPE, H, CLEAR_FN)                    \
 void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
-- 
2.17.1


