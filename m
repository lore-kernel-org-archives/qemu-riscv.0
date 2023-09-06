Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54838EB8FAD
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 09:18:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qdoep-0002lP-CG; Wed, 06 Sep 2023 05:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qdoej-0002e5-M7
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 05:17:03 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qdoed-0005bJ-Tu
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 05:17:01 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6c0828c3c2dso1898758a34.1
 for <qemu-riscv@nongnu.org>; Wed, 06 Sep 2023 02:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693991814; x=1694596614; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zlOwNIRM0PbqstbbSmabZYb/WTRjrOsuhxAOr8eqItQ=;
 b=Ne0tSZZr0/j8iCE6D7S9NFAdwGL3Nh4G/Mk8FJnA7+cfpeg7JUJ3m8kOPC3aE9bpNr
 TvX2Ni4+PGOcgSIXnIFI0ffl7NAFvZziiJegqv+FUUxog6OkXL+RqfxbsTgzZCgTyT8c
 RMEIXqZgJSg6r6YALLEsGSFIpvnBTf8XmSqS1e8QyHO6xs8Sv4mga7Fvo5NJh12PomIc
 FU5ODO/5UiIEmGM5/GKgH0wDucvujmpGoqt0fL4BqfIt+kxSjW7vIPMEdnZShlzgSIo1
 sa2KJkIpruoPZXCTKQtitrlj9kzoKxzZ8G5J56ZcjjScLFss5Wqvuc/BmGglnDG1FPYv
 tKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693991814; x=1694596614;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zlOwNIRM0PbqstbbSmabZYb/WTRjrOsuhxAOr8eqItQ=;
 b=jVT3vKbyok/eBfnUUvIa8imVLTrSAP8LQwZG7DdQPeDmpmPc/hQBrhwin3ciayDMHn
 TLcVXb5AgMllynMB6p1/8hbdu7WOTauSAbqKHK+ZRRV57iil9pyboVcSM3uXiTFT6GE5
 pi9uIm1XQnKAjqStCYwvkGxgH3geo9NCioFfxJ48qawcDpIsFrEPZK3SNjMj/u7dA/eY
 YheQ71wtMHkmUeK2EAvKokjWm9pBgfuOEavDS3vm8u7BbBPewvssJMPHUyISaRSucLNI
 FNwbNsLzThkZ3HdoLFachGYmPtGFtemVtJY3cO/WicieorDmc5saUDtYxC4zRx4PCLG6
 9uwQ==
X-Gm-Message-State: AOJu0YxrWdgDgqsH9NnlaAYudtg4WmTSVNBTSL0NQ1qF1tRfJ6KH2+Ba
 dM3RdriLvd/SocxhFZWBqwyo7w==
X-Google-Smtp-Source: AGHT+IGXLPJAEUfrAPuvn7hcFmZtHLwCTHZqaHVLwnUpUBI29cSrSOdYeqDxh5w/0ooaWqcCWuGVhQ==
X-Received: by 2002:a9d:6845:0:b0:6b9:1917:b2f3 with SMTP id
 c5-20020a9d6845000000b006b91917b2f3mr15989713oto.33.1693991813852; 
 Wed, 06 Sep 2023 02:16:53 -0700 (PDT)
Received: from grind.. ([177.94.15.194]) by smtp.gmail.com with ESMTPSA id
 n21-20020a9d6f15000000b006b75242d6c3sm6229228otq.38.2023.09.06.02.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 02:16:53 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 00/19] riscv: split TCG/KVM accelerators from cpu.c
Date: Wed,  6 Sep 2023 06:16:27 -0300
Message-ID: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Based-on: 20230901194627.1214811-1-dbarboza@ventanamicro.com
("[PATCH v9 00/20] riscv: 'max' CPU, detect user choice in TCG")

Hi,

This v2 contains changes suggested by Drew and Phil in v1.

The series is now focused in the task at hand (split the accelerators),
avoid changing existing behavior.

The following v1 patches were dropped:

- patches 5 and 6: the idea of having fine grained CPU behavior defined
  via class properties is too much for what we have today (generic CPUs,
  vendor CPUs and the 'host' KVM CPU). If we decide to add a forth CPU
  stereotype we can revisit this design

- patches 19 and 20: partially for the same reason as we dropped patches
  5 and 6. Second reason is that the design change disallowing vendor
  CPU support in KVM is too much to be tackled in this series and it
  deserves its separated thread

