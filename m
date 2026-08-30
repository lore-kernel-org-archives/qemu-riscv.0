Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BD2C61DD9
	for <qemu-riscv@archiver.kernel.org>; Sun, 30 Aug 2026 16:04:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0i0b-00060l-2n; Sun, 30 Aug 2026 12:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x0i0Y-00060F-Lr
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2026 12:03:46 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x0i0W-0007hj-Lm
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2026 12:03:46 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-851cbd64814so1056325b3a.1
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2026 09:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1788105822; x=1788710622; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=4/Mt6EYU17EVtqbOmrXe+oIOnepyoTf2cyDH6lrZC1k=;
 b=P6Qr5SDsgbZBbIAthk9pXS4bYwsbEzlYqOjV7cuKsKKbkbFnp1qfFIcbRLV6Phqkvf
 SGZPQWhMytXlTl1cx2KwVxZCD+cCzBp5yXrgIP2cf3qgn+lssj6Ttnl5Gn7fy82bZq7t
 JxjlsQsslZ4AYUWZoQ9Nwh1Lzl3N5N4ex5WapsknhjtaeCPQpNfangZpXINHyIj3iOgo
 UUyPT75iWanKU64D9YCJdhoDVbfAr+TN/vm2xOEer1uBBr4N45qDiI8arrQVazh2t6Wk
 7RQAS5r7gqJqmSpfa50WZ/gdh+uZm83IzHSRKORsIBAKw5StvALX4JPdhOu6HzfE8sws
 ohPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788105822; x=1788710622;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4/Mt6EYU17EVtqbOmrXe+oIOnepyoTf2cyDH6lrZC1k=;
 b=PeSsPJlSz+aECsPLoZ8o768aH8M/SXp1q8otTK+M4Z/YIzSJX6nBhXxXCmGhn0aWvv
 y30XiELzxwF3+7iIrf+1R1I1cA6csoWK2LvuCBLAg2ZKhOd9Gy8GGdxvtEJJbFBtlqpv
 KodEyOo71tF9hp7BCbzF0bY+BJu9KQBduiehaeVcZpStiKlc5YIkTqwDi9Zyicr7+Nb4
 z9Q1936OdnRZps4tXmuaMMcANoklU+i/WdHK26YYZ/s12ldCQ+PZNyOEKzyqBnPDHWd2
 4UYQYcpmc1pCapunsTwCp1e9w3Q+GEG22ZAbNQiVU2wETrCSD+A4zzGUeIRXC0PQhlvR
 70Qg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoLm6kTu7fQXJuZ3ncAf2X/6gyOwnB7AV0EBrbYqS3pwyRDZ3nVdvmDoa3ILtwm23Ih+qgzcWXyaGoh@nongnu.org
X-Gm-Message-State: AFuF++kVVEYjO0oJwLgrX/QztnVO7fAgOgYjjmiAOBRH2w7h04Yyhl7A
 HK3fN7dEj0B+b3grggd2CflOWOuW8u4t6I+r3gCq2JpXZm45hSrgNjy0Q++aUUaIJsc=
X-Gm-Gg: AR+sD13nbx1oiSvwTPeNxBbAPwVA3Tmc8SwRHQ/zqYzJ9A4yfNQi8yUnKAMeTZ744Aw
 Mk50r4+3EJL1ctbxEgQAiFqdC3H6GyTXUyEBo5sdBXNYyrevKlmArYrLpGsD7nkDd8GbgaDkM0U
 9XrA8nHoTolzal3KWdI9wgLoxfgDwz5gXbCO0CIgAm/JFNqFEGPG+Nn2T804UlselNddBis01QS
 EJZDhyiojF2Aq9C1OwYmOaOwpj/iHjddy5iwa8PFt1Xu9s8X/Yn9CGG7zEdF0ZFTwANUFwxA7wo
 Y50SQ8WrShhD3RS8PIMkXClHsJkqdvITnbsMv0aieXesg3lsCsSC7cwJd8XjtKTZxEvckMBkwE6
 lk8klheS19l6MF8NS4/TWVH9CQzFezJHA7MXYA9CHkLi68poOuzO8iurqnYFUlYi+BwsAiIjUBE
 hfDDb1JMY6GRNUKzWCL2m0idk3n8bfYxQ1IVC64MhhDHuWbkBGeH8jXusJ0eyYwI4URe35h7vsF
 tJtWlPd+ANLizJk5E9/RYP9XkCuwWXft7IPxYokToERShYiSg8HByHaDhhHhsw=
