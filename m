Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD4BEB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 19:02:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJf6A-0000mR-I2; Wed, 12 Jul 2023 15:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJf67-0000lv-Hz
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 15:01:59 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJf65-0006Ul-W6
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 15:01:59 -0400
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3a41fbfd359so1357324b6e.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Jul 2023 12:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689188516; x=1691780516;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=urOygtk55l5rPaN2EdfFe3uECA48Ch5NVJSrHpWOCBY=;
 b=kIeMLdK9+cy2HWV06gnnrtgDq+57VbkcCsEnanHMtGNKitX5CtwurTNl4FjFLYQvoX
 HWwGmzkBwGWSPz+1TZKNmXDolf+geaNmi5dBfymLaTyNhMX6IRX8kbS4+MYhdIi3svuz
 4KW2Yr82RP/am5ga50DwUdwlRqC0I/R/aeeE7B0TKI7hwntNz7J1TtZ96GDfDfc0RIHB
 Gt5TPbZ1Bx+h/AmF5905LmErCr/NInW5XYsTgE6fhqgeJpi6dBnSx64sFodf9z4aRI49
 fquLKdZosztzyjAoGvMtuCGzoIp0mcRJz5E9udZri6mQVmUqS0wyGyOI8e3cAmnTCqzd
 duCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689188516; x=1691780516;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=urOygtk55l5rPaN2EdfFe3uECA48Ch5NVJSrHpWOCBY=;
 b=RK9AYA9KH1wP2O7D5HaAK7YSfOJaohZvlTGgQdfyVStS9LQ3VfScWdicxJPZQMgb+7
 Wt2QIoRYnhgeukE+rJJK7GTY4QSXyOMwLk8Zcg7ArUgBcw1w92Boxhu1eFYCJu6BRAuI
 M6xALkZlBL1dw+cenxtj1Ex1rmkJ65swdFiSKd7b/15Tbwzc5WhgAN9xs1QhK1ayGn2e
 VU2IF7YC/XYNg5YMLZXPcZ+Mh45Hr9sF3uvqUpHPcwuBXyj9dzudV/94N3xUFA2JH9tt
 fCj3Jioj0UnGAn7Y/Bkzxqe5C8syUUmm+gy2g1GUH6D6FkCbLhY3MWjZHNeOWZjBKD8f
 Zzwg==
X-Gm-Message-State: ABy/qLY9ctxKPqiw2/vEMXra4t8RckiG65pIxiBqFzBVBwdzDGsTR6f8
 lnR0OrnAc32rNDy+b5mqg7YXwA==
X-Google-Smtp-Source: APBJJlH3c335dnKKx6bf4en5AphFsYIFkthv7ScnfOUU95fY+xBCRNaL6zFtrr1QlvBz/FLNqF/VLg==
X-Received: by 2002:a05:6808:1901:b0:3a3:fa5d:6da3 with SMTP id
 bf1-20020a056808190100b003a3fa5d6da3mr13049944oib.21.1689188516292; 
 Wed, 12 Jul 2023 12:01:56 -0700 (PDT)
Received: from grind.. (201-69-66-19.dial-up.telesp.net.br. [201.69.66.19])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a05680802c900b003a020d24d7dsm2174435oid.56.2023.07.12.12.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 12:01:56 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 0/7] target/riscv: add 'max' CPU type 
Date: Wed, 12 Jul 2023 16:01:42 -0300
Message-ID: <20230712190149.424675-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
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

Following the discussions made in [1] I decided to go ahead and implement
the 'max' CPU type.

It's a CPU that has (almost) all ratified non-vendor extensions enabled
by default. Tooling such as libvirt uses this kind of CPU to do capabilities
discovery. It's also used for testing purposes.

To implement this CPU I did some cleanups in the riscv_cpu_extensions[]
array. After this series this array contains only ratified extensions.
This is a preliminary step for future changes we're planning to do in
the CPU modelling in QEMU, including 'profile' support.

Daniel Henrique Barboza (7):
  target/riscv/cpu.c: split CPU options from riscv_cpu_extensions[]
  target/riscv/cpu.c: skip 'bool' check when filtering KVM props
  target/riscv/cpu.c: split vendor exts from riscv_cpu_extensions[]
  target/riscv/cpu.c: split non-ratified exts from
    riscv_cpu_extensions[]
  target/riscv/cpu.c: add a ADD_CPU_PROPERTIES_ARRAY() macro
  target/riscv: add 'max' CPU type
  avocado, risc-v: add opensbi tests for 'max' CPU

 target/riscv/cpu-qom.h         |   1 +
 target/riscv/cpu.c             | 106 ++++++++++++++++++++++++++-------
 tests/avocado/riscv_opensbi.py |  16 +++++
 3 files changed, 103 insertions(+), 20 deletions(-)

-- 
2.41.0


