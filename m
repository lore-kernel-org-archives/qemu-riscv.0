Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6DACD6911
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 09:29:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qq93B-0007qo-Eq; Tue, 10 Oct 2023 05:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq939-0007p5-L2
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 05:29:11 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq936-0007cw-Ay
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 05:29:11 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99357737980so938155466b.2
 for <qemu-riscv@nongnu.org>; Tue, 10 Oct 2023 02:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696930146; x=1697534946; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jVdFJHte50YKA8Z2cBZMBa58ygStm0gO7g9CZPgou1U=;
 b=SmzRgutaqCuDwAXCi4pZhUH+MK0Cdg8SOtxAH5zgZJeoOK5mFFgih1fCIoiqxNjTZT
 Uj/EPSxNVM7Mcwh/yZY1tn594zDQ4CkluN96hC407mbzpmuXLHnLtEwVEJx3fOU7jw18
 68ZbMWkJZzGzyjABA4vw0gg4dItKkWGJOYdsuTOfRISN89O7gj562s5OHAcwyX2YSJCs
 x2p2TSQBZqQy+dxzaayfv1NeL3ZwgtUy78A8OOdRKGo+OIuIz/DqaD5f7mUtDI2UOFYS
 hN8MgNPglbDCC4zwbei3jCOBNqbDkI8cOp9AOwMh/GsZq381F4EiGU/a9nUy2NtGveiC
 BdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696930146; x=1697534946;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jVdFJHte50YKA8Z2cBZMBa58ygStm0gO7g9CZPgou1U=;
 b=hKfQTbmzTDFx9i8MX7ZEv4m5sJIkmiSnU1Pfr8RA9Wa0cjat7XTk8rrgIpU0dceoAa
 /f8rJwhmso/g19F0FoTpUZ/WOg78Tiw+M66LYkoWadA4A7IGk9YiHckO0bXmfmDa91UR
 OKowAyLDqfeCteSoMvlLzEPbjEPJRb646iHyZGUWADuw08f51zrQJ1Aw6Gk1l2RNTMs1
 ihyVTkBjcUnZRIebmLEsnnDAdtcLEei/rvvfyUHMlyRQVMrSNo4hv75wtADCTcm72IA6
 x/8YVoIrToIqZnzajLAQf4ZxQbRmnm+QK7njyc3QX80YEWFaOflqo9zEJW/ryJMBSyyl
 RLCA==
X-Gm-Message-State: AOJu0YyoR+OCSkUTo/Yhj/kx0y3O95bu4FIMbuVT5QvrwUPggxXKNP8U
 Ykz9Sc6EpWrgd4X4TueTqYQNEQ==
X-Google-Smtp-Source: AGHT+IGSJmBYwfU65QLa50pEmuGo9ajdG+s9uc2SluBaSRQzstp0QD/m7iYDVksfycjqRdqGxvjvpQ==
X-Received: by 2002:a17:906:2250:b0:9ae:54ea:5b0f with SMTP id
 16-20020a170906225000b009ae54ea5b0fmr17025641ejr.24.1696930146660; 
 Tue, 10 Oct 2023 02:29:06 -0700 (PDT)
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr.
 [176.172.113.148]) by smtp.gmail.com with ESMTPSA id
 f23-20020a170906139700b009a5f1d15642sm8105155ejc.158.2023.10.10.02.29.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Oct 2023 02:29:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Stafford Horne <shorne@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org
Subject: [PATCH 00/18] target: Make 'cpu-qom.h' really target agnostic
Date: Tue, 10 Oct 2023 11:28:42 +0200
Message-ID: <20231010092901.99189-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
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

A heterogeneous machine must be able to instantiate CPUs
from different architectures. In order to do that, the
common hw/ code has to access to the QOM CPU definitions
from various architecture.

Those QOM definitions are published in "target/foo/cpu-qom.h".
All 'cpu-qom.h' must be target agnostic, so hw/ can include
multiple of them in order to create a heterogeneous machine.

This series strengthen all (except PPC...) target 'cpu-qom.h',
making them target agnostic.

For various targets it is just a matter of moving definitions
where they belong (either 'cpu.h' or 'cpu-qom.h').

For few (mips/riscv/sparc/x86) we have to remove the target
specific definitions (which 'taint' the header as target specific).

For mips/sparc/x86 this implies splitting the base target
definition by making it explicit to the build type (32 or 64-bit).

PPC is missing because CPU types are currently registered
indistinctly, and whether a CPU is 32/64 bit can not be detected
at build time (it is done in each cpu_class_init() handler,
*after* the type is registered).

Based-on: <20231010074952.79165-1-philmd@linaro.org>
  Introduce qtest_get_base_arch() / qtest_get_arch_bits()

