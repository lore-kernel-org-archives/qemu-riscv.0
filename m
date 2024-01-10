Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713EAC4707B
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 16:40:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNbcg-0001Da-Nv; Wed, 10 Jan 2024 11:40:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rNbcb-0001D3-S9
 for qemu-riscv@nongnu.org; Wed, 10 Jan 2024 11:40:06 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1rNbca-0007fv-0l
 for qemu-riscv@nongnu.org; Wed, 10 Jan 2024 11:40:05 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e5508ecb9so15246855e9.3
 for <qemu-riscv@nongnu.org>; Wed, 10 Jan 2024 08:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704904802; x=1705509602;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fjRyselwmJTU8eOOdownlztREoNuiWTCNW2P76UG0N8=;
 b=CTUQTq5Nybn1iGDukOpqRruDJybDEalt7dcks4h6vZVqZFpTRO458Ct0c+9nARmUTx
 JZGY3VXvOU+92iomA3CigXnxU4I5icMvbsPRklCUFcwxfns7YWpkIr2NbebqQFKxHuER
 Ji8/Z2x6va1J0j9noJXS/hkomtSYlFiaNcuD06ZxSOFQYUX7Gpk/CAAjKubf1nIFInGn
 wEqT6ypdQSD9lVT+8wVylYPewVfxZWZ6hl6T3lPuDLtygIgL+CqUBCfWem0VXhhBiMvS
 e0SKfH7DOk+eBbAtOBzI+aDqaZB9zWkibyT0KeGnVQHKAi76WJTU1nreLhaPS8xVyzeJ
 zATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704904802; x=1705509602;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fjRyselwmJTU8eOOdownlztREoNuiWTCNW2P76UG0N8=;
 b=dNwggafi6DmeKnQRchYebqZWUp3tpkbUhuhJUxxce1vbwQDd4Mtntf+zGb5tKOYMW1
 svM/9jKZfewBjMAg0ebl7CvrhylurbF9fl4iUp0LQB6E/wd/pbYUJr/yQkZYfIzw6pyh
 RtmVzKg+0gxBf9YgQkOdRZYoPFff+U/oqqcBrWh55ceEyFGr2I44XaklfFDTcxRsVLXE
 5WYZbPRZ6LF8O13dCxvPBgbbOXZh5Qtg2818lFK7oSbpbmEadh0fAqgS/DII/fitP4RJ
 MK6inMTexebbC2dJ6tpQyC9qQ5Opp11ab4wHXAwvWQJg5/1Z91CPYWEZE97uPsWHcelM
 agug==
X-Gm-Message-State: AOJu0Yxcf+MegIb8e2ewv7RuN/Z95LEsc1G+GyIXWsk+NNECnDtY6QON
 zYO/5jI6XNKvP+1mAoosQBWNdlFi05Cs9A==
X-Google-Smtp-Source: AGHT+IEZMM7kB3WUkx5dx2iz/SbbyEYpmTA6DvEDufkvbiPSUCJiS1/eKN8GfgYyV89jVfif41JKgA==
X-Received: by 2002:a05:600c:4e86:b0:40e:55b0:64df with SMTP id
 f6-20020a05600c4e8600b0040e55b064dfmr808239wmq.101.1704904802376; 
 Wed, 10 Jan 2024 08:40:02 -0800 (PST)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 fs23-20020a05600c3f9700b0040c11fbe581sm2805970wmb.27.2024.01.10.08.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 08:40:02 -0800 (PST)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH] target/riscv: Check for 'A' extension on all atomic
 instructions
Date: Wed, 10 Jan 2024 16:39:59 +0000
Message-ID: <20240110163959.31291-1-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add requirement that 'A' is enabled for all atomic instructions that
lack the check. This makes the 64-bit versions consistent with the
32-bit versions in the same file.

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
---
 target/riscv/insn_trans/trans_rva.c.inc | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
index 5f194a447b..f0368de3e4 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -163,65 +163,76 @@ static bool trans_amomaxu_w(DisasContext *ctx, arg_amomaxu_w *a)
 static bool trans_lr_d(DisasContext *ctx, arg_lr_d *a)
 {
     REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVA);
     return gen_lr(ctx, a, MO_ALIGN | MO_TEUQ);
 }
 
 static bool trans_sc_d(DisasContext *ctx, arg_sc_d *a)
 {
     REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVA);
     return gen_sc(ctx, a, (MO_ALIGN | MO_TEUQ));
 }
 
 static bool trans_amoswap_d(DisasContext *ctx, arg_amoswap_d *a)
 {
     REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVA);
     return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, (MO_ALIGN | MO_TEUQ));
 }
 
 static bool trans_amoadd_d(DisasContext *ctx, arg_amoadd_d *a)
 {
     REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVA);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl, (MO_ALIGN | MO_TEUQ));
 }
 
 static bool trans_amoxor_d(DisasContext *ctx, arg_amoxor_d *a)
 {
     REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVA);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl, (MO_ALIGN | MO_TEUQ));
 }
 
 static bool trans_amoand_d(DisasContext *ctx, arg_amoand_d *a)
 {
     REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVA);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl, (MO_ALIGN | MO_TEUQ));
 }
 
 static bool trans_amoor_d(DisasContext *ctx, arg_amoor_d *a)
 {
     REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVA);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl, (MO_ALIGN | MO_TEUQ));
 }
 
 static bool trans_amomin_d(DisasContext *ctx, arg_amomin_d *a)
 {
     REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVA);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl, (MO_ALIGN | MO_TEUQ));
 }
 
 static bool trans_amomax_d(DisasContext *ctx, arg_amomax_d *a)
 {
     REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVA);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl, (MO_ALIGN | MO_TEUQ));
 }
 
 static bool trans_amominu_d(DisasContext *ctx, arg_amominu_d *a)
 {
     REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVA);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl, (MO_ALIGN | MO_TEUQ));
 }
 
 static bool trans_amomaxu_d(DisasContext *ctx, arg_amomaxu_d *a)
 {
     REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVA);
     return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, (MO_ALIGN | MO_TEUQ));
 }
-- 
2.43.0


