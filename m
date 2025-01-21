Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1270C0218B
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 18:49:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taJJ5-00047R-41; Tue, 21 Jan 2025 13:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1taJJ3-00040Z-2l
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 13:48:57 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1taJJ0-0005K0-A5
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 13:48:56 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-21649a7bcdcso102553445ad.1
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 10:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1737485333; x=1738090133; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HG44YAgLX/F1jYL73raIbfXoUDahSn4ZA9nq+CnEpzo=;
 b=piVTqquoz8bRAixmi9bY6GyQ/vo3vEy+ZBW+vy1GxUGXHyRw26qwWU4sq6tPnLkIYU
 N3R9v27Dgk4Gurj/85queFoJUgPkU5jeeStGVvlwl7BxRglRsoGYCw3qSzKojWDVBh1h
 QClYB8I2XnWJu91IDOzh5IF9QXN5PqbvqpX9hLnY/aKV29qwUbzkuKYd3gLoqDIGURpO
 gtitS7Tfjns6E71v3Mmi1DKXdSysSTfDTT5xLjbbM71fReTbzRFvzA5tzqiYtD5d+nSU
 lZtIe6DbJc29inC8LaYnCRFfvfTGH0vE7wWWk2mrtPbqUKJa24hFqTxgEawURCNDhSLH
 UW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737485333; x=1738090133;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HG44YAgLX/F1jYL73raIbfXoUDahSn4ZA9nq+CnEpzo=;
 b=BkEyfaE69QBCqOCr71FuB9IcA6f/gDYgMIu25/hccRSautQkw7RYmi/92d+Y8VlSIh
 sOqLbdt2w9RclqGZxxJ25z3YemaCuhOxzobVpPplbtDbKGK9V/UKvivzPIRxcvzqQdbV
 TQdQ2Yf2ZsUuPtU/MQuqlyIXtf/B8h/ebQ2U2dnWx1avJVFNuOudgZ439JNh8CGS3vog
 OBHXIWUKYkz3c974OxJwXaCyZgqt4zQa/JHWKJ2E3gNpw0iPNxw70sYf4tKiqFfstuse
 4m8gp4Yks7EkCpPILI0w0vw+5raqC9JeUXsQi3ZvBQMMxbvkMfNSuDWn3oMSH9HdLJMS
 Zk8w==
X-Gm-Message-State: AOJu0Yw4yHv8f/TFfbTOeG09hAFd1bzQP24dh436XcMOM3op++CxQ/78
 D0c/bMxYucrecrlCeA51eAQSixvaq1vAbpiSKt6qk+hT/lQ1Pde3xWPqa1GP3TU=
X-Gm-Gg: ASbGncs83gzcYeUutyiMZnlI3CmbczkWWDz9SU9mEGl5avyteBjFqom+7h59oMB/0KE
 eJTeIpxhYj6+fFsLjKJyrWCTW97BQrV6xkFAmag+4pc/aHXTFgdrvSnljHOC486QM2LcrM55pNR
 FzL9LGapf0Pk0eUfBZrJYHneHEo8s0omm6wljCgpCKdzVwy/CLaWzkibVr9jaGTh0gA0ZTb6Oua
 e+VmPNfhgpjx7c5pmr/QdxFh6z7Jgl+RcJhy8cCopr5ghNNBNkOgMp6vGdnpoJYR4UOq8/p
X-Google-Smtp-Source: AGHT+IHXWsk48Dox1AzMJ4wxxmU09J21v13OZS35EaHo61xoKVYETYf787BNw2+6N4akSg5xIyg64w==
X-Received: by 2002:a17:903:943:b0:21d:3bd7:afdf with SMTP id
 d9443c01a7336-21d3bd7b381mr73503305ad.0.1737485332898; 
 Tue, 21 Jan 2025 10:48:52 -0800 (PST)
Received: from grind.. ([191.202.238.10]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2ceba56asm81121865ad.98.2025.01.21.10.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 10:48:52 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 peter.maydell@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/5] target/riscv: Coverity fixes
Date: Tue, 21 Jan 2025 15:48:42 -0300
Message-ID: <20250121184847.2109128-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x633.google.com
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

This series contains Coverity fixes for issues found in the latest
RISC-V pull made yesterday.

Coverity CIDs being resolved: 1590355, 1590356, 1590357, 1590358 and
1590359.

Patches based on master. 
 

Daniel Henrique Barboza (5):
  target/riscv/csr.c: fix deadcode in rmw_xireg()
  target/riscv/csr.c: fix 'ret' deadcode in rmw_xireg()
  target/riscv/csr.c: fix deadcode in rmw_xiregi()
  target/riscv/csr.c: fix deadcode in aia_smode32()
  target/riscv/cpu_helper.c: fix bad_shift in riscv_cpu_interrupt()

 target/riscv/cpu_helper.c |  4 +++-
 target/riscv/csr.c        | 24 +++---------------------
 2 files changed, 6 insertions(+), 22 deletions(-)

-- 
2.47.1


