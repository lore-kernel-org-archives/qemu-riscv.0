Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32669CAC598
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 08:44:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uy4mL-0007zb-Nx; Mon, 15 Sep 2025 04:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uy4mF-0007oC-O0
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 04:41:36 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uy4lq-0002QI-9s
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 04:41:32 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-772627dd50aso5594762b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Sep 2025 01:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1757925668; x=1758530468; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=512SNwG/42h2YVFM//EPeL3wCt1vmEMWdeuDeCr6XOw=;
 b=hsWaG110Tr/+1APCn+Z1oU+Nfzc2BV6YGoInurvARb8KvsfIdO47/oKDX1zBNCvRke
 L8aln72Eh2nrrN6fDDHY8gdmAwZuce3najB8TyqlFIhG0AQzoDB9qDVX6PcewOntIz8c
 ZTwK+RTPS1BGgAfQ4wK07pr6NgNSE8aiRDux8ahnkC0WlWldUSu5Ig21+5/1I/7ggYH5
 5ZXzYyVx1YOa2Wbz2q5tEiOkWJn4LkKfskMRrQUkxZJcR8Af2zN2rWPMPGnsvJyZaovl
 4WGGS76CIGy6Vl7zUIiIbSSk5GxKlrKac8RIxME4zf9sTUv42ffryupvoPn2OXHHl2ZA
 /4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757925668; x=1758530468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=512SNwG/42h2YVFM//EPeL3wCt1vmEMWdeuDeCr6XOw=;
 b=ujwLDYT+gBgC31IIrc2oe+iu3OV4Ey9ph/TGHDf8rIx+TjGk2/PsQJ5pBMRvLfVEwu
 bNYgsVuGdWC7iAFDufnJSeaNaiEJfnVHvoYcIahq8lP5dPCH1qmZYn2UoGP6VsczFuRx
 6vuhEbhVdapj30puI1Ek+RyXTbN6Ipl8JudcHmXk7WhPgsbjHp1SBWcvlUlb7OTRlYrW
 joUsvyw0ksjnXBhkGOLTa8To3AkN6GvPjC7hljsyTJERNtegp/7Y247UCCcVxYBNu0lF
 s8D0hpeKUbQmWYv6C/F3py2eHmedZNA7vi9MJgFaNMZdVkDRgJttAAvKmXzWCujhTws/
 brAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1wxDG59ZRMqKfTNafjAq5TP842IZvMlsqP/WYGRBFtp0gN4k/SeqOGVT6z47L32R0ULxKyA+yOPxM@nongnu.org
X-Gm-Message-State: AOJu0Yz5V/yqeRWvJModd4HvN/W+yaXHxbscDB4pEAnpGg+KxDEG1udN
 M3g61+tIK4I7BDW6IRjFARPQeFm1gPh9Z/G0K7c7mAnqPFdTv7Y3NIn7h2VOWoTDLqs=
X-Gm-Gg: ASbGnctRpDP5tNXYs4f/wAr3aM5XrvJir7PSYLSC/AF+XtzOTKT7neBBo2r9GrxjVVU
 TjSFChSc6z//MqrXvfbiiYPnYvhrUTkBmylC+m1aIdAy0xY9EVaKQLycOTMe+DLzYDAOx04sKAB
 oOeUGkpNLa5y5ywsjyasfCVq+mNLPRLrMW7tmexGPF2dGcaV7E8GfjoBOKRwO8eX1Do5jgH468w
 a1VHEGvmqzaFCJpX/CzRTZ+X0fVkuGhlD2GcMrUf5msXGC/NKd22IaOuT7xUcXmm57bUZRha54Q
 NQa+Wrf6tmJ3Ok0VuqJTxMDSG4XRjYQyCn0Av+UJxMWeyBGc/MpUQwHKIK9RXnuMV/TRIg6Zl1b
 JXuDJH1pw7rqeBcJMslJxdwsn19j3WFApVd65i6F/9qamk+55r5lnMuQupSkjOHhKz6tea//iun
 /r1w==
X-Google-Smtp-Source: AGHT+IFoDLndtxzmRjFmPNgqUmSrx8zHVIqUFQdp3DCFdYMLVkCo8j8khTc7kBxGeNWoTrQ9LMlZZw==
X-Received: by 2002:a17:902:d507:b0:24b:270e:56d4 with SMTP id
 d9443c01a7336-25d2a11abefmr139836035ad.4.1757925667933; 
 Mon, 15 Sep 2025 01:41:07 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26295996ff6sm55852045ad.64.2025.09.15.01.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 01:41:07 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH 6/8] target/riscv: Introduce BF16 canonical NaN for Zvfbfa
 extension
Date: Mon, 15 Sep 2025 16:40:34 +0800
Message-ID: <20250915084037.1816893-7-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915084037.1816893-1-max.chou@sifive.com>
References: <20250915084037.1816893-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

According to the Zvfbfa ISA spec (v0.1), improperly NaN-boxed
f-register operands must substitute the BF16 canonical NaN instead of
the FP16 canonical NaN for some vector floating-point instructions.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 18 +++++++++---------
 target/riscv/translate.c                |  8 ++++++++
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 71f98fb350b..62cc03784cb 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2347,17 +2347,17 @@ GEN_OPIWI_NARROW_TRANS(vnclip_wi, IMM_ZX, vnclip_wx)
  */
 static void do_nanbox(DisasContext *s, TCGv_i64 out, TCGv_i64 in)
 {
-    switch (s->sew) {
-    case 1:
-        gen_check_nanbox_h(out, in);
-        break;
-    case 2:
+    if (s->sew == MO_16) {
+        if (s->altfmt) {
+            gen_check_nanbox_h_bf16(out, in);
+        } else {
+            gen_check_nanbox_h(out, in);
+        }
+    } else if (s->sew == MO_32) {
         gen_check_nanbox_s(out, in);
-        break;
-    case 3:
+    } else if (s->sew == MO_64) {
         tcg_gen_mov_i64(out, in);
-        break;
-    default:
+    } else {
         g_assert_not_reached();
     }
 }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8ad147946c9..d99b58629d0 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -201,6 +201,14 @@ static void gen_check_nanbox_h(TCGv_i64 out, TCGv_i64 in)
     tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
 }
 
+static void gen_check_nanbox_h_bf16(TCGv_i64 out, TCGv_i64 in)
+{
+    TCGv_i64 t_max = tcg_constant_i64(0xffffffffffff0000ull);
+    TCGv_i64 t_nan = tcg_constant_i64(0xffffffffffff7fc0ull);
+
+    tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
+}
+
 static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
 {
     TCGv_i64 t_max = tcg_constant_i64(0xffffffff00000000ull);
-- 
2.43.0


