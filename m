Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED168C001B0
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 22:39:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW2fi-0004np-BB; Tue, 15 Aug 2023 18:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2fh-0004nN-Ch
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:37:53 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2fe-00063G-GC
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:37:53 -0400
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3a36b52b4a4so3507599b6e.1
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 15:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692139069; x=1692743869;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vKvdPYBo/eYvGoFGQPH1dJXkILK25zl12QO612SILUE=;
 b=P4eFMsMCWcAp8Gn4vQLKenBvBNXtpowHMQcw9NZ0BDQFzWXW55UIr1RfXJtQOmqwFT
 WCvv8LTaOCcfdz1ycISKckp0h97WkzvtorhV6cRHnT9pWkic4FXx0dGl65+pK5BRWRzd
 /8o5kZBOLHBWEj57yxZf2QIJAth2PZsC65fNqPsyLSAtKSGjGmmGUsn0BAlFXkV00be+
 LQFX8BlfkEQ820J7zo1a/CI61bKzuBam00zcW7VTuGONQTe8Em+W269sUthjY5YY2wXk
 dJgtYTBUzUil0QWfYhjZdUHIGAB1c+qP+7o+aEDTy+pDFH0u54r7f5WSxlV5yoTsgA3N
 fF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692139069; x=1692743869;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vKvdPYBo/eYvGoFGQPH1dJXkILK25zl12QO612SILUE=;
 b=K+U20eFEsj+iXLmmnfENZxi5dNIqFn49s9KkVA4p2SjkMkemOOkhlIRXcYORHeBoEr
 YPrVmiJBE8CmXcNoyyF+Tq4+H4dV8zP7jcFRuG+WTHI1TDHzf+1Jb15z/fwfD5X/D2rg
 FzYWDrrMr0zWrVOucjt+ySDFA9O1svZrkwW/hfZIcl+dKkc1vkWGje9y2KjQksN+DzcL
 ZBvZg4/u0EmvskfvwDjgD+eZywQyBc0Rh6ztOS6VKo2RKI+0GYPhjOLMNjuP3bnSONCx
 5W974kmDnIlksEbWU1ZMBfoa+lZkxon8nTWGr9S8b2dN+YgBaBMbcsy3FugYvRkY1g3F
 a+hg==
X-Gm-Message-State: AOJu0Yy65OlCHMmtB/85G1E1yA0ml3oPSbmme92fAiVTlSGHflNJru74
 9HSM052xXGStlp0m6RyZHhoRvA==
X-Google-Smtp-Source: AGHT+IHgNzJpHRGTK2oYuCbwU1YpiwXF8uRP3j/4/UN2YDsiuV6ASblNuDWCu6Tx/4SnNqVcG3P+Eg==
X-Received: by 2002:a05:6808:1701:b0:3a7:495c:4ccc with SMTP id
 bc1-20020a056808170100b003a7495c4cccmr2340592oib.20.1692139068850; 
 Tue, 15 Aug 2023 15:37:48 -0700 (PDT)
Received: from grind.. (189-69-160-189.dial-up.telesp.net.br. [189.69.160.189])
 by smtp.gmail.com with ESMTPSA id
 be15-20020a056808218f00b003a40b3fce01sm5903418oib.10.2023.08.15.15.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 15:37:48 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 00/12] riscv: add 'max' CPU, deprecate 'any'
Date: Tue, 15 Aug 2023 19:37:29 -0300
Message-ID: <20230815223741.433763-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x230.google.com
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

In this version we replaced the macros added in patch 7 and 8 with
regular functions instead.

Patches missing acks: 4,7,8

Changes from v7:
- patch 7:
  - add riscv_cpu_add_qdev_prop_array() function instead of a macro
- patch 8:
  - add riscv_cpu_add_kvm_unavail_prop_array() function instead of a
    macro
- v7 link: https://lore.kernel.org/qemu-riscv/20230815201559.398643-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (12):
  target/riscv/cpu.c: split CPU options from riscv_cpu_extensions[]
  target/riscv/cpu.c: skip 'bool' check when filtering KVM props
  target/riscv/cpu.c: split kvm prop handling to its own helper
  target/riscv: add DEFINE_PROP_END_OF_LIST() to riscv_cpu_options[]
  target/riscv/cpu.c: split vendor exts from riscv_cpu_extensions[]
  target/riscv/cpu.c: split non-ratified exts from
    riscv_cpu_extensions[]
  target/riscv/cpu.c: add riscv_cpu_add_qdev_prop_array()
  target/riscv/cpu.c: add riscv_cpu_add_kvm_unavail_prop_array()
  target/riscv/cpu.c: limit cfg->vext_spec log message
  target/riscv: add 'max' CPU type
  avocado, risc-v: add opensbi tests for 'max' CPU
  target/riscv: deprecate the 'any' CPU type

 docs/about/deprecated.rst      |  12 +++
 target/riscv/cpu-qom.h         |   1 +
 target/riscv/cpu.c             | 192 +++++++++++++++++++++++++--------
 tests/avocado/riscv_opensbi.py |  16 +++
 4 files changed, 178 insertions(+), 43 deletions(-)

-- 
2.41.0


