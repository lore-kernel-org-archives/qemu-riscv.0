Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26D5C25B77
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 May 2024 08:02:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s79Z8-00024e-Ve; Wed, 15 May 2024 04:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1s79Yv-0001fg-Vl
 for qemu-riscv@nongnu.org; Wed, 15 May 2024 04:00:36 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1s79Ys-0006T5-9y
 for qemu-riscv@nongnu.org; Wed, 15 May 2024 04:00:31 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso4745499a12.3
 for <qemu-riscv@nongnu.org>; Wed, 15 May 2024 01:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1715760029; x=1716364829; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ud73vz92nOsf2EEwTWRfZlN26yWfMncbzbCqjllYE+Q=;
 b=ET4wwB1HX1oZGvZj6Mfly7Xe+yFMHpprCSkMkMwHzlvNzFnPwCTBhj81B+CEwz22zZ
 ZkSkhBplUYv51l5rDKUoForxdInQimj6gHojiRUMB6Hwr72jxIg7b56M9bM+Z93HdVTT
 O2I0CFbmah0Y5Kx+TTGzpY9K4IZ5Yb+9hNjD0fc8WKGihtSBbYDGm4e+ZYvexDpVD3/L
 kqI0NiHBlvJUce+iGQShS86A6meiVK1fkJmoCwBgYy4sQJGiexaUbgeBHzINoURSMkXQ
 FiAAxK2TcEdC2SK9dIjCUHXVzxNldBP3HfRVxDKg4qXEtxxKplqPzm1pgmrAt5AUgbK2
 J19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715760029; x=1716364829;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ud73vz92nOsf2EEwTWRfZlN26yWfMncbzbCqjllYE+Q=;
 b=RqvXTM3D8NjvmpwBJm+guL5bnb16VByRW/Alpy7TSxr9nOkkogXsHJQFgcQR4HQrTK
 fDHyQtMst4/tNjc0fc+dYYtLr/4GREazISU+nCGPLR8CukUdKd3GBUVKwuJKh0KiOPT2
 Va1mk6te5RqLD4/z0dHDM1yWmIT8CQEiRransBlr+E16tlM3QfSO1W6RrtbmSwG+aO6M
 YCg3e1ns0ra/Sr1Shv0prOf2ZQ1un0OspNeLoFXbO1AK9tLt1qcyYnRM2efkBoepYJFT
 btC3SLQ6pgIFHTliTuQjrzdhR7hNDr5ihqKcV9ymLj+ntjjo3Y7ZZk5fExbfKPW7nwMA
 mWkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVBqTWIKqDX9aLKDSBbh2ft2Xc9OIe2q/SGy+WDz57Q2/Z4cCE6ICH0QrBLH6bGkPgPBLxPDHL7ov9y5ws/dDD/aCpe/Q=
X-Gm-Message-State: AOJu0YwO6Bbh9Pl7XWOc5gDYMh2fSyMaWEfnMc21smiOQR256YWfHYF8
 wE7CW77r+K8/F2Jy7RKolAzVr28E0GrShxVt+xmen0Kt6h2eHt2HCZLnBA2Kt6U=
X-Google-Smtp-Source: AGHT+IG+vLxc+37EAmMCF51uqqKjQYL7gji5+rdAh6BF78ww1xQhzpI9Z6I4m2rm7rUfyYXwQMoQxg==
X-Received: by 2002:a05:6a21:890b:b0:1b0:225:2b2c with SMTP id
 adf61e73a8af0-1b00225ba86mr7792122637.13.1715760028752; 
 Wed, 15 May 2024 01:00:28 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0b9d1642sm111418795ad.31.2024.05.15.01.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 01:00:28 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Fea.Wang" <fea.wang@sifive.com>
Subject: [RESEND PATCH v2 0/5] target/riscv: Support RISC-V privilege 1.13 spec
Date: Wed, 15 May 2024 16:05:57 +0800
Message-Id: <20240515080605.2675399-1-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=fea.wang@sifive.com; helo=mail-pg1-x52b.google.com
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

Based on the change log for the RISC-V privilege 1.13 spec, add the
support for ss1p13.

Ref:https://github.com/riscv/riscv-isa-manual/blob/a7d93c9/src/priv-preface.adoc?plain=1#L40-L72

Lists what to do without clarification or document format.
* Redefined misa.MXL to be read-only, making MXLEN a constant.(Skip, implementation ignored)
* Added the constraint that SXLEN≥UXLEN.(Skip, implementation ignored)
* Defined the misa.V field to reflect that the V extension has been implemented.(Skip, existed) 
* Defined the RV32-only medelegh and hedelegh CSRs.(Done in these patches)
* Defined the misaligned atomicity granule PMA, superseding the proposed Zam extension..(Skip, implementation ignored)
* Allocated interrupt 13 for Sscofpmf LCOFI interrupt.(Skip, existed) 
* Defined hardware error and software check exception codes.(Done in these patches)
* Specified synchronization requirements when changing the PBMTE fields in menvcfg and henvcfg.(Skip, implementation ignored)
* Incorporated Svade and Svadu extension specifications.(Skip, existed) 


Fea.Wang (4):
  target/riscv: Support the version for ss1p13
  target/riscv: Add 'P1P13' bit in SMSTATEEN0
  target/riscv: Add MEDELEGH, HEDELEGH csrs for RV32
  target/riscv: Reserve exception codes for sw-check and hw-err

Jim Shu (1):
  target/riscv: Reuse the conversion function of priv_spec

 target/riscv/cpu.c         |  8 ++++++--
 target/riscv/cpu.h         |  5 ++++-
 target/riscv/cpu_bits.h    |  5 +++++
 target/riscv/cpu_cfg.h     |  1 +
 target/riscv/csr.c         | 39 ++++++++++++++++++++++++++++++++++++++
 target/riscv/tcg/tcg-cpu.c | 17 ++++++++---------
 6 files changed, 63 insertions(+), 12 deletions(-)

-- 
2.34.1


