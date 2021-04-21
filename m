Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZ4Fg-0006SD-7x
	for mharc-qemu-riscv@gnu.org; Wed, 21 Apr 2021 00:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4Fe-0006S5-2j
 for qemu-riscv@nongnu.org; Wed, 21 Apr 2021 00:14:10 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:34309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4FZ-0002o1-R8
 for qemu-riscv@nongnu.org; Wed, 21 Apr 2021 00:14:09 -0400
Received: by mail-pg1-x52a.google.com with SMTP id z16so28510575pga.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Apr 2021 21:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=HNyPkvynFx2NHSsF8eDqjG9fu9ueMrRzd2XsD9tmXYA=;
 b=C7zjT9UjGVhTbipx0OuvTlmYLieyT5BeiXPol9llIReJk7Pwi2HDwlcUbYDqVKhrZu
 9iIlJDCkqy6f588ubP8v6+/RDTySeH/4wG2mngDvWc3XdwY0cA6HaiBzJRvYrUULPYrq
 oD68+g7orYNneVdjUvKPjFPa+jb5irKwxnxx5VPV5eAjPCBHGDP8MINIeekQCbNG9Bsa
 CJa2NaT1kxla/oLH0pvDaA5lEaGzC5VjFv/z7O1WOljjboizsqYfllwMQM+PuI3dI44w
 e2Sui1no4Bp7HnmYN9vzprZrN5Y6i+D6CETu5ziNyBC7qxELoLqUUxBfc5wPJXMqNNFp
 ZBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HNyPkvynFx2NHSsF8eDqjG9fu9ueMrRzd2XsD9tmXYA=;
 b=AH0slI0o9kwIxiQH9gV9ayGj9tsjKvu8OT1XCax0yor2iBPmIF955d81PCI0DOspO8
 6ddeVRZzTAMWTyknPGchySFSVBvJ7/F7dR0urtaJwOVxDG6RATe4rn3MBtI+KSP+Cpme
 KaZZK1QPqCKs8TFJRq6C1K2zmvKWUX/Wa3XelesuCeZTASeXsmGcdQax5UALYR7YcPOA
 P0qnU+7oY8CK/5otCmQTEc01M7UYtHUyY+ezJ0zmugWQyEWdwmnWdZaXw75EIYpcb4uF
 8h02rUmDMoNDqct3K0NYSY+fpH1Exjzwp2HDodEKYK/UIQSvt612wQhTnM9/eK22+ZHj
 rHpQ==
X-Gm-Message-State: AOAM532uTuLpm3POurmVxQCmoB+EMGjUIjDvAbqDQ/7P3PfQgN3/Jk6f
 jkzI4k78wKHDL6IgphGKp+d1rQ==
X-Google-Smtp-Source: ABdhPJxkvXKSnjJ+S0GbVMUWNzc1mYKtgfDCWWs6ap+tLyQQRNAehHVNjDlp/se8A4IDj9m125F/UA==
X-Received: by 2002:a63:f40b:: with SMTP id g11mr20745794pgi.133.1618978443584; 
 Tue, 20 Apr 2021 21:14:03 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id jx20sm551465pjb.41.2021.04.20.21.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 21:14:03 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v5 00/17] support subsets of bitmanip extension
Date: Wed, 21 Apr 2021 12:13:42 +0800
Message-Id: <20210421041400.22243-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52a.google.com
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
X-List-Received-Date: Wed, 21 Apr 2021 04:14:10 -0000

From: Frank Chang <frank.chang@sifive.com>

This patchset implements RISC-V B-extension v0.93 version Zba, Zbb and
Zbs subset instructions. Some Zbp instructions are also implemented as
they have similar behavior with their Zba-, Zbb- and Zbs-family
instructions or for Zbb pseudo instructions (e.g. rev8, orc.b).

Specification:
https://github.com/riscv/riscv-bitmanip/blob/master/bitmanip-0.93.pdf

The port is available here:
https://github.com/sifive/qemu/tree/rvb-upstream-v5

To test rvb implementation, specify cpu argument with 'x-b=true' or
'x-b=true,bext_spec=v0.93'to enable B-extension support.

Changelog:

v5:
 * add bext_spec cpu option, default set to v0.93.
 * rebase master branch.

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

Frank Chang (5):
  target/riscv: rvb: count bits set
  target/riscv: add gen_shifti() and gen_shiftiw() helper functions
  target/riscv: rvb: generalized reverse
  target/riscv: rvb: generalized or-combine
  target/riscv: rvb: add b-ext version cpu option

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
 target/riscv/cpu.c                      |  27 ++
 target/riscv/cpu.h                      |   5 +
 target/riscv/helper.h                   |   9 +
 target/riscv/insn32-64.decode           |  33 ++
 target/riscv/insn32.decode              |  54 ++-
 target/riscv/insn_trans/trans_rvb.c.inc | 417 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvi.c.inc |  54 +--
 target/riscv/meson.build                |   1 +
 target/riscv/translate.c                | 314 ++++++++++++++++++
 10 files changed, 960 insertions(+), 56 deletions(-)
 create mode 100644 target/riscv/bitmanip_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc

--
2.17.1


