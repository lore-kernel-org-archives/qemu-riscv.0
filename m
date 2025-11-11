Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F79CCFA18
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 18:31:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vIt8Q-0006aJ-He; Tue, 11 Nov 2025 13:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vIt82-0006E1-70
 for qemu-riscv@nongnu.org; Tue, 11 Nov 2025 13:30:08 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vIt7w-0007fo-0X
 for qemu-riscv@nongnu.org; Tue, 11 Nov 2025 13:30:05 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-7b7828bf7bcso20346b3a.2
 for <qemu-riscv@nongnu.org>; Tue, 11 Nov 2025 10:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1762885797; x=1763490597; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vpp9z0s0YDFeqz471tGX8huKPGNyqldTray744E+pAY=;
 b=fpnhlVJMyKbESuRITcgZlOVoLk2AwuNpv2zRXGwxAyQiA6q58Ej05bzLy+sILdluSn
 KDAEkrl3c0oEVchrSsC6WTsrfgzMHQ15jxcHiLJCVWINyfhntExZUZQvyfMn87NirwR4
 iTOJxV1sK6DpLvzaKRyJ1pLkW2o0slk+pielIKOilpUqwEn2ZtOelj1fs2dQ2gtU4dgk
 nKhuOuELB0mpxghpQbm4F+wLO6x1b1Sp9v6MabBmAMqMMjU7F/iGptT3sVnbjcf8xxY8
 SY56+MfKCptFl2WvQ5ksUe10uPtQAwdcZxW9i+DZHVsOhIZjqR0iJJo35L2Gx1Rk1/Px
 at1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762885797; x=1763490597;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vpp9z0s0YDFeqz471tGX8huKPGNyqldTray744E+pAY=;
 b=NUt0/0BbUB33LID6SFWBwmkYHyjYD46Fh/t/MhEEv46V85iF6vQlx57QWgWN7b4x/N
 67bigR2H+wvlls0WSCglGtoLGz4WW/h7ecRsnRYbMWXBamqVxS5/KVZLsSlu4+m/HZLX
 z6WTt6N8LQEZiNJKY1PXE2XSWyd4T5uvwWtC8YushSMFvikoinmFBGL/uSzi1K4d00wj
 Vl+2jrduBSSbFFgwYb0t1BTqtlhzzTqEjo2HpR5SJ1Kzcj9A+14/mrOP2EKeltBbF1l5
 ygY5k9y8zDDdOtFtcHfXRzT61IlLNE9jG3kZlh5tMxgBjidat5S48vqbDMib3EQ3o5fi
 Xz8A==
X-Gm-Message-State: AOJu0YxH6vGXtxscRHD2NYIXJhxQVtJuPaa9drJooiLb2DK82Ha1NIV7
 UobJ3Kq3RIOOaue5XhQDd5y1ZHppgPYi1V9XSfRrqYogcLFsJMZWCF2YKBQGpRyPmks=
X-Gm-Gg: ASbGncsfC97AxCfbUgJxz6wvLL95QP/xD3pvKaA5/0hYj+7jUsqnr1Zw75ugle9628T
 g3ihL0/hEGLQVcYgSfsZJBLUhyyNeZio17HzxRpwVCkKWUHdIKPohqL3R06eqObWz1o576HpVjj
 oCxeOcxNFKbs12crowZREbzp6W5Vg1rPj1pnod/aAJKOIgl4t7UN4Z6zATNGSPHNSIarGrXxjjK
 /1175LuZCYPnGKLkAOhZp5PtMnRp96Z4POreVJ3OVlENLjuKFEJgSf77/EfnMBfZXKOckEdVfGS
 VnmxuhgrRXXyc/2aD4ijTGQz/nFVG2yorPYYfdCxKDcXSy3jcSgkPW1EZ7cXxVY8nmj8A4NImZ5
 S5UXTwetu9qEiwDzKrk/udchXM4Wz3sNrr20D4AanJtNUScQQA8dRzRqeGc4YPp5dohJ0ticyVN
 KmtE/ZCruckeN2bP3EpcLVbevIxfCm3kpTiOw1mQ==
X-Google-Smtp-Source: AGHT+IFhYKUXIAtdPAOiVrYhqI5nD3tLUH8DT3WcVyxENEILvm9Y3b8WFhRn7m8JGiYSncob+U0s1g==
X-Received: by 2002:a17:90b:4f45:b0:32e:9f1e:4ee4 with SMTP id
 98e67ed59e1d1-343dde816f8mr401471a91.17.1762885796824; 
 Tue, 11 Nov 2025 10:29:56 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([179.93.21.233])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c2ffdecsm15207419a91.2.2025.11.11.10.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 10:29:56 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 0/5] hw/riscv: Experimental Server Platform Reference Board
Date: Tue, 11 Nov 2025 15:29:39 -0300
Message-ID: <20251111182944.2895892-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x436.google.com
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

In this new version we addressed the comments from Chao Liu in patches 2
and 4.

We're also owning up the fact that the board is being contributed in an
incomplete status, given that we're missing 'sdext'.In theory we
shouldn't try to upstream it until we have 'sdext' implemented but this
board seems to be used by a lot of folks for for firmware development
and whatnot. Thus, I changed the board description in patch 3 to add an
'EXPERIMENTAL' tag.

This is how the board is presented with -M help:

$ ./build/qemu-system-riscv64 -M help Supported machines are:
amd-microblaze-v-generic AMD Microblaze-V generic platform
microchip-icicle-kit Microchip PolarFire SoC Icicle Kit none
empty machine rvsp-ref             RISC-V Server SoC Reference board
(EXPERIMENTAL) (...)

Patch 5 adds documentation for the board. Again, making it clear that
this is an experimental board that will be subject to changes before
being 100% compliant with the spec.

Patches based on current master.

Changes in v4:
- patch 2:
  - changed rvsp-ref CPU base type to BARE
  - added a comment mentioning the lack of 'sdext'
- patch 3:
  - changed the board description to add 'experimental'
- patch 4:
  - fixed RVSP_IOMMU_SYS memmap addr: 0102000 -> 0x102000
- patch 5 (new):
  - add board documentation
- v3 link: https://lore.kernel.org/qemu-riscv/20250528200129.1548259-1-dbarboza@ventanamicro.com/ 


Daniel Henrique Barboza (3):
  target/riscv/cpu.c: remove 'bare' condition for .profile
  hw/riscv/server_platform_ref.c: add riscv-iommu-sys
  docs: add rvsp-ref.rst

Fei Wu (2):
  target/riscv: Add server platform reference cpu
  hw/riscv: experimental server platform reference machine

 configs/devices/riscv64-softmmu/default.mak |    1 +
 docs/system/riscv/rvsp-ref.rst              |   28 +
 docs/system/target-riscv.rst                |    1 +
 hw/riscv/Kconfig                            |   15 +
 hw/riscv/meson.build                        |    1 +
 hw/riscv/server_platform_ref.c              | 1346 +++++++++++++++++++
 target/riscv/cpu-qom.h                      |    1 +
 target/riscv/cpu.c                          |   15 +-
 8 files changed, 1407 insertions(+), 1 deletion(-)
 create mode 100644 docs/system/riscv/rvsp-ref.rst
 create mode 100644 hw/riscv/server_platform_ref.c

-- 
2.51.1


