Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D77C43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 16:20:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1whUzp-00019U-D0; Wed, 08 Jul 2026 12:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1whUzo-000193-IT
 for qemu-riscv@nongnu.org; Wed, 08 Jul 2026 12:19:36 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1whUzn-00074u-1A
 for qemu-riscv@nongnu.org; Wed, 08 Jul 2026 12:19:36 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2cc84e77e78so7374965ad.2
 for <qemu-riscv@nongnu.org>; Wed, 08 Jul 2026 09:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783527573; x=1784132373; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wZERHPamERHB1hw0+7p9a9eq7gJF5zxz97pdFVP6Yy0=;
 b=NGF7oQIpLYlM5ggbNZ5cdgoWmnSV8McjurGhh1HuON1d7LTUlJctcPBiuCZBaTGEGo
 aSppNqW3pDdw+oiTsT1r4h8ltiK49s3ojV4bIWE2ssOkqbAbkgo0Xwr4LGzVIrAPb9qS
 5N1Np1aIW8a3tKnXv2vxkaIPLdcJsDYsZ97g716HEMUK2ERyNpATIT9vZgC7IMoeWXLv
 m5DfmrOzOSy0kDSNr8qv/2cyVE8rQJgXxDTWtiY4f6S31id0JijkI45WnE6AX2LzYTpw
 yxQADSkJ+jBoNjjlI6DxbA1BkiPLBcBh2NVLYbLR85EXs9EO/BZzhRXwDC+RmsBSxNUz
 ebrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783527573; x=1784132373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wZERHPamERHB1hw0+7p9a9eq7gJF5zxz97pdFVP6Yy0=;
 b=PZq4+b9SeeJoqOq1+2DBuBmdz1n7xi6oD3UnCmXBfJO9nCViVSDz97h1VrxIFMIl9c
 396vhTWjCThE9rMEK76nqwvN1+eRvrUmw0CW+cl93VsamDEx1+NyxOehgswZ8e5tL2Nu
 a8xbOeXdgagqwdGDWUY9eHSIbPLUiqmAvcpD6yp+hkUgxA2ZiSpybzEqfe1aRhccx1Oz
 JxS20dmcLnk/ByYL/aCHJhsMomR6ArnAUogmQ5ubFvqgFmcs6CKs4HJdMlva5mcBao8n
 aZge06MzDf979/xkjJtvvW1/DERyifvz/6Dd/3TBXr+5C1kgDjBZaA4YEO1JMotMYsqZ
 j0CA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrttpV8m/2JkJQnJ86hj8SjVUVToWuk9Ui1Tu4jCaG+nQlR2VC+rP/PWIZRNThK32moAVKOXKXMTMG0@nongnu.org
X-Gm-Message-State: AOJu0YzB++II/yOzXCviWy08NRR2RSDV6u0PCtL2Mp/Elq/7g+4JVxUA
 Zo7bIF034ckUpAdMQtcE3/H9Hvf6HR2up/mEjbgCRr1bBm8yFMqqd51mEp3NfF+QgGE=
X-Gm-Gg: AfdE7cn8SAbtxSkdYbxPeUcoPiq7f0M3zUF6E46yji6vZMvxRClD23bqBkksSLXHaCC
 UHKGsqtHp4S9KIvDcWlJXbyEI8NaLnmVpzSHMYsDw3ZMaaEq873whow7sN8HsdlxWYe4kZlT83h
 0jP6ef5YPChhpFRI/1fpDFOUg5NJCXe8NV0Uiuu0KPyhdPbSa4gbl9ZFthN9q004Ni1P4sYCTQT
 v9Say5K7S+I12ZrsLuITaz23WhTWLrLJgejaMDLxshsDNkzW7ze26CXFVuw4VIE3B/KxCKNZH+m
 x8zPTVrtjZWqNfdQLndHAkaOWBe9eC1L+hFS9P4rlHzj9zA4L7GSgVA3p9LZA4+gwKjoeyJc/7i
 KDmaASAje+63WcUmwPvUntRRFUnvv2Jnpo8s587oIm/UDMkHzNGKZFXV/pCpwFWBxDQkbd3p9Tr
 U+43R41IoeqHGxC5qe8W+dRlXlkND9OyhKKB0BxqSmGlfPAv5HWUV6PhXTLggPngp5JBt/Nyaxz
 pvpl7FdvFitnTCN
X-Received: by 2002:a17:902:fc8d:b0:2ca:73aa:b48f with SMTP id
 d9443c01a7336-2ccea485246mr33357415ad.35.1783527573525; 
 Wed, 08 Jul 2026 09:19:33 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bdb56fsm30789265ad.15.2026.07.08.09.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 09:19:33 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Max Chou <max.chou@sifive.com>
Subject: [PATCH v6 9/9] disas/riscv: Add support of Zvfofp8min extension
Date: Thu,  9 Jul 2026 00:18:59 +0800
Message-ID: <20260708161859.1124848-10-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708161859.1124848-1-max.chou@sifive.com>
References: <20260708161859.1124848-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x633.google.com
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

This patch adds support to disassemble Zvfofp8min instructions.

Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 disas/riscv.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 7f1b262773..bcda21fb62 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -990,6 +990,9 @@ typedef enum {
     rv_op_cbo_flush = 958,
     rv_op_cbo_zero = 959,
     rv_op_mnret = 960,
+    rv_op_vfncvtbf16_sat_f_f_w = 961,
+    rv_op_vfncvt_f_f_q = 962,
+    rv_op_vfncvt_sat_f_f_q = 963,
 } rv_op;
 
 /* register names */
@@ -2260,11 +2263,14 @@ const rv_opcode_data rvi_opcode_data[] = {
       rv_op_sspush, 0 },
     { "c.sspopchk", rv_codec_cmop_ss, rv_fmt_rs1, NULL, rv_op_sspopchk,
       rv_op_sspopchk, 0 },
-   { "cbo.inval", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
-   { "cbo.clean", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
-   { "cbo.flush", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
-   { "cbo.zero", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
-   { "mnret", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
+    { "cbo.inval", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
+    { "cbo.clean", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
+    { "cbo.flush", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
+    { "cbo.zero", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
+    { "mnret", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
+    { "vfncvtbf16.sat.f.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
+    { "vfncvt.f.f.q", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
+    { "vfncvt.sat.f.f.q", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
 };
 
 /* CSR names */
@@ -3660,7 +3666,10 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                     case 21: op = rv_op_vfncvt_rod_f_f_w; break;
                     case 22: op = rv_op_vfncvt_rtz_xu_f_w; break;
                     case 23: op = rv_op_vfncvt_rtz_x_f_w; break;
+                    case 25: op = rv_op_vfncvt_f_f_q; break;
+                    case 27: op = rv_op_vfncvt_sat_f_f_q; break;
                     case 29: op = rv_op_vfncvtbf16_f_f_w; break;
+                    case 31: op = rv_op_vfncvtbf16_sat_f_f_w; break;
                     }
                     break;
                 case 19:
-- 
2.55.0


