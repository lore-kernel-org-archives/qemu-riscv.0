Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4995C02182
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 14:27:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taFB1-0000XE-0n; Tue, 21 Jan 2025 09:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAs-0000VM-Ba
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:24:15 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAp-00033I-CC
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:24:13 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385de59c1a0so3227186f8f.2
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 06:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469448; x=1738074248; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uL4Y+z6DzTKVC74EB8XgyjJw99XhZeyPYSd4sWJmzog=;
 b=kyyNbtL7qPBGpgMfbNJwFYYqeqULyktpceO19h6lQvNTWMgFX7/jLfVke35PIlf54u
 PYeJRNAIwzOxDqFp4kaeaUsG7pWxS+r/E+Jk0bj40R0zmiQK6Hpuj6ti+vuNfcm4WeUg
 zIC3n4/PniBI9/IhV4xUFPdNeA73lad829+63X6lObpPjo4I4/b3qquHzJHrBcQKrgn7
 DHzvHjyAHH70v7UhMWzjDYKWxuJnQdkorRXSYa5EQOieF7/YE5zq6WGhdxkpvpYwJgnS
 2NFF4Gf/VT41UeCVkC28jczrcaoTQHYvck9pGJGlp14IjFWNYF9yQMnv4+FtOhKVuPOA
 FpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469448; x=1738074248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uL4Y+z6DzTKVC74EB8XgyjJw99XhZeyPYSd4sWJmzog=;
 b=c45pazRU3o+8yYfzkq/qzcRIWa+ZHjcYodGp3yE2ucrG6ZWlvmKsJDiLFKXQRvXh9w
 rExC+VnigDcJLGqhF7blIE8Q566n2AMJeMlHbzfV08KTP86zosTbe38+wf1RN7bRC4s3
 2lv071uSGOK0UO3dF563jP0/XgYicGd4wXb3jYMRYa+WQZl+gK+uyAmCgCMP40Iwfxbq
 9TcpFUYqfRLdg/k1o9bG+Z2oVaGA/arBVbuXnT26A864hCGipgIzSZa1BZ8iOGsTaqEE
 f2yz+zv51Ia2fqHEn+gJd6Ol36HgRF2Biak/1wfvmXOQL+/PhF+krXCpZkSOhMeDASwM
 iPOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZo20UD73HNSAf5AFmJ0MZ/Z0hG9AewbORQ3CiiTrziVcI8ZbH9CBaEm12/EqYQld1cvadSfTxgQqo@nongnu.org
X-Gm-Message-State: AOJu0Yw9Nbim8svAnUcAdEvoJx6jl5Z6NZ6EUmIJdS0ce0dY/iL2OM1U
 HLZtChkNxlPF/3QUfwYoNeAv6kqs9OMEiZ4wVgpPi5gerzQ9xF1Ltemm1xayXFo=
X-Gm-Gg: ASbGncs69c2BMe/boG48NJ7rxYffrLBTUPThckB/FfR//xi2uszGdZ9ZOWTesoTAqTx
 iYmYR1Hr8gI2a54F3ilS0Bi1VtjK+ofu1icDxHkWYmLiRo5wt3YYrwjVZhWl/ye7KsRYeFDx4MY
 gdkBPX3X2mtaxmHhB1RqFdKF1XWzgX0hPcyOKOFaplhBUsYjyuM8Va5iRANLhTh+HCPe/Pnw/FG
 xAQx0QwbqVEvKbwb1AeV5g3r4MHwCtMaBYY8klsiIeWytZGTnwTXkaa1YPWYzLF461AbuyUTCa1
 TYzLZDWED7W9u1KIv64b6d9yG26nif8x36whFYUFTDQj
X-Google-Smtp-Source: AGHT+IG2J+fBTwBjziF/CKK3YvS7IkMDlLeRzzR/kuQ3HqnpmWiqykgSetll2TWOSALFBgnl02mvBg==
X-Received: by 2002:a05:6000:1849:b0:38a:8888:c0b6 with SMTP id
 ffacd0b85a97d-38bf57bfcf5mr18393431f8f.51.1737469447276; 
 Tue, 21 Jan 2025 06:24:07 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3214fbdsm13815861f8f.19.2025.01.21.06.24.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:24:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/28] cpus: Restrict cpu_has_work() to system emulation
Date: Tue, 21 Jan 2025 15:23:18 +0100
Message-ID: <20250121142341.17001-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

This method is not used on user emulation, because there
is always work to do there.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 2402706c7d9..e094d54949d 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -748,6 +748,20 @@ int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs);
  */
 bool cpu_virtio_is_big_endian(CPUState *cpu);
 
+/**
+ * cpu_has_work:
+ * @cpu: The vCPU to check.
+ *
+ * Checks whether the CPU has work to do.
+ *
+ * Returns: %true if the CPU has work, %false otherwise.
+ */
+static inline bool cpu_has_work(CPUState *cpu)
+{
+    g_assert(cpu->cc->has_work);
+    return cpu->cc->has_work(cpu);
+}
+
 #endif /* CONFIG_USER_ONLY */
 
 /**
@@ -814,20 +828,6 @@ CPUState *cpu_create(const char *typename);
  */
 const char *parse_cpu_option(const char *cpu_option);
 
-/**
- * cpu_has_work:
- * @cpu: The vCPU to check.
- *
- * Checks whether the CPU has work to do.
- *
- * Returns: %true if the CPU has work, %false otherwise.
- */
-static inline bool cpu_has_work(CPUState *cpu)
-{
-    g_assert(cpu->cc->has_work);
-    return cpu->cc->has_work(cpu);
-}
-
 /**
  * qemu_cpu_is_self:
  * @cpu: The vCPU to check against.
-- 
2.47.1


