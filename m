Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D560C54E65
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 May 2025 08:14:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uI12w-0007QK-HB; Thu, 22 May 2025 04:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1uI12j-0007NF-Jy
 for qemu-riscv@nongnu.org; Thu, 22 May 2025 04:12:52 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1uI12h-0003M0-Oa
 for qemu-riscv@nongnu.org; Thu, 22 May 2025 04:12:45 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-72d3b48d2ffso7192523b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 22 May 2025 01:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1747901561; x=1748506361; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2AQTPTllC/YXTyTGWiVggK3t5QseTYdpGef7t2eK3FU=;
 b=b/sxdgdAY35tofwXfQ4yNd57ftj4MfwvcabNuqa0lGQUsF+rrjMFNGt1HHpOy4A4ll
 Ftfx10kACGwotaISoX/kfhMJzK/l/Oxqh+mt6kr+ijYH2yt6GeT4hIxeSiv1Gihz4B7j
 mrOMh1pV+jS+1RwK4+MtAIbN1qI9xDkGu3jpAoCG2ymuwvsa3stIFHRPtVuxF1YcLJL7
 WbNb+F3B0JWGmQ0GpVHu5GmIBPqLuDcZXyAj75lcQ6tm2zSWIvKKEekje5//2z89bsjU
 Si3j5gZS4pQhkC34dO3N/ybu9MchkNT0ACStYgUbkoxahmj8hg8a4gVVyK1JtaHr5Us9
 PPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747901561; x=1748506361;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2AQTPTllC/YXTyTGWiVggK3t5QseTYdpGef7t2eK3FU=;
 b=NK6QxLIN84PyAkMxgzOXbaUIR3XUG34cm/ugGIOZH0gnYhF18g5yLWdsn5vdIAELoE
 IAc/61fGGl9J+JO4uBPapo7okvPcKN+6q7vxdgXvSmoohk30cRqGuNKnihaBGniBGrr1
 NhpWMN1mQcXFptDelzaeEV2u8mlmCNrBTB63arTpM8GPMZgsncindxKv8TYKvDSCQYQI
 Poi7w6mFlFVEbC/I5YKIaQRGggPRiNR5Q9BcO+C89mXVKwzfpOG0QPUlFP71rgZwhuL1
 MYqZQ1jdrhDY1sujSyHpRSIahoYMG6BAlBb5Bu5QD3jT1MdGF9PASfT4ure+djTEH7Tf
 zCkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZIuGJ4exC/LVuJmTYdpgTmceWcOTYet7FNKsNS5YaKBpRL20pm3PxK1mu2BtZmg3x6uTzCD7kAMo7@nongnu.org
X-Gm-Message-State: AOJu0YyI6BwQTTf9JnrZSk+wGlrKyDJtmx/nf0HWpsPLFuJPBlll5bNT
 LLT7cfcNAyd5wsQux+O3k7pDg2lAaryrFaBrE631uXAgyjdUx+HY5wnUfV4j0R/16Kc=
X-Gm-Gg: ASbGnct7cCrP2U9NR85N1tpM57d7tT4d1LIO0UEs4zW/EgragWxTYKt0IO0tAs6MqK/
 +2AJdx9sSXWWupWffwS9RpqaD+dTbMZt2pWDFfMCumxd6wH/T3ddMjCED5UHN9CGv9w41LS8KKr
 dIgiKWncBRQrtIuTco8jNYuIPA7BHvU5W1WpnrZhLfeI1SAzuBIi9WBSnQH0DMgTwkrk1Xy405i
 paqQybrbBFL+ed+6FCNoZye924tCXQabPea+f0pFsCDVmxlAcUvu9fh2Xn8tv8s0J5OrjFK6l+y
 2s3S1BcONxXHwxuSUouGu3hnmva8uCV4u70ZpdNIQywJIMi3rVqyBpv9ohRlI2lVsVI6HvTBoty
 W+gsB+ndL+ZBbzZ2palJLb03s+Q==
X-Google-Smtp-Source: AGHT+IEw2fGdePqrIK7OTux3b0zq4OOg0J3KMv/eYyVwhp9sbp/JInDBdyJEghAQA18ECEeGGfhYwQ==
X-Received: by 2002:aa7:88c8:0:b0:742:8d52:62f1 with SMTP id
 d2e1a72fcca58-742accc545emr36491022b3a.8.1747901561135; 
 Thu, 22 May 2025 01:12:41 -0700 (PDT)
Received: from jchang-1875.internal.sifive.com ([136.226.240.172])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a9829b87sm10775851b3a.114.2025.05.22.01.12.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 May 2025 01:12:40 -0700 (PDT)
From: Jay Chang <jay.chang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jay Chang <jay.chang@sifive.com>
Subject: [PATCH v4 0/2] Extend and configure PMP region count
Date: Thu, 22 May 2025 16:12:34 +0800
Message-ID: <20250522081236.4050-1-jay.chang@sifive.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=jay.chang@sifive.com; helo=mail-pf1-x434.google.com
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

The first patch extends the number of PMP regions supported up to 64,
following the RISC-V Privileged Specification (version >1.12), where
RV32 can have up to 64 PMP regions configured through 16 CSRs.

The second patch makes the PMP region count configurable via a new
CPU parameter `num-pmp-regions`. This allows platforms to adjust
the number of PMP regions without relying on a fixed default value.
If unspecified, the default remains 16 to preserve compatibility.

Change log:
  V4:
  * Changed `pmp_regions` type from `uint16_t` to `uint8_t`
  * Introduced `OLD_MAX_RISCV_PMPS` macro

Jay Chang (2):
  target/riscv: Extend PMP region up to 64
  target/riscv: Make PMP region count configurable

 target/riscv/cpu.c                |  54 ++++++++++++-
 target/riscv/cpu.h                |   3 +-
 target/riscv/cpu_bits.h           |  60 ++++++++++++++
 target/riscv/cpu_cfg_fields.h.inc |   1 +
 target/riscv/csr.c                | 129 +++++++++++++++++++++++++++++-
 target/riscv/machine.c            |   3 +-
 target/riscv/pmp.c                |  28 ++++---
 7 files changed, 262 insertions(+), 16 deletions(-)

-- 
2.48.1


