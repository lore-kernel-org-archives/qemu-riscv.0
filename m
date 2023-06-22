Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12B5EB64DB
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 13:58:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCKoE-0007TZ-QL; Thu, 22 Jun 2023 09:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCKoA-0007Rw-Sz
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 09:57:11 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCKo8-0000RK-Lv
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 09:57:10 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-560c617c820so755623eaf.3
 for <qemu-riscv@nongnu.org>; Thu, 22 Jun 2023 06:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687442227; x=1690034227;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jH6adjjNIur8DPsLYot2p1s8K8xzt4EF20Wzmpu3ruM=;
 b=j+lkyXelC+sW2snsiLDX2OpOaks7GnwHs2/IW56GdHKVw9YM7nw4SRoX145poKXzwk
 NMQJE6lWGgunPmG6CYeg3uhkW1LenyOYq9uHqtuQMTjxiJwttb3FO3npSsWkr8eAAQvF
 lGU5fgXgFOdKv7bh7o48Cf4z+UGQhAJf1tT/3CtoHhGoIpSwzeAovh5d84gjU457grfz
 L3geGhnqUHe5Ucn1EludLXfHXSJjx+yZR3GAbCHCxY5O/lvB9KkLelyrUflncyp6NNgw
 pbJTugyNNnfXTX6gTGcFVcmzeNd/tKWNPbBQjWAC7Iwd/YxYL2RzwR+meGvlMyv0lYvg
 oNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687442227; x=1690034227;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jH6adjjNIur8DPsLYot2p1s8K8xzt4EF20Wzmpu3ruM=;
 b=hHYc+DiPUx0RHEihnoRrfKeA/g76GggUOg91LmY1r4j4QN0QfN/23jfaK1/B2cxirc
 tj2Z9A+eKImZW9tMut3s54hnDUGq3/ordUl5iPdGjuivO125idds21gXd6c+K97YbGG0
 yfOYf/OHvJKe8RN0XoxR0JRQvUAnZgP5OeyX6lCwgHQ5uZ4r03SXI9x12KdkwEd5umI4
 uTErz9SPwo0pCSICV2800kqQc11vKW9vmtg2LqS4YjTqDOjgCAM+0xN5HmHriKvfLkFC
 5gJg2WsYJvObN+Ngj64OxVX0YD7UhoAMuxtKjz+VYJu2McRMYKlmWR9gJiDVYXXHMSKJ
 B2uA==
X-Gm-Message-State: AC+VfDxwFbn1YGjWDPeay8F+C580GdGBCa3eAU9kbC48FYbO5e4f2YeN
 so2bb3tFkPMlNTA8UGx8UQf6Xw==
X-Google-Smtp-Source: ACHHUZ4c/QYwYzq51mCNCbYY5eUhvHiV4A1w8fTyMUR+ID5ssRurgEEb5vIc/F4fhuwsGp/shD1CSQ==
X-Received: by 2002:a4a:d9d5:0:b0:558:b78d:8d1c with SMTP id
 l21-20020a4ad9d5000000b00558b78d8d1cmr13597275oou.7.1687442227262; 
 Thu, 22 Jun 2023 06:57:07 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a4aa446000000b00562f06fb5easm156677ool.11.2023.06.22.06.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 06:57:06 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 00/19] target/riscv, KVM: fixes and enhancements
Date: Thu, 22 Jun 2023 10:56:41 -0300
Message-ID: <20230622135700.105383-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc36.google.com
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

In this new version the highlight is the changes in how we're making
riscv_isa_string_ext() work with KVM CPUs. A new patch (patch 15) was
added where we eliminate an unneeded priv_check from the function,
sparing us from having to assign an env->priv_ver for the 'host' CPU
type.

Then, in patch 16, instead of making changes with tcg/kvm extensions
lists and so on, we're avoiding the problem altogether with mock/no-op
properties. We go through all the extension flags (boolean values only)
from riscv_cpu_extensions[] and, if the option wasn't already created by
the KVM driver, we assign a no-op set() callback to it. This allows the
user to use any property, kvm-only or otherwise, and the KVM guest can
safely ignore it. 

Last but not the least, patch 11 was changed as requested by Andrew in
v2.

Series is rebased on top of Alistair's riscv-to-apply.next.

Patches missing review: 11, 15, 16.

Changes from v2:
- patch 11:
  - renamed misa_ext_infos[] to misa_ext_info_arr[]
  - mention that misa_ext_cfgs[] also needs update in cpu.h
  - misa_ext_info_arr[] moved to cpu.c to be used as extern
- patch 13:
  - amended commit msg to clarify that all extensions, MISA Or multi-letter,
    should be enabled and advertised by KVM
  - fixed comment in kvm_riscv_update_cpu_misa_ext()
- patch 15 (new):
  - remove priv_ver check from riscv_isa_string_ext()
- patch 16 (former 15):
  - reworked: instead of reworking riscv_isa_string_ext(), add mock KVM
    properties
- v2 link: https://lists.gnu.org/archive/html/qemu-devel/2023-06/msg02790.html

Daniel Henrique Barboza (19):
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
 target/riscv/cpu.c                            | 282 ++++++++--
 target/riscv/cpu.h                            |  11 +-
 target/riscv/kvm.c                            | 499 +++++++++++++++++-
 target/riscv/kvm_riscv.h                      |   1 +
 19 files changed, 891 insertions(+), 81 deletions(-)

-- 
2.41.0


