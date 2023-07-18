Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6D6EB64DD
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jul 2023 22:48:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLtUn-0003Ny-Sp; Tue, 18 Jul 2023 18:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kaiwenx@rivosinc.com>)
 id 1qLtUm-0003NK-La
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 18:48:40 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kaiwenx@rivosinc.com>)
 id 1qLtUh-0004xM-1j
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 18:48:40 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-517bdc9e81dso2634354a12.1
 for <qemu-riscv@nongnu.org>; Tue, 18 Jul 2023 15:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689720512; x=1692312512; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h0vwFwV4quN6yFVBduC18Yhtf+eVeJGxVojzXHppBW8=;
 b=PEQRnT/qtKclvjBqRIZhp5haRMAZ1Cw/RtF9GaVEuqXKCvpZmgtTqHRONvCgvpUKr3
 XzTVA8P5y2mFkc2xfStlhS+gvDd/uopLQkDMRTVjnD5lm0zD9+C4cy5fTIz71uWRTnMK
 vbmiDY7S54lPckFvsanA5xkK4BUszIPqQpGiX+yIJC8iN0iexT7CLUUu7UzitTPeF62n
 /F9fo0lIEpCIgRb20fGMxuS6jtE8ZPir+6bdN+RZtoqUtX1aqDgodRqSHpb5OG4t7Kv4
 r3tKGWPp10Ldbzy6GlXR2HpZ1roMZs42tz1HQ327CHXlivnMfQllnIXm6IhQbrSpkX0L
 JOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689720512; x=1692312512;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h0vwFwV4quN6yFVBduC18Yhtf+eVeJGxVojzXHppBW8=;
 b=EVcQOYgxT2qt+9VP5x7NisucET5SZue7YK9ZK7CJHAQi7E3iP380eoKtEVXq2Ovj3S
 5xab3VGKrjhTnlpCNu/GhAjNKeItU20UQ1cgTCjqIjk0W1X6z3Qzl1XXG2I9yPWf1QS2
 bkJzItdImPkFC7pwaT7w2XgE2i+UlL4nFILdGF/gVaLA6KjSQnmMY+VqDx3aNenQHRqf
 UK5VeKv9kit4XzDxIXvoSsWhUVMJ1samEvbUxuU71+7CAteCNNufMMsaywrGJ7mGVoxz
 +11C5YbwhGAtzjE7dvSkIpgrUhBj0k7aCBZ82r+1uPro/au0x7dYx6qkUc0ior+lj3jq
 fIgQ==
X-Gm-Message-State: ABy/qLYRbWHFJMHVICiLOpLta8CkWlyXFUunHBFrOCsBPclZo0gnE2dt
 i26bSNqhJTGhz3EFX/acDrhM4N6Ec6JnlqVXECvJjw==
X-Google-Smtp-Source: APBJJlHhu2mfZz9DE/4ai1Y/9u6mj9SETBy+6rZyZvpjvmLA03RBXn1aldE/E+8nuxbLQlPIGOOA6w==
X-Received: by 2002:a05:6a20:8f18:b0:134:2b31:e2a9 with SMTP id
 b24-20020a056a208f1800b001342b31e2a9mr425217pzk.0.1689720512191; 
 Tue, 18 Jul 2023 15:48:32 -0700 (PDT)
Received: from kaiwenx.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 i14-20020aa787ce000000b00682669dc19bsm1983312pfo.201.2023.07.18.15.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 15:48:31 -0700 (PDT)
From: Kaiwen Xue <kaiwenx@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Kaiwen Xue <kaiwenx@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Atish Kumar Patra <atishp@atishpatra.org>,
 Kaiwen Xue <kaiwenx@andrew.cmu.edu>
Subject: [PATCH 0/3] risc-v: Add ISA extension smcntrpmf support
Date: Tue, 18 Jul 2023 15:47:42 -0700
Message-ID: <cover.1689631639.git.kaiwenx@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=kaiwenx@rivosinc.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

This patch series adds the support for RISC-V ISA extension smcntrpmf (cycle and
privilege mode filtering) [1]. QEMU only calculates dummy cycles and
instructions, so there is no actual means to stop the icount in QEMU. Therefore,
this series only add the read/write behavior of the relevant CSRs such that the
implemented firmware support [2] can work without causing unnecessary illegal
instruction exceptions.

[1] https://github.com/riscv/riscv-smcntrpmf
[2] https://github.com/rivosinc/opensbi/tree/dev/kaiwenx/smcntrpmf_upstream

Kaiwen Xue (3):
  target/riscv: Add cycle & instret privilege mode filtering properties
  target/riscv: Add cycle & instret privilege mode filtering definitions
  target/riscv: Add cycle & instret privilege mode filtering support

 target/riscv/cpu.c      |  2 ++
 target/riscv/cpu.h      |  6 ++++
 target/riscv/cpu_bits.h | 29 ++++++++++++++++
 target/riscv/cpu_cfg.h  |  1 +
 target/riscv/csr.c      | 73 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 111 insertions(+)

-- 
2.34.1


