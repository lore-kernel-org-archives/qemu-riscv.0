Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C07AC0219E
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 22:20:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thc7O-00023A-Mr; Mon, 10 Feb 2025 17:19:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc7K-0001q5-Mo
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 17:19:02 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc7H-0002tG-Or
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 17:19:02 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38dd011ff8bso2702665f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 14:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225938; x=1739830738; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PUkz5f9MQ2pvcvCLkym9eiE0tZLYKK08nDn81l1HJFM=;
 b=btk1CvvPA3YTyZkjjFkkQz71BxpkDtSyMlarm2zkWBwUP+lD2cBij426TTSlkHaBCD
 /9cfUN4o4zmgrGA+iViW3GE484L8KpVNBoKSSp4OCtd2xtyRaB0gfVhXOv6SCRWQGnKm
 1isH304D77gVIHSH1MOCVd/BicQqrb9l8pKQMyIpRFe8Z7mFraMdPwj7Zu5FIHePLl9v
 vswp6F2vLBvb5xpU4Yfrk1TH7l0P4XFDkALv9veT8C2p3xVggEfg3J05pYjWShP2IfWx
 0Z4HEox1ecxdX5/a3SnhizCwENC18tmwEY8fjKMUQcasbh04M/cRXrwC8fKrNnQjZ74f
 DAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225938; x=1739830738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PUkz5f9MQ2pvcvCLkym9eiE0tZLYKK08nDn81l1HJFM=;
 b=RRkWCZuTLgHyWqEOmXUawBo1C6PvA5ME/7BhVpXMX+b+3FdA5p6gkKVYxevYQ2kX/b
 +mxFv2zwmf0BEYQG256O9Xx0HKNNYgtD9FcHfAQqS5XlFbkUkvvAR2CSBcH0DshhG/Xx
 PGI1RkvZY41nKN3Ul3+N/RCCI4C93kdndg+ndfBgujF1ntBvw88WNkEcsBsJ7GocabLk
 SL1VmP7EY2Diy1IcyCMnTUyEDouogkIgFb5T5OuKM3DfP4hwytURXYaENCYosGT1Mi9n
 zikdUTTaemfjPwyYNrzVj+XOy9nbex48ne1fpFR+0JXiNDcqObUyZTeo0cvKoUgbQbj5
 tT0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZDu/mgUIjDJDIuWOkNvj7UuvTxAf+pPBm71dap7/BGk2LW4TlCaYpRDYf7BpOemQv6D5xH6xLqdX6@nongnu.org
X-Gm-Message-State: AOJu0YzSocaWx23zGvG758StcO8bJv3mhE+g1li9TLvLP3deFTGzxKQk
 EFWW8x2Wc83WJbMgKvu6XHDTRdPh41XLYlzi2DzeziO0Muj9IntGBf7U9m4BU4Y=
X-Gm-Gg: ASbGncsVZiVvKKJT7zrVJXjbbC/sBpblUbNXJlCD1l2F1RTh3SMzZMjIbNbRFm/26Y/
 AeSGp8RA4cSeZvg1BzyHNGtXMxJYrEsyQVsD/Qpgf4op2twuBIty9lQBknYVfFwTbRycX3J1aCm
 KiVXEQ7c4kaR7YCcTNfGDJhp+kyToNJCxlWXKbWJNO8qXV5rnhL5PI0MjD3djbdMMVXBKnIJKCE
 +KY+9nQUo8q3gTa8UeXbcVSCrBms1rWLwe1+mKXKt2hxM0pZf48T5oeQicn7P7gV/vlWe0f0oag
 Kkm6NADf0nSz/AsGEFCc+2juckBy5EYgrKhVyYKG4ypUoUp/HS8dYuExO6dlEORMdQ==
X-Google-Smtp-Source: AGHT+IF0Ru1u5EVFKG2X3tJNsKsqsxVtsoW3vpp+BocPBd7gSwhzEWm6XTm5e4z3JeY+UPoIHgRYIg==
X-Received: by 2002:a05:6000:2c3:b0:38d:dbbc:3b07 with SMTP id
 ffacd0b85a97d-38ddbbc3d28mr6156987f8f.2.1739225938021; 
 Mon, 10 Feb 2025 14:18:58 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc9ef8ac6sm10675362f8f.27.2025.02.10.14.18.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 14:18:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 05/10] target/mips: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 10 Feb 2025 23:18:25 +0100
Message-ID: <20250210221830.69129-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210221830.69129-1-philmd@linaro.org>
References: <20250210221830.69129-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/cpu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 0b267d2e507..e76298699ab 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -428,13 +428,13 @@ static void mips_cpu_reset_hold(Object *obj, ResetType type)
 static void mips_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 {
     if (!(cpu_env(s)->insn_flags & ISA_NANOMIPS32)) {
-#if TARGET_BIG_ENDIAN
-        info->print_insn = print_insn_big_mips;
-#else
-        info->print_insn = print_insn_little_mips;
-#endif
+        info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_BIG
+                                         : BFD_ENDIAN_LITTLE;
+        info->print_insn = TARGET_BIG_ENDIAN ? print_insn_big_mips
+                                             : print_insn_little_mips;
     } else {
         info->print_insn = print_insn_nanomips;
+        info->endian = BFD_ENDIAN_LITTLE;
     }
 }
 
-- 
2.47.1


