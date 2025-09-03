Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C1BCA1009
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 13:03:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1utn7f-00059M-CU; Wed, 03 Sep 2025 09:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1utn7Z-00056c-Nz
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 09:01:57 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1utn7X-0000Uq-2m
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 09:01:53 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-3297a168470so2920926a91.3
 for <qemu-riscv@nongnu.org>; Wed, 03 Sep 2025 06:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1756904509; x=1757509309; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a5HBE4kGgHVv5ddGcsNk2eOhjM/e0af34LDVEryaLhU=;
 b=dmOA3ErJlFQLr6dvZxnd8Gl7ZdOAuHY5+NgEsZ9VWmfOoXbdTkYTx2fS2uQOqWm84g
 yz3K1LFOcVqb7RGxDl2pTNhPo0Eyi4qNGFjqlwKUMbXH4b474vamVTtlAaQhUMAHV2S7
 J15zqgqm1Xnp8tyEYpRQIdqJFLmrWSgfQbrrqBzuhPYcdWWtunJsGwmCsotSoZQ5zS/g
 1Tm+QKe5Y2ytQcROJUk9aCSnRvP91K7LopSj6vV8EJ8jn5NYFkD8AivgfN332XKWMXTg
 LmMCPPMzCHHLy1jgNaoVOA1FTwowrSWODgPAZUZHsXAJLhIW42VowLAF4806eVvJncby
 keRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756904509; x=1757509309;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a5HBE4kGgHVv5ddGcsNk2eOhjM/e0af34LDVEryaLhU=;
 b=OoSOV2hnsWB6Z7LwhVaP5l+OdCXNkvP7+sBhsVMIK55hkPeyvoin70Ke5P3qLRQ3JM
 x+WQ4n51MjZu7Xmi/RiguaNFkzs6wj/OTYwH0MjE93BCrNWeyPbUI9Inbd55t/EB1vwg
 zaCrCpZE+9hi83hisVJetj8BCjdzuWJFYRKue7CZxNidf2M/PJcQAIZ65RxUYKJHrFDX
 OLyespSTTusqF1PA9mVZ1xIyyZyxlSyGCNeSFpiWv8D2puSVtS3XbLN+57s14qMHkaNa
 M0+phAjD0NESD1+9ofgnaluJi7UW0Fch6+BIpICUQi+Hfjw2BYHk7VWy5hXVSexp9Jk4
 r+kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR3/jVUu/VqUOUktWuCTK8ciQK1SkCbJ2fS6kiBwFY43rGRfge8RTue8DlKtN5FF9uYT53eofVRC/5@nongnu.org
X-Gm-Message-State: AOJu0YwclYsJ15mX8u8MuD8eizV7mve3SU80BtMj/MDzvFzn7FvBXjmt
 JCpCw+baQLLYrJTf6B/3nxRXXpCYi5I70v05sExM6XiATwxucGvSCtUWwGlOJXXLjA9p1b3KbTz
 hYOyD95M=
X-Gm-Gg: ASbGnct5HzV0DxzoYBdxbTVkD/AFsnO9YHGb2VnrbE+QBx16MKcnmHJ2GSze4OxeAfK
 gmyFTA0k0ABonsPmiiiE2PzW8e3rVkQXXhlxwJ1AZsuVVlA0pU+u6oJxtHLOdBh7uu5dhmzX+3P
 hHefndw4h7d+weoBqCeWZTxboP9s6wPFoi1nPQIwBdTp1ndw51F4ROMsJY+2qkBeUhez7Irzt1f
 aSK3ztUmgz0CaT8e1siEqOg4LvZJwUFaNVoRbOcP+7mqYaOEiFh3fxHYK/ulOiq6FuwI/i7R5sk
 MvW60e+8kVpMGYzCIWwKHJ1Y/DEWTjBaBLl5jfDD3Q/Q64fQToLkxhVXqH5xt0K4BEK7tzpc7wJ
 t3XokGNrlklI2f8+O8GE/3LJ/Cu/1WMBrx44nmZnknyPafXDJsqK0ftLreTexJ3Xrz0/8tvHQ+4
 Q7RQ==
X-Google-Smtp-Source: AGHT+IHhWSOOYiOkcPRhJAVTlaM+xESFcT8Qo77wqYZmR3jF1T1RFHevuaicR6xrxPJXgb+mw6+p9w==
X-Received: by 2002:a17:90b:5205:b0:329:cb75:fef2 with SMTP id
 98e67ed59e1d1-329cb761185mr10499582a91.3.1756904509046; 
 Wed, 03 Sep 2025 06:01:49 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-329e23858ecsm5472278a91.14.2025.09.03.06.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 06:01:48 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH v2 0/3] Add Zvqdotq support
Date: Wed,  3 Sep 2025 21:01:22 +0800
Message-ID: <20250903130125.1701363-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x102c.google.com
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

This patch series adds Zvqdotq support.

The isa spec of Zvqdotq extension is not ratified yet, so this patch series
is based on the latest draft of the spec (v0.0.2) and make the Zvqdotq
extension as an experimental extension.

The draft of the Zvqdotq isa spec:
https://github.com/riscv/riscv-dot-product

v2:
* Remove unnecessary variable and mask (Thanks for Richard Henderson's
  suggestion)

Max Chou (3):
  target/riscv: Add Zvqdotq cfg property
  target/riscv: rvv: Add Zvqdotq support
  target/riscv: Expose Zvqdotq extension as a cpu property

 target/riscv/cpu.c                            |  2 +
 target/riscv/cpu_cfg_fields.h.inc             |  1 +
 target/riscv/helper.h                         | 10 +++
 target/riscv/insn32.decode                    |  9 +++
 target/riscv/insn_trans/trans_rvzvqdotq.c.inc | 61 +++++++++++++++++++
 target/riscv/tcg/tcg-cpu.c                    |  5 ++
 target/riscv/translate.c                      |  1 +
 target/riscv/vector_helper.c                  | 61 +++++++++++++++++++
 8 files changed, 150 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzvqdotq.c.inc

--
2.39.3


