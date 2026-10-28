Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C37D606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 04:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=UHlJ8/aA
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLvKF-0007W4-86; Wed, 28 Oct 2026 00:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xLvJk-0007SB-6b
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 00:31:16 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xLvJf-0001bA-AI
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 00:31:14 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-3ac6971aaebso50895a91.3
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 21:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1793161869; x=1793766669; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=5AiXLe1uSjSSEiktgdW1fDZBZcpHxwP2+BRnaA/TmGU=;
 b=UHlJ8/aAbbMUjUvu13+UpjPDYy3owfnqoHkL4rTIXV2l1lKkJob/lO1iz27oKEpkaF
 9RZa32SXmhCAhlbQ6nV2/BJ0F1+9ucXt7Rfogj4VulDsQd6mufPfdxTeX7XAc2Sb6Su8
 Vbe/XIVK5ywqA8SIcqM/7kQpZ1vY4hNBBkco/KIeqcRGo2ntTpxcsH7ApUXzjBXvn4FI
 ABjAnH5+cJv2lT+XPNU8Hjnq5dddr3ktXkt/CUB/f1UXpsCapzIevM7SPmckG+7sOsTo
 GwB3Xrh86uT9cTSgrn7N9VpkrVdPsgjx2DuyhEWXKhmsL/C9qWMUSGsMnuhfEaBj4YNa
 jpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793161869; x=1793766669;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5AiXLe1uSjSSEiktgdW1fDZBZcpHxwP2+BRnaA/TmGU=;
 b=NxgDYF18XKKeO1tWxYxf88HO5jMdEDEtM/84jFAWc99ELIku2fA6rof/E3LMZSNGiy
 vYhlqvZn8ll0HYQosZ/pWg3d3j0IjJRlmf2HNPq0I5ohMkxlMtlBBkd7E9gLgBXWZrPo
 wiChghmshKvep3eC9wDJlzLp4RI990eYxP9pPJnp9DWbLkWaiankxcOU5ndK6har5SLL
 3T6TZgMmxFE7BEszVwaPlb5WrZpCv24ziVxXjRTuXFn2XnZoHD/l3u/OLQtk/PIE1t5e
 anCeXpIcdT4pdI8uowa52Cul4AnLGiA1QTkW6ol2e8auTC8riJFuU1ALqScoyK1DRQWa
 ULwg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxi83rQ8uNPx6uV6/SFayQGi0FV4Lira4/Lwf3acxRmGcrPqnb8zYDoFZX+Dkhsa0AG5vX9RvQHjtMN@nongnu.org
X-Gm-Message-State: AFq9FYLKIJHkI13PLXKCUG26CIA6HvxombkOLNiEwhxC4G95u5BkEw96
 AV0QihjqBAXVKNBIy96xtWTV8xEjWA0fdff2ZI2KK3MQvzisDQbJlOd2KRP6rme1wkQ=
X-Gm-Gg: AYBFou3punt1ntLQtEzOAszPmYv1dxRybUR3hZsMCaV6uJaLVDsj7Acwm1sVEspqOBw
 8bXkgao0ZlduQ0qVs/9j8XucHhqWsW8fpdWwJXq1zoE3Z8UO4RI7IkcdiYub6JB+2RVjwb5fNtk
 aCotusg9h+pQT44pOmL/tb9LX6Jz+uGT63unIWTRg5gtO0JKQEtwfMRicy6PneXoctVdthGzS2u
 soetI0BUX5JmY8MY5I/cqir5t0n9IEWlp+Ph0TAzf488Jfb/4bqiE9r6nrR9Co4a5s940BXToQw
 bEd9WGqZuHMYIxKuDOj61kFHPvN3IaPM8o1JgL+GyQiiJr6xodUQRtqAggtaz2M7w0KkQeHqiJx
 qd3lhcStl6gHCZ9IOfkElpTFLDbb9ngYOvs/2JtDI9w2DCpImwLWfV+4bVQwGTnA5iVXkUlPZLC
 aT3TJji1xG49u5jOVVYynT/Rb/hvlR21W4yBnyv05bHx8TAR6p7LJBax8ItfFDaOOXH4dEcxDxx
 15RkoMuMVBcAhneZqaUj+OtSHuv7PMIF5hQZrrWHuuvUt0Cl/I3BQAmlBHNiRQu086zSHRKPlas
 0fJEkNhSqD3BHsQFGb8aLT9iTvVjrw9IeBrZibkM1bSHcvPB5iGb14PCXhZ0bocYwg400FIAKDc
 Lng==
