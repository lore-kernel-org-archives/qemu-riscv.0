Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C65C5AD4E
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:45:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC7x-0000xV-VB; Sun, 09 Aug 2026 18:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7v-0000vN-Ez
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:19 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7u-0007Q8-2w
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:19 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-c9e607d81fcso633725a12.2
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314977; x=1786919777; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nS2rxErkjoDDZNGsv6FDl/aPsWDFlNYooWE1D4/6J7Y=;
 b=rCfEM3Fx3WeoqsDluBcPye0c7W/23PCQrbZBjkGGp1H9kuiFv3eOQtJcYd7B/cbv/B
 ZzIYMCx7DcwxUONKNGI8TeFsPjQ+TLBozCER2jrg0Py0kP1BJWyv3xa6+n2liWqLGMZm
 P5t9HmmzNDE1h18acXAt2Xan/QXtQHt+c06aigUT8+l14nTkeM8p/OFzgCa2uQQSi5i3
 w7nnzSfdoi3iD5u+zkLC6VF89grsCwtvNaloolmPHnIp9inFkZA9oI+rV4BZPe8fKPTk
 XX2Vp4YI1ywc/tBZI0kVS2eJRAfmsTwu4KMd/eG8qvCfEF5Er+KWID30TSx4t4OMGLI7
 YllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314977; x=1786919777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=nS2rxErkjoDDZNGsv6FDl/aPsWDFlNYooWE1D4/6J7Y=;
 b=qdElUltOnAVdb45uAbGiuD0eSYF5HKBWOJyBv9w7GHenzYaJO69UB7cYNxtyOrKPbI
 dCGtVAQsTgIL30bySYhX2td6GQCSvIhvshchzbQOGTn/GQBmj5XSMh8M6XKlAYu0TA7H
 4VDIAmSI4TPjyGP1i3Q92KmengOnh7yNaBebs6f979PTorZxlAWd7EIg4nFiprcmFTAK
 N1PgUNJZKkCeW0CaZAyWTwhmCNOuS+mUPRSmU9dzTBIKmKaJpOrWRsP9w0MfjR3AU4NU
 yR3esPGg2ocAMI6CiyxYCxCgrOPvxrw+Sb/AIBZK0//vn1Mtx1mN6l0TmrRhjIY80Fpp
 Ewsw==
X-Gm-Message-State: AOJu0Yx91FhyHAg4+ILGoBa7PO1UrA/ZItJt0A/BOovvCLrW4Ryw26hi
 CvcsXrtZFt0wh89jIJ93GGVE589awvionBee5dOuYjC2LSjfQtxEKoMBR8+3248RInmYwro2br4
 sJgAP
X-Gm-Gg: AR+sD121CY6nAa3qsI8urMPMzAsdRlFaLfuewbbtp7ZfVTyUpoutQgcSfQ0raMr6zJW
 YWVTINb24mZwpsewQpIxkU8z8YIB8EGE0oBCeZK2EOj1ch9Y0hISvMVZZ17nCr+9Z+oCNocErC+
 WSsdKHaCmWXcZzbZFgAS9PXW2oAk3EARWWklAOivRziaWShny6hZxSpmJMBE/O0O8mbxmBI6n3Y
 JJIYfn9sSzXejFxbxwrC7RuhkSIaOBluXZWmBVkvS+7kC063ehoked3m9Dunmm+ce12aZL44X3k
 pqs7pSvrvvJBo7GGsRnUarKmeai4wdwdwSZoVlaItUurO+Un3L07Xq1Ww1pm/F+trcfpXTTd0X/
 qXTgiT02rMdPYPHd/mxc8lLWgqYElujuWuzjaZKQXRBJta1/nNh6aDOIdswSKspkpsSrOScUKTl
 x5VDg3+z60qMP/pobreyImjsQVh9CmC3dC171nwKXQLPUnfns+6VpCOqvvBtJCztJzbZsiEeDeT
 m3EZEY1w3pDTMcFtx7OfX3UNrc1XBc=
X-Received: by 2002:a05:6a21:6daa:b0:3c4:3672:ba6 with SMTP id
 adf61e73a8af0-3cbadc15329mr26485869637.22.1786314976598; 
 Sun, 09 Aug 2026 15:36:16 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:36:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 23/56] disas/riscv: Do not recognize c.{addw,subw} with rv32
Date: Sun,  9 Aug 2026 15:35:12 -0700
Message-ID: <20260809223545.730664-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

These code points are reserved with RV32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 77347b557d..ddc2f73eae 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -3060,8 +3060,16 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 1: op = rv_op_c_xor; break;
                 case 2: op = rv_op_c_or; break;
                 case 3: op = rv_op_c_and; break;
-                case 4: op = rv_op_c_subw; break;
-                case 5: op = rv_op_c_addw; break;
+                case 4:
+                    if (isa != rv32) {
+                        op = rv_op_c_subw;
+                    }
+                    break;
+                case 5:
+                    if (isa != rv32) {
+                        op = rv_op_c_addw;
+                    }
+                    break;
                 case 6: op = rv_op_c_mul; break;
                 case 7:
                     switch ((inst >> 2) & 0b111) {
-- 
2.43.0


