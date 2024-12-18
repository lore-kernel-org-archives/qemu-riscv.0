Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65A5E77187
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 14:30:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNv3r-0000XK-5E; Wed, 18 Dec 2024 09:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <craig.blackmore@embecosm.com>)
 id 1tNv3p-0000Ww-Pq
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 09:30:01 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <craig.blackmore@embecosm.com>)
 id 1tNv3n-00047A-UB
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 09:30:01 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-434e3953b65so46350115e9.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 06:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1734532198; x=1735136998; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UdukYHvSd1mFOZMM4pl71+ImVf8PR4lrYvEzB4RPWRw=;
 b=hEzFbELQ7kt4YWeZ8F6cpkTVgkEkVw8vJeKGWaRvrGFyoH+zG43+C0hb+kAD1QtRPX
 2n6EqOf9wg4iL4MQJdLj1wWjbIexejZFY0/5iymH8gfEMOVZJZmJJ1bINcTPE4qF3pJ3
 12zhjBOgKR1sC4obGwyN3KZZiHqGM8MT1spR0FV65u3NYFHRRGWfCs6m3Ck0p/4Zxmb/
 cw8/3umDvAPEewG4zHGBbZ0zH4r6vBSQTsSIsYYnrYoqbMx3MXfh7b6faNiBzXbzjjen
 bX2xK3kVGPdJQqGqa6mD/VffhUSMd8Vh7HVBtodmPcRz54b1AZbRq6tO56nAThX9BnMK
 skaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734532198; x=1735136998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UdukYHvSd1mFOZMM4pl71+ImVf8PR4lrYvEzB4RPWRw=;
 b=q9PK4IdK5zSICusYXVMgvslAaArA1DoCBT5zhAO5uytvFFg+x8Xce23TnEsmAZanaj
 pRerX0FpcKnqCtKBSW6A++a6lKRMNnpsTeGChtxDjTGNibtoYYlmgY56UMGN9IzW3HM3
 dhjjrkR2PNbb0Gezn0bAt6Xz3edK6+MoQmHjBrVWkdyx+Yi81G+RChrI6flhXBC6zxBF
 whApp/mtu1cjUoitAvHmVXcYIn86iKNyP7AQFQ1ZeYUXxNlKvunEAv6OCWA8pyKK4z6M
 uXdE4ZpN5cJFsT5RnlcBk+7hPhUiZPE6+Wl3RYP32chJJNSw2ytuj2H5k5dGlDeX0Bv0
 EuWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2PRbWhtTQrk2SfmkuZf5V/7MMtfsVWMqnVWyU3efGT7GGlUgpbrY92zuj/Zg9Ud/n+vUxu6yDRakd@nongnu.org
X-Gm-Message-State: AOJu0Ywcn5Pb3ZKDhAS3xKmm6zI2XzjbdLrg4FoLNR1DJHLCLrkK58G2
 CF6fEeNnc0BzklxWe3k8zwFKfeYaT2Rt/Vwr0A7HdOb7cV66MnsUD5kFRhBC5ss=
X-Gm-Gg: ASbGncu6qXedMtqxUUa7m5cI0RSpXhfdRYA28GA+NKR3VVLEZRdrXmhRgYm+6sipDPW
 lxVEF5HJVYLqqoC+6l1ktmSYmPE1m+EGMpopAM0tKPGSArm/dEGy/q1Y5b0MBfIeqtpUDK7dbqj
 XjidBQayvNdgnjanaKOVH7AVi/LskM/6PZJfcwsYTH/g3K4vBj1ShOStUtWh7hKn3ZtEwrceAxY
 fJ1BalFO4wGj7Vi8dMpMldoXDQKmZjjf+2rCIkLOnIwgW2QPdQwz+JhHmAYePKPeNFslignAUx3
 0J3k6fh2PdaI3XO5WMEv72nAWKOEyMJAEGXgiDX1cDFZeiFS
X-Google-Smtp-Source: AGHT+IHzuHKIhbzdRupfQx9qLbbtcCfYIV8uGwnwLKItg1YnLKvbNQXT0fqZtxKiilHOEuXXG1raOQ==
X-Received: by 2002:a05:600c:4511:b0:434:9d62:aa23 with SMTP id
 5b1f17b1804b1-43655426b06mr24018125e9.20.1734532198201; 
 Wed, 18 Dec 2024 06:29:58 -0800 (PST)
Received: from dorian..
 (sals-04-b2-v4wan-167965-cust660.vm36.cable.virginm.net. [80.3.10.149])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801a47csm14330046f8f.44.2024.12.18.06.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 06:29:57 -0800 (PST)
From: Craig Blackmore <craig.blackmore@embecosm.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Craig Blackmore <craig.blackmore@embecosm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH v6 0/1] target/riscv: rvv: Use wider accesses for unit stride
 load/store
Date: Wed, 18 Dec 2024 14:29:36 +0000
Message-ID: <20241218142937.1028602-1-craig.blackmore@embecosm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=craig.blackmore@embecosm.com; helo=mail-wm1-x32c.google.com
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

There were no comments on the RFC so reposting as a final patch.

Changes since v5:
- Removed RFC

Changes since v4:
- Split into a seperate submission to simplify review
- Use load/store atomic functions as suggested by Richard Henderson
- Do 8, 4, 2 byte atomic ldst for sizes smaller than 16 bytes

This patch now uses the atomic ldst functions from
accel/tcg/ldst_atomicity.c.inc to ensure element size atomicity.  I was
not sure of the best way to make these functions accessible from the
riscv target, so any suggestions are very welcome.

Previous versions:
- v1: https://lore.kernel.org/all/20240717153040.11073-1-paolo.savini@embecosm.com/
- v2: https://lore.kernel.org/all/20241002135708.99146-1-paolo.savini@embecosm.com/
- v3: https://lore.kernel.org/all/20241014220153.196183-1-paolo.savini@embecosm.com/
- v4: https://lore.kernel.org/all/20241029194348.59574-1-paolo.savini@embecosm.com/
- v5: https://lore.kernel.org/all/20241211143118.661268-1-craig.blackmore@embecosm.com/

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bmeng.cn@gmail.com>
Cc: Weiwei Li <liwei1518@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Helene Chelin <helene.chelin@embecosm.com>
Cc: Nathan Egge <negge@google.com>
Cc: Max Chou <max.chou@sifive.com>

Craig Blackmore (1):
  target/riscv: rvv: Use wider accesses for unit stride load/store

 target/riscv/trace-events    | 12 +++++
 target/riscv/vector_helper.c | 95 +++++++++++++++++++++++++++++++++---
 2 files changed, 101 insertions(+), 6 deletions(-)

-- 
2.43.0


