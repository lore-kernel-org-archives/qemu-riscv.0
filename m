Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ofJv8-0000un-D1
	for mharc-qemu-riscv@gnu.org; Mon, 03 Oct 2022 07:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ofJv1-0000u1-P3
 for qemu-riscv@nongnu.org; Mon, 03 Oct 2022 07:47:35 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ofJuz-0005kf-CM
 for qemu-riscv@nongnu.org; Mon, 03 Oct 2022 07:47:31 -0400
Received: by mail-pl1-x633.google.com with SMTP id x1so9452865plv.5
 for <qemu-riscv@nongnu.org>; Mon, 03 Oct 2022 04:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=SFjuM1bVt4t+k5QhQEu6ZFjo6xGZ74lcrc7zlECQV7Q=;
 b=QxnRQo9SGbQwI+YLB0lyih7wYNZGUXZ07/NiXcGQ6RzuH5asl1j/elFITICk5wq9FZ
 sip7YhiP4yKk0+IUqBmm7HTX24msDYrfk8Yq+QZEpRxZ5j+WBTXXNeXXQyoa69UUrYeG
 o1Av5tDwK1dvSBm28Acf9dvLVgp/CW+hzFW0QywAvhFGRv3ZgaNwGS6JAy8iEFbjuBLg
 g8taOK02hy2Dk91nb5Ir2aMSLkj44yFTB831QYYWU9pLersk2Gr/9ZmFshjvsC7xey+R
 j4pGIuDIsNeXbCE9rNTrVFMD4Cs0assuNoi60AXplA2T289ffEUzSjEgZ8WesPCF8cM7
 9vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=SFjuM1bVt4t+k5QhQEu6ZFjo6xGZ74lcrc7zlECQV7Q=;
 b=J8yNXnIjdF9892zNLG8JfPY+Iq3a1D7uXLA2IMMiLxZeHxGMn8CwKjdL/aPegjn02/
 Fi7bB318+QmrLl8sYvlf+hs387mCN/MtlDDm106lB+p02Fz8bREk52Vd8OvCgSyEOuvt
 ugf5oQbvO0ewND3JwFI5Y8vdNbumv8MdDst4hbfcu1i4yfi80pmw7bo3R4PfdByF0Qm5
 gdW21j7noOP8v/iVA+8GT9huvdPLWbQQe73eCCSgFPeDY3mbogsfth3zKKOV9NQlwrUJ
 Zu0QUVW1WfH1PmwE0zdyBq7fn8ZEbWFrNhlQpuVgsDGuV0svbymStBTxh78S0ieJJMuJ
 LO/A==
X-Gm-Message-State: ACrzQf1nRaaf8yBNNHS3PtmqcbYj7OKtXparr9vyKgRazR3BOriTv2O8
 LcudeK9vGcSlNu6KaKfPTXRpfw==
X-Google-Smtp-Source: AMsMyM7F8+dICjLONZ9SWrw5xOlnKPmVmEGanc/w3gg10u43a/Eei6L8X3ZF55smAPInAGH1C7knCA==
X-Received: by 2002:a17:902:d4ce:b0:177:fe49:19eb with SMTP id
 o14-20020a170902d4ce00b00177fe4919ebmr21620504plg.170.1664797647422; 
 Mon, 03 Oct 2022 04:47:27 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 ix17-20020a170902f81100b001789b724712sm6979753plb.232.2022.10.03.04.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 04:47:26 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v10 0/5] RISC-V Smstateen support
Date: Mon,  3 Oct 2022 17:17:13 +0530
Message-Id: <20221003114718.30659-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pl1-x633.google.com
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
X-List-Received-Date: Mon, 03 Oct 2022 11:47:36 -0000

This series adds support for the Smstateen specification which provides a
mechanism to plug the potential covert channels which are opened by extensions
that add to processor state that may not get context-switched. Currently access
to *envcfg registers and floating point(fcsr) is controlled via smstateen.

These patches can also be found on riscv_smstateen_v10 branch at:
https://github.com/mdchitale/qemu.git

Changes in v10:
- Add support to generate virt instruction exception after decode failure.
  Use this change for smstateen fcsr failure when virt is enabled.
- Implement single write function for *smstateen1 to *smstateen3 registers.

Changes in v9:
- Rebase to latest riscv-to-apply.next
- Add reviewed by in patches 2 and 4

Changes in v8:
- Rebase to latest riscv-to-apply.next
- Fix m-mode check for hstateen
- Fix return exception type for VU mode
- Improve commit description for patch3

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

Mayuresh Chitale (4):
  target/riscv: Add smstateen support
  target/riscv: smstateen check for h/s/envcfg
  target/riscv: generate virtual instruction exception
  target/riscv: smstateen check for fcsr
  target/riscv: smstateen knobs

 target/riscv/cpu.c                        |   2 +
 target/riscv/cpu.h                        |   4 +
 target/riscv/cpu_bits.h                   |  37 ++
 target/riscv/csr.c                        | 414 +++++++++++++++++++++-
 target/riscv/insn_trans/trans_rvf.c.inc   |  43 ++-
 target/riscv/insn_trans/trans_rvzfh.c.inc |  12 +
 target/riscv/machine.c                    |  21 ++
 target/riscv/translate.c                  |   9 +-
 8 files changed, 537 insertions(+), 5 deletions(-)

-- 
2.25.1


