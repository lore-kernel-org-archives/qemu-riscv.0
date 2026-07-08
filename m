Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4E2C43602
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 16:20:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1whUzg-00016X-T2; Wed, 08 Jul 2026 12:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1whUzf-00015z-Oo
 for qemu-riscv@nongnu.org; Wed, 08 Jul 2026 12:19:27 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1whUze-0006zn-55
 for qemu-riscv@nongnu.org; Wed, 08 Jul 2026 12:19:27 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-384c94c9414so840583a91.3
 for <qemu-riscv@nongnu.org>; Wed, 08 Jul 2026 09:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783527565; x=1784132365; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=j8dr4FDMitUA0gEzk3TdSWqsLs8LF2XIAra9aUvAPMY=;
 b=csTIrrIFyCBn4Wab+H6Ju391qkVy4riXBRv1Pbxjvp4oxgJYL/vpPaQQawk2q7X0y6
 aVG9WG58SLaCxXhmmyy7U+nJhQNNnaNoV97Etgz1odKRQaueTgc/gKw5mCxM6H+4F6zP
 sOV+xNCq9GXxGybU+doH0vLBTDCgzBNIJMBNH7gk0saAKSXSwSW09Mdp0Lm3y5LGDmjG
 l9Q/vnSv9+o6fdI+EgCcGo9XK+a9Ks1DXfwfs4vECLu30uFp5mAZFiQKCpIe+bJh53OE
 3uxKxxS6SgE5igVhvoHDwFIH0wkn1vd73XCVqRtjByMaHoWBvmnBL+S1Fn5vsUq4bmJO
 ceug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783527565; x=1784132365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=j8dr4FDMitUA0gEzk3TdSWqsLs8LF2XIAra9aUvAPMY=;
 b=llQd4xlHSR77bAl/hdy+s97be9eJA0UqPOh06/X8/TwGFExuVpeOkdsnvGyV+5zeMS
 tlyKGn42mZTtMdzrbDT5mg4Db6wO3ABe2sTAxKlqkSqMFWnT28d5tqucdWYdcCBduUfR
 6xi2Y6K+tIJSZ51ikvhFwlHx7SWqbjGfft8rxZ0Wlyj4FnNl3lJJ/4MMhk+aVZoc11Jn
 y9HxzOa7X+9POvnYt0NdbXlLKeucsnjwISiNv+YpJiYP/sMQP/jzBTbDOd0m4PGqLqUs
 iox16ecVvx809d86ZzV7oS3DBQOFkITIhJsnW1b8QV7ri/b+iG9IBXKdHldYDefO4+gQ
 qvag==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqo9D38Kk32mMGa7PuuVCCiHOeRhd9nev+QYo9WRwKNeqH51FTfDJhlE4UuQ85MxHWxLnPrOai3ld8w@nongnu.org
X-Gm-Message-State: AOJu0YzzjqP5BZqe0fO2EPzR8FAvX+HR9Fu5j4q6MSolWq2803ywURQB
 1Bl7+k0j5z0HnNBQp3cWEXcqgPBiCkBEHiBXr1ZZhbOTTp3zABveFPJX6YafSNnWZPg=
X-Gm-Gg: AfdE7cnNA0d+JiPbMORXE/sfWFW5ftqcUIAXfombqrEpDhyH8ffPA5DpOO3QO8oERK1
 0OZJfB5+ppp+IHlnFnEvz4Pja8HUWsxELftTs9kPnWqPUF9jpHDaGAEO0IFu3LLokFYC3trD3VZ
 /wUDJGeYULHlvTs+BkbFED7hhmJUGlV5rOSTkZ1SGJPzSVjeQCRD1d6Fcb+TFmpBq/bzOcpeS7u
 N7pA7SAHQF/NulYdBVQubrmUHR/pAa9sXBYZnIbhURwMH9mryj2mgJ7PUpW5CLhk+TZFJDP1gm0
 75SeBYhV9ioMQIVn0ue7utsxwLzLZMBjVoSRC6LuziuBIKXm0QiFnkHccS0rMO7d6la3Q3VsWsZ
 CLWty6CdXTCgS+b5z941QBZvzJDAWAY3XGVP7yXI+bIndoIpmaqiDTw8LLRjqgahF2GN18kjJLf
 EBuBQ0C4k8UroI73Jmb9agkmHjTqnnZhm1Syxr+m5FOb+QfA2oJP3y2rMTAJm9L9YbF0B/P3l7C
 jDJ7DCxTJhsHpy/
