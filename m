Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EFAEB64D7
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 21:31:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEckS-0001p9-UR; Wed, 28 Jun 2023 17:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEckS-0001ok-8C
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 17:30:48 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEckQ-0007vI-5q
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 17:30:47 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-563305e8706so256975eaf.2
 for <qemu-riscv@nongnu.org>; Wed, 28 Jun 2023 14:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687987844; x=1690579844;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xapxJefoVFXjJorcqsj2mlb6KOj+wdv61DJB7tgDdEg=;
 b=V/GxvC07gAhIPNppMUHT1GHJbRnf8U5zMQD1aDJV+9LNuUS7rIxy9gW8o1NKp2TLvd
 ENPNdKHnQQR5rNkBc1gf6X539I+7+mHaFkVOezUgIVmEkEXM0Tqc7PsSI0khBvbMC0vN
 8tYF91qnU2lC3r3l0dEjrYwlFXscIQL8xRUYbqto09kVXfIojVaVL7IHzOIzXJ5dD1hs
 tfoCU881pwto2ARVa0B94uUakVWXvdh0ExR6tCvsDT72gpK/dSatlXx4pSWAUb9ABphI
 7xf0vTpdfgl5tp6inD3svLtKXTlAz9/7Pc6jwU+68ZpwGfkmZTnrDhfGbNoU9nf8Emi3
 8LLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687987844; x=1690579844;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xapxJefoVFXjJorcqsj2mlb6KOj+wdv61DJB7tgDdEg=;
 b=KS4SlmeKI5gmc5LZeMs3dNoqoeavpGivL4j53PpJDO5Ijm8BqOaS1/jhqDv09VE/cZ
 C3S88zNFDqteb/X7WM6bEHnCZYBhZT5ZcLFJN0vUVUY2sun6ZJ9aQyB3eZkl27mj5R5z
 DoaylwlRVWx5GkeSysCL1yR+SseFtY5XI7JSUk9w58IrSDKFobgV8clo7t12uqAB+j7j
 hHF9JsXt0h0kr3G2P8xPXrIlxKagMCmFo3IPL3ka3IUOZMTPXYT0Qby58cvkULoLGC2i
 Nu1ML0VnHl/MpFuzTr47aJbmTBDVEvzzfmzz7id/7iljmXeOuxkO6vJfVawhNCp2Knt2
 taKA==
X-Gm-Message-State: AC+VfDye/vfgnPaLRaOHz/TwVRh4q77Aiy+owktlAJ17GDSCjl723oVw
 1lasGEpNih45Mi4AEGPbkUgfHA==
X-Google-Smtp-Source: ACHHUZ5khVhuDy+J3I0nRmzxirfsVR6FYkgkTWgYR0EKpkmQzWmlIV3K91xKDrMeIq3HeAIO142U1w==
X-Received: by 2002:a4a:bc01:0:b0:558:b482:c3b3 with SMTP id
 i1-20020a4abc01000000b00558b482c3b3mr21767267oop.1.1687987843897; 
 Wed, 28 Jun 2023 14:30:43 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a4a4511000000b0056084a91c74sm832892ooa.24.2023.06.28.14.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 14:30:43 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 00/20] target/riscv, KVM: fixes and enhancements
Date: Wed, 28 Jun 2023 18:30:13 -0300
Message-ID: <20230628213033.170315-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2a.google.com
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

This new version has changes suggested by Phil in v5. It also has some
changes I made on the fly. The short summary is:

- use "#ifndef CONFIG_USER_MODE kvm_enabled() #endif" instead of a helper
  that wraps them all up. This was suggested by Phil to be more clear
  about the code that depends on KVM or not. A new patch (15) was added
  to keep the amount of #ifndefs in control in
  riscv_cpu_add_user_properties() due to this design change;

- misa_ext_info_arr[] is now indexed from 0 to 25 instead of 0 from
  potentially 1 << 25. Getters for 'name' and 'description' were added.

It's worth mentioning a change I decided to make that wasn't mentioned
in the v5 review. In patch 12, where we added KVM MISA properties, we
were trying to find the property before proceeding with
object_property_add() to add the remaining properties. I remembered that
we can also use object_property_try_add(). In fact,
object_property_add() is a simple call for object_property_try_add()
that uses &error_fatal. And it turns out that and the only error being
reported by try_add() happens when object_property_find() finds a
property with the same name. This means that we can use
object_property_try_add() with an error pointer and, if an error is
reported, it means that we already have the property. This change makes
us do a single object_property_find() instead of 2. 

Patches 6 and 17 (former 16) had trivial changes, all of them related to
the extinct riscv_running_kvm() helper, and I decided to keep their r-bs
for reviewer convenience.

Series was rebased on top of riscv-to-apply.next.

Patches missing reviews: 1, 11, 12, 14, 15.

Changes from v5:
- trivial changes (R-bs kept):
  - patch 6: use kvm_enabled() instead of riscv_running_kvm()
  - patch 17 (former 16): wrap cpu_set_cfg_unavailable() inside '#ifndef
    CONFIG_USER_MODE'
- patch 1:
  - riscv_running_kvm() removed
  - rename riscv_cpu_realize_functions() to riscv_cpu_realize_tcg()
  - use 'tcg_enabled()' before riscv_cpu_realize_tcg()
  - reword commit msg to indicate that we're checking positive for TCG
    instead of negative for KVM
- patch 11:
  - misa_ext_info_arr[] is now indexed from 0 (A-A) to 25 (Z-A)
  - getter functions for 'name' and 'description' were added
  - misa_ext_info_arr[] is no longer exported in target/riscv/cpu.h
  - 'name' and 'description' of misa_ext_cfg[] must now be populated
    after initialization because misa_ext_info_arr[] is no longer a
    constant array
- patch 12:
  - use object_property_try_add() in riscv_cpu_add_misa_properties().
    It'll set an Error pointer if the property already exists. Use that
    to skip an already created property instead of doing a redundant
    object_property_find() beforehand
  - moved the object_property_find() code that was checking for
    multi-letter properties to patch 14
  - use the new getters() from patch 11 instead of reading the array
    directly
- patch 14:
  - added the code from patch 12 that checks for an existing
    multi-letter property. Add a kvm_enabled() check around it in
    preparation for the mock KVM properties patch later on
- patch 15 (new):
  - create satp_mode properties earlier to avoid an extra #ifndef
    CONFIG_USER_MODE block
- v5 link: https://lists.gnu.org/archive/html/qemu-devel/2023-06/msg05984.html

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
 target/riscv/cpu.c                            | 322 +++++++++--
 target/riscv/cpu.h                            |   7 +-
 target/riscv/kvm.c                            | 499 +++++++++++++++++-
 target/riscv/kvm_riscv.h                      |   1 +
 19 files changed, 917 insertions(+), 91 deletions(-)

-- 
2.41.0


