Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CDAC7EE24
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 May 2023 19:47:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q45Ik-0006Qu-Fp; Tue, 30 May 2023 15:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45Ii-0006PJ-QC
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 15:46:36 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45Ig-0004Eb-PC
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 15:46:36 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-19e82ae057eso3465843fac.3
 for <qemu-riscv@nongnu.org>; Tue, 30 May 2023 12:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685475993; x=1688067993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jV0wdAEdnIIPvmHtueAa2NVQVAODBEPJ0bDiNc07RgM=;
 b=ajr+JKfvXVcgdTTMWj4/ckpW07TnWAK9BXwkO5XhIiGRA8C1ssjfpizakB6uRkNeyE
 gDXEcqox50TjejNq/OzQ+E1irbqWOrkHiP6EuSBpbnTOHn2n6FNfWgHxcNVxoyfrE9DR
 mAATlAfWOVDrYxpcYkb/9qpuvLIW3i76GPNyHPWsdHZhYxEVYF/BDOrjDiqQ140+8Exv
 RJ9Tveb9oXQXU2o4ZrzvOYUOkURUHVCWsWNav0GWK0jKhFBnjj0ximR536hTIIS54nsT
 YmBzX4C53stcToEQoJne2UFonG/jBr/DN+H+Xpt3nfCUVC4FKqza2zpsxOAi7alxH2Rx
 fcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685475993; x=1688067993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jV0wdAEdnIIPvmHtueAa2NVQVAODBEPJ0bDiNc07RgM=;
 b=OKMBAZAWOjR3Wt5Y8TsH5Qh5FBYtN/0vqUzAhDjVmFRl5fKTchHjXiY+b2VZgPH1dA
 uUo8NogQtx9LUuJVQDDnmT2Uytzy4Qe91BF8Es0OxeGbHDwP4rU0dlSumGMjwQF2EyFY
 49Qu+fF3W5iXmIVDSvOCm0T0x3eWnVpm6crUhxYNT8svwNGK8Db6zLWDCQxuHNyq4wVO
 dGCcU04NBY1NNh1a05Chbt4q6CowNahpbYuF8mWEKJ2pBlTsuooRHmsVPt8lCm+wSj/L
 HGcQO1GM0Sny04dGF+XcrVbHQ4cO0qAHr45oxdZT0P7tOfkIRIP2zItE+xO8B8F0eHPJ
 wNBQ==
X-Gm-Message-State: AC+VfDzdZxL/YmbvESmFBLuuGc7UwjEOp9ef164OAfECPz9vZmd9yADK
 HD2IDoXtJUyVe4pRaEVNK7Dzjg==
X-Google-Smtp-Source: ACHHUZ7iSNpDJzpeHv7+KiKH0XUEriM55CFIqK20JxS5WuzpSFxuST5ajp0qKwCXi15EXb+G2SiTlg==
X-Received: by 2002:a05:6870:1985:b0:19f:ad5a:f518 with SMTP id
 v5-20020a056870198500b0019fad5af518mr212347oam.25.1685475992966; 
 Tue, 30 May 2023 12:46:32 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (200-162-225-121.static-corp.ajato.com.br. [200.162.225.121])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a056870a48300b0019fa8728b05sm342214oal.39.2023.05.30.12.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:46:32 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 00/16] target/riscv, KVM: fixes and enhancements
Date: Tue, 30 May 2023 16:46:07 -0300
Message-Id: <20230530194623.272652-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2e.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi,

This is a series that does a lot of design changes w.r.t KVM support in
the RISC-V machines. 

The most straightforward patches are patches 1 and 2, which are bug fixes
that allows the KVM 'host' CPU to boot.

For the remaining 14 patches I'll describe in text form the changes
intended:

- machine_ids (mvendorid, marchid, mimpid) changes

  - for named CPUs: can't be changed from the value previously set by
    their cpu_init()
  - for the KVM 'host' CPU: can't be changed from the host value
  - for generic CPUs (both TCG and KVM): can be changed at will, as
    long as marchid has a valid value


- KVM extension discovery during init

  We want extensions to be validated in user option callbacks to
  alleaviate the work we need to do during kvm_arch_init_vcpu().

  This can only be done if we discover host capabilities sooner than
  realize() time. We're borrowing a solution from ARM called 'scratch
  CPU', where we initialize KVM fds to be able to read host capabilities
  and discard the CPU afterwards. This scratch CPU is spinned during
  cpu_init() time to fill in default values for KVM extensions. It's
  also possible to error out right away depending on the errors found
  during this process.

- KVM specific user options

  The current design of user options for TCG is not enough to implement
  error handling in KVM because we don't know whether the user set an
  specific option or not. This is crucial to determine whether we should
  error out or keep going when facing a KVM side error.

  KVM options have a 'user_set' flag to determine if the user changed
  that specific config option or not. They also have specific KVM
  attributes such as kvm_reg_id and 'supported' that are also used for
  error handling.

