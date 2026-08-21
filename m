Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32763C5DF7D
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 04:07:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxGUh-0006BQ-C0; Fri, 21 Aug 2026 00:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUT-00066i-3i
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:25 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUR-0003E3-C6
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:24 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-c999f162c9aso426432a12.3
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 21:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787285062; x=1787889862; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iUY4RptRktypsob4goKzTfAtgRhOitw3SAZ3982l394=;
 b=d7d+LJzlubEHCeqRRFR3t9E564G87awbM/LoGQcfumiUIztFxpjCIhxmsq7NTi03Ds
 eh/BW4CLI57CZwTzyRt/tUBYMqMAVRuYmaO24oWViKONnBEOtDI3FbB5YHi8LjKEVBTO
 2BtBIdrVIgyxciOenNi3jts8P9dbAi/XvU//bpqoF9VVuoSiDHLxY3LPdQvhIT/rryBG
 x3MIww3IOx4Ek19NEL8dQWD9aQIWTJwpA17eieJ682ZDfvTHCb7GQ/UszU+dIzaTWFu0
 meTRs/svOlXuuPeOumI5SACnoQys6LDEQjVsnb3se2uJe9dJtVbsBRIFSOoS4wZ2LR59
 ORQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787285062; x=1787889862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=iUY4RptRktypsob4goKzTfAtgRhOitw3SAZ3982l394=;
 b=qGcYDf700KYwi9q9GK/HzF9vwn0daQN3t+vcL+eF2EaFNtX/bFuvJZj0ykvoNftWpg
 FJeNcOGRp/tUKTGQU9pGKc6R0cLExN9Iv+B8+I9gK5CM2WmEVXaI9PsiZ71rP9l8h7vW
 6KNsqKlx2VKrhOtsCwK8siVIS0mzfvR75FOsQLtM/MSV7O9nwuPlMU7wGVeGBTdt2k71
 7E8CuShO/vj+DHbS6/EPZA4QczgbpOWFuLCKX8LYAVKhOQq5/BjbmzxfLmhAfwiQ9hEX
 nUBGR/UcGuPsfusZvgilmsG4Uxr/FRpsZuejctbtR54s0D/6sUXj5nJEnDaofIiDnm+/
 lPGw==
X-Gm-Message-State: AFuF++lC82bUvaPkpSWQ4cFr0gn/Nw4MZwlUwHzcEcd1Afo8j9wkrLHq
 lQ28Xb/XgHxTfy52beFGcMH0mlvJDFNYqhtDuH7T3v0Rblj52+acF2R3UJRzN51XUsg=
X-Gm-Gg: AR+sD10CdvPrmg/+oX6u2zK/5wrxYSh9buK9teod70GX8RjC6Y/ZVpizjRJCScI9w5J
 vnAJDTG1xNPISmqXhg5IzqSnEF4d7dtEClHU4jDTl/qVDohPRKpKqfBcNGCpJf33NOeDxHtrSSx
 tb+EosnPBn4WhUcOkpYA5Fi3N3qyDQl7F/AsUpasSbWoACftRsAkVZT3I/cHJm+dYX4jwGJEsVA
 CBErQVP3kNWNMrrG4LWifqteCWjoSQ9KMEHZdJpRkR4G53d9vwsuI3Ov21Yo2evFYitRB7Cbkim
 DvX+PP7MaGOkFpi/GCw/Js+U+wfRJHyRefxmsgWXT1Rtb1cdk2VL0D9uv+fx6CLAnfwCfdQ4Is+
 lYwGqC7NuvfHJ1a/Hxt+5FfvbH5USwWRdcHtYDo0TjiEvZbIU/W6tcrpDb47F/icvaDbdhY7fA5
 C5IykI8O7pHU0+ffLFbnYbcGprn9ecN8BU30Cz7ArVgJKEQZoScxMlEtpzzPlGpUOnDSk=
X-Received: by 2002:a17:90b:3d87:b0:38f:837e:fc5d with SMTP id
 98e67ed59e1d1-395c334050emr6674778a91.3.1787285061772; 
 Thu, 20 Aug 2026 21:04:21 -0700 (PDT)
