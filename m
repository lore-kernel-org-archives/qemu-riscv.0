Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E847C25B67
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 15:20:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qw29w-0006nj-Mn; Thu, 26 Oct 2023 11:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw29u-0006m4-Oi
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:20:30 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw29s-0006J5-JE
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:20:30 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-577fff1cae6so731747a12.1
 for <qemu-riscv@nongnu.org>; Thu, 26 Oct 2023 08:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1698333627; x=1698938427; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CeuH98/Jn7U3mEiXrbYPk6TZIyqSxoArWfMyJGiEIgA=;
 b=EIef96E1BPTZ12woNna8NNQzE0ntHF2FvX4Q/NPmVAA7HgMKu3GhE6yQnfe0XGHEVK
 CflcbN41g3MTSPYPiBYnf42xTuOJ66cDoc9yFxcuZkFFFSWuwUSn7v0TdGctDNArwwB0
 aL07p80WZkQO0kQ116nphVn3UCbhBzula98kGKo2i2ZWKu1fjO8kihywJj2Pr4kneY94
 4duMtTse7f9eRTrzEpN4kBlLdD5hMvhGGsNp8f6dIkhF0iQd2+6AS0mpbde1b4rTLOg1
 B6KNtdzWByOBh4DP2pbNWbBAXAz2qVsXvEfSjqnDEO+sbZ343GUl8uCNjx+5EwkBF1ZP
 OnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698333627; x=1698938427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CeuH98/Jn7U3mEiXrbYPk6TZIyqSxoArWfMyJGiEIgA=;
 b=DJzsR/p+2QS+6NXk9b4fJPktDt9L0OBDEdrApO0xcFVHvBQVAUBUEpIlR8zoB4U/fe
 LdZ4CUsNSO15IP/ko8GbMKd/VF6LCbgY38RNumbD2w6Rd7xmi27tSVvIi+KqkADN38tg
 Wy6IZGXlT09Q0xmwDaAMWR+MQtVOGLn1i5HjnJ73es11d0Fe+EFZYmIYO6bZ3b6rNzA1
 cF2VMy8WWTqtRGYR8MOqeaOIivSsbuxJC52agbczpsuHeeCcD3sOw+Dgr1s7HkDL/y3j
 5sRRZmN6h1Bd/1Nom8gx+6rdcYRR+kTLZO1RRu8BcrURNtcyhHMdaAUo+WLjfhIOIvws
 q9AQ==
X-Gm-Message-State: AOJu0Yyw0ZqmeMM/czfj/VKCpvZCeuck39DdQORI3PiYvzLEU4ft6jES
 W3kQ+g/HsWh3eI5fJpekLA/+HA==
X-Google-Smtp-Source: AGHT+IGpiW4RgI54JLySYSZhxy0DSJWbZ9hoBZeCgx1G2+ux6XZlkHXUlqVnb1Y7czFOtzRXj7SGHw==
X-Received: by 2002:a17:90b:3606:b0:276:6be8:8bfe with SMTP id
 ml6-20020a17090b360600b002766be88bfemr28991pjb.23.1698333627234; 
 Thu, 26 Oct 2023 08:20:27 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 nv18-20020a17090b1b5200b0027fee011cebsm1326061pjb.10.2023.10.26.08.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 08:20:27 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Subject: [PATCH v2 04/14] target/riscv: Replace Zvbb checking by Zvkb
Date: Thu, 26 Oct 2023 23:18:11 +0800
Message-Id: <20231026151828.754279-5-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026151828.754279-1-max.chou@sifive.com>
References: <20231026151828.754279-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x531.google.com
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

The Zvkb extension is a proper subset of the Zvbb extension and includes
following instructions:
  * vandn.[vv,vx]
  * vbrev8.v
  * vrev8.v
  * vrol.[vv,vx]
  * vror.[vv,vx,vi]

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvvk.c.inc | 37 +++++++++++++++---------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvvk.c.inc b/target/riscv/insn_trans/trans_rvvk.c.inc
index e691519ed78..3801c16829d 100644
--- a/target/riscv/insn_trans/trans_rvvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvvk.c.inc
@@ -112,24 +112,27 @@ GEN_VX_MASKED_TRANS(vclmulh_vx, vclmul_vx_check)
         return false;                                            \
     }
 
