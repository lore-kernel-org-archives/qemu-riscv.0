Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3346CC5CFEB
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:33:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHUd-0007P5-9r; Wed, 12 Aug 2026 18:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUc-0007Nm-2X
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:14 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUY-00012r-A5
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:13 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-84a2c90e383so340093b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573929; x=1787178729; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ggi/wNI46A8QrJvaOskdBGjRytPqZa5Byd+LQudZv10=;
 b=w21B+We/TgzZ44un1rPVxB6B+CS+N67DSOIlG5jy9l7Kz12AwmN2pg6zr501akadwO
 lW+c2xTtjRy8VuKcI39Lfbs2xz7l6JBlGATNQJ0IKBEWas4dON/67CjiTk+HM7vFpODL
 r48HjD4UnA9JjBpRBFwld28Y3teleje8eKDOM4ejJAhFLaV/TD3O6tkaSY4SzW29F1Gs
 aaPq54G1ja1aNRenrSKJTTeDx10JS/to9Q70zoLpqNxVGeXS+4vwbnJwvPwwgxDRzRRC
 R4qQSUQ++Czgqmk8BRvul9kaq3ZLiMlOCgSJm372QffYNHpPg5HdwmfQ8E0TGpKibSxU
 Lfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573929; x=1787178729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ggi/wNI46A8QrJvaOskdBGjRytPqZa5Byd+LQudZv10=;
 b=Pz0GijyATwOW6VdipNfFv7dKzHQw52mFOCNUUTfOZ+qlYHoLFxvNDxcYgu3hqpfLkn
 62dqIiN3YjWKSfcU+x15u8dyHLg6p7goOZrHk+HrTaPDKLe+UPJRiPz/62s6EkzPagFr
 BMJ14ZvVEjdcdZeyipOMHM1/yBr0McbKqCg6DmgP3jlAuUR+4WQbq2AkMFqABtpPTFr3
 f52HZhO7T6XCuXcoP6tgaGFElrwfhjTyLTVn4EEyV4ddiBMt3RnHMlckMYrTxHeaYByM
 OzQ0CWrKvEgXpZXNZAmv3YRw3Nyo4mK+VLd38HdScKg3w5ohnD00QfTu7Vxa0FogS0DG
 tPrw==
X-Gm-Message-State: AOJu0YzkKuzFKherfxamcp690MOpgXWtI+vS0hHC3sazP8CHL7epDn0Q
 BR0uGZxDP1oJmbQDZ20SNlIjRgPjlqcEJGz5lNPfvkudp21T6AifbxZEhAmbE1IRCVA=
X-Gm-Gg: AR+sD118+xJDOz3mQcs45flKgPdxEeI75FrX6ywYV0N1K3Nf9OYVkysK/n8Wga5xT28
 DMYjIzmIea9QoigVNHWJU3y1FLPmf/uby6w/uOLN7YMMyJOaw/5fUFiPm/VDVEanurV+vsYMQoO
 f6DTefjTYI66sknZ+Y22q+XYAhRlXGE8NKBjtww0jjLbIhCJdtAu66zMiJlVgxxKB/grEnmuRZl
 r3kPGJA9R3KwUv/KIxoYUFwiMe8ZCxNPGMh0lFn47HOICC/xEIUKupc3aGlAZPuK1udrsndj3Du
 pSdUEUxLmMk0L7LtMLcaScdBfGc7ow+//TBuu9wgop/ATxqbUczwsKmMhNDP9lQ/qEaVJ2oHg2M
 4U0sqjAtjXaRCIWTgR1SUYwi5B6n0Iz6mLton8+6GR7p9RKi9/Zm9rEaDasGH1QCNo7nv3hYmRz
 8Na45h/PCTeZjolz28ng4ayd6eP+uYUFpahmzqOpY/N8X9PIvUQBgoH/iMheo0OaZTenmyE6xsZ
 +IyZHfMPM48BY+NK981II94rxIJp1w=
