Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0yq-0006vF-7d
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:41:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yj-0006dB-Rb
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:26 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yh-0007l9-I8
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:25 -0500
Received: by mail-pl1-x632.google.com with SMTP id i10so1957858plr.9
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832880;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=cA5Y+KbcBhbpJVVUDMsc73WGhf4Yw87C/H5gtu7S7LU=;
 b=Qe9dmeadPzBtO2wkLRJBuJvexil778XWGL7Jep6f16K+aOZCJFNMKGZe88NvEYDkbt
 zfM6hB/+hjLtwP9SgNRd57WGq4GJfuknlsWQwdLxvHIa3Zdj0ywzFtJl1cJU3FZzb2xV
 nTVUuyNBk9G9dh8pZGoMI+8K88KpZX0NnVLIK8NYyMisBLcWS7GxWJdY6nhuIl3P1BIX
 gNe6WD+/xti+isbSZdR7jwJBpYz7+hgF6+eARK7ccQRCRqPXJby6w6W4F6tnBFz1atCn
 atOZfg7fdYpuI0ZJ9UFB5TQ7YZT97YX0eYIOMYf9MR7ytAGXAVX/dXRQZUqKcZksIXLD
 wI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832880;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cA5Y+KbcBhbpJVVUDMsc73WGhf4Yw87C/H5gtu7S7LU=;
 b=gUXUE6gh9BMMDJOdKjskge4gBWd1epuwccIXh/0nLAH8evNH+gX2pClbxAYCQ4UXkb
 WStnhC++vFDg6TIxOZkafpLmXyWo36cZ+mFdSc4wTQYXqQaQngPCqaqyJJkLU9aEsp1h
 8xGGqwgQD2P4oKRMThxMrv215RfSRKP4a0oLLIEQ5XI6kNlghzpcqOBdr6EpBhjmV+SF
 PSL3L7WdshuSiSmafV1kT46TFCSboaX+KSHZuxlDimKWZfQo/igO1QSLTLgE41bUSJeB
 nZ6mor5o65eb3Fj43zhsLVwyYtsWQxNNW1RXb7SyfF3gR4VGFr65n4Bw0qjZMH0AR65w
 sHZw==
X-Gm-Message-State: AO0yUKXMd9IqJFGyjRXKtDyj1/XtqSAl/33nf0u7bP4gYC5omvEOE/rk
 PX5Uc+VVKo+FSwD80DNvdtzrHBngX/0ydgmI
X-Google-Smtp-Source: AK7set8jzmp6ininuRZK9zZyhjHmg50a+4Bn6jKggFZUX3TMPiPAKY4JbAWiSKk6184kO5YtUtImUA==
X-Received: by 2002:a17:90b:1e41:b0:237:39b1:7b1 with SMTP id
 pi1-20020a17090b1e4100b0023739b107b1mr837470pjb.39.1677832879864; 
 Fri, 03 Mar 2023 00:41:19 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 j14-20020a17090a2a8e00b0023739b104f8sm979357pjd.50.2023.03.03.00.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:19 -0800 (PST)
Subject: [PULL 00/59] Fifth RISC-V PR for QEMU 8.0
Date: Fri,  3 Mar 2023 00:36:41 -0800
Message-Id: <20230303083740.12817-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 03 Mar 2023 08:41:26 -0000

merged tag 'buildsys-qom-qdev-ui-20230227'
The following changes since commit 627634031092e1514f363fd8659a579398de0f0e:

  Merge tag 'buildsys-qom-qdev-ui-20230227' of https://github.com/philmd/qemu into staging (2023-02-28 15:09:18 +0000)

are available in the Git repository at:

  https://gitlab.com/palmer-dabbelt/qemu.git tags/pull-riscv-to-apply-20230303

for you to fetch changes up to 37151032989ecf6e7ce8b65bc7bcb400d0318b2c:

  Merge patch series "target/riscv: some vector_helper.c cleanups" (2023-03-01 18:09:48 -0800)

----------------------------------------------------------------
Fifth RISC-V PR for QEMU 8.0

* Experimantal support for writable misa.
* Support for Svadu extension.
* Support for the Zicond extension.
* Fixes to gdbstub, CSR accesses, dependencies between the various
  floating-point exceptions, and XTheadMemPair.
* Many cleanups.

----------------------------------------------------------------
There's a lot of cleanups here, a handful of which ended up stepping on
each other and were necessary for various features.  I tried to keep
each individual patch set intact, but that led to some merge conflicts
and a bit of a clunky history -- I'm not sure what the right answer is
there, happy to re-spin this to be more linear if that's problem for
folks.

Unfortunately the OpenSBI bump is still failing CI, it turns out I
missed the second stage.  I was intending on having a sixth PR anyway as
I'd really like to get the ACPI patches in for 8.0 so we can start
testing everywhere else.  There's also a patch set from Daniel that's
ready to go but depends on some recently merged TCG patches, so I
figured it'd be better to just send what's ready now rather than trying
to make the history more complicated.

This all passes my local tests ("make check" and a bunch of Linux
configs), but "push-ci-now" is still tripping up on OpenSBI as that's
due to some network resources changing.  With any luck I'll have some
time to sort things out this weekend (though always happy to have some
help if anyone wants to throw in some time).

