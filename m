Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22AFC54E67
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 07:28:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rmqMK-0006Do-4a; Wed, 20 Mar 2024 03:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rmqMI-0006DA-OI
 for qemu-riscv@nongnu.org; Wed, 20 Mar 2024 03:27:34 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rmqMH-0003jU-1E
 for qemu-riscv@nongnu.org; Wed, 20 Mar 2024 03:27:34 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6e74bd85f26so1000988b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 20 Mar 2024 00:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1710919652; x=1711524452; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0mB7j8AGNJd84zJhNNXFzR1ILnT0s2AeibBFP1ll9q8=;
 b=ehNSPAvLOfuDsEsdmLebVian5yZ5QNLj8JZOQPE2HjEdUbVWTkTNDYyF7EgFjujZuM
 gfxwdWIO+upj8u5/5a6AhnGVOI16dyFuthxMWdLQMRgHCWdJaqHnT3yIvoLQ0F+gL/4/
 KKCDLmsMPoDvWrh9VdcLu4yp01Laj/L2yWc1oE66hNjpPVAs/44k7CJuoS7LifH51qr4
 vldv5d5Qn30eB3ntC9xm6xvpho//Q7s3qdqcatfo5QHga0FwH1MRAH/+XjlH/1L/pPBU
 ejpnG3EEVULaYHuVthhhZ71fQq6dS1LdmpAd6R9a2XybBC288qkTaaNFrjFwmNeQrfBa
 waxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710919652; x=1711524452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0mB7j8AGNJd84zJhNNXFzR1ILnT0s2AeibBFP1ll9q8=;
 b=afWo0tYiQB40WJnjwrp6Ank5qqQ5yODip41PMiNg2+oHxts8/DUR0i8lzuZTKuMYGA
 ZnGHjAeBFeYMX8jjE+oOBqzUHAx07MAiBZZgyT6jamzbYd2Uglz2Fri9Zb7fn+xhFiNY
 FPw0Ive2RLBajgoqpKXOMWER9zR6C2Wn7CWCAvqqXoRAncQdCAWvUvpCM9+KWQ+7ElHF
 5HjFPpsLn5ytJHYwWTXzyScwuVlzhvlqqGd46JiPhQwq9T0/EJpsxppstS2Ap4UM4mkE
 6kGrmWiNV2qDT6AMYTiyYOMS8xWzohTDv7AntGXrgQ8pQp29ALtxk0V/TFOcO6m3QMlf
 7hWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiHBjniJuo0e7bz5YnAwztjCzVw9S+F2pByZE0w6UvahJ1Lc9eDMF/GJ4sy955p0ekF1S7S4UxWgOtdcgYs4prnRMdkcg=
X-Gm-Message-State: AOJu0YxSCG4r6SRrM/BT2lmlGsPzIu0grxVZEo1jCk67t51+rcjQZzWl
 YymtLAlhDidQr8wLVC1V5U1A3pIhsD7a4FA8cwj3AsmJsWotdNJcdtuUa4doqYk=
X-Google-Smtp-Source: AGHT+IGbcJ0cskWqEKqhHDV9HjFrHuflfwV+4LJGPVCaJo+dLuXAq5K9LbCHO3N9M+kukDWRQ6TQWg==
X-Received: by 2002:a05:6a00:4b52:b0:6e5:6971:55f with SMTP id
 kr18-20020a056a004b5200b006e56971055fmr19479523pfb.28.1710919651826; 
 Wed, 20 Mar 2024 00:27:31 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 p10-20020a056a000a0a00b006e6b45debe8sm10811376pfh.78.2024.03.20.00.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 00:27:31 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/riscv: rvv: Remove redudant SEW checking for vector fp
 narrow/widen instructions
Date: Wed, 20 Mar 2024 15:25:05 +0800
Message-Id: <20240320072709.1043227-5-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240320072709.1043227-1-max.chou@sifive.com>
References: <20240320072709.1043227-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

If the checking functions check both the single and double width
operators at the same time, then the single width operator checking
functions (require_rvf[min]) will check whether the SEW is 8.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 19059fea5f..08c22f48cb 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2333,7 +2333,6 @@ static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            require_scale_rvf(s) &&
-           (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
@@ -2373,7 +2372,6 @@ static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            require_scale_rvf(s) &&
-           (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_ds(s, a->rd, a->rs2, a->vm);
 }
@@ -2406,7 +2404,6 @@ static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            require_scale_rvf(s) &&
-           (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm);
 }
@@ -2446,7 +2443,6 @@ static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
     return require_rvv(s) &&
            require_rvf(s) &&
            require_scale_rvf(s) &&
-           (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dd(s, a->rd, a->rs2, a->vm);
 }
@@ -2704,8 +2700,7 @@ static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_widen_check(s, a) &&
            require_rvfmin(s) &&
-           require_scale_rvfmin(s) &&
-           (s->sew != MO_8);
+           require_scale_rvfmin(s);
 }
 
 #define GEN_OPFV_WIDEN_TRANS(NAME, CHECK, HELPER, FRM)             \
@@ -2810,16 +2805,14 @@ static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_narrow_check(s, a) &&
            require_rvfmin(s) &&
-           require_scale_rvfmin(s) &&
-           (s->sew != MO_8);
+           require_scale_rvfmin(s);
 }
 
 static bool opffv_rod_narrow_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_narrow_check(s, a) &&
            require_rvf(s) &&
-           require_scale_rvf(s) &&
-           (s->sew != MO_8);
+           require_scale_rvf(s);
 }
 
 #define GEN_OPFV_NARROW_TRANS(NAME, CHECK, HELPER, FRM)            \
@@ -2947,8 +2940,7 @@ static bool freduction_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return reduction_widen_check(s, a) &&
            require_rvf(s) &&
-           require_scale_rvf(s) &&
-           (s->sew != MO_8);
+           require_scale_rvf(s);
 }
 
 GEN_OPFVV_WIDEN_TRANS(vfwredusum_vs, freduction_widen_check)
-- 
2.31.1