Patch 13 was folded into patch 14. The forementioned changes left patch
13 with little changes to justify its own patch.

Extra patches were created to attend suggestions that were a bit too
much to do in the same patch.

Patches missing acks: 5, 9, 10, 11, 14, 16

Changes from v1:
- Dropped v1 patches: 5,6,19,20
- patch 13 from v1 folded patch 14 from v1, now known as patch 13.
  Commit msg from patch 14 was kept
- patch 1:
  - added blank line after tcg_cpu_accel_type_info
- patch 3:
  - added blank lines after each 'if' in riscv_cpu_validate_v() after
    moving it
- patch 4:
  - removed "riscv_tcg_ops is being imported from cpu.c for now" comment
  - changed riscv_tcg_ops back to 'static'
- patch 7 (former 9):
  - replaced "to minimize changes in the future" with "because they
    should not be modified at runtime" in the commit msg
- patch 9 (new):
  - make riscv_add_satp_mode_properties() callable from kvm.c
- patch 10 (new):
  - remove target/riscv/kvm-stub.c
  - add non-KVM stubs for APIs in kvm_riscv.h
- patch 11:
  - remove the 'if kvm_enabled' block from
    riscv_cpu_add_user_properties()
- patch 13 (former 14):
  - squashed together with patch 13 from v1. Commit msg from patch 14
    was kept
  - make misa_bits[] zero-terminated
- patch 14 (new):
  - export set_misa() as riscv_cpu_set_misa()
- patch 16 (new):
  - make misa_ext_cfg[] const
- patch 18 (former 17):
  - remove the 'make it const' reference in commit msg
- v1 link:
  https://lore.kernel.org/qemu-riscv/20230901194627.1214811-1-dbarboza@ventanamicro.com/


Daniel Henrique Barboza (19):
  target/riscv: introduce TCG AccelCPUClass
  target/riscv: move riscv_cpu_realize_tcg() to TCG::cpu_realizefn()
  target/riscv: move riscv_cpu_validate_set_extensions() to tcg-cpu.c
  target/riscv: move riscv_tcg_ops to tcg-cpu.c
  target/riscv/cpu.c: add .instance_post_init()
  target/riscv: move 'host' CPU declaration to kvm.c
  target/riscv/cpu.c: mark extensions arrays as 'const'
  target/riscv: move riscv_cpu_add_kvm_properties() to kvm.c
  target/riscv: make riscv_add_satp_mode_properties() public
  target/riscv: remove kvm-stub.c
  target/riscv: introduce KVM AccelCPUClass
  target/riscv: move KVM only files to kvm subdir
  target/riscv/kvm: do not use riscv_cpu_add_misa_properties()
  target/riscv/cpu.c: export set_misa()
  target/riscv/tcg: introduce tcg_cpu_instance_init()
  target/riscv/cpu.c: make misa_ext_cfgs[] 'const'
  target/riscv/tcg: move riscv_cpu_add_misa_properties() to tcg-cpu.c
  target/riscv/cpu.c: export isa_edata_arr[]
  target/riscv/cpu: move priv spec functions to tcg-cpu.c

 hw/intc/riscv_aplic.c                 |   2 +-
 hw/riscv/virt.c                       |   2 +-
 target/riscv/cpu.c                    | 990 ++------------------------
 target/riscv/cpu.h                    |  30 +-
 target/riscv/csr.c                    |   1 +
 target/riscv/kvm-stub.c               |  30 -
 target/riscv/{kvm.c => kvm/kvm-cpu.c} | 120 +++-
 target/riscv/{ => kvm}/kvm_riscv.h    |  27 +-
 target/riscv/kvm/meson.build          |   1 +
 target/riscv/meson.build              |   4 +-
 target/riscv/tcg/meson.build          |   2 +
 target/riscv/tcg/tcg-cpu.c            | 881 +++++++++++++++++++++++
 target/riscv/tcg/tcg-cpu.h            |  28 +
 13 files changed, 1138 insertions(+), 980 deletions(-)
 delete mode 100644 target/riscv/kvm-stub.c
 rename target/riscv/{kvm.c => kvm/kvm-cpu.c} (91%)
 rename target/riscv/{ => kvm}/kvm_riscv.h (64%)
 create mode 100644 target/riscv/kvm/meson.build
 create mode 100644 target/riscv/tcg/meson.build
 create mode 100644 target/riscv/tcg/tcg-cpu.c
 create mode 100644 target/riscv/tcg/tcg-cpu.h

-- 
2.41.0


