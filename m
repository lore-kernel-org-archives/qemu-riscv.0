Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B53CCD1AB
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 02:42:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBOnY-0003R1-KA; Tue, 21 Oct 2025 22:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1vBOnW-0003QY-Rm
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 22:41:58 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1vBOnP-0002JA-HV
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 22:41:58 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-33d28dbced5so5373166a91.2
 for <qemu-riscv@nongnu.org>; Tue, 21 Oct 2025 19:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1761100907; x=1761705707; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e1wIE0v1euyYcy826yUBGHmG8cIEGIkUorfE6OvvIXY=;
 b=fj4IiKoi+OJTX2orJOIGBFJbZahGlum7OkCAaewVAj32owKvLnn+qiz3yFG7Le9KAX
 AvIB/VtMx1exYUTLj30sJojEYxeNijTCIBzQ13kAKErdVlf9N26swkYpsa/oxr3Z+8d4
 Jg32xdkYvjl+JIN4l5yPYfLB8DvdCy7gQEqSXx91lWhSrXGB7FrAvA1PNRNeMusfp5jW
 fWsUOG8NtS41m/mVVgGREKcJzNLF02gC8PWRe9GzmVjFR03nSECH/SoWdntjeLahqnfE
 5nf4+rNHuNXGE2ddElRL0E7BacljyIH46s54FnwvGi6j2bR6uNu7UQqVO0wRzqOmAoUF
 1QWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761100907; x=1761705707;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e1wIE0v1euyYcy826yUBGHmG8cIEGIkUorfE6OvvIXY=;
 b=FGqS7VBfJBx8keTd3Y1hZXO6iSQjpMuBLz/vM4yQDRSLxz27x+SriwoacrAyCGjiwT
 Ehn7C+/iJ0MyBW1Ijql2jbmvXy7oaBB0aFTrHSOjRXq+QsrkaDgZkNifEMVklhGr1cUW
 hBvZ2GOUw/TbSGYwi4bqimROnJ4rZBNJ9KJ6BYR7HAfZHcKmMAZJQqZmTRnsMOC/e6+A
 x8SY1q6n4VGDBpE3EO4gfxjrW5hG4h/9jkqBTEaCW+WGgNP7UepLBgSxXfIxV0eMJOwC
 WXnTzXZxkf4lNew1kkDx09f9ypl6ha+9OK4Fm6fxyz4C8xtWC9OFOlsLJYCkfGGpVrtt
 4DSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuPpHUv428JyS4MEZSzZoySXWrjzxLh8P9W1BmULjdB7ePMWsLsjaMb7LLuRQxDT4/uHu5eZmmsqBx@nongnu.org
X-Gm-Message-State: AOJu0YxU+R5YL4vulp+71NPgO4kqv3CuY5mapHf9j3a4DiQ7RUIVjIbz
 YGIepCI7FTWwSaMAnYYHIQgUKv+ke5QtvV1da4GSjM4exOJeUyw8OxGV5Vd7CLRI6rA=
X-Gm-Gg: ASbGncuesGdmd9/KzKqDNMCEdtvL6UiY843a4btUSOXFhH0fVMafmCaMkYabM7aRxok
 ycfDYb2iC1diV3IQnK7WrxM9ohPBR4nXwOSY8TjjNpP2xPv2415evB541/EeW68YyFEqly556DI
 31KkgoX2BL4mvCryYXTWqXfZAEIvkEbAoXgqaXc4aRwJORtRH41xvHd119gf29SE9NRXU/Krunp
 gl2mjmugXYyzyBXaiiUib50HU4uh/RKRlsyc7HMl/Dfrggbd7nEaTCYCtkUYOsFqRshDYm60z5W
 7IHCpw65HZbEULHTX0l10r/jICbSPLw+O+0KyofLPsC4B8HgP1NpcU0f8aLE65rWVl8IlIEvx0X
 x3dP9Hat9wXijL7RkUsJfLXtz3Q0bhDQdP3wp762yLv8DxdvjPlnzuOZC0TPQqiiTea6tkvoaDu
 HwSblo1fIRFfd1eKDJQOwtq6SNzfwkpST9/bcBmN9MvS71wLYrtA==
X-Google-Smtp-Source: AGHT+IGyHbGN5vf+qJZoSvIVrxA+CXhzLj/V6h+BnT6rSlmbAt+XcQIxpZlYMMZ5iNNXqZCq4jy79A==
X-Received: by 2002:a17:90b:2d8b:b0:336:bfce:13c9 with SMTP id
 98e67ed59e1d1-33bcf8e3d37mr25509093a91.20.1761100907515; 
 Tue, 21 Oct 2025 19:41:47 -0700 (PDT)
Received: from jchang-1875.internal.sifive.com ([136.226.240.196])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a22ff1591dsm13204731b3a.7.2025.10.21.19.41.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Oct 2025 19:41:46 -0700 (PDT)
From: Jay Chang <jay.chang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jay Chang <jay.chang@sifive.com>
Subject: [PATCH v3 0/2] Make PMP granularity configurable 
Date: Wed, 22 Oct 2025 10:41:39 +0800
Message-ID: <20251022024141.42178-1-jay.chang@sifive.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=jay.chang@sifive.com; helo=mail-pj1-x1034.google.com
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

PATCH v3 update
Change UL type to ULL to prevent bit-width errors.

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


