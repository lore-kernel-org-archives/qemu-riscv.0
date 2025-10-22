Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEC7CCD1B9
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 02:28:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBOYl-00071K-4s; Tue, 21 Oct 2025 22:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1vBOYi-00070b-RD
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 22:26:40 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1vBOYg-0000wI-UG
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 22:26:40 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2697899a202so3750225ad.0
 for <qemu-riscv@nongnu.org>; Tue, 21 Oct 2025 19:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1761099996; x=1761704796; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HYGt6gYGR6dF2AZNEJ7ZrXWSOP7QVzdUZavzcwclZ3Y=;
 b=JcHuCZWB3BGlwsMDYVydBnoJiDFW1eyp5NuBSRP53d705c3zXxrnPVa4kM4CGX/vSm
 sgvYoW6X3GZ8STo6ze1Z/wLENrmaKsXOzjX/mQUI5RpMaJcZNxY8eQ4P4ui1Lgg2o8xD
 8hdjpQn5qqN8FV/+pWK74Ct5PGKgfvewCyE4KHnOl49bZT40YytS3EFjOVCHxKnxDptM
 G4cVJSXUyltvDZ9w8kS/ZFNaMSuPNw/g57/EXus3o+qcQp5C6O1kY57065XtQDXAXDpU
 g9LS1/JhUdgFcp/R0mDSMxHw9Ci9vlOucLoZUS1Z3DBB2Cga3A6wmB7eh9vFCtnJ0GKV
 Wd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761099996; x=1761704796;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HYGt6gYGR6dF2AZNEJ7ZrXWSOP7QVzdUZavzcwclZ3Y=;
 b=AbkXaRopLbqXHRfErPCLWW5dyx2Uq/UMockQkNlgtiJ6lBhEIvlLsVfwkgxo1ncQmK
 OEwVgoMVPQu0uTk7blRYXxuQsbNxgTuO7zyLt38C09wXxE1x+mKZ2AGWUt/h/oVCUSnS
 n3NAb7FSss1wCOi7lwHgvU24LLWVEQMXsDkCJoh8ZCuH5zZgO8qb4TpqrHijadjGaFsj
 XVm+eXGtNtctXer2yPneNV9xQBxfjYWlwMRzVLtK56IscCzDmEBYDjWE/DVcBmGduP1U
 OZuN+dTr2uD5nQYMym6GG5Sg955YCy5wT8weU/fVaDJAqvra8/+zNJYra0MuXFmTRik4
 DOtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqQeisHKiUAS19U/E3Ug9wW1l4x6H37HxKMfbs6cSCStemq7kWDePCm/k5onRoeIj8331x7uOuHOZs@nongnu.org
X-Gm-Message-State: AOJu0YzEwHYeXPTJEn98nta9xcb4buaS6B8/mVH7KybZDaBSm0R9rDZx
 Eb3L3pITVcYSs4S3DItq6H6VZ1sFCZWJS7kG9YWIcCZURZ7SSkVAkoqzbcFjDsOJzVA=
X-Gm-Gg: ASbGncuxo3MZBwhbh276NcTD+5Hg8rQcO9QSZSQWJminbtToBzxz1XV4Cb3XEOjdEOS
 ZgPH7IV9m+C7Jw8hjdfyEKkMFZUkx/7Tt2Vxv1MG0caWTI1aNWuVV7w8QMY7U4+ybXZC43NGlI9
 X90yRi0F03ZI3nc9skMkPoygTKWrJEJHPzGaUXkt5RCeCm0heom9q6GX+K8Q9RTXkIIYmqb0GYW
 RpsaIDbFVA0GX9QU+75mSPWpeuANgPewxrytRKnLnwOteJLIA22i4nizoQprXU1n298N0OX48S9
 ut/CcSFa0xKvYPPr3CiQnS4hTAsv2HZ2CWCJYEJfSD7VGMHyhmuqgv9GZ7rO07oewDtzwO0DKAx
 158P9YSPExBT1bb+bNKd4R2nm6OC7p9JbhPnA6nauYHAKYl8H/Wa1+XrBwHmaOHBjMqptZ6PGly
 AMn6rR4yzCx47ciLG492GXmpRgynKtDOEQy0N8CafOo0tdkNJjRg==
X-Google-Smtp-Source: AGHT+IEpB1BAf5j4sQMksePGgm5SSZfwWyYewWh1GVU52+UJzEpC7kpga0F9LV5q/s0vUWzEp4uWCQ==
X-Received: by 2002:a17:903:440f:b0:292:b0d0:2ef1 with SMTP id
 d9443c01a7336-292ff8c1396mr25112095ad.18.1761099996053; 
 Tue, 21 Oct 2025 19:26:36 -0700 (PDT)
Received: from jchang-1875.internal.sifive.com ([136.226.240.196])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2930340092dsm4673545ad.42.2025.10.21.19.26.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Oct 2025 19:26:35 -0700 (PDT)
From: Jay Chang <jay.chang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jay Chang <jay.chang@sifive.com>
Subject: [PATCH v1 0/2] Make PMP granularity configurable
Date: Wed, 22 Oct 2025 10:26:23 +0800
Message-ID: <20251022022628.41307-1-jay.chang@sifive.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=jay.chang@sifive.com; helo=mail-pl1-x62a.google.com
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

This patch series enhances QEMU's RISC-V PMP support to conform with
the RISC-V Privileged Specification regarding PMP granularity and WARL
constraints.

Previously, QEMU always used a fixed minimum PMP granularity of 4 bytes.
This series introduces a configurable "pmp-granularity" parameter, allowing
platforms to specify larger granularity values. In addition, the handling of
pmpcfg and pmpaddr CSRs has been updated to follow WARL constraints. For
example, when NA4 is not valid due to a larger granularity, it is silently
ignored. TOR and NAPOT address ranges are also properly aligned according to
the configured granularity.

A new CPU parameter `pmp-granularity` is now available on the QEMU command
line. For example:

    -cpu rv64,g=true,c=true,pmp=true,pmp-granularity=1024

If not provided, the default remains 4 bytes.

---

Patch summary:

1. target/riscv: Make PMP granularity configurable
   - Introduce CPU property `pmp-granularity` for platforms to configure
     PMP granularity.
   - Default remains 4 bytes if unspecified.

2. target/riscv: Make PMP CSRs conform to WARL constraints
   - Update pmpcfg and pmpaddr handling to follow WARL semantics.
   - Align start and end addresses of TOR regions to PMP granularity.
   - Ensure software can read back correct values per the spec.

PATCH v1 update
Add the UL type to prevent bit-width errors.

Jay Chang (2):
  target/riscv: Make PMP granularity configurable
  target/riscv: Make PMP CSRs conform to WARL constraints

 target/riscv/cpu.c                | 39 ++++++++++++++++++++++++++
 target/riscv/cpu.h                |  1 +
 target/riscv/cpu_cfg_fields.h.inc |  1 +
 target/riscv/pmp.c                | 46 +++++++++++++++++++++++++++++++
 4 files changed, 87 insertions(+)

-- 
2.48.1


