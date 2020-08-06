Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dTK-0004nQ-5A
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dTI-0004jl-Mz
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:50:04 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:46996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dTE-000865-Lb
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:50:04 -0400
Received: by mail-pl1-x62d.google.com with SMTP id k13so19494759plk.13
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LFspY04g/BPDgduL7CxaD6h8RkYIDab3gP2i/aM9AuQ=;
 b=UIKj8pygB3NoocnoSHKLKz5IEM5DTDuOBEu2gYkTI76OBFv5fWh1Yx+3MZKgUuCTq3
 Nn+pzuzuNcqWMYcE7Gvv8/WgRhTcTDEIOSZNDksJbFYyONVyRrbZSHwhMuCyB3V7OEfp
 xlXlImblmds+XmLLvBuvOWryz5oURJDnqbfJVUyG5uAhQxKR2yR35gKAPaGFWUghWJ33
 YrzPh+UAZLOrwP+OD/lauA2uspJXLnLpVIxdNFtXoB84Gsq3DoMej1M34DBK/K+yIuf1
 AbRnbYWZpRRxdwKOA+iJiMBb19OxTZcXKncTqSCT0l3teJzdGgFU1xsvwQP9aA/mzzhO
 kB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LFspY04g/BPDgduL7CxaD6h8RkYIDab3gP2i/aM9AuQ=;
 b=pRXYt3OEzUBcYufsWelgO9P8LDrHaXgyOrFRNLAhIx8z68lsKxPiVCQOZtTMbyhWmw
 d58lbP1J5cKRDSTo77NJf+rvz9vRv75gv4O6UvrilC8C5lyN+D0w5OyVDtaDanGsUJ8a
 x9R79KoUsT/aDX0xGjb48zzT0x0MMQ0QeRhK+hgtlkDbpq+GBRIUnbyR9e09oNhBAu9e
 QE/IDKu5wXwq0MNxuEB5iJT9g6Bcmcn4bYvwrkt/kSzGzhwH1/yVLUWbadBWQR5dfav7
 0VNiGGp5H1Azt8xq83olQSlyCxXVIGWVtjc3X3oxO2JrmX0JEo+Bqjys2idfJUG36H23
 zVtw==
X-Gm-Message-State: AOAM533cyRyvfofdIUEe0WinfymyN26sVg2dfrUhbqgr2uG+b7kq5yRC
 dxA7OiWTTSbvEbBIV+EtZviHOg==
X-Google-Smtp-Source: ABdhPJy1K+4ORZNkQGm2qEdoGtqvouPHWAKe0caj9yTWAYHu7a7RHqTk48QeR+oZlDGERP33J96JNQ==
X-Received: by 2002:a17:90b:1093:: with SMTP id
 gj19mr7805280pjb.149.1596710998087; 
 Thu, 06 Aug 2020 03:49:58 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:49:57 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 65/71] target/riscv: rvv-1.0: floating-point/integer
 type-convert instructions
Date: Thu,  6 Aug 2020 18:47:02 +0800
Message-Id: <20200806104709.13235-66-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62d.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:50:05 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vfcvt.rtz.xu.f.v
* vfcvt.rtz.x.f.v

Also adjust GEN_OPFV_TRANS() to accept multiple floating-point rounding
modes.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |  6 ++++++
 target/riscv/insn32.decode              | 11 +++++++----
 target/riscv/insn_trans/trans_rvv.inc.c | 18 ++++++++++--------
 target/riscv/vector_helper.c            | 22 ++++++++++++++++++++++
 4 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index a9ec14c49ad..5ef37b9dc49 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -984,6 +984,12 @@ DEF_HELPER_5(vfcvt_f_xu_v_d, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfcvt_f_x_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfcvt_f_x_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfcvt_f_x_v_d, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfcvt_rtz_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfcvt_rtz_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfcvt_rtz_xu_f_v_d, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfcvt_rtz_x_f_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfcvt_rtz_x_f_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfcvt_rtz_x_f_v_d, void, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_5(vfwcvt_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfwcvt_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 425cfd7cb32..c25c03dfb7c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -556,10 +556,13 @@ vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
 vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
-vfcvt_xu_f_v    100010 . ..... 00000 001 ..... 1010111 @r2_vm
-vfcvt_x_f_v     100010 . ..... 00001 001 ..... 1010111 @r2_vm
-vfcvt_f_xu_v    100010 . ..... 00010 001 ..... 1010111 @r2_vm
-vfcvt_f_x_v     100010 . ..... 00011 001 ..... 1010111 @r2_vm
+
+vfcvt_xu_f_v       010010 . ..... 00000 001 ..... 1010111 @r2_vm
+vfcvt_x_f_v        010010 . ..... 00001 001 ..... 1010111 @r2_vm
+vfcvt_f_xu_v       010010 . ..... 00010 001 ..... 1010111 @r2_vm
+vfcvt_f_x_v        010010 . ..... 00011 001 ..... 1010111 @r2_vm
+vfcvt_rtz_xu_f_v   010010 . ..... 00110 001 ..... 1010111 @r2_vm
+vfcvt_rtz_x_f_v    010010 . ..... 00111 001 ..... 1010111 @r2_vm
 vfwcvt_xu_f_v   100010 . ..... 01000 001 ..... 1010111 @r2_vm
 vfwcvt_x_f_v    100010 . ..... 01001 001 ..... 1010111 @r2_vm
 vfwcvt_f_xu_v   100010 . ..... 01010 001 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 6cdb1659b59..e1627637aff 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2698,7 +2698,7 @@ static bool opfv_check(DisasContext *s, arg_rmr *a)
            (s->sew != 0);
 }
 
-#define GEN_OPFV_TRANS(NAME, CHECK)                                \
+#define GEN_OPFV_TRANS(NAME, CHECK, FRM)                           \
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (CHECK(s, a)) {                                             \
@@ -2709,7 +2709,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
             gen_helper_##NAME##_d,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, FRM_DYN);                                        \
+        gen_set_rm(s, FRM);                                        \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2724,7 +2724,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
     return false;                                                  \
 }
 
-GEN_OPFV_TRANS(vfsqrt_v, opfv_check)
+GEN_OPFV_TRANS(vfsqrt_v, opfv_check, FRM_DYN)
 
 /* Vector Floating-Point MIN/MAX Instructions */
 GEN_OPFVV_TRANS(vfmin_vv, opfvv_check)
@@ -2770,7 +2770,7 @@ GEN_OPFVF_TRANS(vmfgt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfge_vf, opfvf_cmp_check)
 
 /* Vector Floating-Point Classify Instruction */
-GEN_OPFV_TRANS(vfclass_v, opfv_check)
+GEN_OPFV_TRANS(vfclass_v, opfv_check, FRM_DYN)
 
 /* Vector Floating-Point Merge Instruction */
 GEN_OPFVF_TRANS(vfmerge_vfm,  opfvf_check)
@@ -2820,10 +2820,12 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
 }
 
 /* Single-Width Floating-Point/Integer Type-Convert Instructions */
