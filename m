Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C925CD37B0
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 16:04:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiGiH-00060U-CS; Mon, 18 Sep 2023 12:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qiGiG-0005z0-5m
 for qemu-riscv@nongnu.org; Mon, 18 Sep 2023 12:03:04 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qiGiD-0003tX-Fl
 for qemu-riscv@nongnu.org; Mon, 18 Sep 2023 12:03:03 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so635148466b.3
 for <qemu-riscv@nongnu.org>; Mon, 18 Sep 2023 09:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695052979; x=1695657779; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R37K2a/Smepsc2iyIaDJqnazCMcEJOOAaYAXmsK0XT0=;
 b=INxTo8EwLN4aLX9q3m3G+o7FAqm3qrBb+iJBMhwSHCc8OPPiM5RYZH+mTSxjH/fnTk
 Y2itOxsL33IxL2ye/rLFJISCZ7o3Rqq2qqpid9l7Jtrg92/U5SVMQccTUEDzWG4HA0BD
 ywK6Mp4LD+urqc5nAlJYSs5X46iC6my+91jN81mYjxk1hoaerQXH+j/CJrDW3ygkH+oI
 ht/hkx5B4iSQK5DMnO05hmaYV+QgZ9uJpEHOA3rR4aabzWqKp3cjb31P+AAweGQp4RxK
 cpZs1HXsSc6Itm1LbLWjK0s2+Te3MtTdi2TLnssBg8hx1fqGdS+aIMgPfv/hKAgP7l+W
 0Prw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695052979; x=1695657779;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R37K2a/Smepsc2iyIaDJqnazCMcEJOOAaYAXmsK0XT0=;
 b=PSMmzE4IeWWqxY0Z86wUS80+elrPai2x/j0WigbRS3XL5e71WmMLZoXv5tGeGEiazh
 5Jg5QsyfK91YpIayRS7UmTOBVpZHf/NLubqhWzdjqwFSWkqtwR9R2AU/RG22C9qho3YL
 YhvKwwQHnJSZdevjJb/Cej6ddmUy42ZOWqrvKxKQkfFjRglURiMBUnbaaWXKb7w9tVM2
 NuMW0xPEA2wHDcH9o6HIr8Bi0XGhDyn8V3qqxPqSy9ycLaVYNoOgmbpP0/B1+C7maudn
 QYhhF7KllqK/xVJ15jhDn0LmKypWU7UtbwjJWPaySgdab0KktF4Qb+E2L9sf/lIFy6Xg
 7h/w==
X-Gm-Message-State: AOJu0YwDBwAAZKFxJFBmEbe0AQUW73m0BMLqj65nllUpBfT2jeAKzfxq
 GXlNfbp+hNMpsWWUFEcuZ+yFow==
X-Google-Smtp-Source: AGHT+IHGtyYBQwLAMwFhSgR4DVjVUaGUpdsvPj2BatAS0H6me1yGIyefW0SsMEvxluQ7CDP796y45Q==
X-Received: by 2002:a17:907:a0c6:b0:9a1:cb2c:b55c with SMTP id
 hw6-20020a170907a0c600b009a1cb2cb55cmr6526293ejc.35.1695052978973; 
 Mon, 18 Sep 2023 09:02:58 -0700 (PDT)
Received: from localhost.localdomain
 (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
 by smtp.gmail.com with ESMTPSA id
 rl20-20020a1709076c1400b009adc81c0c7esm5428731ejc.107.2023.09.18.09.02.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 18 Sep 2023 09:02:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Marek Vasut <marex@denx.de>, David Gibson <david@gibson.dropbear.id.au>,
 Brian Cain <bcain@quicinc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Claudio Fontana <cfontana@suse.de>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alessandro Di Federico <ale@rev.ng>, Song Gao <gaosong@loongson.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Fabiano Rosas <farosas@suse.de>,
 qemu-s390x@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Luc Michel <luc@lmichel.fr>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Bin Meng <bin.meng@windriver.com>, Stafford Horne <shorne@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Rolnik <mrolnik@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 00/22] exec/cpu: Call cpu_exec_realizefn() once in
 cpu_common_realize()
Date: Mon, 18 Sep 2023 18:02:33 +0200
Message-ID: <20230918160257.30127-1-philmd@linaro.org>
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

Hi,

TL;DR: This series factor duplicated common code in CPUs
DeviceRealize() handlers out, moving as a single call in
cpu_common_realize().

In an effort to have most of:
- CPU core code independant of accelerators
- CPU core code target agnostic
- CPU target code independant of accelerators
- and cpu_reset() called automatically without having to
  rely on global QEMUResetHandler,
I'm working on the core CPU code, unfortunately touching
files in all targets.

