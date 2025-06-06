Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF34C5B549
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 07:25:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uNRSO-0005CH-8u; Fri, 06 Jun 2025 03:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1uNRSJ-0005BY-Il
 for qemu-riscv@nongnu.org; Fri, 06 Jun 2025 03:25:36 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1uNRSH-0007ZN-FF
 for qemu-riscv@nongnu.org; Fri, 06 Jun 2025 03:25:35 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-312028c644bso1418872a91.0
 for <qemu-riscv@nongnu.org>; Fri, 06 Jun 2025 00:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1749194731; x=1749799531; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eqQgg7FhIoL/447jsGOcCEkgWZv5U2WvjQztrTXd0ZU=;
 b=LIYhJSq9/V9PYT+INuLGvO4VBzSGsee5quRNn46rmQwdTb+cS1uDahfSCrCNL3KxTF
 piJvOxtLR/HUKS92xZ2jTiyVdN24riS4UMODyScffXz8wp45CpFkiQwP7RvbRP5u1iIC
 F4F+2BuJSraMA/hj+PgOsO29GUL3klGCLCRdHvKNzJQwzFnzA38ED/pPGw2Rf5v4aFBn
 NmR+LgRcVCi4WpxWDqkbV4DpF61dqYO4574GX57nCvIezedvOlVJFylnpzSUtJA25NF+
 3TuOFwsEhfJ/pRgxBLBaVLXf6UIOS6zKpR3wK6zloY08mHAYccQVMFuwAEFDtNvqLHDT
 FAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749194731; x=1749799531;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eqQgg7FhIoL/447jsGOcCEkgWZv5U2WvjQztrTXd0ZU=;
 b=lQp4ZGQ/YT6Um1nQv/vYQL1CapSTbxOIJGeB9Mu5EhaXjsr7cuRMGdZ36S0KTHSDQE
 BekvfzBaswKWO7uAIrRgQ8sklyb+K+ZsRJVRXH/HRAO3tsFLv0TeLw6bIxqQ856UQED7
 XiqXAq1cJsR6WvSwsw/xxVbIQYHo1DjuixLU/rdkHaZ2orYXi67tIGLQcKV2ksxXcwyp
 IJE5taHnYVU1rbTHIowTwCKqmykmPTQDwkwT30befVekyulyjZq191rDn+YX9TTFkYeY
 sUXOc3ERz4ai6UlXCWjeYhafNOAUdVqhudRRja+LpYFERWhOVErfP+gRf6pqxvFwlAqQ
 AqUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZUUz2T0rdYel+RDeSmG4mJQtLYjTvD6fopS0epwPikqqt4EnY/eyAvkzbmTTzfo5rc+I4nPi+pYWf@nongnu.org
X-Gm-Message-State: AOJu0YzNceWfMaa7DBgBxjbRUAQUK4tTEddV9IkIbP23kv33IZplbVma
 3dUjR6TkxI2QZV6eLoaWkApSnJ/hsWA+yyoNoBaiH+bUFLBbmbphBTbHd0+UxA/8ow8=
X-Gm-Gg: ASbGncv+VVFZVROoTetvSZ6FL0BzHrzE83op+PBuSmOjWsNIoe1CUhFEtrvNF5Gue69
 arTu6ci/pLnzFdej1bB576cXjtx/swrXg3ZoxtFIpnh9d2OIy7NROlp4GUbHsQwXjlsJxHMXEp2
 81wGzOm9P3qMSKvsHW8b84GtrIZZD4WYyNwXA3PlmTuuycBdvOZL+IiEhfXF3gcGl7A6YKsjg5R
 aOCLhvoW9qpU38Mby7B2cuLOAMFEOsoCevBaKWmsAFEOvw4BDotIU4q49QmwzHRJKcj1dINShvG
 YQLSrrgb3+68poicpWP8kDjbDxOeaIq0UyMSlc6wxRn4OJyZ7QdEqIOHWbZBSAUFxnq45sZBLSF
 7HRaFJo0BxCQQItU=
X-Google-Smtp-Source: AGHT+IH3uP+SzyW+Hb0EtoTBQrLVDPauSC7nKygY/6do2xIwQgfQRdL0UNdsEIj4gKOeVO7B9nsO3Q==
X-Received: by 2002:a17:90b:5345:b0:311:ffe8:20e9 with SMTP id
 98e67ed59e1d1-31347308c79mr4429732a91.17.1749194730855; 
 Fri, 06 Jun 2025 00:25:30 -0700 (PDT)
Received: from jchang-1875.internal.sifive.com ([136.226.240.181])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31349f17bddsm774703a91.9.2025.06.06.00.25.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 06 Jun 2025 00:25:30 -0700 (PDT)
From: Jay Chang <jay.chang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jay Chang <jay.chang@sifive.com>
Subject: [PATCH v5 0/2] Extend and configure PMP region count
Date: Fri,  6 Jun 2025 15:25:23 +0800
Message-ID: <20250606072525.17313-1-jay.chang@sifive.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=jay.chang@sifive.com; helo=mail-pj1-x1029.google.com
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

The first patch extends the number of PMP regions supported up to 64,
following the RISC-V Privileged Specification (version >1.12), where
RV32 can have up to 64 PMP regions configured through 16 CSRs.

The second patch makes the PMP region count configurable via a new
CPU parameter `num-pmp-regions`. This allows platforms to adjust
the number of PMP regions without relying on a fixed default value.
If unspecified, the default remains 16 to preserve compatibility.

Change log:
  V5:
  * Dropped all pmp_regions = 8 overrides except SiFive-specific cases,
    and every other vendor CPU should set its own default if they want.
    (based on feedback from Daniel)

Jay Chang (2):
  target/riscv: Extend PMP region up to 64
  target/riscv: Make PMP region count configurable

 target/riscv/cpu.c                |  48 ++++++++++-
 target/riscv/cpu.h                |   3 +-
 target/riscv/cpu_bits.h           |  60 ++++++++++++++
 target/riscv/cpu_cfg_fields.h.inc |   1 +
 target/riscv/csr.c                | 129 +++++++++++++++++++++++++++++-
 target/riscv/machine.c            |   3 +-
 target/riscv/pmp.c                |  28 ++++---
 7 files changed, 256 insertions(+), 16 deletions(-)

-- 
2.48.1


