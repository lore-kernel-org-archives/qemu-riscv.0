Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B804C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 22:46:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qygQp-0006JL-48; Thu, 02 Nov 2023 18:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygQn-0006Is-HQ
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:44:53 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygQl-00034K-OP
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:44:53 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5af5b532d8fso17401427b3.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 15:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698965090; x=1699569890; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cpr42aIIhMmoauO1120ZACmYjtIuev1dG8oOrH1nor4=;
 b=kPHMG1juSgW1NT4nv5jBH/uKWgOLHFvUjoYX514XJUFDhWPNiXEzGwp9kmtwgDxchO
 IShJCs9k+YzS7F4brS3V1bITkO0SQ/3+4Uu+vI3CJws13Bpw6D/zZSmZ0qrbAP0rP3iu
 74rKGzQx9WO034XolrezNcNKueGzcGhiIDNy2OG4t7ExSysGh/2oKYEs9bPuYtP75h/+
 +TScpFgrh6HJlRLhWof0bjaUK0cdt+LkZMuKjJlqis5OT3KwkgYHrL+huCw8IYuCWRp7
 1ui35ocl8NwhYQluTo4mcICKFzwD4KxhxN5hR5J2kw4XyyWtQ1LTmKIc5M9JySUrTAsq
 XR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698965090; x=1699569890;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cpr42aIIhMmoauO1120ZACmYjtIuev1dG8oOrH1nor4=;
 b=cKYfofnpXYUo5O/NrsqcPcko0tWbAd4uSle/jp9UX+RhcPvvk0Q9pdtXlZVtHqThdi
 Ym6WoQ0k1N9j9ziUuxMkEHoEieybQ3xUfE1Q9FSq+7AF7zAIPlOOIz4XGjiYNcbk2XcP
 BKjwSh27NuqkJTG8vkwaE+rvC3y+Cl10jjaxDt6CeHtLk7YEowV7QpINXXDky80SHcCM
 HI8a+cnwLlrFLcq2a3AFx5rtVrTeWnlpb+Odd6qkA6pPFzN758LsXu2ue3Os9/oaWfQu
 OQmkqC63dITBhCnbfAdDqCTq0w1DYE7u1W4sDNh/bbEBjkkscVnkI5p+y0d2I4nvC2D3
 QYbw==
X-Gm-Message-State: AOJu0YwPZh7CZiAuQGBC+kv/YXUHuhAKpaRxQ0cVtOKAC88p1AS5zXNt
 RrLs6A/gmay69by7lJb0Nuw83w==
X-Google-Smtp-Source: AGHT+IHO3j+eVGXUYubJ92E30+G9mY8xsYGAWW+dvuI/OmidZpTikTzCwgR+08ORIhhsiAi5dq9hVg==
X-Received: by 2002:a0d:eb8b:0:b0:5a7:e3f9:a1fb with SMTP id
 u133-20020a0deb8b000000b005a7e3f9a1fbmr1266473ywe.42.1698965090238; 
 Thu, 02 Nov 2023 15:44:50 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 ce10-20020a05690c098a00b0059b24bd4f2asm259523ywb.57.2023.11.02.15.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 15:44:49 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 00/19] rv64i and rva22u64 CPUs, RVA22U64 profile support
Date: Thu,  2 Nov 2023 19:44:26 -0300
Message-ID: <20231102224445.527355-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

In this version two new patches were added, both while discussing v6
with Alistair:

- new 'rva22u64' CPU. This is a CPU suggested by Alistair and others to
  allow users to use a profile without having to deal with profile
  enablement. This is done in patch 18;

- 'max' CPU profile restriction. There's no user benefit to have profile
  support in a CPU that has all extensions enabled. This is done in
  patch 19.

Other changes were done based on Drew's feedback on v8:

- patch 3: handle RVH priv_ver bump if it's user enabled, and put some
  comments explaining how it interacts with the 'priv_spec' user option.

- patch 4: rv64i cpu_init() now sets max setp_mode to SV64, and
  we're returning 'MBARE' as default satp_mode for all 'bare' CPUs
  if the user doesn't set a satp_mode in the command line. This will do
  what we want without having to change cpu_riscv_set_satp() and
  satp_finalize(), so patches 3 and 4 from v8 were dropped. Drew saw the
  diff of this patch and decided to keep his ack from v8;

Patches based on riscv-to-apply.next.

Patches missing acks: 3, 18, 19

Changes from v8:
- patches 3 and 4 from v8: dropped
- patch 3 (patch 5 from v8):
  - bump priv_ver when RVH is enabled
  - add a disclaimer when bumping priv_ver about the priv_spec option
    having precedence
- patch 4 (patch 6 from v8):
  - set set_satp_mode_max_supported() to SV64 in rv64i_bare_cpu_init()
  - set PRIV_VERSION_1_10_0 in rv64i_bare_cpu_init()
  - change set_satp_mode_default_map() to set MBARE for 'bare' CPUs
- patch 18 (new):
  - add rva22u64 CPU
- patch 19 (new):
  - forbid profile support for 'max' CPU
- v8 link: https://lore.kernel.org/qemu-riscv/20231101204204.345470-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (19):
  target/riscv: create TYPE_RISCV_VENDOR_CPU
  target/riscv/tcg: do not use "!generic" CPU checks
  target/riscv/tcg: update priv_ver on user_set extensions
  target/riscv: add rv64i CPU
  target/riscv: add zicbop extension flag
  target/riscv/tcg: add 'zic64b' support
  riscv-qmp-cmds.c: expose named features in cpu_model_expansion
  target/riscv: add rva22u64 profile definition
  target/riscv/kvm: add 'rva22u64' flag as unavailable
  target/riscv/tcg: add user flag for profile support
  target/riscv/tcg: add MISA user options hash
  target/riscv/tcg: add riscv_cpu_write_misa_bit()
  target/riscv/tcg: handle profile MISA bits
  target/riscv/tcg: add hash table insert helpers
  target/riscv/tcg: honor user choice for G MISA bits
  target/riscv/tcg: validate profiles during finalize
  riscv-qmp-cmds.c: add profile flags in cpu-model-expansion
  target/riscv: add 'rva22u64' CPU
  target/riscv/tcg: do not support profiles for 'max' CPU

 hw/riscv/virt.c               |   5 +
 target/riscv/cpu-qom.h        |   4 +
 target/riscv/cpu.c            | 130 +++++++++++-
 target/riscv/cpu.h            |  13 ++
 target/riscv/cpu_cfg.h        |   3 +
 target/riscv/kvm/kvm-cpu.c    |   7 +-
 target/riscv/riscv-qmp-cmds.c |  44 +++-
 target/riscv/tcg/tcg-cpu.c    | 370 ++++++++++++++++++++++++++++++----
 8 files changed, 518 insertions(+), 58 deletions(-)

-- 
2.41.0


