Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406C0D729E9
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Nov 2024 15:43:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tH39O-0005tD-Ud; Fri, 29 Nov 2024 10:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tH39K-0005on-5H
 for qemu-riscv@nongnu.org; Fri, 29 Nov 2024 10:43:18 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tH39I-0001SX-Kb
 for qemu-riscv@nongnu.org; Fri, 29 Nov 2024 10:43:17 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa53ebdf3caso384384166b.2
 for <qemu-riscv@nongnu.org>; Fri, 29 Nov 2024 07:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732894995; x=1733499795; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+XE34OJXFWmmTufhaFmOD0y3qIjXRtYlwH42nYye8ck=;
 b=xg9SSppP4ykagiuDHVcKldtJRLGBGum3KbAbQIc4MnqvQodnPGU8K4MQZBEdA/nHnn
 04VT50wc7HL8PCHP8Oj9bkcbz9whOKCHiL5hutYPloPfnhO5QKjIpUXcWGgWGYOG6M7g
 OkMiZUBjslRYOMDVqU1XLsRXR+DQk0Dbnhozy0M5XvnN2pfOAhqsoBbT8wZuoZT/0rKo
 JIsMNc+gOLORPlRZMxVCeFOEV+yW7eFSU84f04w586ugKlvY9fftUcp1eZujL6Fq0Mxs
 0giVQ19XzayDsmSSEcwiCtjgjVrJ5RK6ND7+aqeGu+Noj/yEJLkYpkcZWlsItEZWt/YM
 dQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732894995; x=1733499795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+XE34OJXFWmmTufhaFmOD0y3qIjXRtYlwH42nYye8ck=;
 b=HQoHQp4ErtJbZwem2LRUmadmL3+CzZV56vWWpKea2LIBmpilgMLhx0sidtIwDaVyf+
 6WxFQ7IAhdaIJM9PZpDuz7dezMNgc7Cai0sek1ArbDEn7yVH3oJoJ9PR3BD87cPML1Ug
 84RUsuwpEr82/PcByHMkTLf2vWWbPeYAvY2+L3Ij7IYK1qs8paUW4j1CmQ7QcH0XFnyy
 wXMBatrjYk/3voztfR3yrpmVI+6lsnjRjYI0ZgPd4uoxsXYTCyHnGTPQ6UQ2xTSoygiM
 EhNKMjoWSfzWdn7CcwZVKmZ9SSFr/gLpgvy/8bYc4GRB58owNjIYqAf0s6/Z2NtFTkMa
 TU0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeJz/Z4keYMMG1HX7FlSI4pdQDEsMvni8piPQLuUUap1cP1nuO2mKZy78wkysJO0qBGj/8HN24tC2o@nongnu.org
X-Gm-Message-State: AOJu0YzMdMO8yhLR63KSBrZxylINwuWbOkxpSlPJdbR7a9mlsap97FhD
 SRpzunJ2bSSi3l+t0dM+RnTPVhIQkt/kEsr+9G0opjTH9gQu5xAwSLOctHG+ZvA=
X-Gm-Gg: ASbGnctAECY45EP8GXfU/zbGQWunKfEQqRmt/pE4UH5xp6H5ajzaZeXIMn6RRWWmKZy
 YcAL6n5laO855/LHpVkwWZ1Dc1IevOj8+LEMp1QvNjpbc3pGnO9QZErtqEDqavQADLvW3zONPQR
 hFQ6qI2Otfdspjjs4Cw5XPd7pPWvHSKMmSEGbt7hbgBoVBnYHHqmI+o+aqcw9Uybn5pbHcNG/5n
 Da9Ax96mx5Rt4C/KxZczdokV+83WIc7TN2v1nrt3AltqQqejdspJV16Qzwu
X-Google-Smtp-Source: AGHT+IHopqMFEYjjS8mm0D3Vx22WvBIpFjKu9mSnyhiCB3Y2TBhLRiCN4mv7hBjqVnVFrzKwN3baqQ==
X-Received: by 2002:a17:907:7742:b0:aa5:46d3:4d88 with SMTP id
 a640c23a62f3a-aa580f1b949mr1163076066b.15.1732894995196; 
 Fri, 29 Nov 2024 07:43:15 -0800 (PST)
Received: from m1x-phil.lan ([176.176.147.124])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996df797sm188427366b.68.2024.11.29.07.43.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 Nov 2024 07:43:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 1/3] MAINTAINERS: Cover RISC-V HTIF interface
Date: Fri, 29 Nov 2024 16:43:02 +0100
Message-ID: <20241129154304.34946-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241129154304.34946-1-philmd@linaro.org>
References: <20241129154304.34946-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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

The HTIF interface is RISC-V specific, add
it within the MAINTAINERS section covering
hw/riscv/.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
IMHO 'RISC-V TCG CPUs' should cover target/riscv/ which are
the accelerator-facing implementations, and each machine or
device in hw/riscv/ should have its own section. Not going
to clean that in this patch.
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b1c4abed65..046e05dd28d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -324,8 +324,10 @@ S: Supported
 F: configs/targets/riscv*
 F: docs/system/target-riscv.rst
 F: target/riscv/
+F: hw/char/riscv_htif.c
 F: hw/riscv/
 F: hw/intc/riscv*
+F: include/hw/char/riscv_htif.h
 F: include/hw/riscv/
 F: linux-user/host/riscv32/
 F: linux-user/host/riscv64/
-- 
2.45.2


