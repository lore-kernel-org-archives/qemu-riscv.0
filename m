Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E29CD4F54
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 14:25:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSy8i-0003Kd-Fu; Fri, 29 May 2026 10:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy8g-0003JX-JC
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:24:42 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy8e-000290-2C
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:24:42 -0400
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-45eea4c0649so1504958f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 07:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780064678; x=1780669478; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G5EfljsoPq7fD23spfbA2Get1/4U0Oy4zAkIoz/po5c=;
 b=EGomEKeo5SOTANZ5UT0Sp9TKwE3j2lki2iPEIC8f2BGLvkPktD7NMHWIilGZUrc4Fz
 8Z/0ZyMwHM0DNxPFQOHD93hRPspUVY9+IFlZdZcVUQZHeaF22mxLYG9PqXO+ab6z4Qti
 kpZZLJ+XvbDOdXZuC+j/e6TACfQQ/6GxZLvOqF7u8Nz0O14oYkE9BxOB0pRDTWUqcY1f
 Z6phhaZrTQQQmoCMiPLkTN7gvk0ileS+7cIRP7nXOgJdFsbu55yiPWVmtYXVVdhklk0T
 sDbX1RuD8ilj1e7pQI3O5nAdgcI6K1P2j4IUBBgU0uHCqNhdnLHB8JARgdEZ0GKVmawM
 ruJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780064678; x=1780669478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G5EfljsoPq7fD23spfbA2Get1/4U0Oy4zAkIoz/po5c=;
 b=QKbOsCnfaXmYkeyME9aYeAguI3JLnIZ90lW82IBzI42UQI8wrtXd9p7idnp53IwwZJ
 9EjPhm7miVJO2ezEY2IfMR2/1CsS7S9sYI/Pd4teFOPSbjO6TBH0m/uSCXHG5wb7UkmS
 sm0uwtZOWSGGHT3esH7F5M3MnlhH9o4ZQ0ub0x64Za2nkLxN4TPyzjUi7LVrSYyD1zTQ
 HSMBXOLI7Ow+pusebdn1O5wodcz1kum0dIh4DEtzPZOTrjJF10FCHT3h+rbLH2+DyiS0
 +e0aVfPPv3QaIzOlT3tI2CV3ScUL55Ap9MYRAzv/E5pu/+g7TaiydjSi8KVr7AJKMvB4
 3VLw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+54kz0CFXb2VOPGfRDYoo6hB/75Bu40Gw9L+yM/+hwH2McT+xd7EF3HOQhIJXwORq7OfZ3C/mD1U76@nongnu.org
X-Gm-Message-State: AOJu0YyCcMD8+zURjWX6BpjxmVtvnoYguw4KQ+SnpdqZ1BO234aeOb8j
 2P4PaLQjNyi58Y6vmLlsWsSH0KdIAjTc09CXLEfjPENIJmi/qsh1EP9uBKciO598Qso=
X-Gm-Gg: Acq92OHpJHEUISBere8ts2X7OzYlLHUIJc/pIUnULucIYQErROWAYLwOwqrNmVP4moZ
 Bt1WNB3kRqFc2Cv+lQ21pYJQWcon4tIxfX7PjHn7g0HyzwwfH/dZFQgHW2RyiKgF302PSPdWyh+
 2yaljKY9E5wWAh1hm3sTkudhkE6vF7rBZBCootCreBssOPzhZTzMnnDE6qoUwKjbTD79j0yLNBn
 CrmSuitVzrY6EyROJNcHd6jBP9WeI9aWBZDvGqfe0eIJ5bP7vYWD/1a/i3jj5CK8meQNpsZ1gww
 6R7NpAdXgeJt4QKThLMz2eNiaXwpfQQAcZjFnF2ElfHONhKXv00+2A5bncHtR+YF9zeObLaCqNe
 87/R51gCn3VZUUpDEt/x293yQDWIgUUUvC4m930XUICfSWqBWwJjbOIu9sn7UMUxzFE0Dsd6UvL
 FFF7UWTYnDAY5810F2mXq33lWp5mrjvv4m80rA2Ejx3Ono92GHFo9i8xQsTnbR9Mz0hA==
