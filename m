Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4A4C02188
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 11:56:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tcNhd-0006Vk-Ih; Mon, 27 Jan 2025 06:54:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNhb-0006UZ-Kh
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 06:54:51 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNhZ-0006uR-1i
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 06:54:51 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38632b8ae71so3487347f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Jan 2025 03:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737978887; x=1738583687; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0D0mBXBaLsDF4AjforVcC1QF9ut0pEK5UwN8hfEmGYc=;
 b=QlM9Fqn35rwC3hu59u9W0a5gJXM2fG3GboadZGAnC9qdmI7ahjeiAeMvXJpmU1G5eT
 yugwBkgwBUXIEStfxUrbBDizoL66xfhM1A2buDj008zOT9+78imocxebGASOKde+8WzN
 Mcyn//1Kg/7fQZQl9KfAvIAbinTV0hmKBaKS6TieY1HrbDH801P9AwdIfCOAe2D/AXlc
 4vK3i8XG+mkOir2pGes9viqGbR0QJb6K2bXtYnQUYi+WQ4LWEQFQy3a8vd/GOxMMYA5u
 68Z6gygGQyi/03PR0hAWi+17j62272dohX2F0qtgvEEtyB/vDzX3zUCsVKp+Bef0u5DM
 iMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737978887; x=1738583687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0D0mBXBaLsDF4AjforVcC1QF9ut0pEK5UwN8hfEmGYc=;
 b=FvLEzr+f+dddPiTiLy5eTJFKuhuRtupj4/lUN78iOVaUn7D19BFS1qhi1+k+/ZYZE6
 YjrWktZf0fGcKtmn2IYUHaXP6Fj7DyLI5mpE5V/HoLsA5PuFupc2e38JuHPA2c96ey1n
 9vbJMun4yA7TSdKW/JrwcClRjCjB16U88jRbtARBxVYzcSaQiWIQcAZRD0KYkmZ6Jd7g
 zzxKDg3Ed9c5zIPQAY8zp8J4cE4i4w1A1dn68HbNSSay1VyS/w+GiiPstQu2lAS8olwK
 DBPdl6nAr+XcMXR3BsIthGJOA8oqZv2R9jkTMKaD8q687kzjgw3d9QJh0kdJP2aschBv
 fJgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR1+q4uO5ddzw/S5dumngL0laUsUm6Yaf0OhsmuhRuA0OTVgmK+zt/sBV/HS0OJtmAaIXHWhPd+0rB@nongnu.org
X-Gm-Message-State: AOJu0YyVm8WgO2HmwYVWM5+9Ku/4cD8B60xnc1AttsmOeJNtSU8VbzNb
 UOGr/dDWw9JKt9kJB9j3eAacIbUIJZs5W01U+kKlowSKJpiDXupnMCOO9Y8vwIotdfZZaE/Tb5k
 MHGk=
X-Gm-Gg: ASbGncuvLF23y8FCvrZhSXoGF48EG81740Ga6Yj9LgiUCZRxTJlHx3T6Sdi5wrV1kED
 N/n8K3dkUGIyjgKWiGq+0zQ91HyWZHmHN+sbO9sY1g8SQKCZJX/QAgm2hvBHA6mFMngTV7ot7g8
 iG1k3e5fTjK1E7fSl4I6hxU459X39OXwvXQRqqz082rfRmoQBHgc0b1A0Fm3fnOZ32NEYIf5Y6t
 kCiRBUz0gp8r/qGmCA/UXrzTFqG3nvBHdFgGq1QtUUeRBIyV69lZBfWJy+RHf5EPDG+I3euRSnn
 h+Q6+cmncr/YDwY3kEDpKK7fTDJaEc9bxRtwmhZs2D/nFPi7RmM62V8=
X-Google-Smtp-Source: AGHT+IGPQFkUiA7e3qJST4WmTjeM+k06Yc2GvTtVflUzG9dWKVdEwTse05E8oxwLqW6eaJSSfEh1TQ==
X-Received: by 2002:a05:6000:2af:b0:38c:3eab:2e17 with SMTP id
 ffacd0b85a97d-38c3eab2fd7mr3370033f8f.2.1737978887560; 
 Mon, 27 Jan 2025 03:54:47 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a188928sm10794589f8f.45.2025.01.27.03.54.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Jan 2025 03:54:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/10] target/microblaze: Set disassemble_info::endian value
 in disas_set_info
Date: Mon, 27 Jan 2025 12:54:20 +0100
Message-ID: <20250127115426.51355-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127115426.51355-1-philmd@linaro.org>
References: <20250127115426.51355-1-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 target/microblaze/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 13d194cef88..7603d2e8f73 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -224,6 +224,11 @@ static void mb_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
     info->mach = bfd_arch_microblaze;
     info->print_insn = print_insn_microblaze;
+#if TARGET_BIG_ENDIAN
+    info->endian = BFD_ENDIAN_BIG;
+#else
+    info->endian = BFD_ENDIAN_LITTLE;
+#endif
 }
 
 static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
-- 
2.47.1


