Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EDACD8CAC
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 17:18:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vJawj-0001US-TV; Thu, 13 Nov 2025 12:17:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1vJavh-0000SM-4f
 for qemu-riscv@nongnu.org; Thu, 13 Nov 2025 12:16:20 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1vJave-0006ZI-9i
 for qemu-riscv@nongnu.org; Thu, 13 Nov 2025 12:16:16 -0500
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-7aae5f2633dso1289410b3a.3
 for <qemu-riscv@nongnu.org>; Thu, 13 Nov 2025 09:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1763054173; x=1763658973; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nmgh3LFk96HdrFD9152quz3Sn/dfARCWPL1thHveu/Q=;
 b=C+0xz9Q6436FDInTcBmo6p9z2CE2ka9ODSw+CNtPHAxJig87r3vMoc2Q1Q+u17d+sZ
 K0Sw+XE0XtuSK2GCJ1aBIMbiFrpysmikM36UJf+4hDnbdVWH2Dlkc1Um7/vwj9E/5U1j
 4s4gxscw29TRABgvSeVFbhNoxJQnBqxuyuXRappVjpzlNXtsAOxguH5Lk8NTpv5LNqbX
 TaSNgtxK1GMU/SPy+qsjkdwPp/cw31Mvrb+T+eMUncOlY9CEOWe/jOhYzcvN8kDew3wX
 OX9hhjEnBLOgy4qOxlZA4856UohvVMkOVAyQZCH5yeKtg4Xejx0IVKIlGC5UbG86K8Kh
 n/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763054173; x=1763658973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nmgh3LFk96HdrFD9152quz3Sn/dfARCWPL1thHveu/Q=;
 b=lMiKzZ464eSM/cqzyJ6xoT3lW6tE+7isD4o9Lvclmj0iTDlmWp6Yc5HniPDDCqhcqs
 aEAt1Z9po8AlEVl6/HSu2ZjLPRJJTwS62/yqOy8RJynVyaJz5t8lSG96UnBO76HNnCnC
 9L8oh8u9BArnWftL3YsBoJJ50vG0m+bXNfCIEZGQSEJCPaGpFL3WujtPE6LERAoXMYeN
 OZTLhd3eMkOvvLEDX2wRA0rBSplbRavk7CGeRmma+Vao65eEC2aCCrG6HhwQr7P4UczN
 Bz0FocCgOLJIpMlemCiG9pEocc/3m58kLHdDMDLwxJi3Etz0hiuqactaBa9n6ig2bdHz
 ICRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdkjEBOiCj+1vBZKIpOxoaLKLGX3qvrE4dvxKz/4ZYVg2J8ED4j6ci3bwjftDAkbTCypgf41a9xYTZ@nongnu.org
X-Gm-Message-State: AOJu0YxJhlDNVB58jobLW7qWPCaT3NALz0A43C9Ya3gkvdftfZ/IGVYw
 xH9sDCGnsNxJxScSGMe2jGZJlUAGSgmvaAUFzEaA1j8Ss46yOBAE6QKUtJZocbQHUrQ=
X-Gm-Gg: ASbGncvhYA/ruiTNsX5lRzou4G4uSquEAAi+GuW5OU5p16se/NO0rAhr5x/PxBPkNhP
 fAkebrdge0c1Jiklfo3gNtF9BZnFpnC9tqCfdxjrLyw0qnsirQa/ERKLMGgzngoCz9XWLYzOYR3
 2StBU/kd6cykjKistXFu3v6ELLpf5a1Hh4TpGIwpZd6w+4At+LMn1Q0R4dF9QBH+sHDo8ypg02J
 /t3CDsmz90qc4iF416hyRzknM+c9OK4c6j1LsGWNMVN9qzKIzSeKCny5tEEXZB6tC0ibE6CTkLC
 1SGQuycBz7p6Qn6ZUHx6o+IU1nwO4Jp+ob+k+VLH2htsT1ITBMD2ASd9SMQz8JQZ9KfmprCXqYu
 rp5ZEDbY8IJmf4vcwkh3ERRuUSHvQzP2KCXHyhVDDLeS1y5bOpJMVgMGizG1yVa1hthGbEyIow0
 rDatmaMeC6DNGrtNcxbN61Kqc8LiqM8GTYfLcsAvobphQQuxIZHxk8K8s=