X-Received: by 2002:a17:90a:e183:b0:381:25ce:bcc2 with SMTP id
 98e67ed59e1d1-3893fb6b6ebmr3159659a91.6.1783527564581; 
 Wed, 08 Jul 2026 09:19:24 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bdb56fsm30789265ad.15.2026.07.08.09.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 09:19:24 -0700 (PDT)
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
 Chao Liu <chao.liu.zevorn@gmail.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 6/9] target/riscv: rvv: Make vfncvtbf16.f.f.w support BF16
 to OFP8 conversion for Zvfofp8min extension
Date: Thu,  9 Jul 2026 00:18:56 +0800
Message-ID: <20260708161859.1124848-7-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708161859.1124848-1-max.chou@sifive.com>
References: <20260708161859.1124848-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x1033.google.com
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

According to the Zvfofp8min extension, the vfncvtbf16.f.f.w instruction
supports BF16 to OFP8 conversion without saturation when SEW is 8.
And the VTYPE.altfmt field is used to select the OFP8 format.
* altfmt = 0: BF16 to OFP8.e4m3
* altfmt = 1: BF16 to OFP8.e5m2

Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/tcg/insn_trans/trans_rvbf16.c.inc | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/riscv/tcg/insn_trans/trans_rvbf16.c.inc b/target/riscv/tcg/insn_trans/trans_rvbf16.c.inc
index 86eb86f615..7e9b0a53a4 100644
--- a/target/riscv/tcg/insn_trans/trans_rvbf16.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvbf16.c.inc
@@ -67,11 +67,20 @@ static bool trans_fcvt_s_bf16(DisasContext *ctx, arg_fcvt_s_bf16 *a)
 static bool trans_vfncvtbf16_f_f_w(DisasContext *ctx, arg_vfncvtbf16_f_f_w *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZVFBFMIN(ctx);
 
-    if (opfv_narrow_check(ctx, a) && (ctx->sew == MO_16)) {
+    if (opfv_narrow_check(ctx, a) &&
+        ((ctx->sew == MO_16 && ctx->cfg_ptr->ext_zvfbfmin) ||
+         (ctx->sew == MO_8 && ctx->cfg_ptr->ext_zvfofp8min))) {
+        gen_helper_gvec_3_ptr *fn;
         uint32_t data = 0;
 
+        if (ctx->sew == MO_16) {
+            fn = gen_helper_vfncvtbf16_f_f_w;
+        } else {
+            fn = ctx->altfmt ? gen_helper_vfncvtbf16_f_f_w_ofp8e5m2 :
+                               gen_helper_vfncvtbf16_f_f_w_ofp8e4m3;
+        }
+
         gen_set_rm_chkfrm(ctx, RISCV_FRM_DYN);
 
         data = FIELD_DP32(data, VDATA, VM, a->vm);
@@ -81,8 +90,7 @@ static bool trans_vfncvtbf16_f_f_w(DisasContext *ctx, arg_vfncvtbf16_f_f_w *a)
         tcg_gen_gvec_3_ptr(vreg_ofs(ctx, a->rd), vreg_ofs(ctx, 0),
                            vreg_ofs(ctx, a->rs2), tcg_env,
                            ctx->cfg_ptr->vlenb,
-                           ctx->cfg_ptr->vlenb, data,
-                           gen_helper_vfncvtbf16_f_f_w);
+                           ctx->cfg_ptr->vlenb, data, fn);
         finalize_rvv_inst(ctx);
         return true;
     }
-- 
2.55.0


