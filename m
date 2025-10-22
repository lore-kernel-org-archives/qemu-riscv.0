Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC03BCCD1A5
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 02:28:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBOYv-00073b-7K; Tue, 21 Oct 2025 22:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1vBOYr-00073E-Fw
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 22:26:50 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1vBOYp-0000xh-HW
 for qemu-riscv@nongnu.org; Tue, 21 Oct 2025 22:26:49 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-27eec33b737so94883095ad.1
 for <qemu-riscv@nongnu.org>; Tue, 21 Oct 2025 19:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1761100006; x=1761704806; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BggvODyv+V6+7dTdUyhB+wxSw41sK1/lfcBOB7MlUHw=;
 b=ZD13L5cjY9xI7EVG5Z/H9HiGLYa23ncNQtt7DC+H9PYY5+7NoDmKmJ64upGz9xebcp
 bHpbM54SVcAaLufQ/XgWHCYYF6Ku1qZstsoXCLZu5IJE1RFwwpTl5ps3Bsr7SFxu/D2y
 LwWfDozHHu/2ZHAf1BPL0og5gxoLhpLtM/ge2NVU8oF6wlgDMDXFKaYx5LYmlQ4mifSn
 rmp6RHWiyjWVwmEYUTJ8nl6IZnQ3f/gLCQzfVUtjz5lMenpBpxiTmQxCMIV6cktJd85w
 kO7YS/Yg8wkuBawCdf1FkB7SlkvBGJBKMrOquEeaUWzjda6UQbMM4NbxY8OhuMHM61ek
 cqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761100006; x=1761704806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BggvODyv+V6+7dTdUyhB+wxSw41sK1/lfcBOB7MlUHw=;
 b=U47mIGLxXu/AKSiBIyFi3L/dYfLv+lI9phPxUvlf1VE37z85uLKWzd02EGXS1LE8mq
 WfKA3DKhPW72IxRt17ful5GiSVVfA2BvLG4it3W7vquV082V3M1LY88ky5nfrA2QpvWP
 ErOayZXp065JL9a1QYehNammKV49bXnYlvryvy1lm7MISAvYzXy/NrRMlYJFFF4Y+JZO
 kiyYg1dC3vTQnL1CHv1vlCUpnrszRlaW+5YmR21cJfmZVubQj5+S9Et0e7RnlPyuEYyC
 fzZAAdQfPOC5pVp/STB/Wi6BvnZxXC2d9NmPNwZk6VtzZl9WYm+aoBferNyyYTfOJdRi
 1U5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7ASkIbCfGG6xXoFcoYOMtdMpWj6yt8HDx5MZmj9AARprn44kVWUhsxcXpgEh/StiXEeJXjNCzN2Cq@nongnu.org
X-Gm-Message-State: AOJu0YwqU/uquOR7tql6TUpE4Sgkp7rIy4NLJib1t5O+NmArpiFn6I0d
 GlOwHkOd+LOZFx1igyiMRw6FmBO5EFQuBuWrnAFE2r+Kfzpoz0VU9lg00+aRMEfl688DBfaD09Q
 E9Udp
X-Gm-Gg: ASbGncuZqUVWUktABPi2h3nQq14iVUvHGYICC+WFCInybMrhvIiTK7Folv7p3PRCsQd
 Q4+kxV1ul3tqKqfrtMHD4PxiOBUwDu2I7lVdnpQTjivO9uWy1eWTEpgYPhJBCYQds0Upcv/GqZ1
 873SWpclJFaMAwcw1aNi0PKT/AnD9BnqyvYwvJVGJTYbAPI2UDi/zFngRdsHszjNQhEeD0SaQR/
 LOXs/c1nZItJVlSdDYpEz0wiBOhbdVvUXw02l28t/Awa8BAZkQg7zzOZ32y9ZNDlMtO1ATCqeGD
 rT/+yPmiEZKK/AvfEvQxjfh5EaFK/c5fnqQ2Y2Dkfekq3t2MxcZX9kQC0Qnbx1WXai4I91PHtpA
 hhqw9rnT9UkaxqlAmJE2ztdBfRTgBQM0JYx2nXxTr9CgxbAzF/SpUqSL9pYj0YZTuW0w3Ka0yiy
 gKYowONonhkGdpy1EFoGZDzI98Hi/OQ+OdjFaRwZ9eeFFFwcL6VA==
X-Google-Smtp-Source: AGHT+IGd+HxTJv0vOieGQBPeNQ348OwYAyDSOenacuD25MDOxBolBc4hwVvWnYgMGR2AhmCdQiUFHQ==
X-Received: by 2002:a17:902:e944:b0:290:c76f:d2ad with SMTP id
 d9443c01a7336-290c9cb6b61mr241086065ad.19.1761100005889; 
 Tue, 21 Oct 2025 19:26:45 -0700 (PDT)
Received: from jchang-1875.internal.sifive.com ([136.226.240.196])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2930340092dsm4673545ad.42.2025.10.21.19.26.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Oct 2025 19:26:45 -0700 (PDT)
From: Jay Chang <jay.chang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jay Chang <jay.chang@sifive.com>
Subject: [PATCH v2 0/2] Make PMP granularity configurable 
Date: Wed, 22 Oct 2025 10:26:26 +0800
Message-ID: <20251022022628.41307-4-jay.chang@sifive.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022022628.41307-1-jay.chang@sifive.com>
References: <20251022022628.41307-1-jay.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=jay.chang@sifive.com; helo=mail-pl1-x633.google.com
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

PATCH v2 update
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


