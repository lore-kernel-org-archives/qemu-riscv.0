Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ok33Q-0005f2-7u
	for mharc-qemu-riscv@gnu.org; Sun, 16 Oct 2022 08:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ok33O-0005cm-Gx
 for qemu-riscv@nongnu.org; Sun, 16 Oct 2022 08:47:42 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:52030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ok33M-0003Pj-NV
 for qemu-riscv@nongnu.org; Sun, 16 Oct 2022 08:47:42 -0400
Received: by mail-pj1-x102a.google.com with SMTP id cl1so8724461pjb.1
 for <qemu-riscv@nongnu.org>; Sun, 16 Oct 2022 05:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qAGhXdl9JGSoervBWAtHALAsd3VD7kIj0ZvC7dtIcJQ=;
 b=iuzs8HlcC8Qv1oKLk8fo4O8xRieCINuALDkRNLGm0lbumwPXBmMJlOxr3JyGzgMYLx
 kAftRjNxLmhbGbsScg7E4q2XYa0UvVOU5WyDpDS58IsjwdabJ3+BbbhZa9AEJdXcNIfD
 G6DdNGJ7ssA8b6wjf1u0YExfIQu6/meTtSAy0J07ZngdNekOol2QFwkvx3auAbSOhAtq
 4omt7vi9h921Rd0l1Xph/euZpRrtppzreQEaDLc/pg3Z3m5/Tzzrw/8BikHYg1f/eO/B
 WRfQs024UxhKqe1o/3Y6br49SsKS3HPOdEV24u5QCiM+BVOKcLgrfv6BvXxFCiXHb3LP
 q5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qAGhXdl9JGSoervBWAtHALAsd3VD7kIj0ZvC7dtIcJQ=;
 b=QP9tcem7Xrh8Jv4043sSZMQ2UFrJx3jad3bNLfvjZXPeVpg3PeixGQQMOUBr44bCDK
 i8jZ6zb3HOv4Tw3SldmUJI0Pu1NBzPArGJdc5Oi1Cu4hRQajag2SGayPPeTyWXq0XIeg
 86wgDI+u5VzR27TCCnOdfkj255WSsCkUYuj91IQjyAar5i2ckchHonhh8Im2J0dO0ZE2
 AtLnivo4VXkLMZD+ClqrzjSw7nT3Cmc48uuc9OpyereF9QBcS6n4mYr2cyKUY4owVHyM
 v20cJra88JMLQdLoD5ZXVYMgIB8jKqlAr+IwU3bBSzyoANOuCOdpiIoPmPDr516hpiMa
 Sjvw==
X-Gm-Message-State: ACrzQf0W3qBVrxkSnpcOyYRnaxRtM0nI/6Oh4UPWU4b30OjGz2toFdLE
 D01FjTibmsGS6VkIWx5fdJyfQQ==
X-Google-Smtp-Source: AMsMyM4E7CRVMXeIHXPCHENkYOv8om/41WMwldZVybkDrTD69yzxteayiw+wKYYFxxCSAoNyokB3IA==
X-Received: by 2002:a17:902:70c7:b0:183:3e66:fe48 with SMTP id
 l7-20020a17090270c700b001833e66fe48mr6865547plt.165.1665924458473; 
 Sun, 16 Oct 2022 05:47:38 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com
 ([2401:4900:57ef:25d:3187:d4f6:127:22d3])
 by smtp.googlemail.com with ESMTPSA id
 v18-20020a634812000000b0043b565cb57csm4444894pga.73.2022.10.16.05.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 05:47:37 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v11 0/5] RISC-V Smstateen support
Date: Sun, 16 Oct 2022 18:17:21 +0530
Message-Id: <20221016124726.102129-1-mchitale@ventanamicro.com>
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
X-List-Received-Date: Sun, 16 Oct 2022 12:47:42 -0000

This series adds support for the Smstateen specification which provides a
mechanism to plug the potential covert channels which are opened by extensions
that add to processor state that may not get context-switched. Currently access
to *envcfg registers and floating point(fcsr) is controlled via smstateen.

These patches can also be found on riscv_smstateen_v11 branch at:
https://github.com/mdchitale/qemu.git

Changes in v11:
- Rebase to latest riscv-to-apply.next
- set virt_inst_excp at the begining of decode_opc
- Add reviewed by in patch 4

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

Mayuresh Chitale (5):
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
 target/riscv/translate.c                  |   8 +-
 8 files changed, 536 insertions(+), 5 deletions(-)

-- 
2.25.1


