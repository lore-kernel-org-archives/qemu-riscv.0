Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E574DD690F3
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 10:38:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tGbux-0008Vn-LD; Thu, 28 Nov 2024 05:38:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tGbuv-0008VR-U7
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 05:38:37 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tGbuu-000662-8z
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 05:38:37 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43494a20379so5923255e9.0
 for <qemu-riscv@nongnu.org>; Thu, 28 Nov 2024 02:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732790313; x=1733395113; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TP0Ip4Rzdbzg4KxmAGds5CRnBSGPx3UMLoPkVjTmsAI=;
 b=mVjTVCco0qoj+Rters8+MNObTJTN5QUR5QTMhWzzxytWe523OI5y25yciNtDwMEtMb
 YnCDf6VzUSdviSiatlsDElHeJbHkOtBcjt52hz6tCZWmaeL8FUYW3y2NngMPTWJXrA9z
 bNtCUirUbF4Cr04ra6qw33BzJP9B656QLdWfTLloEy//aBMjIKuZgjiwEeTbifl0v89e
 A+oGcV/hQE7kPAfpQhEwROpDJvHA15rB0T5U8c39ZBHlUVbPAyXZ9iVyVujIN/ZsHmez
 3NxnLYxlXA3sEOkbJCEgTxG7IGU/a/6mLybhHPKTn7IpLgQv9iN/CdXCJK8pK7dBLAKL
 SfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732790313; x=1733395113;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TP0Ip4Rzdbzg4KxmAGds5CRnBSGPx3UMLoPkVjTmsAI=;
 b=e7W/8IOBHoQo7q4bhl/Jac7ZbNFnQ9r1txMNw/XZxQuprCdXmnV/JJpBAacXjlsYN/
 XI7lCtRf70JFP5AvTwZeXQAHQ+B6g72/C6a9+KcK0lu5kgL1SGTTUkk8twpCYCCP0sDx
 bPjwHkPZv4VYydodylvrImhqvCayP6LR9kms4+7oQR95RBnQTKuazV1dVoTy7oJC11aa
 QdCpdV/T4fWgXS1uz8RPkR/WWp1M8GTc5kX53mb8R3Q3vpF9+pHoLzGuHcDyeOs4KuiH
 yqHVoFbkiG8Hsaw/ALmxe4Z4ysQBiNTBm6B1c2Am6xdb2vEu70NaZaQszYDecBfjDjcO
 Gkvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbleJucBr7nYLLIvk2AJXETw9qnuaYjl1pLCZ1zZoz79lFvmWkkXlwQBYoibVm+0+7Lsfbn4/GUUgv@nongnu.org
X-Gm-Message-State: AOJu0Yz4DmipAS9hdPQFHHnMNc2v13PV5I1EvLxBrVE9eDr4+YGhtj/D
 6a5oXxRpo/FN/kE+0GrtCotddYd1Ptj9C6sFmvXTJxlM72HIzfkjImw3nhaQ5ZA=
X-Gm-Gg: ASbGnctEekWi5i9212Dwjq4UwE9uQXhusU7NJ8N5nlm8hUflwmgT+0yN1q7ZCuK8EaV
 XIe/R679aXIPZbD6NLGtpfsQ6+AcpCJhapvKN4tCbXmrgLfT6CkHq7Snlxp0oG/z0m7o0RXvg5w
 26IjgBQw6O6fRnP5msTMWNow8IfBSjUr1veLvzgQub3QRMdwyqor1MjXfq4iLEx3V1Ppw9wAM2x
 PzE/gSnnKm99VJSp6fR4rk0xFbp7G+xJowxdQSn2wGZCMoiEdOXXdoz
X-Google-Smtp-Source: AGHT+IGA3jW6Edqm5aXqMBYN81KhO8fM4qovl5967vXF+a0VgzWNLA09gieyGZf4xCYdyCfEzHPx3A==
X-Received: by 2002:a05:600c:458d:b0:433:c463:62dd with SMTP id
 5b1f17b1804b1-434a9e0e5femr57951435e9.27.1732790313384; 
 Thu, 28 Nov 2024 02:38:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434b0f7150esm17596885e9.42.2024.11.28.02.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 02:38:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Subject: [PATCH for-9.2] target/riscv: Avoid bad shift in
 riscv_cpu_do_interrupt()
Date: Thu, 28 Nov 2024 10:38:31 +0000
Message-Id: <20241128103831.3452572-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

In riscv_cpu_do_interrupt() we use the 'cause' value we got out of
cs->exception as a shift value.  However this value can be larger
than 31, which means that "1 << cause" is undefined behaviour,
because we do the shift on an 'int' type.

This causes the undefined behaviour sanitizer to complain
on one of the check-tcg tests:

$ UBSAN_OPTIONS=print_stacktrace=1:abort_on_error=1:halt_on_error=1 ./build/clang/qemu-system-riscv64 -M virt -semihosting -display none -device loader,file=build/clang/tests/tcg/riscv64-softmmu/issue1060
../../target/riscv/cpu_helper.c:1805:38: runtime error: shift exponent 63 is too large for 32-bit type 'int'
    #0 0x55f2dc026703 in riscv_cpu_do_interrupt /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/clang/../../target/riscv/cpu_helper.c:1805:38
    #1 0x55f2dc3d170e in cpu_handle_exception /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/clang/../../accel/tcg/cpu-exec.c:752:9

In this case cause is RISCV_EXCP_SEMIHOST, which is 0x3f.

Use 1ULL instead to ensure that the shift is in range.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/riscv/cpu_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 0a3ead69eab..45806f5ab0f 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1802,10 +1802,10 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     bool async = !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
     target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
     uint64_t deleg = async ? env->mideleg : env->medeleg;
-    bool s_injected = env->mvip & (1 << cause) & env->mvien &&
-        !(env->mip & (1 << cause));
-    bool vs_injected = env->hvip & (1 << cause) & env->hvien &&
-        !(env->mip & (1 << cause));
+    bool s_injected = env->mvip & (1ULL << cause) & env->mvien &&
+        !(env->mip & (1ULL << cause));
+    bool vs_injected = env->hvip & (1ULL << cause) & env->hvien &&
+        !(env->mip & (1ULL << cause));
     target_ulong tval = 0;
     target_ulong tinst = 0;
     target_ulong htval = 0;
-- 
2.34.1


