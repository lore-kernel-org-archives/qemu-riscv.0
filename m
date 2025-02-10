Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BE6C0219E
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 21:31:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thbM8-0004Km-Ra; Mon, 10 Feb 2025 16:30:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbM6-0004Ga-Fk
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 16:30:14 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbM3-0002Rz-SW
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 16:30:14 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38ddfee3ba9so1140143f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 13:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739223010; x=1739827810; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cigMHRTzJ2sIEBBFkwClq9YrVsopCKNGdfUt+g5JjJY=;
 b=gQusJsGigF140dOEv869CDYT9nfDLic+3WLr/zWWxdUdrzAp/oWkA8hQ3CGaLhz4gF
 wkIt4y5S+HlDOu03BXxpaY0bkbyTpuZgawFjVvBYKmrECwy1vgbe04P4KU/hLw6lwuRK
 aBYWN8OfcgEWy/Hn2LWakm0VYx4U4S4hQcLtT9b0td46xXQRGYccFBjh9wZ09jO4oqV/
 ur9AgqCSvRI50lAi2HujBkCIrGQtwSdlg7UjCwbiJ9yznR6xGY8GaCAcgqzwjJSPC0bZ
 N0w4QA1WA/28mV1TLpPmXU2RX2o0KT7FcNbkgQ03VWKSEHe7vxfi7dkmsNX5XwsbGgyf
 glGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739223010; x=1739827810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cigMHRTzJ2sIEBBFkwClq9YrVsopCKNGdfUt+g5JjJY=;
 b=txPHXavJv7JomQEX/27mtH42G39uFw6X0CeqD1EgIeNUUGElGaVG8hgi06WuaFhD0u
 2/I6NYvxxeUZ/g68VZSxfOMeFwqlYiuDMKxiSGh72ingysBWmlE6Wz3r6GnQYMbhmYDn
 gCnfUyiHn28Shqd306io92tMfYhrOa6R85NiNnwSK9qELZ2aM58S2ARFumA5N6qfLm/s
 UI1bP4rKS0t/4oGspJzPw1EEtvnaZlxT2sUGRdc+iUfziaJRg5Qwn9PIUkYCDeE2pEFz
 MzjGoGHe7/O2zjj79BE0QHKVjp79A/oWm5Kc+0J0+hC5hGcXRexOww18NYndi2OBCEfi
 /IzA==
X-Gm-Message-State: AOJu0YxQHpTfXwY+5F903QpPSAf1217Do/Ajhs8d4dXWVb+E6/FBBTqy
 +smT7e8l0U7OIKhzqp1pzV//NqaHY1w7Bjio1Eop2LBf3aOxU2BAur/ajIVZnLc=
X-Gm-Gg: ASbGncssvGvjnU+lXd1fZoUdFWjbUwHqCymGRg3/bViLS/HW6pfKI/TboSi4If3J+Q2
 EvoeaWFkmGel3FPGKcoogBM5aJqFJ9bjqJL7FSyoCn2zJE1oxw6U0FcmBOyRaI3RjfGDz2wHUPT
 tVkn/3U1sOyibyiow+tndMw/Rljb99NOQ8BRcimwPBU8BVrFJ7g+gTeEBt0mYT6QJ35KI2EslTS
 BzU1FFJxf2wtCdi2wFU8IEw5uT5lbGKwCHjOc47Zpq8W8ZNVsK821YFYS8IIn+j6iyVFvVeZFXZ
 93LiBiQP4rAt2GNnebCxnGHBfUgOmLW1dx7MZ19m6nTQp2Qye+kEwCLPhTlU0fTiOQ==
X-Google-Smtp-Source: AGHT+IF77csdHIKpywxhM0vLTN5FONXb+r8Ze95eQdhiFDTiauuc7utYlvEYaSgoDbnJH56IYQpzmg==
X-Received: by 2002:a5d:64c2:0:b0:38d:df2d:7ac8 with SMTP id
 ffacd0b85a97d-38ddf2d7d5dmr5239443f8f.25.1739223010306; 
 Mon, 10 Feb 2025 13:30:10 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc33939f3sm12377912f8f.17.2025.02.10.13.30.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 13:30:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 07/10] target/riscv: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 10 Feb 2025 22:29:27 +0100
Message-ID: <20250210212931.62401-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210212931.62401-1-philmd@linaro.org>
References: <20250210212931.62401-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 target/riscv/cpu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3d4bd157d2c..b39a701d751 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1156,6 +1156,15 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
     CPURISCVState *env = &cpu->env;
     info->target_info = &cpu->cfg;
 
+    /*
+     * A couple of bits in MSTATUS set the endianness:
+     *  - MSTATUS_UBE (User-mode),
+     *  - MSTATUS_SBE (Supervisor-mode),
+     *  - MSTATUS_MBE (Machine-mode)
+     * but we don't implement that yet.
+     */
+    info->endian = BFD_ENDIAN_LITTLE;
+
     switch (env->xl) {
     case MXL_RV32:
         info->print_insn = print_insn_riscv32;
-- 
2.47.1


