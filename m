Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEY9n-0007Dw-5B
	for mharc-qemu-riscv@gnu.org; Thu, 21 Jul 2022 11:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oEY9k-0007BZ-Uh
 for qemu-riscv@nongnu.org; Thu, 21 Jul 2022 11:32:04 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oEY9i-0002cz-2v
 for qemu-riscv@nongnu.org; Thu, 21 Jul 2022 11:32:04 -0400
Received: by mail-pl1-x635.google.com with SMTP id q5so2131320plr.11
 for <qemu-riscv@nongnu.org>; Thu, 21 Jul 2022 08:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U+d0OSEASe9H+3z58KzKhgP8akHmocIFwu+GXF2UiT0=;
 b=Fb8+xGxZGW8gn66hyzYZ3rlmKubAfT3ERnrgrw8guxQtb1U05vy5bn7OQNZy3UDg4S
 zhcJg/BI+pjjQQvctqkmUbaQxxpMsqJ1am1oxGH8PXFIN6n0L9BskRvwMZVm5nk/q1Vb
 00Lmky2qHWat4u/bJXUhjt7UNCCo1kc2OUucBPBLXxjJQ+sGohHi45+gSvl3LqJAFnHw
 F9aN6Bls2+dwDXOJaj9LKbpvs72ah05Eme3mgey8ymEAVEawcn8ByH7fcblcvedRQjbd
 DdGnhCPf60DwAip/TZsOmuX+cgo8P+kALzy84SxAKk/+m88OS0v+SLjlwGOrWnl9e1AW
 L7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U+d0OSEASe9H+3z58KzKhgP8akHmocIFwu+GXF2UiT0=;
 b=ehoJ5jv+ohlmFTjjGp2DTfRXuP26lzpQhCPO3TxFJHpApG0R/S97hD6PkAGqiRNpHD
 TK3HWBry/UeKQULmhP4HhObbJf26f6EoJ24IW7QJdod/URJYgS01zLiFithr7B4lNxn1
 N2FlL5Fjo3dk/1EZiYG+wRQrDGO3MJLUUQLhr5M1uKR+G26YlWvSqyA9uPeCVyYsJwgg
 lkfj92lHCiZ6NMAIkflDnVOOtLYCYutCGX/htugtlX3v9IXoGUSAWfN/bVS+7MgeQEO2
 ZaEBODYaxaeShSx21H9Is/1+oFfiIYRioX5KG7EQHzKAxPDAMkzBcQAu10fFOSfZzlhH
 cqww==
X-Gm-Message-State: AJIora9gGcY/2jLIwQALTZonS3M2vEwmRm3+y/DByoeI7ZW7dBwJFdgR
 IAmHLYCf26J0kJHHlPk7MLtH4g==
X-Google-Smtp-Source: AGRyM1sWqRiwD4uiWQMzUPQX3lXOierHxcrCuBzp/4JaGJpi4zw9GVvPZs252/JTwxTcMCNnsLNyWw==
X-Received: by 2002:a17:90b:4a08:b0:1ef:f36b:18e1 with SMTP id
 kk8-20020a17090b4a0800b001eff36b18e1mr12024020pjb.246.1658417520064; 
 Thu, 21 Jul 2022 08:32:00 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([182.70.95.50])
 by smtp.googlemail.com with ESMTPSA id
 f4-20020a170902684400b0016bdf0032b9sm1814379pln.110.2022.07.21.08.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 08:31:59 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v6 0/5] RISC-V Smstateen support
Date: Thu, 21 Jul 2022 21:01:31 +0530
Message-Id: <20220721153136.377578-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 21 Jul 2022 15:32:05 -0000

This series adds support for the Smstateen specification which provides
a mechanism plug potential covert channels which are opened by
extensions
that add to processor state that may not get context-switched. Currently
access to AIA registers, *envcfg registers and floating point(fcsr) is
controlled via smstateen.

These patches can also be found on riscv_smstateen_v6 branch at:
https://github.com/mdchitale/qemu.git

The patch 4/5 (AIA) can be reviewed but not merged until the
bits reserved for AIA get re-defined.

Changes in v6:
- Sync with latest riscv-to-apply.next
- Make separate read/write ops for m/h/s/stateen1/2/3 regs
- Add check for mstateen.staten when reading or using h/s/stateen regs
- Add smstateen fcsr check for all floating point operations
- Move knobs to enable smstateen in a separate patch.

Changes in v5:
- Fix the order in which smstateen extension is added to the
  isa_edata_arr as
described in rule #3 the comment.

Changes in v4:
- Fix build issue with riscv32/riscv64-linux-user targets

Changes in v3:
- Fix coding style issues
- Fix *stateen0h index calculation

Changes in v2:
- Make h/s/envcfg bits in m/h/stateen registers as writeable by default.

Anup Patel (1):
  target/riscv: Force disable extensions if priv spec version does not
    match
*** BLURB HERE ***

Mayuresh Chitale (5):
  target/riscv: Add smstateen support
  target/riscv: smstateen check for h/senvcfg
  target/riscv: smstateen check for fcsr
  target/riscv: smstateen check for AIA/IMSIC
  target/riscv: smstateen knobs

 target/riscv/cpu.c                        |   2 +
 target/riscv/cpu.h                        |   4 +
 target/riscv/cpu_bits.h                   |  37 ++
 target/riscv/csr.c                        | 703 +++++++++++++++++++++-
 target/riscv/insn_trans/trans_rvf.c.inc   |  38 +-
 target/riscv/insn_trans/trans_rvzfh.c.inc |   4 +
 target/riscv/machine.c                    |  21 +
 7 files changed, 804 insertions(+), 5 deletions(-)

-- 
2.25.1


