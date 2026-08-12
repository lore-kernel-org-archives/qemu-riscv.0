Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEE4C5AD5A
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:33:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHUX-0007IN-2T; Wed, 12 Aug 2026 18:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUU-0007Fx-N1
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:06 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUO-0000yd-PT
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:06 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2cc73e322dbso1653585ad.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573919; x=1787178719; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OLr6AWVYwmvoOGhA0NVH5A+szln3Aa4bJ7XtbqeSm+E=;
 b=XOhE6XYFRjzylgIB2D9BU/GEOjIkCgJkqizZT5agjuFKw3+4+Zf9TUCdV4pvkmMqAZ
 iVuqzJqLaPy8vK5bkrwdMuTiJfHXfdnahW8DjqsGY9E+MSNWemcGa5QAD+gGT0q8eIKQ
 VyJvOVkV0vXfIM6XkYN84z0xl+I7xaDxFQloQRFVStyCeluX6ABaUJthDdyc4gWDREo6
 IOONhSyp0zjLTrSDA2+kkOeZ96pOxusAYD8lW0Cz57dqJghPX0utK7LXGNP5+h7pDpBb
 zj71S4C/jxEeIA8zIvtAD/Tmq2IH/Bhem0Y+0aMarbWEIXT9Hdo1QmZlOHK+NiydkL7e
 8VWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573919; x=1787178719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OLr6AWVYwmvoOGhA0NVH5A+szln3Aa4bJ7XtbqeSm+E=;
 b=Xoa2YbCAMarJS/4NpEMyzn9dn5tcxzuTixlIHTREeFKyPiKeKdoA2kH57F2NSHXQ+s
 7igOnjhnI6PZmZq1QHl3qjIP0Jm4jypKsWjIKLGkSSHK0ZKDmO/p9xuf54gnMKwRNFzl
 B4YQ4CZZb4O0VMQTd0+FFEOSLK1jhMat+9VYNKatZbAkmwesrJIlfMunMxKHrrJRmE1d
 Gyy21ZUcL7pLRqgOVl2BjHDBPivGXnSoX+NfMx91cJTqXieKUoyYrnK4UvAA9qObjTtv
 fBBtdmNCd5SxwoErFYsGj/c6NTH8AwPFvUrl4vPML+H90s/FhI979SjlSjFg+yfB+RNz
 clyg==
X-Gm-Message-State: AOJu0YxVp8iyt1tA+OYnQT4+1wDcextWY/8Z8UNszxFbnzQiAATDmTqt
 3p0TIC2eNZMT8z3qB0rI3i5zcWfFrQKAVEkILo7mPSREAi45PB1X7tWDh8PJbGhBkOs=
X-Gm-Gg: AR+sD13Oe4l9e+zJruk2ZgKIyRSvh2ayu6HSOgpmcqBpE6BsZR0y+HLnqXChcWjC8tL
 +hvWZnX2Ea9mQq8rKnMOEFvNwfYkxU55/r3jOGkc0mJWA3W/GJRVgnI15DdcgnJsOpHaHpvLDwM
 3uE7pwY4F9H5fejigvh/mMXG9e++CPYwb7eLxEPPbtuw/Dw5lrcr8jWfIJ7t9NJxKRSwzT8Th0P
 AGtvNbPSEhILYTw4o7B1aut2ZwXK/DsDKO4gNXscy0hnnwJvxcgUK3w+WTBuGkWT1uRs6orU9Om
 u5tOt/oYFy06zdjzAcgCwzWzjn7nlb0h0IMMY7tMQFLhiZ+oALEmPNdBGeLi2QJEdmdYLTCD/Sn
 iWBpXR6ieEq5+0k7RmFNvOHe20I+5iHrdiDuWSU29PoP7m0pEmZs3JLludtZzAg50k+Njo4X+7m
 HxvgAIvDtcO6T/qJu+9m8FbqjWDWNiCuYgpijppG6Fe8uhvEijCl7/7a5CEThh7UzWOg6bphI5Y
 JF3aZsgxHihIVZ3Ptnea+UAOrs4DAw=
X-Received: by 2002:a05:6a21:1786:b0:3c3:7a0a:18a6 with SMTP id
 adf61e73a8af0-3cc552bf248mr2535107637.18.1786573919465; 
 Wed, 12 Aug 2026 15:31:59 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:31:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 13/52] disas/riscv: Handle c.addi4spn imm != 0 during decode
Date: Wed, 12 Aug 2026 15:31:03 -0700
Message-ID: <20260812223142.349142-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
 disas/riscv.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 9813d75feb..8a957e6a1e 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1885,7 +1885,7 @@ static const rv_opcode_data rvi_opcode_data[] = {
     { "fmv.x.q", rv_codec_r, rv_fmt_rd_frs1 },
     { "fmv.q.x", rv_codec_r, rv_fmt_frd_rs1 },
     { "c.addi4spn", rv_codec_ciw_4spn, rv_fmt_rd_rs1_imm, NULL, rv_op_addi,
-      rv_op_addi, rv_op_addi, rvcd_imm_nz },
+      rv_op_addi, rv_op_addi },
     { "c.fld", rv_codec_cl_ld, rv_fmt_frd_offset_rs1, NULL, rv_op_fld,
       rv_op_fld, 0 },
     { "c.lw", rv_codec_cl_lw, rv_fmt_rd_offset_rs1, NULL, rv_op_lw, rv_op_lw,
@@ -2952,7 +2952,11 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
     switch ((inst >> 0) & 0b11) {
     case 0:
         switch ((inst >> 13) & 0b111) {
-        case 0: op = rv_op_c_addi4spn; break;
+        case 0:
+            if ((inst >> 5) & 0xff) {
+                op = rv_op_c_addi4spn;
+            }
+            break;
         case 1:
             if (isa == rv128) {
                 op = rv_op_c_lq;
-- 
2.43.0


