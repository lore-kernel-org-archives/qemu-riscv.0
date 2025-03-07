Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD87C19F32
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 20:40:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tqeUS-0004MZ-Vz; Fri, 07 Mar 2025 15:40:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tqeUS-0004M3-3Z
 for qemu-riscv@nongnu.org; Fri, 07 Mar 2025 15:40:16 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tqeUM-0001tK-QC
 for qemu-riscv@nongnu.org; Fri, 07 Mar 2025 15:40:15 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2feae794508so3697149a91.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Mar 2025 12:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1741380008; x=1741984808; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dppJGFKe0O8FEfkLqUZJx0Vx/phQ/obvZ/lkzgf8YXE=;
 b=VxVV8h0NemvJa/e5VP8rK1NQBI1TCdw2xhx71Azvzq7+uDbpBKrRwgGCN2OxNmLFGy
 xS3ghE3xHdw/mjGObf4EZztQVsrZoavynYIfIFZ4E3TRBXYjYgxVSvzf5imx354YwxwL
 D6x5RagxFjky8+jbqhjtnwdVbgLkYUHyOS4XarM8Fj5z17Ra2Exfmxq2+8HxD1Ck+kZr
 JjeLkHWdx9bdRI0/4JDXqPc+L5RP9Uo2gVQNl/yszj/Hv36eZQ8BYZWsqtmYxfydxE7K
 rizOExCUR7wr+2QjSnlG0s20pfg0MrnD5Fy6LvPUVYnTi+t0U+1Fw8mRZsoCcXnEdpkI
 TgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741380008; x=1741984808;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dppJGFKe0O8FEfkLqUZJx0Vx/phQ/obvZ/lkzgf8YXE=;
 b=I0jLfzs4JmmRFmT3g0fgGc8l9bsOTRrdlE8E8dBY6yZI28UGQUzCK+Kjwn2XUA9k/1
 S7cl6NtC3rN2atAah/HxIVQnL49wdDHK2+GhJjpWhDckSS5nW07C4jJNyqCZeKJdtbK2
 4W20FJ+zdFGV+NCGbhp2KezdzoGQqNZxKkApJCXioPWUmC0Midig+d4QZcy1ekRUJrV+
 TjYFLzoFhIFT1Zrhwo6/J+5WDbnLh7Rg8s+nGIVpMYlHIvY5Hc5SZn4kjy4PH+0WUNAN
 Es/MHqKLLuOBirHR5sezJwPNcGcH+gqWvPdndOHRhjWyR2Oiq8+wJ3oEcmKFyg3SEtb2
 F9Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU08TBqNOXi5LvAP8pUoTsBCPhF7HjkidD5itYf6EiTqJxpOtChYd/H644tT+wTV/IMljWQc9pXvQ80@nongnu.org
X-Gm-Message-State: AOJu0YzINFVQgghpBx0cqptWnXE0/T+zl5BSLlUXZCAJYh/OaKtSt98Q
 o0QO5ahsSX+SKMwUeu7+/zfLIIuj6anZWiG7mky8v+6VVyXQsb1NB4MxP2Nq164=
X-Gm-Gg: ASbGncus7dqAETG6GgJwLCgewh8bML8fvXUBYEfYNbfVOqfYkoNC2QMzgtc5KT3m6tV
 dUuv0nqwyFpCvJXjhYB2ggeDHJzSl/8dFiABYcsVJUq9TDxHSaWRhaaTAZlQWIwN8kuiUGOxWVP
 kK4FpsKyhTamOoKWJ510FyrfW/pn8rLhCbuP0ASmaAmyjqkkUE91xSRrqedHmFTjGjefBqK2jE6
 VhUF8NUbhO2FK9ODsw6KQRQSVIptjbH/1BaDzQ73jJQqcVkUL7229M1kxponF4rycEhVjcFh7d1
 +UeY3HpRqiNiIonxcR0KF2zMsYOfqCnYWTW5xGaWQ85RnPl0CYFqPfF9E79ACaALN7wHWmGR
X-Google-Smtp-Source: AGHT+IG1Y4/xz6hk0YT4x0gmAAUF+JK6ZT9SziZSR1qtLRcv8OhlbExiO8LM/5kenrUZGBovoHmx2Q==
X-Received: by 2002:a17:90b:1dce:b0:2ff:62f3:5b19 with SMTP id
 98e67ed59e1d1-2ff7ce6f0bcmr7494655a91.13.1741380008547; 
 Fri, 07 Mar 2025 12:40:08 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff5aa3d3ccsm3270900a91.0.2025.03.07.12.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 12:40:08 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org (open list:MCIMX7D SABRE / i...),
 Jason Chien <jason.chien@sifive.com>
Subject: [PATCH 0/4] Integrate IOMMUs with PCI hosts that have ATUs
Date: Sat,  8 Mar 2025 04:39:33 +0800
Message-ID: <20250307203952.13871-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=jason.chien@sifive.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

The struct PCIIOMMUOps is designed for use by an IOMMU, but many PCI hosts
also utilize it to implement their ATUs, preventing coexistence with IOMMUs.
Overwriting a PCI host’s PCIIOMMUOps disrupts its translation rules.

This patch series introduces a mechanism to route inbound transactions from
PCI hosts to the IOMMU, enabling proper integration.

The final patch depends on another patch series:
https://lists.nongnu.org/archive/html/qemu-riscv/2025-03/msg00003.html

Jason Chien (4):
  include/hw/pci: Introduce a callback to set the downstream mr of PCI
    hosts
  hw/pci: Introduce an API to set PCI host downstream mr for IOMMU
    integration
  hw/pci-host/designware: Implement PCIIOMMUOps.set_downstream_mr()
  hw/riscv/riscv-iommu: Connect the IOMMU with PCI hosts that have ATUs

 hw/pci-host/designware.c         | 18 +++++++++++++++---
 hw/pci/pci.c                     |  8 ++++++++
 hw/riscv/riscv-iommu.c           | 15 ++++++++++-----
 include/hw/pci-host/designware.h |  2 ++
 include/hw/pci/pci.h             | 21 +++++++++++++++++++++
 5 files changed, 56 insertions(+), 8 deletions(-)

-- 
2.43.2