Philippe Mathieu-Daudé (18):
  target: Mention 'cpu-qom.h' is target agnostic
  target/ppc: Remove CPU_RESOLVING_TYPE from 'cpu-qom.h'
  target/riscv: Remove CPU_RESOLVING_TYPE from 'cpu-qom.h'
  target: Declare FOO_CPU_TYPE_NAME/SUFFIX in 'cpu-qom.h'
  target/hexagon: Declare QOM definitions in 'cpu-qom.h'
  target/loongarch: Declare QOM definitions in 'cpu-qom.h'
  target/nios2: Declare QOM definitions in 'cpu-qom.h'
  target/openrisc: Declare QOM definitions in 'cpu-qom.h'
  target/i386: Inline target specific TARGET_DEFAULT_CPU_TYPE definition
  target/riscv: Inline target specific TYPE_RISCV_CPU_BASE definition
  target/i386: Declare CPU QOM types using DEFINE_TYPES() macro
  target/mips: Declare CPU QOM types using DEFINE_TYPES() macro
  target/ppc: Declare CPU QOM types using DEFINE_TYPES() macro
  target/sparc: Declare CPU QOM types using DEFINE_TYPES() macro
  cpus: Open code OBJECT_DECLARE_TYPE() in OBJECT_DECLARE_CPU_TYPE()
  target/i386: Make X86_CPU common to new I386_CPU / X86_64_CPU types
  target/mips: Make MIPS_CPU common to new MIPS32_CPU / MIPS64_CPU types
  target/sparc: Make SPARC_CPU common to new SPARC32_CPU/SPARC64_CPU
    types

 include/hw/core/cpu.h       |  7 +++-
 target/alpha/cpu-qom.h      |  5 ++-
 target/alpha/cpu.h          |  2 --
 target/arm/cpu-qom.h        |  2 +-
 target/avr/cpu-qom.h        |  5 ++-
 target/avr/cpu.h            |  2 --
 target/cris/cpu-qom.h       |  5 ++-
 target/cris/cpu.h           |  2 --
 target/hexagon/cpu-qom.h    | 35 ++++++++++++++++++++
 target/hexagon/cpu.h        | 23 +------------
 target/hppa/cpu-qom.h       |  2 +-
 target/i386/cpu-qom.h       | 19 +++++++----
 target/i386/cpu.h           | 11 ++-----
 target/loongarch/cpu-qom.h  | 38 +++++++++++++++++++++
 target/loongarch/cpu.h      | 26 +--------------
 target/m68k/cpu-qom.h       |  5 ++-
 target/m68k/cpu.h           |  2 --
 target/microblaze/cpu-qom.h |  2 +-
 target/mips/cpu-qom.h       | 16 +++++----
 target/mips/cpu.h           |  5 +--
 target/nios2/cpu-qom.h      | 32 ++++++++++++++++++
 target/nios2/cpu.h          | 22 +------------
 target/openrisc/cpu-qom.h   | 36 ++++++++++++++++++++
 target/openrisc/cpu.h       | 26 +--------------
 target/ppc/cpu-qom.h        |  3 +-
 target/ppc/cpu.h            |  2 ++
 target/riscv/cpu-qom.h      |  9 +----
 target/riscv/cpu.h          |  2 ++
 target/rx/cpu-qom.h         |  5 ++-
 target/rx/cpu.h             |  2 --
 target/s390x/cpu-qom.h      |  5 ++-
 target/s390x/cpu.h          |  2 --
 target/sh4/cpu-qom.h        |  5 ++-
 target/sh4/cpu.h            |  2 --
 target/sparc/cpu-qom.h      | 14 ++++----
 target/sparc/cpu.h          |  5 +--
 target/tricore/cpu-qom.h    |  5 +++
 target/tricore/cpu.h        |  2 --
 target/xtensa/cpu-qom.h     |  5 ++-
 target/xtensa/cpu.h         |  2 --
 hw/i386/microvm.c           |  6 +++-
 hw/i386/pc.c                |  6 +++-
 hw/riscv/spike.c            |  8 ++++-
 hw/riscv/virt.c             |  8 ++++-
 target/i386/cpu.c           | 66 ++++++++++++++++++++++---------------
 target/mips/cpu.c           | 34 ++++++++++++-------
 target/ppc/cpu_init.c       | 52 +++++++++++++----------------
 target/sparc/cpu.c          | 35 +++++++++++++-------
 tests/qtest/cpu-plug-test.c |  2 +-
 49 files changed, 369 insertions(+), 248 deletions(-)
 create mode 100644 target/hexagon/cpu-qom.h
 create mode 100644 target/loongarch/cpu-qom.h
 create mode 100644 target/nios2/cpu-qom.h
 create mode 100644 target/openrisc/cpu-qom.h

-- 
2.41.0