X-Received: by 2002:a05:6a21:4610:b0:39c:4e62:b843 with SMTP id
 adf61e73a8af0-3cc57bdb1ffmr1042807637.10.1786573928693; 
 Wed, 12 Aug 2026 15:32:08 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:32:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 24/52] disas/riscv: Handle aliases of csrrwi during decode
Date: Wed, 12 Aug 2026 15:31:14 -0700
Message-ID: <20260812223142.349142-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.h |  2 --
 disas/riscv.c | 28 ++++++++--------------------
 2 files changed, 8 insertions(+), 22 deletions(-)

diff --git a/disas/riscv.h b/disas/riscv.h
index d8c5acd969..3bbcbf10fb 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -84,8 +84,6 @@ typedef enum {
     rvc_imm_eq_zero,
     rvc_imm_eq_n1,
     rvc_imm_eq_p1,
-    rvc_csr_eq_0x001,
-    rvc_csr_eq_0x002,
 } rvc_constraint;
 
 typedef enum {
diff --git a/disas/riscv.c b/disas/riscv.c
index 9ec79baf4d..d3cbfb86ac 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1063,8 +1063,6 @@ static const rvc_constraint rvcc_ret[] = { rvc_rd_eq_x0, rvc_rs1_eq_ra,
                                            rvc_end };
 static const rvc_constraint rvcc_jr[] = { rvc_rd_eq_x0, rvc_imm_eq_zero,
                                           rvc_end };
-static const rvc_constraint rvcc_fsrmi[] = { rvc_csr_eq_0x002, rvc_end };
-static const rvc_constraint rvcc_fsflagsi[] = { rvc_csr_eq_0x001, rvc_end };
 
 /* pseudo-instruction metadata */
 
@@ -1145,12 +1143,6 @@ static const rv_comp_data rvcp_subw[] = {
     { rv_op_illegal, NULL }
 };
 
-static const rv_comp_data rvcp_csrrwi[] = {
-    { rv_op_fsrmi, rvcc_fsrmi },
-    { rv_op_fsflagsi, rvcc_fsflagsi },
-    { rv_op_illegal, NULL }
-};
-
 static const rv_comp_data rvcp_fsgnj_s[] = {
     { rv_op_fmv_s, rvcc_fmv_s },
     { rv_op_illegal, NULL }
@@ -1722,7 +1714,7 @@ static const rv_opcode_data rvi_opcode_data[] = {
     { "csrrw", rv_codec_i_csr, rv_fmt_rd_csr_rs1 },
     { "csrrs", rv_codec_i_csr, rv_fmt_rd_csr_rs1 },
     { "csrrc", rv_codec_i_csr, rv_fmt_rd_csr_rs1 },
-    { "csrrwi", rv_codec_i_csr, rv_fmt_rd_csr_zimm, rvcp_csrrwi },
+    { "csrrwi", rv_codec_i_csr, rv_fmt_rd_csr_zimm },
     { "csrrsi", rv_codec_i_csr, rv_fmt_rd_csr_zimm },
     { "csrrci", rv_codec_i_csr, rv_fmt_rd_csr_zimm },
     { "flw", rv_codec_i, rv_fmt_frd_offset_rs1 },
@@ -4469,7 +4461,13 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                     }
                 }
                 break;
-            case 5: op = rv_op_csrrwi; break;
+            case 5:
+                switch (operand_csr12(inst)) {
+                case 1: op = rv_op_fsflagsi; break;
+                case 2: op = rv_op_fsrmi; break;
+                default: op = rv_op_csrrwi; break;
+                }
+                break;
             case 6: op = rv_op_csrrsi; break;
             case 7: op = rv_op_csrrci; break;
             }
@@ -4991,16 +4989,6 @@ static bool check_constraints(rv_decode *dec, const rvc_constraint *c)
                 return false;
             }
             break;
-        case rvc_csr_eq_0x001:
-            if (!(imm == 0x001)) {
-                return false;
-            }
-            break;
-        case rvc_csr_eq_0x002:
-            if (!(imm == 0x002)) {
-                return false;
-            }
-            break;
         default: break;
         }
         c++;
-- 
2.43.0