I suppose them term "exec" used in various areas of QEMU
started from what we call today "accel[erators]" [*]. So
cpu_exec_realizefn() can be read as cpu_accel_realize(),
or "generic code where an accelerator realizes its internal
fields on an abstract (target independent) CPU".

This series moves a common pattern used in all target's
cpu_realize() handlers to the common cpu_exec_realizefn().

Some optional code is used to check CPU requested features
are compatible with the accelerator possibilities. We
extracted this code as CPUClass::verify_accel_features()
handler. Better name welcomed :)

Some targets were calling cpu_reset() *before*
cpu_common_realizefn(), we moved it *after* (since RESET
shouldn't happen before REALIZE). I still have to audit
each target to confirm there are no side effects.
Besides this cpu_reset() change, the rest should be
relatively trivial to review, still I'd like feedback
from the respective target maintainers for the "move HW
creation after vCPU one" patches.

Regards,

Phil.

Follow-up: Make cpu_reset() accel-agnostic and move it
           to cpu_common_realize() (not trivial due to
           KVM run_on_cpu() calls).

[*] If Paolo/Richard confirm, I might post series renaming
    various APIs s/exec/accel/, because various headers
    meaning aren't clear to me.

Philippe Mathieu-Daudé (21):
  target/i386: Only realize existing APIC device
  hw/intc/apic: Pass CPU using QOM link property
  target/i386/kvm: Correct comment in kvm_cpu_realize()
  exec/cpu: Never call cpu_reset() before cpu_realize()
  exec/cpu: Call qemu_init_vcpu() once in cpu_common_realize()
  exec/cpu: Call cpu_remove_sync() once in cpu_common_unrealize()
  exec/cpu: RFC Destroy vCPU address spaces in cpu_common_unrealize()
  target/arm: Create timers *after* accelerator vCPU is realized
  target/hppa: Create timer *after* accelerator vCPU is realized
  target/nios2: Create IRQs *after* accelerator vCPU is realized
  target/mips: Create clock *after* accelerator vCPU is realized
  target/xtensa: Create IRQs *after* accelerator vCPU is realized
  target/sparc: Init CPU environment *after* accelerator vCPU is
    realized
  exec/cpu: Introduce CPUClass::verify_accel_features()
  target/arm: Extract verify_accel_features() from cpu_realize()
  target/i386: Extract verify_accel_features() from cpu_realize()
  target/s390x: Call s390_cpu_realize_sysemu from s390_realize_cpu_model
  target/s390x: Have s390_realize_cpu_model() return a boolean
  target/s390x: Use s390_realize_cpu_model() as verify_accel_features()
  exec/cpu: Have cpu_exec_realize() return a boolean
  exec/cpu: Call cpu_exec_realizefn() once in cpu_common_realize()

xianglai li (1):
  exec/cpu: Introduce the CPU address space destruction function

 include/exec/cpu-common.h     |  8 ++++
 include/hw/core/cpu.h         |  7 +++-
 target/s390x/s390x-internal.h |  4 +-
 cpu.c                         | 11 ++++-
 hw/core/cpu-common.c          | 15 +++++++
 hw/intc/apic_common.c         |  2 +
 softmmu/physmem.c             | 24 +++++++++++
 target/alpha/cpu.c            | 10 -----
 target/arm/cpu.c              | 53 ++++++++++++------------
 target/avr/cpu.c              | 10 +----
 target/cris/cpu.c             | 11 +----
 target/hexagon/cpu.c          | 11 +----
 target/hppa/cpu.c             | 20 ++-------
 target/i386/cpu-sysemu.c      | 20 ++++-----
 target/i386/cpu.c             | 77 ++++++++++++++++++-----------------
 target/i386/kvm/kvm-cpu.c     |  3 +-
 target/loongarch/cpu.c        | 11 +----
 target/m68k/cpu.c             | 11 +----
 target/microblaze/cpu.c       |  9 ----
 target/mips/cpu.c             | 27 ++++--------
 target/nios2/cpu.c            | 20 +++------
 target/openrisc/cpu.c         | 11 +----
 target/ppc/cpu_init.c         |  8 ----
 target/riscv/cpu.c            | 10 +----
 target/rx/cpu.c               | 11 +----
 target/s390x/cpu-sysemu.c     |  3 +-
 target/s390x/cpu.c            | 21 +---------
 target/s390x/cpu_models.c     | 16 +++++---
 target/sh4/cpu.c              | 11 +----
 target/sparc/cpu.c            | 10 -----
 target/tricore/cpu.c          | 10 +----
 target/xtensa/cpu.c           | 13 +-----
 32 files changed, 189 insertions(+), 299 deletions(-)

-- 
2.41.0


