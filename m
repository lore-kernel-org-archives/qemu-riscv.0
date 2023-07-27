Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A1CEB64DD
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 22:29:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qP9Av-0001F0-Nf; Thu, 27 Jul 2023 18:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qP9At-0001EV-TX
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 18:09:35 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qP9As-0004rB-9B
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 18:09:35 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6bb2ce4f9f8so1200248a34.3
 for <qemu-riscv@nongnu.org>; Thu, 27 Jul 2023 15:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690495772; x=1691100572;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Orv7MX0ttntF8PHeU3TgGURXkdyLHtOWFn1lKtHB7ew=;
 b=b68z1PbZ6892OTEYj64djphljr8iGchQkeRFDe0AoyHdClwDyHRxvMiKn/xdtlnVws
 dqtgxzVkqw9vE0pDnTjd8huE38y+HosO/fn2rYn7v9alaBFTd2+C96TlNvDxMYR/d0Bh
 IUC9QbUN0eQXeHZzmAw8E/NUOaFe8bYE5dHbFXb8xJPkc5hQUkZi8acMn1EYdN9ssQDm
 bKgQLMj39V5gSYLt3GBVd38M/XrKsUOHsUeWeXH7jgm+rxFy2tAO0MFCDcqmV46XZvtr
 dEbqPzQuIplOC3zLABZ/bJBjKd5B52uGSANFzIBboEc/ej9SSb74eHA9bOyXjyC6sphO
 ipAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690495772; x=1691100572;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Orv7MX0ttntF8PHeU3TgGURXkdyLHtOWFn1lKtHB7ew=;
 b=c+dILlDLARo2EvSgZ+iE5bAJ7AWMrrqFqFeeCktAjvjjS6ox+7JO6BdHDCIJ2Yc9BG
 kiBsz3r6TOY57oB+osR5+6NFgIQkUwNkAQSvQHe3L9kJlgr7ebUwcwzj33CTpCGLbCRd
 N4LRbAULVX/SIsY8q+0ZxFCpSPNXAOK4NkUhb/CUPoijCegYQz1fgCUjYwYHevzl3suL
 xcwDN0tPnF3e1c7SrcL12hGYpZ40pafdfK2lJcvSzEzx3xS42C28z6ojbpWq3mrCCk6j
 8f46K9qSGvHcGBUbfDJYFp6ijp0SwT+2vjis8XDneEcX/8v/Ezld/+UhCmBvLVGhvUlu
 4/dg==
X-Gm-Message-State: ABy/qLY5ZloCLHtQBK0pOoFLK8Q69qmW8sFz4dIqDzCvoKktv8gzOXmO
 L7tjNouIfEygQIOIk0gy8UEVuA==
X-Google-Smtp-Source: APBJJlHXJ39ki0rVjmh0jOD6ROOUFNUK39P/3gvyKxWEjAW1LIjSHt94Je4rn+jSPNUzrQ3VzPhAIA==
X-Received: by 2002:a05:6870:1f8f:b0:1bb:9b40:266 with SMTP id
 go15-20020a0568701f8f00b001bb9b400266mr890228oac.25.1690495772426; 
 Thu, 27 Jul 2023 15:09:32 -0700 (PDT)
Received: from grind.. (201-69-66-36.dial-up.telesp.net.br. [201.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 y136-20020a4a458e000000b0051134f333d3sm1070471ooa.16.2023.07.27.15.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 15:09:32 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 00/12] riscv: add 'max' CPU, deprecate 'any'
Date: Thu, 27 Jul 2023 19:09:15 -0300
Message-ID: <20230727220927.62950-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

I decided to spin a new version of this work after chatting with Conor
about some log messages about 'vector version is not specified' message
when using the 'max' CPU.

For this particular CPU we should set an appropriate value for the vector
version right at cpu_init(), but doing that isn't enough to avoid that
log message. A new patch (9) was added to tune in RVV validation code to
skip the message if a CPU already set env->vext_ver.

Patches missing acks: 9, 11, 12

Changes from v6:
- patch 9 (new)
  - change RVV vext_ver handling to avoid msg logs if the CPU sets a
    specific env->vext_ver
- patch 10 (former 9)
  - set env->vext_ver in riscv_init_max_cpu_extensions()
- v5 link: https://lore.kernel.org/qemu-riscv/20230720171933.404398-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (12):
  target/riscv/cpu.c: split CPU options from riscv_cpu_extensions[]
  target/riscv/cpu.c: skip 'bool' check when filtering KVM props
  target/riscv/cpu.c: split kvm prop handling to its own helper
  target/riscv/cpu.c: del DEFINE_PROP_END_OF_LIST() from
    riscv_cpu_extensions
  target/riscv/cpu.c: split vendor exts from riscv_cpu_extensions[]
  target/riscv/cpu.c: split non-ratified exts from
    riscv_cpu_extensions[]
  target/riscv/cpu.c: add ADD_CPU_QDEV_PROPERTIES_ARRAY() macro
  target/riscv/cpu.c: add ADD_UNAVAIL_KVM_PROP_ARRAY() macro
  target/riscv/cpu.c: limit cfg->vext_spec log message
  target/riscv: add 'max' CPU type
  avocado, risc-v: add opensbi tests for 'max' CPU
  target/riscv: deprecate the 'any' CPU type

 docs/about/deprecated.rst      |  12 +++
 target/riscv/cpu-qom.h         |   1 +
 target/riscv/cpu.c             | 188 +++++++++++++++++++++++++--------
 tests/avocado/riscv_opensbi.py |  16 +++
 4 files changed, 171 insertions(+), 46 deletions(-)

-- 
2.41.0


