Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQTa0-0005Ip-Nv
	for mharc-qemu-riscv@gnu.org; Fri, 10 Feb 2023 08:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTZz-0005IY-Lp
 for qemu-riscv@nongnu.org; Fri, 10 Feb 2023 08:36:43 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTZx-0007Th-V2
 for qemu-riscv@nongnu.org; Fri, 10 Feb 2023 08:36:43 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-15fe106c7c7so6639531fac.8
 for <qemu-riscv@nongnu.org>; Fri, 10 Feb 2023 05:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bfD+6csXDxuzwnT7hlSofZkdJy1bIhG8BMRkMVM4vV4=;
 b=WuIJRhys+a2lWjwczwKNlCNS4QRlxnPRNawzv0Vk8DGUvjALAJQGeE0xQAS4o5axVy
 gPGGtziMA98HRJOQyDBbs4fuices5TVUpDch7r6u87lMitMEoFwKy8TN39jPUF7AaeqD
 fn6bVxQe+y/qfZpsKZogkF5oF7p3r0G7A4Ec5KaiExM0zUkqiMeI0xNurE3l9Bk4k+zY
 8WSyNIsyE3lKyuRhOA/hWg7XY3HYnyBHC5ZHjz4NpyA+DIRg1aLSXR8pBK6WL2hUtRET
 RfBWavXSvI55J1BnmrQsOsgt4E6cSJ5SufaTJiMFbU20F7i+1ghy0StKFbLhSi5KwDgi
 AqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bfD+6csXDxuzwnT7hlSofZkdJy1bIhG8BMRkMVM4vV4=;
 b=f4zjHeaPX8zjEcsgYT3djClVx/7nAjjyaRghUR6zf8N61NZdACet+nVKNlbKv2x8JX
 32nXj/XoaaN24Q/U0y/LKYHIVzpFbrm8frmbvBY5eUZH3r1gJO5fHAGUG5OPT+6SxR/P
 u3KZ+FIBOoCXFGGoqsjHYIRe1BRAvquHz52p0uFzLmpZc/9ZFyKKIlXWS8+9SDh0Ymbb
 D4PXb9dpn9TvRlKByFnqcg8xhoSobN0ePORbCyuvHKfnb9ttIXaQv3vqjSDmlaVABxiD
 HQmCV3IATceA3gIRwD+QCSyZVkpRRtc90Wa2AW6ZKbHW/QKlDWtYJveVHbgHXFgDRQiy
 hQfw==
X-Gm-Message-State: AO0yUKWxyJewthdlKQxkHHsKU8iUkM8JmJZwJbVYFtP95hgG0Zi+Q+ac
 itOMqmdInPxLsRqfhK9rwjEDCA==
X-Google-Smtp-Source: AK7set9lH7vYSZE30cUA5rWgn51s9jCBXVvtCpWM49KNoZx/Gk48DHLnx+DmGCBkb2dU3eHZ0MbTjw==
X-Received: by 2002:a05:6871:9a:b0:163:a45a:9e3e with SMTP id
 u26-20020a056871009a00b00163a45a9e3emr9628076oaa.21.1676036200468; 
 Fri, 10 Feb 2023 05:36:40 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a05687050e400b0014474019e50sm1890570oaf.24.2023.02.10.05.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 05:36:40 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 00/11] enable write_misa() and RISCV_FEATURE_* cleanups
Date: Fri, 10 Feb 2023 10:36:24 -0300
Message-Id: <20230210133635.589647-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
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
X-List-Received-Date: Fri, 10 Feb 2023 13:36:44 -0000

Hi,

Initially this was supposed to be just the first 2 patches, where we
enable users to be able to actually write the MISA CSR (yes, at this
moment all the code in write_misa() is a no-op).

During an internal discussion of that code, Andrew Jones pointed out
that I was setting RISCV_FEATURE_MISA by just mirroring the value
already set in cpu->cfg.misa_w, and asked why that was necessary.
Instead of replying "I'm doing it because it's being done for every
other feature in that enum" - which was the truth - I decided to take a
closer look.

The RISCV_FEATURES_* enum and the CPUArchState::features attribute were
introduced 4+ years ago, as a way to retrieve the enabled hart features
that aren't represented via MISA CSR bits. Time passed on, and
RISCVCPUConfig was introduced. With it, we now have a centralized way of
reading all hart features that are enabled/disabled by the user and the
board. All recent features are reading their correspondent cpu->cfg.X
flag.

All but the 5 features in the RISCV_FEATURE_* enum. These features are
still operating in the same way: set it during riscv_cpu_realize() using
their cpu->cfg value, read it using riscv_feature() when needed. There
is nothing special about them in comparison with all the other features
and extensions to justify this special handling.

This series then is doing two things: first we're actually allowing
users to write the MISA CSR if they so choose. Then we're deprecate each
RISC_FEATURE_* usage until, in patch 11, we remove everything related to
it. All 5 existing RISCV_FEATURE_* features will be handled as everyone
else. 

Note: patch 6 is adding an error message that will fire a checkpatch.pl
warning (82 chars). The following patch will put the error message back
into the acceptable 80 chars range. 

Daniel Henrique Barboza (11):
  target/riscv: do not mask unsupported QEMU extensions in write_misa()
  target/riscv: allow users to actually write the MISA CSR
  target/riscv: remove RISCV_FEATURE_MISA
  target/riscv: introduce riscv_cpu_cfg()
  target/riscv: remove RISCV_FEATURE_DEBUG
  target/riscv/cpu.c: error out if EPMP is enabled without PMP
  target/riscv: remove RISCV_FEATURE_EPMP
  target/riscv: remove RISCV_FEATURE_PMP
  hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
    create_fdt_socket_cpus()
  target/riscv: remove RISCV_FEATURE_MMU
  target/riscv/cpu: remove CPUArchState::features and friends

 hw/riscv/virt.c           |  7 ++++---
 target/riscv/cpu.c        | 20 +++++---------------
 target/riscv/cpu.h        | 29 ++++++-----------------------
 target/riscv/cpu_helper.c |  6 +++---
 target/riscv/csr.c        | 17 ++++++++---------
 target/riscv/machine.c    | 11 ++++-------
 target/riscv/monitor.c    |  2 +-
 target/riscv/op_helper.c  |  2 +-
 target/riscv/pmp.c        |  8 ++++----
 9 files changed, 36 insertions(+), 66 deletions(-)

-- 
2.39.1


