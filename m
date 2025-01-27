Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BDEC02188
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 11:56:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tcNhg-0006ZJ-SB; Mon, 27 Jan 2025 06:54:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNhf-0006XG-4m
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 06:54:55 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNhd-0006wR-Ll
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 06:54:54 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3863703258fso3347659f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 27 Jan 2025 03:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737978892; x=1738583692; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HOKaO4+JhkS19YUfs3qPtnMOdIHyEK0YrYWedLcqil4=;
 b=MwuihrdVUTVYfD2aL+chwflx0z4w5Fls6E9YR90Jl5N+mbIwFobMWfy50R2dG1PnbW
 4vuflc1QlLY1vZm6yhms3cYX0ElkUJ6RhsRZcW5bWavBPG7Uu/N+/W8UjJYz18I5+z3/
 82cL7ZViRV8fvxA2fnvdZD9UnJrZlQCKnzdIT69fUbpPSjIapTQ39UN6agp8V72bzRYp
 +wrg4NcuioTJeto8tiNh39y+fyeHL5awuoncrKiQ0NlT+/ggzK73/VVbLGZ+k3wAEiNz
 8Q8kBOd+z5mkQn/iSwg5M+xod5h9zj7WGsnb6VFCjB9xJj6ao1HuYuru529oLlVbTuBp
 rp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737978892; x=1738583692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HOKaO4+JhkS19YUfs3qPtnMOdIHyEK0YrYWedLcqil4=;
 b=Bzxw6EHwcJmQIWtA9fzb9hv7EuKi/Gb3xJYsYJe4nrDvxi3DrbNWINQcfjv6p10cjv
 kgmonB+lr5Zr/bNTecS/a1vMCzq+Axycc2XN6Qb0QIMF2QI+5PUmUW+buLqbLIjwaSSf
 zUCH29NldMVit/uWdTE/cccI7l7ooILCDYt+kpMGi9E0zxORm3/VuKXo/AXCo+3Ovnmh
 nLaHL2hDXfrTPDWgPEzWLrZGXEXTwwkr2xGDpjLFuw113OuqjjtLcBOPVlKpukZN8PR9
 H1GxgNkWT67xZD20mQieFZ7Nu7wSLLLoRSQSFaUEE/7D6U603TTI799DdUmUHkEqhi5b
 1w4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR6bx61cOZEAne5xGsvZyoSOozrXIgA1QUV+lyWIj/97x+xRW/jS8PyYlX0aKgRd9l78eMiQmj/UeG@nongnu.org
X-Gm-Message-State: AOJu0Yz22dROKhAWOnJIH0sxP5VIPHD1FnQLDjAM8KXd3qTS90xc3mW8
 IKEj5PL8fagHK1g1oJ1jfuC2GZ5XOCEKFKgCV5zWH8hy/zdFu7qdAkBmJf5HFLo=
X-Gm-Gg: ASbGnctLdAbok3hraBSjLg6U9L4IZ6QS/6MNWHfE2TprkP1gEsLcgIpdwteoHTiSzPd
 +t7OVvPJj93dNpvi//Ip7Wchz71kOBIUYu8aeEBNtf1nWel7rsZnQ8tSEPV9gbuIgTXS+0srhH3
 F/KYjsRnF+p1XlcolxYhoYMe0LQ1FO9O4klJOsl6h3KXaVACUXZ2qUaA8c7qM5Ii4ZkhUGZkZTM
 /JrO2UCgunmH2iFLO0SJLXUXsAPFfHDa+yF03tADGrwxwFbeBk817JI7A8/8CGO+7vGrza7+SMc
 SGJF+RFjtj3kEIyY/Uc053fBCDtJvjZGWYyXoTOD1+81iDIXHPEhgYg=
X-Google-Smtp-Source: AGHT+IFiTf3Yez4AfIDsimkGKAnF9uSNi9P+S1XvekK4mopdZR/kO2FDhmtpzg8yfuYCkxoyZnGEcg==
X-Received: by 2002:a05:6000:1787:b0:385:f892:c8be with SMTP id
 ffacd0b85a97d-38c2b7cdabfmr11603137f8f.23.1737978892299; 
 Mon, 27 Jan 2025 03:54:52 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17d865sm11029825f8f.38.2025.01.27.03.54.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Jan 2025 03:54:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/10] target/mips: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 27 Jan 2025 12:54:21 +0100
Message-ID: <20250127115426.51355-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127115426.51355-1-philmd@linaro.org>
References: <20250127115426.51355-1-philmd@linaro.org>
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

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


