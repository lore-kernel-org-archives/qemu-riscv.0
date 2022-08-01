Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oIZ4k-0004Wj-IW
	for mharc-qemu-riscv@gnu.org; Mon, 01 Aug 2022 13:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oIZ4j-0004Tw-15
 for qemu-riscv@nongnu.org; Mon, 01 Aug 2022 13:19:29 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oIZ4h-0006ed-9S
 for qemu-riscv@nongnu.org; Mon, 01 Aug 2022 13:19:28 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 w17-20020a17090a8a1100b001f326c73df6so11194533pjn.3
 for <qemu-riscv@nongnu.org>; Mon, 01 Aug 2022 10:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=BG2/EJD+6HV5FB++n4qJwmQEgdX/cuw2hxxj6JjR4pk=;
 b=Mz2a0kvic3jazrwxvgZjzOvYzh9hHMGbBG+ocysPjElo0Zm0qZroYk/xW8q1suzlku
 R0XOH9wkIT+nDmIn3BLOMnnU7YLt3GfSb1giQM5qWAZBfjTSYQNBRdaZc1H0YKdA98KY
 6SD2dGfsvCxDpX65lCJHoSm8JUaFBY/JCACQ213YVvkzk10Tq/9N+v/jPTIoodZ9Zbzx
 CtyB0Qf4Q3GMx8AkX3tSl8fdlzjr2J4WqtIy1g9tVqv7tPVj5iBG+LQn6S2NjLJoAZSQ
 QcULcOTKGNrxIjBMxIPp8rknAkqQEnbKl4WjLsigi/PQ6XMBcV7QHzFk5vzze+JU7Rs0
 w2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=BG2/EJD+6HV5FB++n4qJwmQEgdX/cuw2hxxj6JjR4pk=;
 b=w0DotvT1bInDn6jwHWx7ol+eUQ0iVZfnEkSg4k7azSbg6FD71cuoYRgqGkwFznCcUD
 3GZYgYBiiq/44KPrJ9DFC8D8AqfoXIQjjDqn1G3qvafaA2D1aKx7hpQ4KipToAig2+vW
 WlYVDrnngp2Fd7VwyloVW12UOJFTZcn6qa1SuoAXILFOnyi31ePigllPclG4Pjldp6C+
 JeR+8sEORrUatpaPGUYQ1zL40Kw8v4d/qbo4eZHbs6erStafUQMJk4Ia96wzDdo8LkE1
 icAKKNSnMMefmU1TjssXWo+8JS0MSg3GSLSbtMaKtnCYrxp7v7c2RqV/Jz27YdVAmrW2
 6ZWw==
X-Gm-Message-State: ACgBeo3+eQpT8hN1n5T1Ay1p3gfQyPBpJnRHd63SXUr1O7TDexrxBaKz
 D9l1pdJJSa5J/ECF01j2ApGkKQ==
X-Google-Smtp-Source: AA6agR6YxRvkzIuEQi9SOWNmdYBmHL+gp5v77Y3W2SqViJrqknsKOg2WLzW4F+g2CSUZDaHeqtLrKA==
X-Received: by 2002:a17:90a:1d0:b0:1ec:7066:49b8 with SMTP id
 16-20020a17090a01d000b001ec706649b8mr20537652pjd.163.1659374365184; 
 Mon, 01 Aug 2022 10:19:25 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([122.176.236.198])
 by smtp.googlemail.com with ESMTPSA id
 i10-20020a056a00004a00b0052ab602a7d0sm1709942pfk.100.2022.08.01.10.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 10:19:24 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v7 0/4] RISC-V Smstateen support
Date: Mon,  1 Aug 2022 22:48:39 +0530
Message-Id: <20220801171843.72986-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Mon, 01 Aug 2022 17:19:29 -0000

This series adds support for the Smstateen specification which provides
a mechanism plug potential covert channels which are opened by extensions that
add to processor state that may not get context-switched. Currently access to
*envcfg registers and floating point(fcsr) is controlled via smstateen.

These patches can also be found on riscv_smstateen_v7 branch at:
https://github.com/mdchitale/qemu.git

Changes in v7:
- Update smstateen check as per discussion on the following issue:
  https://github.com/riscv/riscv-state-enable/issues/9
- Drop the smstateen AIA patch for now.
- Indentation and other fixes

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

Mayuresh Chitale (4):
  target/riscv: Add smstateen support
  target/riscv: smstateen check for h/senvcfg
  target/riscv: smstateen check for fcsr
  target/riscv: smstateen knobs

 roms/opensbi                              |   2 +-
 target/riscv/cpu.c                        |   2 +
 target/riscv/cpu.h                        |   4 +
 target/riscv/cpu_bits.h                   |  37 ++
 target/riscv/csr.c                        | 463 +++++++++++++++++++++-
 target/riscv/insn_trans/trans_rvf.c.inc   |  40 +-
 target/riscv/insn_trans/trans_rvzfh.c.inc |  12 +
 target/riscv/machine.c                    |  21 +
 8 files changed, 576 insertions(+), 5 deletions(-)

-- 
2.25.1


