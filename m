Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55563C0015E
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 13:52:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qPNK1-0006Ue-4j; Fri, 28 Jul 2023 09:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qPNJr-0006Qa-WF
 for qemu-riscv@nongnu.org; Fri, 28 Jul 2023 09:15:51 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qPNJY-0003Iz-EO
 for qemu-riscv@nongnu.org; Fri, 28 Jul 2023 09:15:35 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6b9a2416b1cso1764910a34.2
 for <qemu-riscv@nongnu.org>; Fri, 28 Jul 2023 06:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690550126; x=1691154926;
 h=content-transfer-encoding:based-on:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W9nvMVvIgywNUYmmvCjsN6Rzo9AhC8RrxwrxIFZBN8M=;
 b=PTF+rapybBExNQDuE2may6H4zTdS5pZVVTRzO3zQX+g4pdubLAtuXslaQdqG2ssdgj
 jAVhvp83bEa6YLqBa07FvrZNC4sIr6q+kotUPHrTBDOEHh4v4PGY3/ViXtL9sSrgFqJz
 D2gqDiyN8CtW0RrAmqRZMzQ/+LwmUZfiJATOBM4B3cEAgGOXABePXPu7gfef56h097hT
 f5i+rKRruq5NuKzF1gWqUG3OUhD/2qc3BNWlOrHj0LWN5oqt3UNV7uh4GU//P7eCLwYk
 QcHDCtHHj6sKl2PrpktXnDukjdJVgJIz/ToxF1HAGL3tmeMx/gQGBzMx5sMbvkcEGqM5
 TDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690550126; x=1691154926;
 h=content-transfer-encoding:based-on:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W9nvMVvIgywNUYmmvCjsN6Rzo9AhC8RrxwrxIFZBN8M=;
 b=AO+UAuJiZMEf87VAX2vRoFt4M8ypa3Dl9Ma4eGeGksgevgJXFpJ8oMrfn8a+VxsAus
 Hz/ChsSxXXU8EnzyJ2w2I9tepFm3YbA15ApvmOtlqJsoeyQxRtRHVEEp2TTU8/Xkwcww
 YsdJGZOEv6pG6jjjCI0TuQtQC020iL78yRcngnf3zR0/ILxF8PWHdvSqpShIZY15Qqif
 VgCX6lL463IN/cR8oVOVrPEf+LfOS47thYfjNZW5QiejpWoGeR2gF9la3ak8qecFZQCa
 kqsO34gjxQfOatpgs+1GhDIAxRWSgWh4aRqUa/tPr63EJtkVOPC3tO4HJvhfl4tPHY4D
 5vQA==
X-Gm-Message-State: ABy/qLacHG5O7QRw8syXvkIwz+m3BuTXpDjVi1IinmEk8QQEXeHeZfX1
 jqDm3wf1eCfuz2Q2mQNWGP0O7ClqCGesmwGA2yDuxg==
X-Google-Smtp-Source: APBJJlFK+p3Jan9KJ2dQ9SmFRkRI7qe4LridbKC1a+XtTeq7ZLIZWvV8MZzSf1HE4RXVV/8eD1H3OQ==
X-Received: by 2002:a05:6870:a918:b0:1bb:39f8:fcb6 with SMTP id
 eq24-20020a056870a91800b001bb39f8fcb6mr3195427oab.20.1690550126109; 
 Fri, 28 Jul 2023 06:15:26 -0700 (PDT)
Received: from grind.. (201-69-66-36.dial-up.telesp.net.br. [201.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a056871cc0600b001b3d93884fdsm1699371oac.57.2023.07.28.06.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 06:15:25 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/8] riscv: detecting user choice in TCG extensions
Date: Fri, 28 Jul 2023 10:15:12 -0300
Message-ID: <20230728131520.110394-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Based-on: 20230727220927.62950-1-dbarboza@ventanamicro.com
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32d.google.com
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

This series, based on the work done in "[PATCH for-8.2 v6 00/11] riscv:
add 'max' CPU, deprecate 'any'", aims to solve two problem we have in
TCG properties handling:

- we are not checking for priv_ver when auto-enabling extensions during
  realize();

- we are not able to honor user choice during validation because we're
  not able to tell if the user set an extension flag or not.

The solution adopted here is a modification of what we did in the RISC-V
KVM driver for 8.1. Instead of adding an 'user_set' flag and doing a
linear search in all the extensions (now split between multiple arrays),
we'll use a hash to store the 'offset' value of the property that the
user set in the command line in the set() callback of the property. The
existence of an entry in the hash indicates that the user set a value
for that extension, and the store val indicates what the user set. This
can be used in the future in case we decide to overwrite the user input
in a corner case.

Aside from this detail, the changes to convert the existing code to use
the new structure (RISCVCPUMultiExtConfig) is quite similar to what was
already done before in the KVM driver.

I also added a new concept called 'auto_update' (any other name is
welcome) to refer to the action of changing extension state during
realize() without user knowledge. All these cases are now wrapped in a
cpu_cfg_ext_auto_update() function that checks if the priv_ver is valid
and if the user set the extension to an specific val. User choice
prevails in this case, regardless of the noble intentions we have when
auto-updating an extensions (e.g. extension dependencies).

Yes, users will have an easier time breaking validation and guest boot,
but that's the idea. Users will have more power, and the adequate dose
of responsibility that comes with it.


Daniel Henrique Barboza (8):
  target/riscv/cpu.c: use offset in isa_ext_is_enabled/update_enabled
  target/riscv: make CPUCFG() macro public
  target/riscv/cpu.c: introduce cpu_cfg_ext_auto_update()
  target/riscv/cpu.c: use cpu_cfg_ext_auto_update() during realize()
  target/riscv/cpu.c: introduce RISCVCPUMultiExtConfig
  target/riscv: use isa_ext_update_enabled() in
    init_max_cpu_extensions()
  target/riscv/cpu.c: honor user choice in cpu_cfg_ext_auto_update()
  target/riscv/cpu.c: consider user option with RVG

 target/riscv/cpu.c | 392 +++++++++++++++++++++++++++++----------------
 target/riscv/cpu.h |   2 +
 target/riscv/kvm.c |   8 +-
 3 files changed, 261 insertions(+), 141 deletions(-)

-- 
2.41.0