X-Received: by 2002:a17:90b:5292:b0:3a7:a463:54bb with SMTP id
 98e67ed59e1d1-3ae582c72admr1628586a91.5.1793161869255; 
 Tue, 27 Oct 2026 21:31:09 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ae5a5d45a8sm1024470a91.17.2026.10.27.21.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 21:31:08 -0700 (PDT)
From: Portia Stephens <portias@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Michael Ellerman <mpe@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 00/10] Add the RCPU to Tenstorrent Atlantis
Date: Wed, 28 Oct 2026 14:30:49 +1000
Message-ID: <20261028043059.600498-1-portias@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=portias@tenstorrent.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Atlantis includes a 32-bit RISC-V core (RCPU) used for boot, low-level
control, and ongoing system management [1]. This series is the first step in
adding the RCPU to the tt-atlantis machine. The RCPU shares access to most
peripherals with the Ascalon cores. However, the RCPU has a different memory view.
This requires a different memory map and a private memory container that the
SoC aliases the shared devices into, at the addresses the RCPU expects.

On hardware, the RCPU is responsible for loading images from the boot medium
into DRAM and releasing the Ascalon cores from reset, via the CPL. This
functionality is not implemented in these changes. The images for the Ascalon
cores continue to be loaded directly into DRAM via command line arguments and
the Ascalon cores start executing at reset.

With these changes, running tt-atlantis with rcpu=on will create a separate
CPUCluster with the RCPU, giving gdb two inferiors. If no bootrom is provided,
the RCPU hart will be held powered off. With a bootrom provided,
via tt-atlantis,rcpu=on,bootrom=, the RCPU will execute the image and console
output is on the second command line serial. This series does not provide a
binary to test on the RCPU, it is in active development and not publicly
available. The QEMU tests are updated to test booting of the Ascalon cores with
and without the RCPU modeled. The machine properties related to the cpus, smp
count and cpu-type, apply to the Ascalon cluster. The RCPU is an auxiliary
core and is not configurable.

See docs/system/riscv/tt_atlantis.rst for usage.

[1] https://github.com/tenstorrent/atlantis-soc-docs/blob/main/data_sheet/atl_soc_data_sheet.pdf

Changes from v1:
- Include RCPU in smp cpu count
- Fix incorrect address map naming of PRCM_DDR and DDR_CTRL
- Drop valid_cpu_types enforcement

Portia Stephens (10):
  hw/riscv/atlantis: Update fdt functions to take generic parameters
  hw/riscv/atlantis: Move Ascalon into cluster struct
  hw/riscv/atlantis: Store Ascalon memory in cluster struct
  hw/riscv/atlantis: Create CPU cluster for Atlantis cpus
  target/riscv: Add Tenstorrent Real-time CPU
  hw/riscv/atlantis: Add the RCPU to the Atlantis SoC
  hw/riscv/atlantis: Back RCPU memory region by unimplemented device
  hw/riscv/atlantis: Load the RCPU bootrom
  tests/functional/riscv64: Add rcpu to tt-atlantis tests
  docs/atlantis: Update Atlantis documentation to include the RCPU

 MAINTAINERS                                  |   1 +
 docs/system/gdb.rst                          |   2 +
 docs/system/riscv/tt_atlantis.rst            |  40 ++
 hw/riscv/Kconfig                             |   2 +
 hw/riscv/tt_atlantis.c                       | 636 +++++++++++++++----
 include/hw/riscv/tt_atlantis.h               |  83 ++-
 target/riscv/cpu-qom.h                       |   1 +
 target/riscv/cpu.c                           |  28 +
 target/riscv/tcg/csr.h                       |   3 +
 target/riscv/tcg/meson.build                 |   1 +
 target/riscv/tcg/tt_csr.c                    |  58 ++
 tests/functional/riscv64/test_tt_atlantis.py |  10 +-
 12 files changed, 737 insertions(+), 128 deletions(-)
 create mode 100644 target/riscv/tcg/tt_csr.c

-- 
2.43.0