----------------------------------------------------------------
Bin Meng (20):
      target/riscv: gdbstub: Check priv spec version before reporting CSR
      target/riscv: Add some comments to clarify the priority policy of riscv_csrrw_check()
      target/riscv: Use g_assert() for the predicate() NULL check
      target/riscv: gdbstub: Minor change for better readability
      target/riscv: gdbstub: Do not generate CSR XML if Zicsr is disabled
      target/riscv: Coding style fixes in csr.c
      target/riscv: Use 'bool' type for read_only
      target/riscv: Simplify {read, write}_pmpcfg() a little bit
      target/riscv: Simplify getting RISCVCPU pointer from env
      target/riscv: Avoid reporting odd-numbered pmpcfgX in the CSR XML for RV64
      target/riscv: gdbstub: Turn on debugger mode before calling CSR predicate()
      target/riscv: gdbstub: Drop the vector CSRs in riscv-vector.xml
      target/riscv: Allow debugger to access user timer and counter CSRs
      target/riscv: Allow debugger to access seed CSR
      target/riscv: Allow debugger to access {h, s}stateen CSRs
      target/riscv: Allow debugger to access sstc CSRs
      target/riscv: Drop priv level check in mseccfg predicate()
      target/riscv: Group all predicate() routines together
      hw/riscv: Skip re-generating DT nodes for a given DTB
      hw/riscv: Move the dtb load bits outside of create_fdt()

Christoph Müllner (1):
      RISC-V: XTheadMemPair: Remove register restrictions for store-pair

Daniel Henrique Barboza (16):
      target/riscv: introduce riscv_cpu_cfg()
      target/riscv: do not mask unsupported QEMU extensions in write_misa()
      target/riscv: allow MISA writes as experimental
      target/riscv: remove RISCV_FEATURE_DEBUG
      target/riscv/cpu.c: error out if EPMP is enabled without PMP
      target/riscv: remove RISCV_FEATURE_EPMP
      target/riscv: remove RISCV_FEATURE_PMP
      hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in create_fdt_socket_cpus()
      target/riscv: remove RISCV_FEATURE_MMU
      target/riscv/cpu: remove CPUArchState::features and friends
      target/riscv/csr.c: use env_archcpu() in ctr()
      target/riscv/csr.c: simplify mctr()
      target/riscv/csr.c: use riscv_cpu_cfg() to avoid env_cpu() pointers
      target/riscv/csr.c: avoid env_archcpu() usages when reading RISCVCPUConfig
      target/riscv/vector_helper.c: create vext_set_tail_elems_1s()
      target/riscv/vector_helper.c: avoid env_archcpu() when reading RISCVCPUConfig

Palmer Dabbelt (6):
      Merge patch series "make write_misa a no-op and FEATURE_* cleanups"
      Merge patch series "target/riscv: Some updates to float point related extensions"
      Merge patch series "target/riscv: Various fixes to gdbstub and CSR access"
      Merge patch series "target/riscv: Add support for Svadu extension"
      Merge patch series "RISCVCPUConfig related cleanups"
      Merge patch series "target/riscv: some vector_helper.c cleanups"

Shaobo Song (1):
      target/riscv: Fix checking of whether instruciton at 'pc_next' spans pages

Weiwei Li (21):
      target/riscv: Fix the relationship between Zfhmin and Zfh
      target/riscv: Fix the relationship between Zhinxmin and Zhinx
      target/riscv: Simplify the check for Zfhmin and Zhinxmin
      target/riscv: Add cfg properties for Zv* extensions
      target/riscv: Fix relationship between V, Zve*, F and D
      target/riscv: Add property check for Zvfh{min} extensions
      target/riscv: Indent fixes in cpu.c
      target/riscv: Simplify check for Zve32f and Zve64f
      target/riscv: Replace check for F/D to Zve32f/Zve64d in trans_rvv.c.inc
      target/riscv: Remove redundunt check for zve32f and zve64f
      target/riscv: Add support for Zvfh/zvfhmin extensions
      target/riscv: Fix check for vector load/store instructions when EEW=64
      target/riscv: Simplify check for EEW = 64 in trans_rvv.c.inc
      target/riscv: Expose properties for Zv* extensions
      target/riscv: Add support for Zicond extension
      target/riscv: Fix the relationship between menvcfg.PBMTE/STCE and Svpbmt/Sstc extensions
      target/riscv: Fix the relationship of PBMTE/STCE fields between menvcfg and henvcfg
      target/riscv: Add csr support for svadu
      target/riscv: Add *envcfg.PBMTE related check in address translation
      target/riscv: Add *envcfg.HADE related check in address translation
      target/riscv: Export Svadu property

 hw/riscv/sifive_u.c                          |  30 +--
 hw/riscv/virt.c                              |  35 +--
 include/hw/riscv/sifive_u.h                  |   1 +
 target/riscv/cpu.c                           | 134 ++++++----
 target/riscv/cpu.h                           |  34 +--
 target/riscv/cpu_bits.h                      |   4 +
 target/riscv/cpu_helper.c                    |  24 +-
 target/riscv/csr.c                           | 354 ++++++++++++++-------------
 target/riscv/gdbstub.c                       | 100 ++------
 target/riscv/insn32.decode                   |   4 +
 target/riscv/insn_trans/trans_rvv.c.inc      | 184 +++++---------
 target/riscv/insn_trans/trans_rvzfh.c.inc    |  25 +-
 target/riscv/insn_trans/trans_rvzicond.c.inc |  49 ++++
 target/riscv/insn_trans/trans_xthead.c.inc   |   4 -
 target/riscv/machine.c                       |  11 +-
 target/riscv/monitor.c                       |   2 +-
 target/riscv/op_helper.c                     |   2 +-
 target/riscv/pmp.c                           |   8 +-
 target/riscv/translate.c                     |   3 +-
 target/riscv/vector_helper.c                 | 104 +++-----
 20 files changed, 538 insertions(+), 574 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzicond.c.inc



