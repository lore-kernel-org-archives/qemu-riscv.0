Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kz9I6-0000Lb-Na
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 21:20:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9I5-0000LN-H5
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:20:13 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:44314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9I3-0001wu-60
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:20:12 -0500
Received: by mail-pl1-x62a.google.com with SMTP id r4so547546pls.11
 for <qemu-riscv@nongnu.org>; Mon, 11 Jan 2021 18:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=hMdeLTIobVnnFr9an+png7iZnBio6LlQbfnOtAaUd5s=;
 b=HMdToB8flngDEnJmgDkpcQPlVD6bSsqZTVHg6/N1wIp27aVEXrO35jqj0fdOlqAF0l
 eaGlbZ2WDouVJx6D4fyFO8kIpfLRnYVaaaQ2f68uDSzPEau6U6goFqp/2jLcAi18Ophw
 ce5didCEfTBk+NWk+mom31CWc+QA+RnzTFGqCMCLE+sIrEGkfua5WKHVB05sCyvDrUKm
 BWxRjh8UNzGYrCZ+OGjy0k5BELcKxTnmDDPUOW5aWS4WCmJSmlmYkrCkfuzj86XTDs0b
 uO5nU/MmsecoX/dCybkjp/773n2uV7l9hotY89ruKmVG4awPEnKwc/GzrfM4D5o1TSa5
 nZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hMdeLTIobVnnFr9an+png7iZnBio6LlQbfnOtAaUd5s=;
 b=iQexnxEoHrlFXgMpgxpqlc3GDC0x9W0Q1PsFnPohiJQv7njQWipTCUT/bGbjxMiUqE
 V9y6mdQD/e0A4cIRhKRBQRNvRlAh3C8RVWrHmirTMaMVHX+8Ui+kZ1fuqqYHMeU70uVQ
 eIwkovRoKO0TgNd6P4l8X21O1LnZ2mSSlKPv4QIr98fo9b3Uly0vdASCcQ8rkhDStOS7
 7Qfe1drHetjG6PQUvoNvvPGUiLztBGga04/72ocxXAGOL5rM91Mdm7ge8k5Kzjydn9QS
 mbZIGyEcB1/fJ+4IshV5rlWp5XNsBKAYBf67ERyXApVXGrb6BA5O5WnGc6lqV7NIjSxR
 bmHw==
X-Gm-Message-State: AOAM5310R4V8lx/y5QX4nmOWDZoAOb24/KjEDhuI+31Se1gRHfkMvsbm
 oQEb2hEh0MouT8XL7Yq8295oGw==
X-Google-Smtp-Source: ABdhPJwkBaB4m2eIVn/p00C7QCXjdeJt1NCPxUu3sAnzsHb3w+OmsI+1JkwYWCoy4qnq8jW6hsjp9g==
X-Received: by 2002:a17:90a:f00f:: with SMTP id
 bt15mr1934827pjb.209.1610418008923; 
 Mon, 11 Jan 2021 18:20:08 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x14sm981326pfp.77.2021.01.11.18.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 18:20:08 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [RFC v3 00/16] support subsets of bitmanip extension
Date: Tue, 12 Jan 2021 10:19:41 +0800
Message-Id: <20210112022001.20521-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62a.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 02:20:13 -0000

From: Frank Chang <frank.chang@sifive.com>

This patchset implements RISC-V B-extension 0.93 version Zbb, Zbs and
Zba subset instructions. Some Zbp instructions are also implemented as
they have similar behavior with their Zbb-, Zbs- and Zba-family
instructions or for Zbb pseudo instructions (e.g. rev8, orc.b).

Specification:
https://github.com/riscv/riscv-bitmanip/blob/master/bitmanip-0.93.pdf

The port is available here:
https://github.com/sifive/qemu/tree/rvb-upstream-v3

To test rvb implementation, specify cpu argument with 'x-b=true' to
enable B-extension support.

Changelog:

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
 target/riscv/insn_trans/trans_rvi.c.inc |  45 +--
 target/riscv/meson.build                |   1 +
 target/riscv/translate.c                | 314 ++++++++++++++++++
 10 files changed, 932 insertions(+), 47 deletions(-)
 create mode 100644 target/riscv/bitmanip_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc

--
2.17.1


