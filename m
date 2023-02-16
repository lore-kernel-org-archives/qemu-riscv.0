Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSmEU-0002r6-Sh
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 16:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSmET-0002qo-Cp
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 16:56:01 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSmER-0001sv-6p
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 16:56:00 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-15ff0a1f735so4276781fac.5
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 13:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k20xGM8qSgRee5tWJoiKe2WSmBvqEzAa8MCaAIa8+5E=;
 b=IAYDMym9SQb5s9jEX5a9jK3UruqL1RdHocsvGYHfVm4YFhN1pJkOWGbQOMtp/JLvVK
 fK5bc4W4nl0m2bPQOuc7w6lqzCbgk2NjBhraOb+V8Q2YyBlSVG1KryzQxvwpbOIF14zc
 I+NpuTM/p/UkMo0KEqrrYoh1r0k0PbZUaakSvVmkAx1TMm/Ozy6weUXJ4RX9C8PeVbWG
 O5loRb6i6FEkSi4dL+YaOhXRI2uDHsyVZnqSJPx/ChNBodR5zbHM7x16ge22HiQrxTCQ
 R+yhZnyWeOOd7xSuSlYAf4DJAC2xkgmjKq2YCtHcsO6HjkF5w5HDPLX7shF6+LbIiwwG
 afyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k20xGM8qSgRee5tWJoiKe2WSmBvqEzAa8MCaAIa8+5E=;
 b=fNIEXaDFfbDA+8LhvyRrM2ax81xN41Rg7VKoyWxhLs2aCGMMsF70XIDdK0ujwHn3uE
 3/PiCrcQaaidk9R0NWaZ4mF08gVLk5TlzlcQxDGx5CWFtn/mphk+ghM2wnrTiXEb4Eq3
 9Ky0XNUvQcxeIPxoIWm7RCPT/JuxSqJe55YqPoh+NPsDdBKA2WwhcwhjX586TDe2B64h
 4Yb+RaFVhy5b4s5NwAbXPLvUzT++JuEES0NVJfDGnjX3eikhaZsaELfMe60Oqt8PVW3+
 lHx3zbT/ah1AlWkkCZLvHP5m5bZ5oamUxbS1NYWcX0aRidMpnj7Fv9ySnzXCg/0K4oMv
 VMcA==
X-Gm-Message-State: AO0yUKUE0CAY0QDar2njYBaAW2LCliYOwP0niDnNU6AXjirIjUr3AkqB
 /uziob9zElJjfKGeS4zeORGhtw==
X-Google-Smtp-Source: AK7set89pyzkC6RpDgDw+6/Sb41PF1ckebgU3M3a/z5XaTpKc3KROWeIzuY4fGGpwBn8Ay3DzH0rfA==
X-Received: by 2002:a05:6870:a711:b0:16d:c094:2743 with SMTP id
 g17-20020a056870a71100b0016dc0942743mr3914866oam.27.1676584556931; 
 Thu, 16 Feb 2023 13:55:56 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 i132-20020acaea8a000000b0037d7f4d0890sm1047570oih.26.2023.02.16.13.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 13:55:56 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 0/9] make write_misa a no-op and FEATURE_* cleanups
Date: Thu, 16 Feb 2023 18:55:41 -0300
Message-Id: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
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
X-List-Received-Date: Thu, 16 Feb 2023 21:56:01 -0000

Hi,

This version contains a change in patch 2, where riscv_cpu_cfg() now
returns a const pointer to the RISCVCPUConfig struct instead of the
struct itself.

Minor changes were made in the remaining patches due to that.


Changes from v5:
- patches without review/acks: patch 2
- patch 2:
  - riscv_cpu_cfg() now returns a const pointer to RISCVCPUConfig
- v5 link: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg04906.html

Daniel Henrique Barboza (9):
  target/riscv: turn write_misa() into an official no-op
  target/riscv: introduce riscv_cpu_cfg()
  target/riscv: remove RISCV_FEATURE_DEBUG
  target/riscv/cpu.c: error out if EPMP is enabled without PMP
  target/riscv: remove RISCV_FEATURE_EPMP
  target/riscv: remove RISCV_FEATURE_PMP
  hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
    create_fdt_socket_cpus()
  target/riscv: remove RISCV_FEATURE_MMU
  target/riscv/cpu: remove CPUArchState::features and friends

 hw/riscv/virt.c           |  7 +++--
 target/riscv/cpu.c        | 19 +++---------
 target/riscv/cpu.h        | 28 +++--------------
 target/riscv/cpu_helper.c |  6 ++--
 target/riscv/csr.c        | 65 +++------------------------------------
 target/riscv/machine.c    | 11 +++----
 target/riscv/monitor.c    |  2 +-
 target/riscv/op_helper.c  |  2 +-
 target/riscv/pmp.c        |  8 ++---
 9 files changed, 31 insertions(+), 117 deletions(-)

-- 
2.39.1