X-Google-Smtp-Source: AGHT+IEdoSbWfZxdWwzpFXHSrcTKZuNo8nYqoWn5rhqCV3Ii7IlMwTeCP5PNy4p7n08XWAdPpWuytQ==
X-Received: by 2002:a05:6a20:1588:b0:2e5:655c:7f86 with SMTP id
 adf61e73a8af0-35ba17ae264mr402703637.39.1763054172852; 
 Thu, 13 Nov 2025 09:16:12 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc375081023sm2712992a12.21.2025.11.13.09.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 09:16:12 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anton Blanchard <antonb@tenstorrent.com>, Max Chou <max.chou@sifive.com>,
 Nutty Liu <liujingqi@lanxincomputing.com>
Subject: [PATCH v3 1/3] target/riscv: rvv: Apply vext_check_input_eew to
 vector int/fp compare instructions
Date: Fri, 14 Nov 2025 01:16:02 +0800
Message-ID: <20251113171604.3034161-2-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113171604.3034161-1-max.chou@sifive.com>
References: <20251113171604.3034161-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x430.google.com
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

From: Anton Blanchard <antonb@tenstorrent.com>

Handle the overlap of source registers with different EEWs for vector
integer/floatint point comare instructions.

Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
Reviewed-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Nutty Liu <liujingqi@lanxincomputing.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 2a487179f63..422e1a21185 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -436,9 +436,10 @@ static bool vext_check_sss(DisasContext *s, int vd, int vs1, int vs2, int vm)
            require_align(vs1, s->lmul);
 }
 
-static bool vext_check_ms(DisasContext *s, int vd, int vs)
+static bool vext_check_ms(DisasContext *s, int vd, int vs, int vm)
 {
-    bool ret = require_align(vs, s->lmul);
+    bool ret = require_align(vs, s->lmul) &&
+               vext_check_input_eew(s, vs, s->sew, -1, 0, vm);
     if (vd != vs) {
         ret &= require_noover(vd, 0, vs, s->lmul);
     }
@@ -461,9 +462,10 @@ static bool vext_check_ms(DisasContext *s, int vd, int vs)
  *      with a mask value (e.g., comparisons) or the scalar result
  *      of a reduction. (Section 5.3)
  */
-static bool vext_check_mss(DisasContext *s, int vd, int vs1, int vs2)
+static bool vext_check_mss(DisasContext *s, int vd, int vs1, int vs2, int vm)
 {
-    bool ret = vext_check_ms(s, vd, vs2) &&
+    bool ret = vext_check_ms(s, vd, vs2, vm) &&
+               vext_check_input_eew(s, vs1, s->sew, vs2, s->sew, vm) &&
                require_align(vs1, s->lmul);
     if (vd != vs1) {
         ret &= require_noover(vd, 0, vs1, s->lmul);
@@ -1823,7 +1825,7 @@ static bool opivv_vmadc_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_mss(s, a->rd, a->rs1, a->rs2);
+           vext_check_mss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 GEN_OPIVV_TRANS(vmadc_vvm, opivv_vmadc_check)
@@ -1859,7 +1861,7 @@ static bool opivx_vmadc_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_ms(s, a->rd, a->rs2);
+           vext_check_ms(s, a->rd, a->rs2, a->vm);
 }
 
 GEN_OPIVX_TRANS(vmadc_vxm, opivx_vmadc_check)
@@ -2033,7 +2035,7 @@ static bool opivv_cmp_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_mss(s, a->rd, a->rs1, a->rs2);
+           vext_check_mss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 GEN_OPIVV_TRANS(vmseq_vv, opivv_cmp_check)
@@ -2047,7 +2049,7 @@ static bool opivx_cmp_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_ms(s, a->rd, a->rs2);
+           vext_check_ms(s, a->rd, a->rs2, a->vm);
 }
 
 GEN_OPIVX_TRANS(vmseq_vx, opivx_cmp_check)
@@ -2755,7 +2757,7 @@ static bool opfvv_cmp_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_mss(s, a->rd, a->rs1, a->rs2);
+           vext_check_mss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
@@ -2768,7 +2770,7 @@ static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_ms(s, a->rd, a->rs2);
+           vext_check_ms(s, a->rd, a->rs2, a->vm);
 }
 
 GEN_OPFVF_TRANS(vmfeq_vf, opfvf_cmp_check)
-- 
2.43.0


