Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978AAC02198
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 21:31:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thbLv-0003ys-3v; Mon, 10 Feb 2025 16:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbLt-0003vx-HL
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 16:30:01 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbLr-0002DM-Tn
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 16:30:01 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so48499205e9.1
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 13:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739222998; x=1739827798; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+JtBiYKMI/Sj3oIOkec3F7FVIT/FlOHh9WNs4yErZgw=;
 b=Ddd0eL4vR2q1s62vhOZtVtmwLGOyQ7MO7Ajn56hWS+XC+3CjlsK9JEZeCPpuxO0h2c
 H08NMxioC1ovSmVlbMw2Ad7Hyy8anAEDzgXGD4jxS4Wrz4pJ9xZgCNeLtzNAMJniemXu
 UGN2SnVPGAA2zakOmGFIZ4FwQMx8p4PeXOk/06MXQ0akIRM2ayxkZ02CJzKmfA8AaWgY
 0q1UxL53hoesNbEA6um3YSypyBIiVph/RmpemNmWOxrVVQAq2Okcd0a4AhS13lj1n27q
 DZ1a532DskpAkcZw4ParpHdsp8w7viaCCxzj9fabjpGAy5LhcWv3FbzsZRQEI61eW++b
 k7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739222998; x=1739827798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+JtBiYKMI/Sj3oIOkec3F7FVIT/FlOHh9WNs4yErZgw=;
 b=SE7QJJdwjG89O/eNPbI453/YkDR0M5biRz6MNe0+j0+sFcp53OYGx/GA3SY1ojwh86
 yeWBjUSrPRWrBXRnSQ7ntR2A6PfBZt+eqy2TnwuCrL8QSACNtQdidC3JzLb6eVfwVkzM
 BpAZq19FgUq+ha118n4rBD0sHHeoVPW1yRp36LJcSUQsEFAjyKSSORLj+TpcitiHKshk
 m8s6yPjSv9ye9yzQ/j/W+ynODhUTG3g2hKKEeEWlSlu6D7F9F5BoPF6i/Kgd+J1c/ETl
 UckCp3cAVYZxHYBcRxXYGx5R7kGqkOZCWZUYzPwjP3y/Z16Sd/EYutszKEai+tTzQ8FT
 /0Og==
X-Gm-Message-State: AOJu0Ywwvl+YHRqEvndRlWYI1ezCPwlan5QQzGxfdkk34BmHmHx+6Pl8
 BQ/LeXZhkCcu9zhshw3YhSfK2xPdIIluc2CfYQ/jCaGtZOQSjDbacigmW2rBvvhKfpP/WbD5eDf
 HNV8=
X-Gm-Gg: ASbGnctM6TxSoFpAJw+c/Cqtj/fb/85L/iTupYTfFWHBDq+2V8T+QDkF1S9dibxFv5H
 GJ4LME3SoLU3R8kfqBcXEeYy6mxN3QMtxbHu6u8Fc5coH6PZy4ZNchI0KmqOyPKzBASD6Ma/LA0
 bbPFKE1uZExVMlZ/OLNknw8RapXsbSf65YwBYnAHcmOvCOzZvbhxLKflroCGVCb2pii1sz+ByRW
 4JBHh+P80+jqVdTW6I6lfnROBTkzt1zg6pVik6VOT2tT1RD4LIQmFHJW6UX6viJsMAj2h7rU8RH
 3y1zsQRDpquaeUfHxCbfExUxsi4QxnURYjkoydozncnF5FDAsPzZa0MA5GUbjMVO1A==
X-Google-Smtp-Source: AGHT+IGr8OUYB9880DlObnMvvs+8i+cskVdQN+xrT7lWCClHQUhHpiYsf8lCpjnOKQW6o7RU+fsAiQ==
X-Received: by 2002:a05:600c:1e02:b0:434:fa73:a907 with SMTP id
 5b1f17b1804b1-43924992054mr128935005e9.13.1739222998589; 
 Mon, 10 Feb 2025 13:29:58 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dccc1f531sm9947450f8f.87.2025.02.10.13.29.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 13:29:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 05/10] target/mips: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 10 Feb 2025 22:29:25 +0100
Message-ID: <20250210212931.62401-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210212931.62401-1-philmd@linaro.org>
References: <20250210212931.62401-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 target/mips/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 0b267d2e507..f6d247b530f 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -429,12 +429,15 @@ static void mips_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 {
     if (!(cpu_env(s)->insn_flags & ISA_NANOMIPS32)) {
 #if TARGET_BIG_ENDIAN
+        info->endian = BFD_ENDIAN_BIG;
         info->print_insn = print_insn_big_mips;
 #else
+        info->endian = BFD_ENDIAN_LITTLE;
         info->print_insn = print_insn_little_mips;
 #endif
     } else {
         info->print_insn = print_insn_nanomips;
+        info->endian = BFD_ENDIAN_LITTLE;
     }
 }
 
-- 
2.47.1