X-Received: by 2002:a5d:4242:0:b0:45e:f381:cd8a with SMTP id
 ffacd0b85a97d-45ef6af03cdmr62323f8f.2.1780064677660; 
 Fri, 29 May 2026 07:24:37 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34a03f8sm4275856f8f.7.2026.05.29.07.24.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 07:24:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/17] accel: Remove need for AccelCPUClass
Date: Fri, 29 May 2026 16:24:16 +0200
Message-ID: <20260529142434.87880-1-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x442.google.com
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

Move cpu_init/realize hooks from AccelCPUClass to
AccelOpsClass. Specialize them for TCG in TCGCPUOps.

This drastically simplifies the need of per-binary QOM
types per accelerator per target (see also the nice
diff-stat).

Based-on: tag single-binary-20260528

Ignoring checkpatch.pl:

  WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
    accel/accel-target.c
    include/accel/accel-cpu-target.h
    include/accel/accel-cpu.h

Philippe Mathieu-Daudé (17):
  target/loongarch: Remove unused 'accel/accel-cpu-target.h' header
  accel: Remove AccelCPUClass::cpu_class_init()
  accel: Rename AccelOpsClass::cpu_target_realize() -> cpu_realize()
  accel/hvf: Remove need for AccelCPUClass::cpu_target_realize
  accel/kvm: Remove need for AccelCPUClass::cpu_target_realize
  accel: Introduce AccelOpsClass::cpu_instance_init handler
  accel/whpx: Convert AccelCPUClass -> AccelOpsClass::cpu_instance_init
  accel/nvmm: Convert AccelCPUClass -> AccelOpsClass::cpu_instance_init
  accel/hvf: Convert AccelCPUClass -> AccelOpsClass::cpu_instance_init
  accel/kvm: Convert AccelCPUClass -> AccelOpsClass::cpu_instance_init
  accel/tcg: Convert AccelCPUClass -> new TCGCPUOps::cpu_instance_init
  accel: Remove AccelCPUClass::cpu_instance_init()
  accel/tcg: Convert AccelCPUClass -> new TCGCPUOps::cpu_realize
  accel/tcg: Convert X86 AccelCPUClass -> TCGCPUOps::cpu_realize
  accel/tcg: Convert RISCV AccelCPUClass -> TCGCPUOps::cpu_realize
  accel: Remove AccelCPUClass::cpu_target_realize()
  accel: Remove AccelCPUClass and 'accel/accel-cpu-target.h'

 accel/tcg/tcg-accel-ops.h         |  1 +
 include/accel/accel-cpu-ops.h     |  3 +-
 include/accel/accel-cpu-target.h  | 31 --------------
 include/accel/accel-cpu.h         | 23 -----------
 include/accel/tcg/cpu-ops.h       |  2 +
 include/system/hvf_int.h          |  1 +
 include/system/kvm.h              |  3 ++
 target/i386/nvmm/nvmm-accel-ops.h |  2 +
 accel/accel-common.c              | 68 ++++---------------------------
 accel/hvf/hvf-accel-ops.c         |  3 +-
 accel/kvm/kvm-accel-ops.c         |  2 +
 accel/tcg/cpu-exec.c              | 15 ++++++-
 accel/tcg/tcg-accel-ops.c         |  1 +
 accel/whpx/whpx-accel-ops.c       |  2 +
 accel/whpx/whpx-common.c          | 17 --------
 target/arm/hvf/hvf.c              |  4 ++
 target/arm/whpx/whpx-all.c        |  1 -
 target/i386/hvf/hvf-cpu.c         | 25 ++----------
 target/i386/hvf/hvf.c             |  5 ---
 target/i386/kvm/kvm-cpu.c         | 25 +-----------
 target/i386/nvmm/nvmm-accel-ops.c |  2 +
 target/i386/nvmm/nvmm-all.c       | 19 +--------
 target/i386/tcg/tcg-cpu.c         | 28 ++-----------
 target/i386/whpx/whpx-all.c       |  1 -
 target/loongarch/tcg/tcg_cpu.c    |  1 -
 target/ppc/kvm.c                  | 23 +----------
 target/riscv/kvm/kvm-cpu.c        | 33 +--------------
 target/riscv/tcg/tcg-cpu.c        | 28 +++----------
 28 files changed, 64 insertions(+), 305 deletions(-)
 delete mode 100644 include/accel/accel-cpu-target.h
 delete mode 100644 include/accel/accel-cpu.h

-- 
2.53.0


