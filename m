Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2700ECDB47E
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 14:02:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrIjU-0006ID-Lk; Fri, 13 Oct 2023 10:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIjJ-00069Z-Mf
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:01:33 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIjF-00026Z-Sz
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:01:29 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso330844666b.0
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 07:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205683; x=1697810483; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oOgjtdb9ykn+s/ckzJQWD+kkXkgOLw7b9JoigpOQD4w=;
 b=HzC3WO8wtG7sFESF+QEr25Jisfj90aQJIULjEWIbU4JKfJmP6+8yaM9vRD6uCHhI/Y
 iVAyqr7vo/ZbP7UfzbiponUaydg4uO7x44OkIC35hkcSwzf0A5gBTr7CCxStMe5sGHp0
 qO2wbhIKNwEKY2sGu6cHL8ADQbpAznGaybTLTGVXmnCb++IRUPnks/yeprWr2k5m5og5
 eAj5WJHWXTEH9vv04IC/BvVlAcl42QqoUxtN1IFGYqJscpa6ARBSLPP3MqE+EReYjrlx
 QVjMIIQJ7KFK89HSLrRGo6FDnw5xgP+9eOQAqX4u6PGJSOpxzv6t348R3wHHw9k/GA3f
 DBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205683; x=1697810483;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oOgjtdb9ykn+s/ckzJQWD+kkXkgOLw7b9JoigpOQD4w=;
 b=eGdQzgkTMQWUYWP/uc7k5qMWo0YljE7RXbRgh/zYJevbxpaWHR2TxmLbvtJejx/NHH
 gkwJPA53sjpheYzym2FCR1A4DoDJTajqoOopVIuVXRpwZHq+9+luRiU3L9iMkhzh2xz/
 gVFEbzoI5NJR7qJtUhI3KPaDYaWTLsdbpLfEvZmwmoXtd4P8Bq9VS7FPK7UDRMX/6d+Y
 vFRCRaMvr0jj1ZkOq8CA6JtPxdQPR/bb24+rQtsMCznkLTUavHPTKOUObuMg5fbQNQkG
 VbkH4yCfvFGcaRoGpqZn5FzAzSzV/GBpI7rKovmYn/UX6TXOiGgr6ChAwGy70JisKWlR
 R+8A==
X-Gm-Message-State: AOJu0YzZu0VLGC+iUD0WugrJWoquw9xaYVZgsSTWc9ncBXxnCF6k2RAF
 YTh7U77NnCA8HXmfilaWltXKAw==
X-Google-Smtp-Source: AGHT+IFqCw3TcG1ugTqR4cRGr2//B5Ci5LzFIGztGAJ3xbL+vbIsRYqfA/LmkSkxP+cmE0gh0Ege3Q==
X-Received: by 2002:a17:906:10da:b0:9a9:e393:8bcd with SMTP id
 v26-20020a17090610da00b009a9e3938bcdmr22908914ejv.5.1697205683103; 
 Fri, 13 Oct 2023 07:01:23 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170906378c00b0099d45ed589csm12435407ejc.125.2023.10.13.07.01.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:01:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Marek Vasut <marex@denx.de>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 00/16] target: Make 'cpu-qom.h' really target agnostic
Date: Fri, 13 Oct 2023 16:00:59 +0200
Message-ID: <20231013140116.255-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
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

Since v1:
- Added R-b tags
- Addressed Richard comments
- Postponed OBJECT_DECLARE_CPU_TYPE() changes

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

