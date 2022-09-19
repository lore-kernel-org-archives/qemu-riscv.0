Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oaAHl-0007pz-I3
	for mharc-qemu-riscv@gnu.org; Mon, 19 Sep 2022 02:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oaAHY-0007nn-Tp
 for qemu-riscv@nongnu.org; Mon, 19 Sep 2022 02:29:33 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oaAHW-00005v-Fj
 for qemu-riscv@nongnu.org; Mon, 19 Sep 2022 02:29:28 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 p1-20020a17090a2d8100b0020040a3f75eso5150479pjd.4
 for <qemu-riscv@nongnu.org>; Sun, 18 Sep 2022 23:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Vopz/BYe+Ey6PidW4HcEje2S/QViCiaTuz0aoYDIniA=;
 b=Iu0VnE7+LQcWMt405DjeIkm7F21RdtpqiJIhKn+6ieMArdCHDCK820YzHlQsKwoF50
 LmCFc2JJlil8mLoUJCdJ0tevY3tA2wCROX41iwK+1v/WeeaE7mnVeodiTvW4JYKlvOO1
 sha4plAUE9kluqu8kVpOOWoXFENTAVR2GRsXWEsE+7MdnpZbHSV41btZu/IvDJ8krm6N
 yoqq+eDLRu8MSO63zv+eeGMVpBbuXMoNiBKICBjPyYUkn6gMtK/OqltytKr+YQhDhxbj
 smPmXkMFmdEqLsFU32M4zur6Gj+tl1OigpBdPK/VwC0drvWZt1pJ+nRQwxH/8B5TX++F
 3dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Vopz/BYe+Ey6PidW4HcEje2S/QViCiaTuz0aoYDIniA=;
 b=0E/I9PM7drzUd44dBWUPl7b6wJqjr9Nbj0oCrbfkigqtT98G/UvLvmzN/y6QtAuw+d
 gRPcEMPLj8HzkMT3Vc3r6bvd9UiDE+U+Nv0o4GYeQaTLGuMTJq4xaQUW2TpOehjHyQ4n
 XsRAI1tt6DFEaCwANz0XGo9SrI/Ozwp1tETYc30qfY8Icf8dHbcD2oGagQ3AIvTGrqtE
 qxUlnLIrfVfQvXsS1ls/lEQOgzMXCGH0iosAkAIMVPMZZ3OfgeRiKHRJJm9Ws0JUOF4j
 LjzuYfX1/OFfr2ByTgz/OUbCN86Nge6sh4dKqoMYrFIaN3CyVDAvPdfCwwAIyUPfqIb4
 9PWQ==
X-Gm-Message-State: ACrzQf1d3N1aS0vCnbuJ7g6WXlyny9c+slSiHPfMuddC2Q0VioUGZewP
 89/u/pqkriBdM/OtxAEmW1PfDg==
X-Google-Smtp-Source: AMsMyM7lkZvdUCohcXepz1prpT7WQdqZ25m3mKSamP3y4NgdejnztWNGS4MoQOs/lzybpMxKJFKihA==
X-Received: by 2002:a17:902:e549:b0:178:6d7c:abf6 with SMTP id
 n9-20020a170902e54900b001786d7cabf6mr12004662plf.131.1663568957066; 
 Sun, 18 Sep 2022 23:29:17 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([122.169.74.146])
 by smtp.googlemail.com with ESMTPSA id
 y1-20020a17090264c100b001782580ce9csm17678574pli.249.2022.09.18.23.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 23:29:16 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v9 0/4] RISC-V Smstateen support
Date: Mon, 19 Sep 2022 11:59:04 +0530
Message-Id: <20220919062908.643945-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Mon, 19 Sep 2022 06:29:33 -0000

This series adds support for the Smstateen specification which provides a
mechanism to plug the potential covert channels which are opened by extensions
that add to processor state that may not get context-switched. Currently access
to *envcfg registers and floating point(fcsr) is controlled via smstateen.

These patches can also be found on riscv_smstateen_v9 branch at:
https://github.com/mdchitale/qemu.git

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
  target/riscv: smstateen check for fcsr
  target/riscv: smstateen knobs

 target/riscv/cpu.c                        |   2 +
 target/riscv/cpu.h                        |   4 +
 target/riscv/cpu_bits.h                   |  37 ++
 target/riscv/csr.c                        | 471 +++++++++++++++++++++-
 target/riscv/insn_trans/trans_rvf.c.inc   |  40 +-
 target/riscv/insn_trans/trans_rvzfh.c.inc |  12 +
 target/riscv/machine.c                    |  21 +
 7 files changed, 583 insertions(+), 4 deletions(-)

-- 
2.25.1


