Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVXbX-0005cT-Ab
	for mharc-qemu-riscv@gnu.org; Tue, 06 Sep 2022 08:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbT-0005a8-PZ
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 08:22:55 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:42869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbN-0003pQ-7i
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 08:22:53 -0400
Received: by mail-ed1-x534.google.com with SMTP id q21so7255961edc.9
 for <qemu-riscv@nongnu.org>; Tue, 06 Sep 2022 05:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=2TryqUfeHN19NU4kptcV+D0cDp71nEExrubk/3qJPSQ=;
 b=qkwN24lnMYKztZvQq+UxHwMh3m5uBvj7yKQQOnmifXTkO6xJmEQCUskrqrotrLmTgQ
 vBcs6kODqRWBFErWLMzYFrvHRljK0du0fXjgu/zy/oeLObzX2in+0CVoCtuPbBI1oREI
 WGVHWTghtoU3Vc+2DF5mhgMpr67edlJTCqJ+Ry8b8fImZasNDXhBZ6jxrD0LwV/gFEKk
 CNgthqad+95PkMbXwB/UGhRwsg+HdjxiYgNnTGG/JtO0udin9JaDBAVnJpzPYiSSYtsg
 ZhYwnJvo1hmqA2wILZPQpbjw5uZxIiO4xQKZeXqijs9ZQG4iLRzLr0Yb9IgcTdQ1O5iu
 JoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=2TryqUfeHN19NU4kptcV+D0cDp71nEExrubk/3qJPSQ=;
 b=vHJS04+TR7mJrJCjZ3TCBIZxrYi1okWduPzQVziVLaWe+zE7tWLlPuII4KZSdHJ004
 aYpUpYjClMgZ5FiT+JLacT3aFczJ6NhGCVpK+cwcMYOY+DqIy46ua8FsgVfSFWevSgN+
 qlXRlJHbi4G8MIlrqVQjH6IE4TNuDIRgINVZxyIMM1HdOd3tLDh4QKoyJNoCdc7b6+7W
 8zD3IUhjtTvS5qhzEMDZdrMf2TqhAYGVKd10DbuWeK/vxyRa79ZRJ3uuutjKXIfe1SwJ
 IVQT2cNJUfImxpJJ0Xdn9/AaS3/GZ6AWlF7beBTt6pX+4YwO85CkTisqM63oaapYohy+
 dqpg==
X-Gm-Message-State: ACgBeo3CNdwdMcFupAO5D/U3xfzpyCgghmqWdhM4jmsVxHxXgzrUTvxu
 JYPSuEYBcsxcMJ2EarYHW2c0eMTMWGSOKqP8
X-Google-Smtp-Source: AA6agR44iK0Qs47lsnhO9odu52mG86jbRRAVjCeZVYCtUOzg3+80ypElqbNL4/CPUBvbYBAnxEulBw==
X-Received: by 2002:aa7:d3d6:0:b0:44e:98b9:3d7b with SMTP id
 o22-20020aa7d3d6000000b0044e98b93d7bmr6847208edr.259.1662466966463; 
 Tue, 06 Sep 2022 05:22:46 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 d21-20020a170906305500b0073d6ab5bcaasm6479034ejd.212.2022.09.06.05.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:22:46 -0700 (PDT)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH 00/11] Add support for the T-Head vendor extensions
Date: Tue,  6 Sep 2022 14:22:32 +0200
Message-Id: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x534.google.com
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
X-List-Received-Date: Tue, 06 Sep 2022 12:22:57 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This series introduces support for the T-Head vendor extensions,
which are implemented e.g. in the XuanTie C906 and XuanTie C910
processors:
* XTheadBa
* XTheadBb
* XTheadBs
* XTheadCmo
* XTheadCondMov
* XTheadFMemIdx
* XTheadMac
* XTheadMemIdx
* XTheadMemPair
* XTheadSync

The xthead* extensions are documented here:
https://github.com/T-head-Semi/thead-extension-spec/releases/download/2.0.0/xthead-2022-09-05-2.0.0.pdf

The "th." instruction prefix prevents future conflicts with standard
extensions and has been documentented in a PR for the RISC-V toolchain
conventions:
  https://github.com/riscv-non-isa/riscv-toolchain-conventions/pull/19

The goal of this patchset is to provide access to these instruction
so that compilers/users can optimize SW accordingly.

Note, that the T-Head vendor extensions do not contain all
vendor-specific functionality of the T-Head SoCs (e.g. no vendor-specific
CSRs are included). Instead the extensions cover coherent functionality,
that is exposed to S and U mode.

To enable the extensions above, the following two methods are possible:
* add the extension to the arch string (e.g.
* QEMU_CPU="any,xtheadcmo=true,xtheadsync=true")
* implicitly select the extensions via CPU selection (e.g.
* QEMU_CPU="thead-c910")

This patchset attempts to minimize code changes in
generic/infrastructure code.
This patchset allows to boot the Xuantie Linux kernel.

Christoph Müllner (11):
  riscv: Add privilege level to DisasContext
  RISC-V: Adding T-Head CMO instructions
  RISC-V: Adding T-Head SYNC instructions
  RISC-V: Adding T-Head Bitmanip instructions
  RISC-V: Adding T-Head CondMov instructions
  RISC-V: Adding T-Head multiply-accumulate instructions
  RISC-V: Adding T-Head XMAE support
  RISC-V: Adding T-Head MemPair extension
  RISC-V: Adding T-Head MemIdx extension
  RISC-V: Adding T-Head FMemIdx extension
  RISC-V: Add initial support for T-Head C906 and C910 CPUs

 target/riscv/cpu.c                         |  43 +
 target/riscv/cpu.h                         |  14 +
 target/riscv/cpu_helper.c                  |   6 +-
 target/riscv/cpu_vendorid.h                |   6 +
 target/riscv/insn_trans/trans_xthead.c.inc | 874 +++++++++++++++++++++
 target/riscv/meson.build                   |  10 +
 target/riscv/translate.c                   |  42 +-
 target/riscv/xtheadba.decode               |  46 ++
 target/riscv/xtheadbb.decode               |  62 ++
 target/riscv/xtheadbs.decode               |  32 +
 target/riscv/xtheadcmo.decode              |  43 +
 target/riscv/xtheadcondmov.decode          |  33 +
 target/riscv/xtheadfmemidx.decode          |  34 +
 target/riscv/xtheadmac.decode              |  30 +
 target/riscv/xtheadmemidx.decode           |  73 ++
 target/riscv/xtheadmempair.decode          |  29 +
 target/riscv/xtheadsync.decode             |  25 +
 17 files changed, 1397 insertions(+), 5 deletions(-)
 create mode 100644 target/riscv/cpu_vendorid.h
 create mode 100644 target/riscv/insn_trans/trans_xthead.c.inc
 create mode 100644 target/riscv/xtheadba.decode
 create mode 100644 target/riscv/xtheadbb.decode
 create mode 100644 target/riscv/xtheadbs.decode
 create mode 100644 target/riscv/xtheadcmo.decode
 create mode 100644 target/riscv/xtheadcondmov.decode
 create mode 100644 target/riscv/xtheadfmemidx.decode
 create mode 100644 target/riscv/xtheadmac.decode
 create mode 100644 target/riscv/xtheadmemidx.decode
 create mode 100644 target/riscv/xtheadmempair.decode
 create mode 100644 target/riscv/xtheadsync.decode

-- 
2.37.2