X-Received: by 2002:a05:6a00:130d:b0:857:73e2:9104 with SMTP id
 d2e1a72fcca58-85773e292ffmr16842355b3a.20.1788105822524; 
 Sun, 30 Aug 2026 09:03:42 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8569ff701d5sm2455900b3a.25.2026.08.30.09.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2026 09:03:42 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Chou <max.chou@sifive.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v3 0/6] target/riscv: Add SiFive Xsfvqmaccdod/Xsfvqmaccqoq
 int8 matmul extensions
Date: Mon, 31 Aug 2026 00:03:29 +0800
Message-ID: <20260830160335.3441069-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x42e.google.com
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

This patchset adds SiFive's custom int8 matrix-multiply vector
extensions Xsfvqmaccdod and Xsfvqmaccqoq. Each extension provides 4
signedness variants (unsigned/unsigned, signed/signed,
unsigned/signed, signed/unsigned) for a total of 8 instructions:
sf.vqmacc{u,,us,su}.{4x8x4,2x8x2}.

The toolchains support Xsfvqmaccdod/Xsfvqmaccqoq extensions:
 - LLVM 18.1.0
   - llvm/llvm-project#68295, commit d1985e3d1fed, merged 2023-10-20.
   https://github.com/llvm/llvm-project/pull/68295
 - GCC 15
   - commit 139bd3198a73 ("RISC-V: Add the mini support for SiFive extensions"), 2024-11-17.

References:
 - SiFive Int8 Matrix Multiplication Extensions Specification
   https://www.sifive.com/document-file/sifive-int8-matrix-multiplication-extensions-specification

Changes since v2:<20260812174417.2468981-1-max.chou@sifive.com>
 - Rebase to riscv-to-apply.next branch (commit aee18ec)
 - Modified patch 5 to align the new disas flow

Changes since v1:<20260721122034.1567146-1-max.chou@sifive.com>
 - Rebase to master branch (commit 84f0721)
 - Reformat riscv_multi_ext_implied_rules to list one rule per
   line before adding XSFVQMACCDOD_IMPLIED/XSFVQMACCQOQ_IMPLIED, so
   future additions to the array are a pure append instead of
   reflowing whatever line they land on. Split out into its own
   patch. (Thanks for Daniel Henrique Barboza's suggestion)
 - Move the SiFive int8 matmul helper out of the shared
   vector_helper.c and into a new target/riscv/tcg/xsf_helper.c,
   so vendor-specific code no longer lives in common vector-helper
   code. (Thanks for Daniel Henrique Barboza's suggestion)

rnax

Frank Chang (2):
  target/riscv/cpu: Add SiFive custom int8 matmul extension implied
    rules
  target/riscv: rvv: Add SiFive custom int8 matmul instructions

Jason Chien (1):
  disas/riscv: Add disassembler support for Xsfvqmaccdod/Xsfvqmaccqoq

Max Chou (3):
  target/riscv: Add cfg property for SiFive int8 matmul extensions
  target/riscv/cpu: List one implied-ext rule per line
  tests/tcg/riscv64: Add tests for SiFive int8 matmul extensions

 MAINTAINERS                                 |  10 +
 disas/meson.build                           |   3 +-
 disas/riscv-xsf-op.c.inc                    |  11 +
 disas/riscv-xsf.c                           |  49 ++++
 disas/riscv-xsf.h                           |  16 ++
 disas/riscv.c                               |   2 +
 disas/riscv.h                               |   1 +
 target/riscv/cpu.c                          |  80 ++++--
 target/riscv/cpu_cfg.h                      |   5 +
 target/riscv/cpu_cfg_fields.h.inc           |   2 +
 target/riscv/helper.h                       |  10 +
 target/riscv/meson.build                    |   1 +
 target/riscv/tcg/insn_trans/trans_xsf.c.inc |  98 ++++++++
 target/riscv/tcg/meson.build                |   1 +
 target/riscv/tcg/tcg-cpu.c                  |  16 ++
 target/riscv/tcg/translate.c                |   3 +
 target/riscv/tcg/xsf_helper.c               |  87 +++++++
 target/riscv/xsf.decode                     |  30 +++
 tests/tcg/riscv64/Makefile.softmmu-target   |   7 +
 tests/tcg/riscv64/test-xsfvqmacc.S          | 260 ++++++++++++++++++++
 20 files changed, 677 insertions(+), 15 deletions(-)
 create mode 100644 disas/riscv-xsf-op.c.inc
 create mode 100644 disas/riscv-xsf.c
 create mode 100644 disas/riscv-xsf.h
 create mode 100644 target/riscv/tcg/insn_trans/trans_xsf.c.inc
 create mode 100644 target/riscv/tcg/xsf_helper.c
 create mode 100644 target/riscv/xsf.decode
 create mode 100644 tests/tcg/riscv64/test-xsfvqmacc.S

-- 
2.43.0