Received: from stoup.. ([108.174.179.84]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395c4c194d2sm1298383a91.15.2026.08.20.21.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 21:04:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH v2 14/23] target/riscv: Add MEM_IDX, BSWAP, ALIGN to VDATA
Date: Thu, 20 Aug 2026 21:03:55 -0700
Message-ID: <20260821040404.268123-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821040404.268123-1-richard.henderson@linaro.org>
References: <20260821040404.268123-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Populate it in all vector ldst operations.
Not yet used within the helpers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/internals.h                    |  3 +++
 target/riscv/tcg/insn_trans/trans_rvv.c.inc | 25 ++++++++++++++++-----
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 9e4da39ea0..b7ffb6098c 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -94,6 +94,9 @@ FIELD(VDATA, VTA, 4, 1)
 FIELD(VDATA, VTA_ALL_1S, 5, 1)
 FIELD(VDATA, VMA, 6, 1)
 FIELD(VDATA, NF, 7, 4)
+FIELD(VDATA, MEM_IDX, 11, 3)
+FIELD(VDATA, BSWAP, 14, 1)
+FIELD(VDATA, ALIGN, 15, 1)
 
 /* float point classify helpers */
 target_ulong fclass_h_bf16(uint64_t frs1);
diff --git a/target/riscv/tcg/insn_trans/trans_rvv.c.inc b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
index a22e2cae6c..3916236762 100644
--- a/target/riscv/tcg/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
@@ -693,6 +693,14 @@ static uint8_t vext_get_emul(DisasContext *s, uint8_t eew)
 typedef void gen_helper_ldst_us(TCGv_ptr, TCGv_ptr, TCGv,
                                 TCGv_env, TCGv_i32);
 
+static uint32_t vdata_add_memopidx(DisasContext *s, uint32_t data)
+{
+    data = FIELD_DP32(data, VDATA, MEM_IDX, s->mem_idx);
+    data = FIELD_DP32(data, VDATA, BSWAP, s->mo_endianness != 0);
+    data = FIELD_DP32(data, VDATA, ALIGN, !s->cfg_ptr->ext_zicclsm);
+    return data;
+}
+
 static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
                           gen_helper_ldst_us *fn, DisasContext *s,
                           bool is_store)
@@ -712,6 +720,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
      * The first part is vlen in bytes (vlenb), encoded in maxsz of simd_desc.
      * The second part is lmul, encoded in data of simd_desc.
      */
+    data = vdata_add_memopidx(s, data);
     desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
                                       s->cfg_ptr->vlenb, data));
 
@@ -890,6 +899,8 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
     mask = tcg_temp_new_ptr();
     base = get_gpr(s, rs1, EXT_NONE);
     stride = get_gpr(s, rs2, EXT_NONE);
+
+    data = vdata_add_memopidx(s, data);
     desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
                                       s->cfg_ptr->vlenb, data));
 
@@ -991,6 +1002,8 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     mask = tcg_temp_new_ptr();
     index = tcg_temp_new_ptr();
     base = get_gpr(s, rs1, EXT_NONE);
+
+    data = vdata_add_memopidx(s, data);
     desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
                                       s->cfg_ptr->vlenb, data));
 
@@ -1127,6 +1140,8 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     dest = tcg_temp_new_ptr();
     mask = tcg_temp_new_ptr();
     base = get_gpr(s, rs1, EXT_NONE);
+
+    data = vdata_add_memopidx(s, data);
     desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
                                       s->cfg_ptr->vlenb, data));
 
@@ -1231,15 +1246,15 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
             }
         }
     } else {
-        TCGv_ptr dest;
-        TCGv base;
+        TCGv_ptr dest = tcg_temp_new_ptr();
+        TCGv base = get_gpr(s, rs1, EXT_NONE);
         TCGv_i32 desc;
         uint32_t data = FIELD_DP32(0, VDATA, NF, nf);
         data = FIELD_DP32(data, VDATA, VM, 1);
-        dest = tcg_temp_new_ptr();
+        data = vdata_add_memopidx(s, data);
+
         desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
-                        s->cfg_ptr->vlenb, data));
-        base = get_gpr(s, rs1, EXT_NONE);
+                                          s->cfg_ptr->vlenb, data));
         tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
         fn(dest, base, tcg_env, desc);
     }
-- 
2.43.0


