Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpM8f-000614-8S
	for mharc-qemu-riscv@gnu.org; Tue, 15 Dec 2020 21:02:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM8d-00060t-Ow
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 21:01:59 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM8b-0000qO-Id
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 21:01:59 -0500
Received: by mail-pj1-x1031.google.com with SMTP id f14so629386pju.4
 for <qemu-riscv@nongnu.org>; Tue, 15 Dec 2020 18:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=rLNQq/+xqdwYJKLRlDvJGIwRXl36/MH0X9u0Rmyy1wk=;
 b=bR93heYJA35zKR4JS78Me/Wv4U3LXGpPkTbInBF2io/KB4grrWFx88tTbA6ezLJhNy
 wO8TtCI8udNuQy94pMlB157NVswyEjGMDZdoFET3nxe1tyA7EQtcNUIq6jei5IhrFrCL
 YCv8ktLxmwEjF2BsUp67i2dZud4BCDIZaW4OfdQN70DNhwq/cA1GCPBEo6X/EMurWYHq
 VO/y/mTVC5iHO2vGs2MaG897bhneFm7kXZoPmfLhOloee2t2+VLFP1VFL+qOVwEozgbx
 osDkoM3Nm7IUFthfx15g72t14Htdym9Uk8fpflsCsFb2eITp6XrJoYHdsqX4DcR6/k1+
 M8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rLNQq/+xqdwYJKLRlDvJGIwRXl36/MH0X9u0Rmyy1wk=;
 b=S0PF2Zb3q21zyMoPEYQdAGBpUeweMCPISIlFawXZCmL+Qlw2+bzOOJvfS6vFw2OybO
 huXNY7HjVqdp+RYTlezN7Dg6rknjsQB3W1NBaf+vheSSwwKyXg9JjaYQ2CUulKh8LoVc
 M82cUY4oJ4fJtPQpx9r4DmR0MESvVrqUnd0wD00D4muPgQgabdYYb5yXMh8jtdCLxOxM
 WWPyZioyYrdRqdfwhszBwPwVzenDGLm/Kn/Smf3QvmxcBkHKtpBcd2yQFPR/N191JPc/
 0nefD/F2GUdMW0tasTGPvTXB/xNBWFotYYr+ys605xsEf9SI5a8c/EOYoLA/UEw1EUac
 +EOA==
X-Gm-Message-State: AOAM533ryIeVrFT/A1+E8C8GiFszAtR4L6L2u2fG8Vzl+i0RQfu1AW41
 SXYgaWiEeNPJ8Taw4kxDQ3nzmg==
X-Google-Smtp-Source: ABdhPJzKKJBxAFKDqTywyd/0spLObBOWgiSw9xazt0Cr0eVZv4eOmvRxQjAym4vcda+OWmvRMRIpAw==
X-Received: by 2002:a17:90b:943:: with SMTP id
 dw3mr1159959pjb.97.1608084115638; 
 Tue, 15 Dec 2020 18:01:55 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:01:54 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>
Subject: [RFC v2 00/15] support subsets of bitmanip extension
Date: Wed, 16 Dec 2020 10:01:25 +0800
Message-Id: <20201216020150.3157-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Wed, 16 Dec 2020 02:02:00 -0000

From: Frank Chang <frank.chang@sifive.com>

This patchset implements RISC-V B-extension draft version Zbb, Zbs and
Zba subset instructions. Some Zbp instructions are also implemented as
they have similar behavior with their Zbb-, Zbs- and Zba-family
instructions or for Zbb pseudo instructions (e.g. rev8, orc.b).

Specification:
https://github.com/riscv/riscv-bitmanip

Summary of current proposals for Zb{abcs}:
https://lists.riscv.org/g/tech-bitmanip/topic/summary_of_current_proposals/77924315

The port is available here:
https://github.com/sifive/qemu/tree/rvb-upstream-v2

To test rvb implementation, specify cpu argument with 'x-b=true' to
enable B-extension support.

Changelog:

v2:
 * Add gen_shifti(), gen_shiftw(), gen_shiftiw() helper functions.
 * Remove addwu, subwu and addiwu instructions as they are not longer
   exist in latest draft.
 * Optimize implementation with cleaner tcg ops.

Frank Chang (3):
  target/riscv: rvb: count bits set
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
  target/riscv: rvb: add/sub with postfix zero-extend
  target/riscv: rvb: support and turn on B-extension from command line

 target/riscv/bitmanip_helper.c          | 103 ++++++
 target/riscv/cpu.c                      |   4 +
 target/riscv/cpu.h                      |   2 +
 target/riscv/helper.h                   |   9 +
 target/riscv/insn32-64.decode           |  33 ++
 target/riscv/insn32.decode              |  54 ++-
 target/riscv/insn_trans/trans_rvb.c.inc | 466 ++++++++++++++++++++++++
 target/riscv/meson.build                |   1 +
 target/riscv/translate.c                | 337 +++++++++++++++++
 9 files changed, 1003 insertions(+), 6 deletions(-)
 create mode 100644 target/riscv/bitmanip_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc

--
2.17.1