Philippe Mathieu-Daudé (16):
  target: Unify QOM style
  target: Mention 'cpu-qom.h' is target agnostic
  target/arm: Move internal declarations from 'cpu-qom.h' to 'cpu.h'
  target/ppc: Remove CPU_RESOLVING_TYPE from 'cpu-qom.h'
  target/riscv: Remove CPU_RESOLVING_TYPE from 'cpu-qom.h'
  target: Declare FOO_CPU_TYPE_NAME/SUFFIX in 'cpu-qom.h'
  target/hexagon: Declare QOM definitions in 'cpu-qom.h'
  target/loongarch: Declare QOM definitions in 'cpu-qom.h'
  target/nios2: Declare QOM definitions in 'cpu-qom.h'
  target/openrisc: Declare QOM definitions in 'cpu-qom.h'
  target/riscv: Move TYPE_RISCV_CPU_BASE definition to 'cpu.h'
  target: Move ArchCPUClass definition to 'cpu.h'
  target/i386: Declare CPU QOM types using DEFINE_TYPES() macro
  target/mips: Declare CPU QOM types using DEFINE_TYPES() macro
  target/ppc: Declare CPU QOM types using DEFINE_TYPES() macro
  target/sparc: Declare CPU QOM types using DEFINE_TYPES() macro

 target/alpha/cpu-qom.h      | 21 ++-----------
 target/alpha/cpu.h          | 17 ++++++++---
 target/arm/cpu-qom.h        | 61 +------------------------------------
 target/arm/cpu.h            | 55 +++++++++++++++++++++++++++++++--
 target/avr/cpu-qom.h        | 20 ++----------
 target/avr/cpu.h            | 18 ++++++++---
 target/cris/cpu-qom.h       | 24 ++-------------
 target/cris/cpu.h           | 20 +++++++++---
 target/hexagon/cpu-qom.h    | 27 ++++++++++++++++
 target/hexagon/cpu.h        | 20 ++----------
 target/hppa/cpu-qom.h       | 20 +-----------
 target/hppa/cpu.h           | 16 ++++++++--
 target/i386/cpu-qom.h       | 42 ++-----------------------
 target/i386/cpu.h           | 39 +++++++++++++++++++++---
 target/loongarch/cpu-qom.h  | 23 ++++++++++++++
 target/loongarch/cpu.h      | 14 +--------
 target/m68k/cpu-qom.h       | 21 ++-----------
 target/m68k/cpu.h           | 17 ++++++++---
 target/microblaze/cpu-qom.h | 20 +-----------
 target/microblaze/cpu.h     | 15 +++++++--
 target/mips/cpu-qom.h       | 23 ++------------
 target/mips/cpu.h           | 21 ++++++++++---
 target/nios2/cpu-qom.h      | 18 +++++++++++
 target/nios2/cpu.h          | 11 +------
 target/openrisc/cpu-qom.h   | 21 +++++++++++++
 target/openrisc/cpu.h       | 14 +--------
 target/ppc/cpu-qom.h        |  3 +-
 target/ppc/cpu.h            |  4 +--
 target/riscv/cpu-qom.h      | 26 ++--------------
 target/riscv/cpu.h          | 24 +++++++++++++--
 target/rx/cpu-qom.h         | 20 ++----------
 target/rx/cpu.h             | 18 ++++++++---
 target/s390x/cpu-qom.h      | 41 +++----------------------
 target/s390x/cpu.h          | 34 ++++++++++++++++++---
 target/s390x/cpu_models.h   |  8 ++---
 target/sh4/cpu-qom.h        | 28 ++---------------
 target/sh4/cpu.h            | 24 ++++++++++++---
 target/sparc/cpu-qom.h      | 23 ++------------
 target/sparc/cpu.h          | 22 +++++++++----
 target/tricore/cpu-qom.h    | 15 +++------
 target/tricore/cpu.h        | 10 +++---
 target/xtensa/cpu-qom.h     | 26 ++--------------
 target/xtensa/cpu.h         | 24 +++++++++++----
 target/i386/cpu.c           | 50 ++++++++++++++----------------
 target/mips/cpu.c           | 23 ++++++++------
 target/ppc/cpu_init.c       | 52 ++++++++++++++-----------------
 target/sparc/cpu.c          | 23 ++++++++------
 47 files changed, 528 insertions(+), 588 deletions(-)
 create mode 100644 target/hexagon/cpu-qom.h
 create mode 100644 target/loongarch/cpu-qom.h
 create mode 100644 target/nios2/cpu-qom.h
 create mode 100644 target/openrisc/cpu-qom.h

-- 
2.41.0


