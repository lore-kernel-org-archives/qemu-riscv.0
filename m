Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AD5C36008
	for <qemu-riscv@archiver.kernel.org>; Sat, 29 Mar 2025 14:47:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tyXQh-0007sM-Ba; Sat, 29 Mar 2025 10:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tyXQf-0007rS-CC
 for qemu-riscv@nongnu.org; Sat, 29 Mar 2025 10:44:57 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1tyXQd-0004DX-IN
 for qemu-riscv@nongnu.org; Sat, 29 Mar 2025 10:44:57 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2ff85fec403so8319887a91.1
 for <qemu-riscv@nongnu.org>; Sat, 29 Mar 2025 07:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1743259493; x=1743864293; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zM2u2LTkRWOnZXtO1N1ga0RMqgVI4wtD5r/xNpvZR/Y=;
 b=WXgg0gxN9ufc172r18+p7HhRNSFYMvjh/Lz0njfUKUEyhIrrXXzVPMqLK8O3WFx0V4
 QW7N/9St+UIHGjP2JB3el9A1/x0wBvgG7nhmbgezty9a96bR4KN0zoGQyqt0qVZLMxiy
 xyPYkrt5PbybU4ZfFdvNuiH7S7kg5T0ikwA5xU+ReAmQHzS4pgXcblQpeQa/AbUEHlfh
 9ak4oEnBcSzgRpxZ/8ACbn/ZAOZkhLIWUQBJiaUJ1o097BuyYq8ecEWp2d+J4vLWXSj4
 IJImdJ3u79IXdCNf/l1k2ljjaeejq7oLmgK+SpR04tgpcFW11i4E2R2D52QyLtsYdrap
 x5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743259493; x=1743864293;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zM2u2LTkRWOnZXtO1N1ga0RMqgVI4wtD5r/xNpvZR/Y=;
 b=KaZQsIrfxHgiwMeD+nKcyHXXzYNtmE2qbNyK+PziAx2kP/+d6h5XY3kC9tU23/VEtO
 j8zAFvwiSRf7QtieQ4cerEyFV4jbM9qVzy56whpIYObudT+FHSyooyT491qEMX4hyM2K
 56v7UI5HPRhccrsr0uqjEMsuvGwEzdY7appwfIKLjhjwjQAmEokM+CJ3f4RwUd8b6R/e
 OdrqQpmdY5ISJYlMXwMsTATlhj+rnffWNk8W6J8FWY0SdQAs/R5KHwwtTFFMEEsPsOrk
 +K4+rVz6g1SxE1CX9vtQ1k1SIIXCvAMQ687Jfa699Htxl2HiVkSsKi/qRlGfBlWtffDt
 zh5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUCWLyl5WRKcQjFBgALg5QowvBIUBZE2bGmjGlbbTggZsMNNNDrFncUlidcUp+BWNCB4lN4aVQaJY4@nongnu.org
X-Gm-Message-State: AOJu0YxU1Bz4Qf3Zv/B44i3NZ/wmujl86Boi5TuBjfuFJET99b2kVDAs
 +SxuE29TAvSkxJyC8rWzpKN6PtnP5DpsQn0SHnZrztZn6NX5zebUOI0UOej/jzg=
X-Gm-Gg: ASbGncscnBC3OpdIJX1IRZnFMNvzhlbw1w744MJaAsnjFxGtGfygtAyREdigIcBUvSM
 Xc5Vziir9yNSEDmPNUsZ+swzWLGlsSn9SjT/9Uqfz+w9DE0TmfaIdNW7+WhYa09neR4SySWeqvn
 WyUc6NRqTEmUrGNbvpSOJC94KDooVGQeQIqM6WoNqc3vy3rxr8Bnhb+eWGsRVrSh7/os8ZLDje2
 uejNxyaZfmpjRtvxYQA7VA6YhPOhJtJe1j/CNwqQntYcf9QS0ZrN4vQIJ68rp1xQB6NUitcmQW1
 IrCLAPYO2LTG2wEf41dKrdkers3hMbHKyevwxqhi3UuiPdx1RDlSANoIUcxRgN8tEUK2FnjBUEU
 GRh5Zndw7zkYJkg==
X-Google-Smtp-Source: AGHT+IG8lTBMNsyvG1bgKegabKsHhXv4wTPfqZc0h5zbPMHa98IHRQ/OPC+b2xOYCRQEXikqcAbGcg==
X-Received: by 2002:a17:90a:c887:b0:2fc:aaf:74d3 with SMTP id
 98e67ed59e1d1-3051c85e2a7mr10433961a91.4.1743259493264; 
 Sat, 29 Mar 2025 07:44:53 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3039f6b6bcbsm6737196a91.45.2025.03.29.07.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Mar 2025 07:44:52 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, antonb@tenstorrent.com,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH v2 00/12] Fix RVV encoding corner cases
Date: Sat, 29 Mar 2025 22:44:34 +0800
Message-ID: <20250329144446.2619306-1-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x1035.google.com
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

This patch series fixes several corner cases of RISC-V vector
instruction's encoding constraints.

Building on Anton's original work, this v2 series specifically
addresses:

1. Illegal overlaps between source registers
2. Corner cases in complex vector instructions like vrgatherei16
3. Handling of register overlaps in vector widening/narrowing
instructions
4. Fix unmasked RVV instruction encoding (e.g. vcompress.vm)


Anton Blanchard (2):
  target/riscv: rvv: Source vector registers cannot overlap mask
    register
  target/riscv: rvv: Add CHECK arg to GEN_OPFVF_WIDEN_TRANS

Max Chou (10):
  target/riscv: Add vext_check_input_eew to check mismatched input EEWs
    encoding constraint
  target/riscv: rvv: Apply vext_check_input_eew to vector register
    gather instructions
  target/riscv: rvv: Apply vext_check_input_eew to
    OPIVI/OPIVX/OPFVF(vext_check_ss) instructions
  target/riscv: rvv: Apply vext_check_input_eew to
    OPIVV/OPFVV(vext_check_sss) instructions
  target/riscv: rvv: Apply vext_check_input_eew to vector slide
    instructions(OPIVI/OPIVX)
  target/riscv: rvv: Apply vext_check_input_eew to vector integer
    extension instructions(OPMVV)
  target/riscv: rvv: Apply vext_check_input_eew to vector widen
    instructions(OPMVV/OPMVX/etc.)
  target/riscv: rvv: Apply vext_check_input_eew to vector narrow
    instructions
  target/riscv: rvv: Apply vext_check_input_eew to vector indexed
    load/store instructions
  target/riscv: Fix the rvv reserved encoding of unmasked instructions

 target/riscv/insn32.decode                 |  18 +--
 target/riscv/insn_trans/trans_rvbf16.c.inc |   9 +-
 target/riscv/insn_trans/trans_rvv.c.inc    | 167 +++++++++++++++++----
 3 files changed, 154 insertions(+), 40 deletions(-)

-- 
2.43.0


