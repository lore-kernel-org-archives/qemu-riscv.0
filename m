Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B201C02198
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 21:31:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thbMj-00053G-Dd; Mon, 10 Feb 2025 16:30:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbMG-0004R1-UK
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 16:30:40 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbMA-0002TT-DV
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 16:30:24 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so11133245e9.0
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 13:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739223016; x=1739827816; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W3TRvMCsTOKayhPJBtpLWMZ5XRU7il83OMKb5CXGBDk=;
 b=P1sgswSz2ikAXuhcR2LUP38G+wLbQC9CkkWKTbI7/0SyRE/bFYPN6MccULfnc0XME8
 uD5s993mLhaoFhKSowp+J0PBStq01snVkN+XMLRnguAlWnX63V6m0wLxnJ92j3tx/10k
 FmvgCmsKzcml524EB7AC5l6g1AUHHoPYG+tOPhjzep/iBcuI46YkGJCNdjTIxP3ePExe
 1AIiaES+Yz39ydlG4OEkPUKyrYsukyWQMuAkzLPblOLX0oS7ZY8tGjvisvHctN0RDnY5
 CmYc4GVYanW/49TU+VYbZZG1f+KZNay0pPlpO0sMPKz30oly9vqhuoAPRKwMJFwmcVfb
 JlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739223016; x=1739827816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W3TRvMCsTOKayhPJBtpLWMZ5XRU7il83OMKb5CXGBDk=;
 b=Ju0hmahoEDGjvvbGDWGlrZ42NYp+JT6O4hlSUWf2AtnrYqMw/Y0uQYyvHa9Os54hVs
 xQP2i2gucQrd/L/wk2eoRj/WJwW5awkvz5LFh+WBx0QWlhv5MompKx4f9QrLtf3GHibW
 CfXzy9eihx5quASINJLcBbZN7Bl4tDLakiLPwRo0+wE9bGV1hpHOVTtLvtgOE10y1ldf
 z84HKeDP4gQVSCjIkeylIB0gdKuresRmxk72sEBiAM9DftX15ngjd6DEenlIrDxrr6s+
 TQCEUPuyEezb+PXctEVm1Hsj9C9lG5tpUcM8y3jze4gA4kuYVutAg8WFTUg6ordXPA21
 WxWg==
X-Gm-Message-State: AOJu0Yzutq2LeM6wIdKKaL7YJ+EiCkgkZoGvfzkr5WGH6DyrbaSq3MRF
 881KpF5hTsGI24iLGoXx+fCm1UAnbGc3LLB01edekxcvJIO190ABMm+KT7nkPuM=
X-Gm-Gg: ASbGncuqqX1JB55FrfGFGBNAs/TgtRLzEf89clD9+Xc5p3PkyZQ2g0O918XtcCHw/fp
 rc484MNpIqQznQe3CIfMV3vSfTMT3MqBaB2TqzRnbeJZeOsVdb3yGkcUn0xowFWpkEC7LYczyrQ
 t0Pgd7vj/HosIpQCHdBfiixJD3lhrOrXWOjpmEtQssRmz62vIYg9aGZ0Bh35kPQdmwzsboUmIxH
 RaDtV7LkODkDcM8En0+20XNDJZbJ/i3/XP7DjKT+WGgvfyzQcRMM4TLXbvox1I3mUfFhmp44mCD
 BksVWrvGI9zP0bbgdNXaG5XKT5ENZHE/pknXxcjpiki8aUX53fZA02CKlZcgdcEFuQ==
X-Google-Smtp-Source: AGHT+IGKmr59/tETcQOVTqSTYfTjeM0bqbgNNsd0GvkQv9Zm/O9W9rQwPIVCSLj+At+cQl2W9x0KRg==
X-Received: by 2002:a05:6000:1f83:b0:38d:de92:adab with SMTP id
 ffacd0b85a97d-38dde92ae55mr5311247f8f.29.1739223015904; 
 Mon, 10 Feb 2025 13:30:15 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb22f737sm10243442f8f.24.2025.02.10.13.30.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 13:30:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 08/10] target/sh4: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 10 Feb 2025 22:29:28 +0100
Message-ID: <20250210212931.62401-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210212931.62401-1-philmd@linaro.org>
References: <20250210212931.62401-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
 target/sh4/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index e3c2aea1a64..9d3e6cb2fd7 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -134,6 +134,11 @@ static void superh_cpu_reset_hold(Object *obj, ResetType type)
 
 static void superh_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
+#if TARGET_BIG_ENDIAN
+    info->endian = BFD_ENDIAN_BIG;
+#else
+    info->endian = BFD_ENDIAN_LITTLE;
+#endif
     info->mach = bfd_mach_sh4;
     info->print_insn = print_insn_sh;
 }
-- 
2.47.1


