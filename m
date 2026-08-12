Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2CFC5CFDB
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:33:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHUa-0007Ld-6W; Wed, 12 Aug 2026 18:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUY-0007Kb-O4
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:10 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUT-000102-Uq
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:10 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2caed617615so1487915ad.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573924; x=1787178724; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Fkr8ILSgdmdAd6Z+/5pTP1IGHAginhfzN0HdJ9S2suo=;
 b=wYRofGrEpyCl3C6frqzI13s+asSqCupk93efLgOJwbhawQnzhBlYMRVGVDJxh5RUg/
 qtDwJZ3kLAgllzrTP/SDUM+CVSIwsz8Dvgg5GJmBpVnJsernYNDb8UaZIhvhIsThknWb
 RmHJ0OTAcRvlbG0mluVhy/olvve5osWqNxJDV1ncu7P08n1T5XGDWvHmsacrqc4n5m5N
 Hvj8mr2Uqgh9/1ZPud7cUVMmhTnX1AjAK7yIuNnak/DJ9FmlvvtOsOaglMKR45QinEex
 lat/twUASrk7xUQYqe/TpZeI2hT+2ySnah/vaxKliX1z3SZxblEjT/k+LgFC7MdV0FQK
 NrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573924; x=1787178724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Fkr8ILSgdmdAd6Z+/5pTP1IGHAginhfzN0HdJ9S2suo=;
 b=HSlNtdAzMUDinE2ob+Agnuy0GGsT0QRFmJJC9ZD/oSPE9dOk7A6hYA2upX4LIs/IvP
 4vO4DckGRDRu2WoyKRxeut2UgdBXMoLXRCZC/nGHbwF9RUoZ1sE4hJByUofIPdzMJISc
 ngKfdHK2j6aExUJkm0gUdnp7A0cXUT3lijTC5foB+l2ZvMyyERzJRXn8cNEfI0auSpvq
 9YCALcvaMONI4USwC69CUN9JOlJybdrvzos31k+b2coBZKGLIMmjH2aVmnHBDVkkgUUw
 pdsJ8KOSKJNsGq3E7+Re+6s+FqZA7yb9wY6XRyYetQnOb6irHgmPhl3kc9gB08sGe7YM
 WbDg==
X-Gm-Message-State: AOJu0YyVlD7TQrdqNP/pMY14kqe9cpk7Ij+1xl2C4d4gMzIQVUCaAZy5
 rwSlW5Tmne8WH4UCA9oi12DharrqQfmRQrOZ9FzFl73QzFQ75WXhfgw8/dh4MBxOyu8=
X-Gm-Gg: AR+sD13WhZbzdGPwI+gQKabHp+Zgrxzg7f8HBMytWwHWtMg8zeCcoNXb0BVkZV7R5DL
 8gXa4i1vXJlxAO4BquvX6Bc+I6Fq/ipks+5176S0pMRNp5aDwk84HScBljAs5ilkLp09Xk5cgEn
 iRoLBijQMC5wdYQLEBd4/GpKoIi0pL/dMfvxM2jlq4X57qgon49hhUm6Px1H9I3cGMV2dwqipEv
 OU0jw4OEEDLGkY7nEyMyOdBQmpJb8UKoX7v/NJ0bjI7nAAag5Eo6vBo5i1AoaA+N4wqaI8P8dBY
 sbQmoXoX+q5osW5fVClLM+xQxPlUvhPSdBzpI9j8E0uaOMr2fsfE/xFuuvcE1fIXpWgsr3g/rsi
 KzhtSMvNyxCjpCTXS3+3RlFc4fwfG13m+yXU+0R7C3kwcN6DonJbBw0GwZZVlV6/Zi7EnIo9p5P
 P5OtDpLIxNw8UIO7Ox8Ft0JmgAby4eb+Bcf7Npn9GdI5wzVxCBZZWEP6uyCl92sVSUeSelpZ/KX
 AWFujCQyDubXJuMkHd2
X-Received: by 2002:a05:6a21:7111:b0:3c3:af85:85e7 with SMTP id
 adf61e73a8af0-3cc55423424mr2118204637.34.1786573924289; 
 Wed, 12 Aug 2026 15:32:04 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:32:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 19/52] disas/riscv: Remove rvcd_imm_nz
Date: Wed, 12 Aug 2026 15:31:09 -0700
Message-ID: <20260812223142.349142-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Remove rvcd_imm_nz and rv_opcode_data.decomp_data as unused.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.h | 5 -----
 disas/riscv.c | 7 +------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/disas/riscv.h b/disas/riscv.h
index 31bb0db86c..3909d73dd0 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -186,7 +186,6 @@ typedef struct {
     short decomp_rv32;
     short decomp_rv64;
     short decomp_rv128;
-    short decomp_data;
 } rv_opcode_data;
 
 typedef struct {
@@ -217,10 +216,6 @@ enum {
     rv_op_illegal = 0
 };
 
-enum {
-    rvcd_imm_nz = 0x1
-};
-
 /* instruction formats */
 
 #define rv_fmt_none                   "O\t"
diff --git a/disas/riscv.c b/disas/riscv.c
index ddc2f73eae..95957506bd 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -5417,12 +5417,7 @@ static const rv_opcode_data *decode_inst_decompress(rv_decode *dec, rv_isa isa,
     }
 
     if (decomp_op != rv_op_illegal) {
-        if ((op->decomp_data & rvcd_imm_nz) && dec->imm == 0) {
-            dec->opcode_data = rvi_opcode_data;
-            dec->op = rv_op_illegal;
-        } else {
-            dec->op = decomp_op;
-        }
+        dec->op = decomp_op;
         op = &dec->opcode_data[decomp_op];
     }
     return op;
-- 
2.43.0


