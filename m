Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrX32-0004Y9-TD
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:09:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX30-0004OR-Li
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:09:42 -0500
Received: from [2607:f8b0:4864:20::1032] (port=44863
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX2m-0000s1-Kt
 for qemu-riscv@nongnu.org; Sun, 28 Nov 2021 22:09:42 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso12826255pjo.3
 for <qemu-riscv@nongnu.org>; Sun, 28 Nov 2021 19:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o0nx1GS5VJeyp1k+FZKT7OR4BKO1ppBtW8r1Zc85MPM=;
 b=XL5d/aSetNp7zEJlVnpVBy5tQh3FOlI/OD/N0YSp6L6Sp0D3S+zNpsxvqxzgI6Q8Y9
 T/xdv9rzK3INIghz5RbSCQ8CDOUGByYWY9nFM3GbN9GgubB4qTUlpC9EEF1OVW40Cklt
 wURnPk2/SkNv4JLWi1jkFdkNNDCtvjn825IwW4MFwHD5hdipPQ4F5T3x9UVeQmR43Y5o
 nnjdm582x2TYi8AW+eYvOsQYFQGWrWHdBmbuyZdnw1NMwzBQ6VuDUHPW15kPwHtypbxl
 6JO5bZkRxoKgeiL+od1eDW1KaV85nQ2Hss+9KZRtEG1KPs8KUFAe4YvRXDBN/Lb9uf51
 bnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o0nx1GS5VJeyp1k+FZKT7OR4BKO1ppBtW8r1Zc85MPM=;
 b=sw9T2avqTEvKbmxvEOGonUxU+nPqVSbpo0kEHbTtv4NGhBy4V6sA95PwDtZC8QdcnU
 d7/xj8fBgtMuce2xJGC01VdWzUSIAGle1eHjHKy4737PT9+m458P0TRHsRpBO+hEjuNv
 cO5pUw5RDuJOSoTyZsedh1e1iix6k2EV4vRI6kUCs/xLnnnbOdOuaLYvYhPPixJ/5YGq
 xuuR3Iaw2pyyPOLtb3Mpj9W8C/prGesWIhIF86qyC5MUNrxRAap1mCH6cxp0l3CdRjpl
 Jy+drfb3fAjduhhdb0NdQ58OuJ8tzE+AOzlt2ZXOsMiLvoXtCgcLHUMfMWRO1zrK+7FP
 QKiQ==
X-Gm-Message-State: AOAM533vmqSFhlcZFcC1QW4tEh5QqS7TZgIBQ2Cn44YapE5tTJ9TBl73
 xU5zkKjSKOEWp3eFCdaURRq5uLk6C2fJTtHb
X-Google-Smtp-Source: ABdhPJxrmmVEhCrPp7R0cp7FDmL0GVSRXN4tJ3pL7eXYpbmpQyTH1/RPrtTqahrMakazIsJM8ABRdg==
X-Received: by 2002:a17:90a:7e10:: with SMTP id
 i16mr34585364pjl.185.1638155367384; 
 Sun, 28 Nov 2021 19:09:27 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:09:27 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v10 60/77] target/riscv: introduce floating-point rounding
 mode enum
Date: Mon, 29 Nov 2021 11:03:20 +0800
Message-Id: <20211129030340.429689-61-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 03:09:43 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/fpu_helper.c               | 12 ++++++------
 target/riscv/insn_trans/trans_rvv.c.inc | 18 +++++++++---------
 target/riscv/internals.h                |  9 +++++++++
 3 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 388e23ca670..dec39d4a9ed 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -55,23 +55,23 @@ void helper_set_rounding_mode(CPURISCVState *env, uint32_t rm)
 {
     int softrm;
 
-    if (rm == 7) {
+    if (rm == RISCV_FRM_DYN) {
         rm = env->frm;
     }
     switch (rm) {
-    case 0:
+    case RISCV_FRM_RNE:
         softrm = float_round_nearest_even;
         break;
-    case 1:
+    case RISCV_FRM_RTZ:
         softrm = float_round_to_zero;
         break;
-    case 2:
+    case RISCV_FRM_RDN:
         softrm = float_round_down;
         break;
-    case 3:
+    case RISCV_FRM_RUP:
         softrm = float_round_up;
         break;
-    case 4:
+    case RISCV_FRM_RMM:
         softrm = float_round_ties_away;
         break;
     default:
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 1ce5a10b6a8..047be5d5c47 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2088,7 +2088,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
             gen_helper_##NAME##_d,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2167,7 +2167,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)            \
             gen_helper_##NAME##_w,                                \
             gen_helper_##NAME##_d,                                \
         };                                                        \
-        gen_set_rm(s, 7);                                         \
+        gen_set_rm(s, RISCV_FRM_DYN);                             \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);            \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,           \
@@ -2199,7 +2199,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
         };                                                       \
         TCGLabel *over = gen_new_label();                        \
-        gen_set_rm(s, 7);                                        \
+        gen_set_rm(s, RISCV_FRM_DYN);                            \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);        \
                                                                  \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
@@ -2236,7 +2236,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
         static gen_helper_opfvf *const fns[2] = {                \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
         };                                                       \
-        gen_set_rm(s, 7);                                        \
+        gen_set_rm(s, RISCV_FRM_DYN);                            \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
@@ -2266,7 +2266,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,          \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2303,7 +2303,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
         static gen_helper_opfvf *const fns[2] = {                \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
         };                                                       \
-        gen_set_rm(s, 7);                                        \
+        gen_set_rm(s, RISCV_FRM_DYN);                            \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
@@ -2380,7 +2380,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
             gen_helper_##NAME##_d,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2526,7 +2526,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
             gen_helper_##NAME##_w,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2574,7 +2574,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
             gen_helper_##NAME##_w,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, RISCV_FRM_DYN);                              \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index ac062dc0b4e..db105d4d640 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -36,6 +36,15 @@ target_ulong fclass_d(uint64_t frs1);
 extern const VMStateDescription vmstate_riscv_cpu;
 #endif
 
+enum {
+    RISCV_FRM_RNE = 0,  /* Round to Nearest, ties to Even */
+    RISCV_FRM_RTZ = 1,  /* Round towards Zero */
+    RISCV_FRM_RDN = 2,  /* Round Down */
+    RISCV_FRM_RUP = 3,  /* Round Up */
+    RISCV_FRM_RMM = 4,  /* Round to Nearest, ties to Max Magnitude */
+    RISCV_FRM_DYN = 7,  /* Dynamic rounding mode */
+};
+
 static inline uint64_t nanbox_s(float32 f)
 {
     return f | MAKE_64BIT_MASK(32, 32);
-- 
2.25.1


