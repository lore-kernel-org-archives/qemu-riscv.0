Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634D2EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 21:41:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHAEQ-0004kk-Ec; Wed, 05 Jul 2023 17:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHAEJ-0004jX-JO
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 17:40:07 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHAEH-0001Yj-H8
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 17:40:07 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-55b8f1c930eso4612839eaf.3
 for <qemu-riscv@nongnu.org>; Wed, 05 Jul 2023 14:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688593204; x=1691185204;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+ZZ9FOf+ijHw8rtn0izfd5SdfH+XKwxMBzyU9jGP940=;
 b=EVJd3McFmFStrbkaUo7BWOwHJrb5zYTkeaOG6161etNUBD6jfFKhWb+7gPvBkU3+SG
 Qnke7I1uuH+xccDT4/WbdG9B7KcqHgPdRtDtGqtnfT3sqdwIzpVuamIBUAsIClTYKjpB
 wkrmepFLqDdblaqtlWEeqMv8RGO+osUMKiKvV8QYUBh7xTQLX9t8/FVRTAVRi3HcA4yj
 ha0jYOiqD9SVqWwMPKFcK3/xQS2DqCtsEmsm4W4H2OCbQp7J+YrxlMGgbLrDUXde26oJ
 jSchOkwEAp5SuyYrrU9NyXKFV9+8KDV4FRhooQmVhs4UqrSiacYG8xtt3lh3HEZq8irz
 G8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688593204; x=1691185204;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+ZZ9FOf+ijHw8rtn0izfd5SdfH+XKwxMBzyU9jGP940=;
 b=RUR/ZLY5OTs5Fpi4lig4s6vLmvNBHJdKfL0yQj3JAhSPBDiG3JRnnQhDhhdq7llD2H
 nfKaLScj3ewkJUNoPx/BxSYEs/V+GHdnq9d2vX0Q6dNbgJsgA/4QX0jfvUNBZCip9mYp
 HSCrYoqA3XAanz2ofQlSTyYFeStu+qkH097DabJW/u8R2/Ugjb3rhSaWTkxEKxTOXg5N
 VhQUvKJzuMjvdYT2fdmoFBmtbLk3bIxB9LkAlI9r1VCli8lyVq51IGts6gl5Wnz2Vq2B
 /FvdBamSlQis7opgAhGlzlSG6a04CnkbJOOlHUUjoIsiyDepR7yWqOTaLLbFIf7I5k8g
 JzjA==
X-Gm-Message-State: ABy/qLaGwyPTN1EHmfsG5Tb2yjsQyydtgMiHUSXq4fHw2lE3wQYK3opk
 KpnjxzfcKEHwGzIuqsHUaWcJ3w==
X-Google-Smtp-Source: APBJJlE/50fpCNS3jI4oq+3hmlHjo7Hsw5l2ZlX3rE5Hl/mY1NWc13Lj3MDLPkFFoDnO4gWI9G+wlw==
X-Received: by 2002:a4a:4151:0:b0:55e:9ee:2a30 with SMTP id
 x78-20020a4a4151000000b0055e09ee2a30mr19012ooa.4.1688593204075; 
 Wed, 05 Jul 2023 14:40:04 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a4add01000000b0056665a16536sm70764oou.30.2023.07.05.14.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 14:40:03 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 00/20] target/riscv, KVM: fixes and enhancements 
Date: Wed,  5 Jul 2023 18:39:35 -0300
Message-ID: <20230705213955.429895-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc30.google.com
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

This version has a last minute change in patch 14. It's a bug fix and a
design change.

The bug fix: ioctl() will always error out with -1 and return the error
code in 'errno'. I was checking the ioctl() return value for EINVAL,
which doesn't work.

The design change has to do with discussions between Andrew and Anup and
myself in our internal Slack. RISC-V KVM is overusing the EINVAL error
code in set_one_reg() and get_one_reg() APIs, making it very hard for
userspace (such as QEMU, crosvm, etc) to tell what went wrong. In our
case, patch 14 is making an EINVAL assumption that we're not confident
about because this error code can mean almost anything.

We'll push for a KVM change in the next few days. As far as QEMU goes
we're going to do what we consider the right thing: check for ENOENT
instead of EINVAL in patch 14. The reason why we're doing this change
right now in QEMU, instead of waiting for KVM to change first, can be
better explained by Drew's comment in version 7 [1]:

" But, also as discussed internally, based on our upcoming plans to use
ENOENT for missing registers, we should change this check to be for
ENOENT now. While that may seem premature, I think it's OK, because
until a KVM which returns ENOENT for missing registers exists and is
used, QEMU command lines which disable unknown registers will be
rejected. But, that will also happen even after a KVM that returns
ENOENT exits if an older KVM is used. In both cases that's fine, as
rejecting is the more conservative behavior for an error. Finally, if
the yet-to-be-posted KVM ENOENT patch never gets merged, then we may be
stuck rejecting forever anyway, since EINVAL is quite generic and
probably isn't safe to use for this purpose."

Checking for ENOENT is the right approach and we'll change QEMU to
implement it right off the gate for 8.1. In case KVM refuses to change
we'll error out in all cases in patch 14, which is still a better
solution than making guesses about EINVAL means.


Series based on top of Alistair's riscv-to-apply.next.

Patches missing review: 14

Changes from v7:
- Patch 14:
  - use 'errno' to check the error code from ioctl()
  - test for ENOENT instead of EINVAL
- v7 link: https://lore.kernel.org/qemu-devel/20230630100811.287315-1-dbarboza@ventanamicro.com/

[1] https://lore.kernel.org/qemu-devel/20230705-091906904fcc54a4ce96e625@orel/

Daniel Henrique Barboza (20):
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
  target/riscv/cpu: add misa_ext_info_arr[]
  target/riscv: add KVM specific MISA properties
  target/riscv/kvm.c: update KVM MISA bits
  target/riscv/kvm.c: add multi-letter extension KVM properties
  target/riscv/cpu.c: add satp_mode properties earlier
  target/riscv/cpu.c: remove priv_ver check from riscv_isa_string_ext()
  target/riscv/cpu.c: create KVM mock properties
  target/riscv: update multi-letter extension KVM properties
  target/riscv/kvm.c: add kvmconfig_get_cfg_addr() helper
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
 target/riscv/cpu.c                            | 341 ++++++++++--
 target/riscv/cpu.h                            |   7 +-
 target/riscv/kvm.c                            | 499 +++++++++++++++++-
 target/riscv/kvm_riscv.h                      |   1 +
 19 files changed, 940 insertions(+), 87 deletions(-)

-- 
2.41.0


