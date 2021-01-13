Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzaM3-0006it-1c
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 02:14:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaLx-0006f1-AY
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 02:14:02 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:34738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaLu-0003hO-6u
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 02:14:00 -0500
Received: by mail-pg1-x532.google.com with SMTP id i5so940367pgo.1
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 23:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=0k5VWgUZmBykkLgQPNEXBKI1BcCXiLtvx6YuEbb6Vsc=;
 b=SoHdg1NJ+Je663oIlDKORYyG/lW9DdCEvlehdSAIiPylK8r38WYU9ZL1aH7FyMJYyU
 bcSecHDwFdoPEKaJZZFL5NfMOEVxfeOpsPrEjzk2duYyblfoGrgmHhnN+z8fKdoN3t4q
 UFZd2q7B6Nlkg7DbeiEa5cnfrfGMEI1pmiba/RklVFJDNxaJKy+l0PzhuWV7L1kyM+Eu
 4I09hX069LhZUeTVW972gNE4UgWIZK/F00G+jSTUVa1g9WLtoWSTTdlKuyf0P3uViwfk
 N+2Pd3NGhzq4FvXh2tsUon0Vbw884slO2UuVNZ41eo3ijbjohM4iOaPgv1Zx37iFKnpN
 WGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0k5VWgUZmBykkLgQPNEXBKI1BcCXiLtvx6YuEbb6Vsc=;
 b=GqbNBu/Ec5/RbKfX0O/Pc4OjsrzI6ridyKzwasVaUGrl/fVRCvYho5Ke3sVkeIPMAL
 xhYvxbO5cF2EVCQCdTRunTVmB8MezN09EWxpgNmSrw07mQDNjNwmuUUJMnENNvaCj00m
 cXMbt7ykLcSrbV9vEsZsiqFNmbYjstb5Dr15Y8LOm9yHoj2EzaDJpOZ4SpWyioaU1LwW
 tPHI0fUDBIHnvmmIXXZu57SsRL1A3TXsK5sj3tFrSNZKX6WEGzL4ct2WufyLBx4AJw/r
 sKCPjbyRENvW4zyC45oVL67+JtPB/IuOmnH8o4ZF+fRWGz4nMvBcTGcczrriGHcbNu55
 7Rvw==
X-Gm-Message-State: AOAM532FJpTRSK1EqagFyF3sdPM799+DnMZMz/198vqaO38GNQUicJba
 5ded/o7Tkl+/WB1igIVSVarJ+A==
X-Google-Smtp-Source: ABdhPJzlzkt1QJCRiHW+UpGPVOkT/cGipYGFzqOjcAK7yu50f7Sfx0Hv+pufFIgHKtLXGWu+irQeOg==
X-Received: by 2002:a65:608e:: with SMTP id t14mr840773pgu.436.1610522035497; 
 Tue, 12 Jan 2021 23:13:55 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id l7sm1361888pjy.29.2021.01.12.23.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:13:54 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [RFC v4 00/16] support subsets of bitmanip extension
Date: Wed, 13 Jan 2021 15:13:32 +0800
Message-Id: <20210113071350.24852-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jan 2021 07:14:03 -0000

From: Frank Chang <frank.chang@sifive.com>

This patchset implements RISC-V B-extension 0.93 version Zbb, Zbs and
Zba subset instructions. Some Zbp instructions are also implemented as
they have similar behavior with their Zbb-, Zbs- and Zba-family
instructions or for Zbb pseudo instructions (e.g. rev8, orc.b).

Specification:
https://github.com/riscv/riscv-bitmanip/blob/master/bitmanip-0.93.pdf

The port is available here:
https://github.com/sifive/qemu/tree/rvb-upstream-v4

To test rvb implementation, specify cpu argument with 'x-b=true' to
enable B-extension support.

Changelog:

v4:
 * Remove 'rd != 0' checks from immediate shift instructions.

v3:
 * Convert existing immediate shift instructions to use gen_shifti()
   and gen_shiftiw() interfaces.
 * Rename *u.w instructions to *.uw.
 * Rename sb* instructions to b*.
 * Rename pcnt* instructions to cpop*.

v2:
 * Add gen_shifti(), gen_shiftw(), gen_shiftiw() helper functions.
 * Remove addwu, subwu and addiwu instructions as they are not longer
   exist in latest draft.
 * Optimize implementation with cleaner tcg ops.

Frank Chang (4):
  target/riscv: rvb: count bits set
  target/riscv: add gen_shifti() and gen_shiftiw() helper functions
  target/riscv: rvb: generalized reverse
  target/riscv: rvb: generalized or-combine

Kito Cheng (12):
  target/riscv: reformat @sh format encoding for B-extension
  target/riscv: rvb: count leading/trailing zeros
  target/riscv: rvb: logic-with-negate
  target/riscv: rvb: pack two words into one register
  target/riscv: rvb: min/max instructions
  target/riscv: rvb: sign-extend instructions
  target/riscv: rvb: single-bit instructions
  target/riscv: rvb: shift ones
  target/riscv: rvb: rotate (left/right)
  target/riscv: rvb: address calculation
  target/riscv: rvb: add/shift with prefix zero-extend
  target/riscv: rvb: support and turn on B-extension from command line

 target/riscv/bitmanip_helper.c          | 102 ++++++
 target/riscv/cpu.c                      |   4 +
 target/riscv/cpu.h                      |   2 +
 target/riscv/helper.h                   |   9 +
 target/riscv/insn32-64.decode           |  33 ++
 target/riscv/insn32.decode              |  54 ++-
 target/riscv/insn_trans/trans_rvb.c.inc | 415 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvi.c.inc |  54 +--
 target/riscv/meson.build                |   1 +
 target/riscv/translate.c                | 314 ++++++++++++++++++
 10 files changed, 932 insertions(+), 56 deletions(-)
 create mode 100644 target/riscv/bitmanip_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc

--
2.17.1


