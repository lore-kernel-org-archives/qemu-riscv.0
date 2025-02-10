Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F155C02198
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 21:31:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thbLl-0003lU-KR; Mon, 10 Feb 2025 16:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbLj-0003jn-Mx
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 16:29:51 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbLh-0002BN-Ny
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 16:29:51 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38dd93a4e8eso1656877f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 13:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739222988; x=1739827788; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TudiBAwlV8vL/G6pFMlMl4VlW+7MiYN30xZzToiA+nQ=;
 b=EFjD8NxEaGNJvciygwu9UEZnn2oEHK/pFGr8aOrdlXpMIbh9AZ9PAck2WeIeSQe7QG
 SJnUlnGdUhpxCbVMHqYhzMWtlLDSgilIN5Hx75iJRVGRaNxcxwX7xKwA5IBP+4bUi7FI
 3wPq0YmG3RsOs0fEKs2oF/GXlribAEDJngj56h7JVvVTiOLr9ydr1SL5wTwJZSUnw/Es
 bqPNKuAZ0dJvfzHCOldSZRo5bmqnzKMISNC//SjINw4xgzgqGnkI4lFYQ1u2cvMKGY3x
 IkpxGFZFWQDK5wFchIIzQRDTrO+7b1eQQFZ8OpgpFbUUq3F+YDLvtfXdikRDpd3DO9xV
 ZlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739222988; x=1739827788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TudiBAwlV8vL/G6pFMlMl4VlW+7MiYN30xZzToiA+nQ=;
 b=N1AV4psS27eNZZPHui55dhq82OGHMZaFLrLrgHahiHX261lGZySSSdCl+m/D517au/
 VaQrOpd0zivBKrnKZqhPjL2yZ/oR4MADGXvmU+4VdLGMdN5j3aNylIw27aq/dP2XvD+o
 CuOW1nzr/Fq3SOkfpVC59ec7hvawZh/iIOyARJJbcu3sCrO6GdKis6WtdM7gS2G6w4jn
 nxNDM7y5AQf7t7OiSImQR31Xa3fC5p9DHYOgJXmRfnutBff4uGg5d3Th8WWn4ZEe46ai
 6VH7Fmb+8HCm26IE6+7zv7l/2bhAPzXgKNC/EX6DRyMFCGkAnWeR6lo8EgGfQliazEBj
 JaXw==
X-Gm-Message-State: AOJu0YxzKV31bQKAH3etZwy4cLKFLQTFuyLaSplPCrA0Zgo/2vs7o/HY
 8yJUGmlM46U1yH5rby2MIG9t3uhSnd4uCafBo5tfSEP8OUpUllFe8na/m3z/CoY=
X-Gm-Gg: ASbGnctXrif1W2rx3lN1Zp+nG3NwdzK76m/MsSG6OCkwQRKFJlXgQisEvhkjcVp1KRv
 U5+vd8KVsSWiebLkDpqxSt3+cubNMh5DZ70v/LdAbWFffnQOWDl+jy0UkMy9bZ3umJWZxo+8X6w
 vbtVAi9h4UsBYje1Akc3sMm7oRT56zKHGIV+Qsi6AKEkCRUGHbX4PIjL8bI2eVyrxJOtcYXghhW
 kVEmeiNGVaU+GcbZpSjWwbjZCPe6Q7UkiCowXtxlM5o9xWio5Zhvd3B1XK48MWIV3WnJoSB2PtE
 ALD4uJ9nb7qrUW/xaPMJgkMksLGXRLwHvDd4FwcrzyLZKKY+Q9Qe5IsSaHxuEGHN1g==
X-Google-Smtp-Source: AGHT+IGmaDBBExT7J5zsHTCH2rhWX1/1u/wLH4tCRmX+nD6OUANrS0KoZ2gRSKj4eG4pxRRAGniucA==
X-Received: by 2002:a5d:5887:0:b0:38d:d92e:5f7a with SMTP id
 ffacd0b85a97d-38dd92e627dmr7006882f8f.28.1739222988204; 
 Mon, 10 Feb 2025 13:29:48 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd0d3120fsm8787916f8f.70.2025.02.10.13.29.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 13:29:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 03/10] target/arm: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 10 Feb 2025 22:29:23 +0100
Message-ID: <20250210212931.62401-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210212931.62401-1-philmd@linaro.org>
References: <20250210212931.62401-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 94f1c55622b..68b3a9d3ab0 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1188,7 +1188,7 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
     ARMCPU *ac = ARM_CPU(cpu);
     CPUARMState *env = &ac->env;
-    bool sctlr_b;
+    bool sctlr_b = arm_sctlr_b(env);
 
     if (is_a64(env)) {
         info->cap_arch = CS_ARCH_ARM64;
@@ -1215,13 +1215,9 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
         info->cap_mode = cap_mode;
     }
 
-    sctlr_b = arm_sctlr_b(env);
+    info->endian = BFD_ENDIAN_LITTLE;
     if (bswap_code(sctlr_b)) {
-#if TARGET_BIG_ENDIAN
-        info->endian = BFD_ENDIAN_LITTLE;
-#else
-        info->endian = BFD_ENDIAN_BIG;
-#endif
+        info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
     }
     info->flags &= ~INSN_ARM_BE32;
 #ifndef CONFIG_USER_ONLY
-- 
2.47.1