-static bool zvbb_vv_check(DisasContext *s, arg_rmrr *a)
+static bool zvkb_vv_check(DisasContext *s, arg_rmrr *a)
 {
-    return opivv_check(s, a) && s->cfg_ptr->ext_zvbb == true;
+    return opivv_check(s, a) &&
+           (s->cfg_ptr->ext_zvbb == true || s->cfg_ptr->ext_zvkb == true);
 }
 
-static bool zvbb_vx_check(DisasContext *s, arg_rmrr *a)
+static bool zvkb_vx_check(DisasContext *s, arg_rmrr *a)
 {
-    return opivx_check(s, a) && s->cfg_ptr->ext_zvbb == true;
+    return opivx_check(s, a) &&
+           (s->cfg_ptr->ext_zvbb == true || s->cfg_ptr->ext_zvkb == true);
 }
 
 /* vrol.v[vx] */
-GEN_OPIVV_GVEC_TRANS_CHECK(vrol_vv, rotlv, zvbb_vv_check)
-GEN_OPIVX_GVEC_SHIFT_TRANS_CHECK(vrol_vx, rotls, zvbb_vx_check)
+GEN_OPIVV_GVEC_TRANS_CHECK(vrol_vv, rotlv, zvkb_vv_check)
+GEN_OPIVX_GVEC_SHIFT_TRANS_CHECK(vrol_vx, rotls, zvkb_vx_check)
 
 /* vror.v[vxi] */
-GEN_OPIVV_GVEC_TRANS_CHECK(vror_vv, rotrv, zvbb_vv_check)
-GEN_OPIVX_GVEC_SHIFT_TRANS_CHECK(vror_vx, rotrs, zvbb_vx_check)
-GEN_OPIVI_GVEC_TRANS_CHECK(vror_vi, IMM_TRUNC_SEW, vror_vx, rotri, zvbb_vx_check)
+GEN_OPIVV_GVEC_TRANS_CHECK(vror_vv, rotrv, zvkb_vv_check)
+GEN_OPIVX_GVEC_SHIFT_TRANS_CHECK(vror_vx, rotrs, zvkb_vx_check)
+GEN_OPIVI_GVEC_TRANS_CHECK(vror_vi, IMM_TRUNC_SEW, vror_vx, rotri,
+                           zvkb_vx_check)
 
 #define GEN_OPIVX_GVEC_TRANS_CHECK(NAME, SUF, CHECK)                     \
     static bool trans_##NAME(DisasContext *s, arg_rmrr *a)               \
@@ -147,8 +150,8 @@ GEN_OPIVI_GVEC_TRANS_CHECK(vror_vi, IMM_TRUNC_SEW, vror_vx, rotri, zvbb_vx_check
     }
 
 /* vandn.v[vx] */
-GEN_OPIVV_GVEC_TRANS_CHECK(vandn_vv, andc, zvbb_vv_check)
-GEN_OPIVX_GVEC_TRANS_CHECK(vandn_vx, andcs, zvbb_vx_check)
+GEN_OPIVV_GVEC_TRANS_CHECK(vandn_vv, andc, zvkb_vv_check)
+GEN_OPIVX_GVEC_TRANS_CHECK(vandn_vx, andcs, zvkb_vx_check)
 
 #define GEN_OPIV_TRANS(NAME, CHECK)                                        \
     static bool trans_##NAME(DisasContext *s, arg_rmr *a)                  \
@@ -188,8 +191,16 @@ static bool zvbb_opiv_check(DisasContext *s, arg_rmr *a)
            vext_check_ss(s, a->rd, a->rs2, a->vm);
 }
 
-GEN_OPIV_TRANS(vbrev8_v, zvbb_opiv_check)
-GEN_OPIV_TRANS(vrev8_v, zvbb_opiv_check)
+static bool zvkb_opiv_check(DisasContext *s, arg_rmr *a)
+{
+    return (s->cfg_ptr->ext_zvbb == true || s->cfg_ptr->ext_zvkb == true) &&
+           require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_ss(s, a->rd, a->rs2, a->vm);
+}
+
+GEN_OPIV_TRANS(vbrev8_v, zvkb_opiv_check)
+GEN_OPIV_TRANS(vrev8_v, zvkb_opiv_check)
 GEN_OPIV_TRANS(vbrev_v, zvbb_opiv_check)
 GEN_OPIV_TRANS(vclz_v, zvbb_opiv_check)
 GEN_OPIV_TRANS(vctz_v, zvbb_opiv_check)
-- 
2.34.1


