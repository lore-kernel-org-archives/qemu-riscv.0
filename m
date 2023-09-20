Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0A6CE79AA
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 11:21:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qivFw-0005Tv-82; Wed, 20 Sep 2023 07:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qivFu-0005TK-03
 for qemu-riscv@nongnu.org; Wed, 20 Sep 2023 07:20:30 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qivFr-000221-U9
 for qemu-riscv@nongnu.org; Wed, 20 Sep 2023 07:20:29 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6c0f2addaefso3876594a34.2
 for <qemu-riscv@nongnu.org>; Wed, 20 Sep 2023 04:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695208826; x=1695813626; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cD4Yh3yYi1/+2MPcY5wY2Z55yifTh4XeSglHuN/8j9Q=;
 b=nIjL4QKHPSRnJOIPumvQ/DHU4slqR8Mp4oqYcm9LtPBQfXXrn1QhfRc0kFFDgFjrx4
 YqTBY8qq7DfxAZQnmhde5uq7ZEn7sxWZgT1PM43CIM4cWD2CHlO5vdlqce5bq1uJxxCe
 wfSYXQvzTA9UDCR8ifd3EEbq+KpfXRf3HSaBvqgsQNNka+Qst50TdfHGxkg0a3Evs6W8
 dZUOdFHnsNlZFp80EcmOoVN7ygXsdP+rNFovgF8zp00lnNh10yzNu8sqU1wY3F5+grE+
 IddpffCdS7e86n+13RYf5oNNOkwVcH3Rygg5fEjq3KtmCyLrlB/3v0dYoxx5DhwAsWJH
 XDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695208826; x=1695813626;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cD4Yh3yYi1/+2MPcY5wY2Z55yifTh4XeSglHuN/8j9Q=;
 b=QMbofLUUfjeSm1/WUWzSt70lZiQZW3YHzvyI/FbG0SU7UAikhS1lDLAaaK3c7052Kc
 wdjLSCOzVDxD8wL1ytxGwTRioUtMc8PqrhrBWAiMfqTVsNJ49cZYkuQfzr+tPaz8o9TP
 b/P/Gd1xrEIHqyT+ybKP7pOZ6Vbomh+aurD/X2QQ31dgy/dZ06g0GOpkg33xNCwqp42R
 JYEEuqdAILqSRkkVpUwjh+BQShzPUpHtOPUgezk3hhnTqA3KMdmcpbqIKfKyIXTM9WPM
 pS8cAvNDQjhF1lN001WFP4RZpdEgHi1vKLXP4c1stzlegS5S2rHpfKAhvUHAUhBPvlKk
 nTtA==
X-Gm-Message-State: AOJu0YwuU1HnSfVVTndkWOYLlvqZLIfB/ad/N5QbIfuDJmUiunXCQzNx
 9E2IwBVuRnejff3rnqu/AGVHGA==
X-Google-Smtp-Source: AGHT+IEw0jN/lGWXaEThxMOSGiwufg9NVUw3XLI4Cvsr6rynjCX7e8sNdem072L1XyG0z4uOPL2UzA==
X-Received: by 2002:a05:6830:22d1:b0:6b8:7d12:423d with SMTP id
 q17-20020a05683022d100b006b87d12423dmr2164677otc.18.1695208826737; 
 Wed, 20 Sep 2023 04:20:26 -0700 (PDT)
Received: from grind.. ([2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a9d7c84000000b006b45be2fdc2sm5863955otn.65.2023.09.20.04.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 04:20:26 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 philmd@linaro.org, ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 00/19] riscv: split TCG/KVM accelerators from cpu.c
Date: Wed, 20 Sep 2023 08:20:01 -0300
Message-ID: <20230920112020.651006-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x332.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi,

In this version we changed patch 10 (remove kvm-stub.c) as suggested by
Phil to not include non-KVM stubs in kvm_riscv.h. A change in patch 05
requested by Zhiwei was also made.

Patches based on Alistair's riscv-to-apply.next.

Patches missing acks: patch 10

Changes from v2:
- patch 05:
  - remove riscv_cpu_add_user_properties() from riscv_host_cpu_init()
- patch 10:
  - do not add non-KVM stubs in kvm_riscv.h
- v2 link: https://lore.kernel.org/qemu-riscv/20230906091647.1667171-1-dbarboza@ventanamicro.com/

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
 target/riscv/cpu.c                    | 988 ++------------------------
 target/riscv/cpu.h                    |  30 +-
 target/riscv/csr.c                    |   1 +
 target/riscv/kvm-stub.c               |  30 -
 target/riscv/{kvm.c => kvm/kvm-cpu.c} | 120 +++-
 target/riscv/{ => kvm}/kvm_riscv.h    |   4 -
 target/riscv/kvm/meson.build          |   1 +
 target/riscv/meson.build              |   4 +-
 target/riscv/tcg/meson.build          |   2 +
 target/riscv/tcg/tcg-cpu.c            | 883 +++++++++++++++++++++++
 target/riscv/tcg/tcg-cpu.h            |  27 +
 13 files changed, 1113 insertions(+), 981 deletions(-)
 delete mode 100644 target/riscv/kvm-stub.c
 rename target/riscv/{kvm.c => kvm/kvm-cpu.c} (91%)
 rename target/riscv/{ => kvm}/kvm_riscv.h (89%)
 create mode 100644 target/riscv/kvm/meson.build
 create mode 100644 target/riscv/tcg/meson.build
 create mode 100644 target/riscv/tcg/tcg-cpu.c
 create mode 100644 target/riscv/tcg/tcg-cpu.h

-- 
2.41.0