- KVM extensions error handling changes

  We determine if a case is serious enough to error out or not based on
  two factors: user input and KVM support. KVM support is determined by
  the error code that KVM might thrown our way. RISC-V KVM uses 'EINVAL'
  to tell that a given reg is not available to be read/written by the
  kvm_get/set_one_reg() ioctl. Searching for the EINVAL error allow us
  to determine if a given extension is not supported during the KVM
  feature discovery step.

  As a rule we don't error out in two scenarios:

  - The user is setting an extension to the same value as present in the
    host. In this case we just ignore the option altogether;
  - The user is disabling an extension (i.e. turning off) that is not
    supported by KVM. E.g the user sets 'zbb=false' and KVM is not able
    to read/write 'zbb'. We don't error out because this is a common
    case that can happen when running QEMU with older KVM versions.

  We error out in the following scenariosn:

  - All errors that happens when user tries to enable an extension.
    Failing to enable an extension is bad because there are user
    expectations with enabled extensions and how the guest will behave; 

  - User disables an extension that KVM support and KVM throws an error
    when trying to disable it. We rrror out because, unlike the case
    where KVM is alien to the extension, this indicates either a KVM
    limitation or any other error that the user should be aware of. For
    instance, as of Linux 6.4 rc1, RISC-V KVM doesn't allow 'ssaia',
    'sstc', 'svinval', 'zihintpause' and 'zbb' to be disabled. Thus a
    failure in disabling 'zbb' is something that is worth aborting the
    launch.

- Difference between single-letter and multi-letter extensions handling

  We don't support enabling a single-letter extension that is not
  already enabled in the host. In other words we just support disabling
  existing single-letter extensions.

  The same doesn't apply for multi-letter extensions because, although
  it's not the case for KVM at this moment, KVM is likely to have cases
  where certain extensions are disabled by vendors but can be enabled by
  users that want to try it out. We're already supporting this case to
  avoid changing the design later.


Things that are known to be missing/pending:

- named CPU KVM support: I want to forbid this use case entirely, but
  refrained to do it in this series because it's a bit too overloaded
  with changes as is;

- documentation changes: it would be nice to have these design decisions
  documented. I'll work in it as a follow-up.


Daniel Henrique Barboza (16):
  target/riscv: skip features setup for KVM CPUs
  hw/riscv/virt.c: skip 'mmu-type' FDT if satp mode not set
  target/riscv/cpu.c: restrict 'mvendorid' value
  target/riscv/cpu.c: restrict 'mimpid' value
  target/riscv/cpu.c: restrict 'marchid' value
  target/riscv: use KVM scratch CPUs to init KVM properties
  target/riscv: read marchid/mimpid in kvm_riscv_init_machine_ids()
  target/riscv: handle mvendorid/marchid/mimpid for KVM CPUs
  linux-headers: Update to v6.4-rc1
  target/riscv/kvm.c: init 'misa_ext_mask' with scratch CPU
  target/riscv: add KVM specific MISA properties
  target/riscv/kvm.c: update KVM MISA bits
  target/riscv/kvm.c: add multi-letter extension KVM properties
  target/riscv: adapt 'riscv_isa_string' for KVM
  target/riscv: update multi-letter extension KVM properties
  target/riscv/kvm.c: read/write (cbom|cboz)_blocksize in KVM

 hw/riscv/virt.c                               |  14 +-
 include/standard-headers/linux/const.h        |   2 +-
 include/standard-headers/linux/virtio_blk.h   |  18 +-
 .../standard-headers/linux/virtio_config.h    |   6 +
 include/standard-headers/linux/virtio_net.h   |   1 +
 linux-headers/asm-arm64/kvm.h                 |  33 ++
 linux-headers/asm-riscv/kvm.h                 |  53 +-
 linux-headers/asm-riscv/unistd.h              |   9 +
 linux-headers/asm-s390/unistd_32.h            |   1 +
 linux-headers/asm-s390/unistd_64.h            |   1 +
 linux-headers/asm-x86/kvm.h                   |   3 +
 linux-headers/linux/const.h                   |   2 +-
 linux-headers/linux/kvm.h                     |  12 +-
 linux-headers/linux/psp-sev.h                 |   7 +
 linux-headers/linux/userfaultfd.h             |  17 +-
 target/riscv/cpu.c                            | 171 +++++-
 target/riscv/kvm.c                            | 553 +++++++++++++++++-
 target/riscv/kvm_riscv.h                      |   3 +
 18 files changed, 855 insertions(+), 51 deletions(-)

-- 
2.40.1


