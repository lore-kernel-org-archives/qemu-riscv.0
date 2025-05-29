Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81ABBC5AD49
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 May 2025 20:24:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uKjmo-000471-Vy; Thu, 29 May 2025 16:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uKjmj-00045K-Nd
 for qemu-riscv@nongnu.org; Thu, 29 May 2025 16:23:29 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uKjmf-00065q-Bc
 for qemu-riscv@nongnu.org; Thu, 29 May 2025 16:23:27 -0400
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-87df3dffe63so346630241.3
 for <qemu-riscv@nongnu.org>; Thu, 29 May 2025 13:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1748550202; x=1749155002; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gfHuZ0E99LVLJfXThl3w1NwekVMKfh+8f/1cLy/B10I=;
 b=QflPa/uPMpovIdHoSNRs9MPpFnOCqXChw7hRqXlE0T0YiFL9Khj1RomtYrHj4mZC7L
 u8xbIuXE57piiAyQYKtHpm04QKwI5ht4Rk0kQWDU18kcSW2NG3URXjxsFhDzN0f5AP/3
 grpkpMc1gcFcVU47ttxmr/ay+DZfcvBF49dGosLIKqVRpgJGtNb7/1W2k90O6dVRMUnV
 RzEMv2X341TQkvnJiHS7M7ZPYOomrkkKQ8Jnc70Eo5OnUka8/AXlS36edTHoI+yOOPjy
 Bn+kXFfFXIi+YSGsoTOh24McmHYRuMGDtBmKYmwelEKnT6liE85FGIrSrFn07GVU7vw9
 hLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748550202; x=1749155002;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gfHuZ0E99LVLJfXThl3w1NwekVMKfh+8f/1cLy/B10I=;
 b=MU4WqVk+zxT+j/O4E3Uaksa9ThkIsK816qtOca81te3GuzG3eyvvJFr5DXYTICtsj8
 Q1LtFuPljomiHbSyg+STBH9dapI9YoBQYsuWNiT2vJf7BTrTgp3z1Y64bC/rNICTsr+V
 0xIYlrh5DJmwTvA1ix1/zJeVkxLlb1tgi0N7e2asD1CEHzs8f4/L9gF7lJBv9HdKiwP8
 cdgbGOCs6lrM45j3bk/rsyUX3HOndtGsHh8c2kaHpgZRL9ppp1Tgv4j8TOhHOBiAFXAy
 wutE/A7BWEjSipcYjtnqckYTisllu+zaHr60yUIXgWxtL+CgrkgGfH9Y42oEz/xZtQEJ
 nqjw==
X-Gm-Message-State: AOJu0YyHm+s4S74BWG9lS4R6LANFVVS60KHEOA5doxb93P/GEZXFJsWd
 qhZerm0mTTx3FlmXhn07AmdRwgPwkfORJAUcyxnfRxiPiV2gE8jCFyKMjf961YsImjI=
X-Gm-Gg: ASbGncuUKhMvd1FirQlyhtIBUJPmfac8vhc33cJp+HhClAef/38KYeZ6MnhiK5APEz5
 paaEXFgyCkSud6IGH7lTtoxYAvhC9+QbGXTZosmSZHRXdi1LMAeVx+nlx+jI4OMMI/+cLCHT4rB
 JLkDTYyCGdSgSaPD7nzVQ6jYqQfSuS8q1hR+Xm18oI3kNjNGJdFQ0ZS5Qzk8xEP+ZfvMoN619Ie
 Dw7ZSi3Nkpzf98oKSjt/WTzfTblifbGEBq2kI31O2TH6IPmNz+9Zbf2oFDFZc6RIV8NsC+yG2ek
 tG082FhSjbWeICbVhwlE10TsHiF0cnWwalNYBDdL4a7hsNgPtZQ/gb/IDVIrrt0w9QDpflQTCx+
 BQ0Cnn/cU0zxVvw==
X-Google-Smtp-Source: AGHT+IEf+EffzzQ73XC42MasVF/lbCg6Kl7q1clWdM2/5GhEayA7l119ar/KI02nyQCjSDSEettBLQ==
X-Received: by 2002:a05:6102:38ce:b0:4e5:93f5:e834 with SMTP id
 ada2fe7eead31-4e6e41b2ec2mr1485431137.24.1748550201956; 
 Thu, 29 May 2025 13:23:21 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.35.190])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-87e2a2c774asm1647137241.20.2025.05.29.13.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 13:23:21 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [qemu PATCH 0/3] target/riscv: add missing named features
Date: Thu, 29 May 2025 17:23:12 -0300
Message-ID: <20250529202315.1684198-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ua1-x930.google.com
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

Hi,

These simple patches add two missing named features in riscv,isa.  Third
patch is a doc change I figured was worth doing.

Drew, as far as Server SoC Reference platform goes, we don't have
'sdext'. I guess we'll have to postpone the Server Soc Ref work for now.

Daniel Henrique Barboza (3):
  target/riscv/cpu.c: add 'sdtrig' in riscv,isa
  target/riscv/cpu.c: add 'ssstrict' to riscv,isa
  target/riscv/cpu.c: do better with 'named features' doc

 target/riscv/cpu.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

-- 
2.49.0