-GEN_OPFV_TRANS(vfcvt_xu_f_v, opfv_check)
-GEN_OPFV_TRANS(vfcvt_x_f_v, opfv_check)
-GEN_OPFV_TRANS(vfcvt_f_xu_v, opfv_check)
-GEN_OPFV_TRANS(vfcvt_f_x_v, opfv_check)
+GEN_OPFV_TRANS(vfcvt_xu_f_v, opfv_check, FRM_DYN)
+GEN_OPFV_TRANS(vfcvt_x_f_v, opfv_check, FRM_DYN)
+GEN_OPFV_TRANS(vfcvt_f_xu_v, opfv_check, FRM_DYN)
+GEN_OPFV_TRANS(vfcvt_f_x_v, opfv_check, FRM_DYN)
+GEN_OPFV_TRANS(vfcvt_rtz_xu_f_v, opfv_check, FRM_RTZ)
+GEN_OPFV_TRANS(vfcvt_rtz_x_f_v, opfv_check, FRM_RTZ)
 
 /* Widening Floating-Point/Integer Type-Convert Instructions */
 
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 10b99113712..c12d697c440 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4042,6 +4042,28 @@ GEN_VEXT_V_ENV(vfcvt_f_x_v_h, 2, 2)
 GEN_VEXT_V_ENV(vfcvt_f_x_v_w, 4, 4)
 GEN_VEXT_V_ENV(vfcvt_f_x_v_d, 8, 8)
 
+/*
+ * vfcvt.rtz.xu.f.v vd, vs2, vm
+ * Convert float to unsigned integer, truncating.
+ */
+RVVCALL(OPFVV1, vfcvt_rtz_xu_f_v_h, OP_UU_H, H2, H2, float16_to_uint16)
+RVVCALL(OPFVV1, vfcvt_rtz_xu_f_v_w, OP_UU_W, H4, H4, float32_to_uint32)
+RVVCALL(OPFVV1, vfcvt_rtz_xu_f_v_d, OP_UU_D, H8, H8, float64_to_uint64)
+GEN_VEXT_V_ENV(vfcvt_rtz_xu_f_v_h, 2, 2)
+GEN_VEXT_V_ENV(vfcvt_rtz_xu_f_v_w, 4, 4)
+GEN_VEXT_V_ENV(vfcvt_rtz_xu_f_v_d, 8, 8)
+
+/*
+ * vfcvt.rtz.x.f.v  vd, vs2, vm
+ * Convert float to signed integer, truncating.
+ */
+RVVCALL(OPFVV1, vfcvt_rtz_x_f_v_h, OP_UU_H, H2, H2, float16_to_int16)
+RVVCALL(OPFVV1, vfcvt_rtz_x_f_v_w, OP_UU_W, H4, H4, float32_to_int32)
+RVVCALL(OPFVV1, vfcvt_rtz_x_f_v_d, OP_UU_D, H8, H8, float64_to_int64)
+GEN_VEXT_V_ENV(vfcvt_rtz_x_f_v_h, 2, 2)
+GEN_VEXT_V_ENV(vfcvt_rtz_x_f_v_w, 4, 4)
+GEN_VEXT_V_ENV(vfcvt_rtz_x_f_v_d, 8, 8)
+
 /* Widening Floating-Point/Integer Type-Convert Instructions */
 /* (TD, T2, TX2) */
 #define WOP_UU_H uint32_t, uint16_t, uint16_t
-- 
2.17.1


