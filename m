Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DB4C369AB
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 04:32:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u4XyT-0005pK-B2; Tue, 15 Apr 2025 00:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1u4XyN-0005mw-Uf
 for qemu-riscv@nongnu.org; Tue, 15 Apr 2025 00:32:36 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1u4XyL-0007QU-Sd
 for qemu-riscv@nongnu.org; Tue, 15 Apr 2025 00:32:35 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-2c6ed7efb1dso3330688fac.2
 for <qemu-riscv@nongnu.org>; Mon, 14 Apr 2025 21:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1744691552; x=1745296352; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AzNM6WOim063dpu8Q/iHUdVmMI7CNwTO8pY6ZOq1UCI=;
 b=D7dbjIHm0QH8grbp1K8bBje+89TjH2obycciEPSCYGdl6r1Uw+Iwo3c/xzmSSrjZiw
 rRllqhfeAG/1H6Cb4nys4gYVRy/RdI0Zr9Zis4UBDUoHSOrNLRgZZhPrWb9r2O1ooEc9
 5K4eeKe842huLe8AJNGZEmSiKZyOM4mrSYaykvFGlw1Y/vAK7PL9QJ61gFg2YajeCtaa
 gwQFJneMDm/RM89X0MFhlTbVu6VsNrrJcyfOSgsHanr8MiUoX38NaATnEmzGz+/Slc9U
 eeEr85Wh0hHouWi6KTEQlL4OQhOWtW5fp8L4ZdR80XTRng7Qlc4ALWFwU7UJMXfDh8WV
 D2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744691552; x=1745296352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AzNM6WOim063dpu8Q/iHUdVmMI7CNwTO8pY6ZOq1UCI=;
 b=QBN1vRowMKvzco3kChrlVvcwfycb+U+OUbR+oUJlAgqbD2Jmh7TH8r5DcxQPfTEKMY
 lQeE4z5svaylwAls+OmknzlS5a/uIJ4msfsmzje+B0b8sh+6OIU6gLwzuYstAkd5EX/V
 HBZIlQks6PcTiItf8RLp372wb3ZcYOJ+mKRQ2sK18I0k83Ps74+orzK2DfCPJvcam/kX
 Rs3upYTtpcBJjc6Ui+4+aU/HUToqlZ03sG1K9sxdJe45hwDY4C067U1V/nxAGa8g6PX8
 EG44iNH6IN5q4N5YrboG83MgblJhHn44jFu+XPDcFmwsYFE+GXScB9zh/UhT5CRDglEQ
 qyNQ==
X-Gm-Message-State: AOJu0YwAW9xlrtPxIGd+n2cZING+3YjV5UwlEAlcmYu8IZ4rNqrRm+ol
 TXiuuMe5gwres3NWdqZQCsO8W7y06jtmC8g+nS+NBpeghs0T52SfZkWGlyLFEtTsxlf2KgdjUqh
 62bc=
X-Gm-Gg: ASbGncubiFJFbYi1IzH3KRGUkBk1BdfGoO2IHtcAMhyfWNCvpq04JCu9be89hWBXoWh
 vC24uZ78xdrFI+Q3omnu+CO6zvYDoN276kcK1GsYdenzNGyXItplckCTNeVVa+zGwNZ0SuuVljy
 JOd6XkCoRZFb1jv+Ib0gpRAHiOM2dHIkRSiGPkSW16jwR169jJVZYqtn131oKOsE3tallFvh9P4
 u0zo02ef4HTYOKvqH1TXgnp98//s72pVvwa/0h74fd7sm1VxlTimMktwNtTERcN4Gjf/Dzru3s0
 B8G3iEk8ZWitUDYpSZwspgzrO0ka5h3qReASqWql8TlmukYlRR9yjbGC5SKq/W0buVO/VTtQSCc
 =
X-Google-Smtp-Source: AGHT+IHExW6nlxPgUI3ko9fNvzdqf860OjUJHkGioTaFVlYODku8qI+BLxyQdeRBhp//xAjL8tu0Mg==
X-Received: by 2002:a05:6871:800d:b0:296:dd30:e90f with SMTP id
 586e51a60fabf-2d0d5cb783amr8520279fac.16.1744691552055; 
 Mon, 14 Apr 2025 21:32:32 -0700 (PDT)
Received: from ausc-rvsw-c-01-anton.tenstorrent.com ([38.104.49.66])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2d096d4af59sm2728816fac.46.2025.04.14.21.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 21:32:30 -0700 (PDT)
From: Anton Blanchard <antonb@tenstorrent.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.or
Cc: max.chou@sifive.com, dbarboza@ventanamicro.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, Anton Blanchard <antonb@tenstorrent.com>
Subject: [PATCH 1/3] target/riscv: rvv: Apply vext_check_input_eew to vector
 integer/fp compare instructions
Date: Tue, 15 Apr 2025 04:32:05 +0000
Message-Id: <20250415043207.3512209-2-antonb@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415043207.3512209-1-antonb@tenstorrent.com>
References: <20250415043207.3512209-1-antonb@tenstorrent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=antonb@tenstorrent.com; helo=mail-oa1-x2f.google.com
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

Handle the overlap of source registers with different EEWs.

Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 445a0b72a5..4ba6de65f7 100644
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
@@ -1756,7 +1758,7 @@ static bool opivv_vmadc_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_mss(s, a->rd, a->rs1, a->rs2);
+           vext_check_mss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 GEN_OPIVV_TRANS(vmadc_vvm, opivv_vmadc_check)
@@ -1792,7 +1794,7 @@ static bool opivx_vmadc_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_ms(s, a->rd, a->rs2);
+           vext_check_ms(s, a->rd, a->rs2, a->vm);
 }
 
 GEN_OPIVX_TRANS(vmadc_vxm, opivx_vmadc_check)
@@ -1966,7 +1968,7 @@ static bool opivv_cmp_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_mss(s, a->rd, a->rs1, a->rs2);
+           vext_check_mss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 GEN_OPIVV_TRANS(vmseq_vv, opivv_cmp_check)
@@ -1980,7 +1982,7 @@ static bool opivx_cmp_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_ms(s, a->rd, a->rs2);
+           vext_check_ms(s, a->rd, a->rs2, a->vm);
 }
 
 GEN_OPIVX_TRANS(vmseq_vx, opivx_cmp_check)
@@ -2688,7 +2690,7 @@ static bool opfvv_cmp_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_mss(s, a->rd, a->rs1, a->rs2);
+           vext_check_mss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
 
 GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
@@ -2701,7 +2703,7 @@ static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            vext_check_isa_ill(s) &&
-           vext_check_ms(s, a->rd, a->rs2);
+           vext_check_ms(s, a->rd, a->rs2, a->vm);
 }
 
 GEN_OPFVF_TRANS(vmfeq_vf, opfvf_cmp_check)
-- 
2.34.1


