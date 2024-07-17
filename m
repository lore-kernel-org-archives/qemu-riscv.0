Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22470C3DA4B
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 13:40:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sU4sq-0008R5-0d; Wed, 17 Jul 2024 09:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sU4sn-0008L0-QA
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2024 09:39:49 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sU4sl-0007QV-Ve
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2024 09:39:49 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-78aeee1068aso3540382a12.2
 for <qemu-riscv@nongnu.org>; Wed, 17 Jul 2024 06:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1721223585; x=1721828385; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6iQEcEdK2rJ0EkOTo/BBteq5KGoTSIo2iyL+QTvd6mc=;
 b=mJqFFsA3KeCPMAk01sJ7de9d3ZSGwtHrbFZaDg0eBiEwFqnIK1qjFfH2/hg5GR0PeF
 2aOKxKASOXS5OdJUkPmvW4gtbano3f8dxIZ5b/hwxVa/rK/9Cnr0C3iyXmTP8TDV5uNB
 1W/jQuLz0OmYFsB31pq6XWBSiZFrh466NRzdTR67nAE/UiMr13dhH7ybRV/jtoLCpEw3
 VCth1825risGW3/rdnuHYTROzH7sYVAIVd+b/WygpfDOov/SXgJSIixg75dtssXalWUB
 SEdQxJjdq/1mQ+y4mzFPaLrRbqkxZcrJ0l03QTwSsJLAEBZXkvenctr0gh+0aZUyx+3E
 Md6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721223585; x=1721828385;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6iQEcEdK2rJ0EkOTo/BBteq5KGoTSIo2iyL+QTvd6mc=;
 b=b7p0AuUUFUdIy2SmGQvZPymevV8Hhvqht0d7DhpQD3lmgqkuOfwcHbZ1pN+vgwQx0R
 JWOyWdkD8vxrCCAZYZuKuvOrJJKJwoxLfoV6G+eVBxNpX8kwsXBG9pdBer/LP3JFkl1X
 DDDr1vT+J0M1d8DhbB+Pe+R+hEyPjSxiMC2+/M8jWlbbtE5G/QoftD3XkqKDkGvsVduR
 gfc4a9gqpKw4NcMTHrZG5HkvRCfb+MSXSW7wCymgBTDQmjV6FmSxT+MUW2Vhp3uIPnDM
 e7Xgu39G0A//X7CjXAiiQTIgLpsteONnKGl9wxCwr4Vtb8eKreRa+Ma5GrgWo2WD8TbP
 PJ6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE11ljxU1CE0laxN25S+jiHRsyQ+V3FJn6FO0dg8OTRaWphMrKRjMIHdG8Mbvp2Y2KK9SASvqh1wX0XYM1LDi0CdzLWcE=
X-Gm-Message-State: AOJu0YzxQk9Ad01S5TpQP3s22FpMu4O7iBHrjUf9YkDxvMTV4MxAFjAR
 Kfpat2Bj0zO9lwMcZnsgHmjyASMnvZQ+9M64fcskQNMwb5U2CF8pBWbLlwCJUfY=
X-Google-Smtp-Source: AGHT+IE5Qh+iAyHsbJEDaov8fcucnztXOOU9nd4u5kMgWOBWt1lnUMIaDR0OWBnXxt5KbMgUzzm3oQ==
X-Received: by 2002:a05:6300:4041:b0:1c0:f0ad:6ca9 with SMTP id
 adf61e73a8af0-1c3fdd79e6dmr1446790637.58.1721223584743; 
 Wed, 17 Jul 2024 06:39:44 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc5aa6esm74903495ad.299.2024.07.17.06.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 06:39:44 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH v5 0/5] Improve the performance of RISC-V vector
 unit-stride/whole register ld/st instructions
Date: Wed, 17 Jul 2024 21:39:31 +0800
Message-Id: <20240717133936.713642-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x534.google.com
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

This version provides subroutine to iterate the load/store operations
per page and replaces the original continuous load/store loop by the
memcpy call.

And thank for Richard Henderson's patch set to the user-only munmap
race issue, this version rebases on it and apply the
[set|clear]_helper_retaddr calls.

I'm preparing the v6 version that will include
* Improve the vector unit-stride fault-only-first load instructions
* Try to handle the watchpoints by hand to increase the possibility to
    do host direct access


Some performance result of this version 
1. Test case provided in 
    https://gitlab.com/qemu-project/qemu/-/issues/2137#note_1757501369
    - QEMU user mode (vlen=512):
        - Original:   ~40.1 sec
        - v4:          ~4.7 sec
        - v5:          ~2.9 sec
    - QEMU system mode (vlen=512):
        - Original:  ~112.5 sec
        - v4:          ~6.5 sec
        - v5:          ~3.1 sec
2. SPEC CPU2006 INT (ref input)
    - QEMU user mode (vlen=512)
        - Original:   ~37.4 hr
        - v4:         ~12.2 hr
        - v5:         ~10.0 hr


Based-on: 20240710032814.104643-1-richard.henderson@linaro.org

Changes from v4:
- v4 patch 1
    - Queued
- patch 1
    - Separated from the patch 2 of v4
- patch 2
    - Remove mask bound checking flow
    - Provide a subroutine to iterate pages accessed by the instruction
    - Add [set|clear]_helper_retaddr to avoid the munmap race issue on
      user mode
- patch 3
    - Apply the subroutine to the unit-stride whole register load/store
      instructions
- patch 4
    - Replace the original loop by memcpy call when the endian of both
      host and guest are the same

Previous version:
- v1: https://lore.kernel.org/all/20240215192823.729209-1-max.chou@sifive.com/
- v2: https://lore.kernel.org/all/20240531174504.281461-1-max.chou@sifive.com/
- v3: https://lore.kernel.org/all/20240613141906.1276105-1-max.chou@sifive.com/
- v4: https://lore.kernel.org/all/20240613175122.1299212-1-max.chou@sifive.com/

Max Chou (5):
  target/riscv: Set vdata.vm field for vector load/store whole register
    instructions
  target/riscv: rvv: Provide a fast path using direct access to host ram
    for unmasked unit-stride load/store
  target/riscv: rvv: Provide a fast path using direct access to host ram
    for unit-stride whole register load/store
  target/riscv: rvv: Provide group continuous ld/st flow for unit-stride
    ld/st instructions
  target/riscv: Inline unit-stride ld/st and corresponding functions for
    performance

 target/riscv/insn_trans/trans_rvv.c.inc |   3 +
 target/riscv/vector_helper.c            | 482 +++++++++++++++---------
 2 files changed, 307 insertions(+), 178 deletions(-)

-- 
2.34.1


