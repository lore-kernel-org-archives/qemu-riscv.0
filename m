Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EECCDB474
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 22:13:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qssIt-0001b5-Nv; Tue, 17 Oct 2023 18:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qssIs-0001ag-Dm
 for qemu-riscv@nongnu.org; Tue, 17 Oct 2023 18:12:42 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qssIk-0002Rw-BF
 for qemu-riscv@nongnu.org; Tue, 17 Oct 2023 18:12:42 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6b3c2607d9bso3660211b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 17 Oct 2023 15:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697580752; x=1698185552; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JoI3ewOqGPmPitQc47qaIzmOcciESJo39DxkrCwyHlE=;
 b=SZgf8a3EmpUkcYaw0PwxUHCSHRKjcTl1WVCK0/1CAeJqFk0CgVP0ESSAvUnfHSx+O+
 axnpHdf4S1nfNMIkNhFSuXMWKprJJZ/GscVNAk9XnaTzhn1VLwa+FyzXH7QHo+nlgg0l
 gOR0DHUwMoYVYaXDD3rMBdXQb0PI0vjClc2jAXHcFyxHcvZcvopycZj3ygAiYZev2duh
 xtlom78Eztgi7jepslHm7QYqMOagIgMdGG0PSTnrnbVWnSVwGhw2U4qRfC3rl7+xE97L
 TAhVnw5NVEqCtgn/BbTiV0Kk7pQ9DCX+fhfWnJg8QwAJ+/zj6RlWSi95f8uMhDTdcqJA
 pSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697580752; x=1698185552;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JoI3ewOqGPmPitQc47qaIzmOcciESJo39DxkrCwyHlE=;
 b=NhrCpIiZohTIeg1d6xxSo5o5b5/liJcM/f4j7YPJQ1+C5Ke8U3h+3X5qmPv8xJ1iEs
 65ogGFIeyEyyYD46NNTNO6CHd1mgwwrP+oAtJ5u+rjN0AB8fNf0uR4dF3qM5Ypvw4psi
 RjuOnQH7khwl7MKDw6EqzcCkWVjY0cPl74yL0GDJEUGKtz8QZaYt2Z8Oil6e3F9SWfaD
 m1QMabC+qxH/G8kj/LRFqKuOn62U3aS7KVLyjx5Pn2mKX0HtnVPkbrmOgBi3GvKxwqUV
 p27zoVnhNA1Roh6gcP9KyL2Ov2cmINR/BgNaSWZCD4E4ELLId77o2wP6FtbUd3zc8QEL
 NGBA==
X-Gm-Message-State: AOJu0YwNZ+KuezmHgYHCSjvtOZyS+IJPDK8SdDHsokRQlH8dXOOqdSWe
 FizMmB+TkSYswr7j8D+Vu15vFw==
X-Google-Smtp-Source: AGHT+IHvK74gpzwutVPb2MLwrZCOwCwj/bwrKE0VcVPR/b6wbPGK3NXeWQv39Wu4WIiTcXfvO86tLw==
X-Received: by 2002:a05:6a00:1a51:b0:6ad:535e:6ed9 with SMTP id
 h17-20020a056a001a5100b006ad535e6ed9mr3527350pfv.16.1697580751933; 
 Tue, 17 Oct 2023 15:12:31 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.45.186.249])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a62d14d000000b006be077531aesm2011023pfl.220.2023.10.17.15.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 15:12:31 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 0/6] riscv: zicntr/zihpm flags and disable support
Date: Tue, 17 Oct 2023 19:12:20 -0300
Message-ID: <20231017221226.136764-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x432.google.com
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

Hi,

This is a follow-up of the work done in [1] after review comments made
in the rva22u64 profile support review [2].

zicntr and zihpm are already implemented by QEMU before they were added
as discrete extensions by RVI. This puts QEMU in a weird spot because it
has enabled default extensions that aren't togglable on/off via user
flags and aren't reported in riscv,isa as present.

There's no reason to no treat both zicntr and zihpm as regular
extensions, reporting their existence in riscv,isa DT and allowing users
to disable them. This will also benefit us in the incoming profile
support, since disabling a profile should disable all its mandatory
extensions, and for the rva22u64 profile this means that both zicntr and
zihpm should be disabled as well. 

Let's add user flags and disable support for both in all accelerators
(TCG and KVM). FWIW Linux boot doesn't seem to care about the lack of
both zicntr and zihpm when running TCG, although attempting to use the
timers will result in SIGILL.


[1] https://lore.kernel.org/qemu-riscv/20230717215419.124258-1-dbarboza@ventanamicro.com/
[2] https://lore.kernel.org/qemu-riscv/20231017-e7a4712137165b59844499e3@orel/T/#m3bb0e3c9b00d9edd168da9f7de0bc26df4f7d6ab

Daniel Henrique Barboza (6):
  target/riscv/cpu.c: add zicntr extension flag
  target/riscv/tcg: add ext_zicntr disable support
  target/riscv/kvm: add zicntr reg
  target/riscv/cpu.c: add zihpm extension flag
  target/riscv/tcg: add ext_zihpm disable support
  target/riscv/kvm: add zihpm reg

 target/riscv/cpu.c         | 15 +++++++++++++++
 target/riscv/cpu_cfg.h     |  2 ++
 target/riscv/csr.c         |  4 ++++
 target/riscv/kvm/kvm-cpu.c |  2 ++
 target/riscv/tcg/tcg-cpu.c | 21 +++++++++++++++++++++
 5 files changed, 44 insertions(+)

-- 
2.41.0


