Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF70EB64DD
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 20:59:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJguZ-0000E5-9h; Wed, 12 Jul 2023 16:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJguY-0000Dk-0z
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 16:58:10 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJguS-0005T7-Pp
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 16:58:09 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6b74791c948so6510222a34.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Jul 2023 13:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689195483; x=1691787483;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gkG+7qZyYpzMB1CIWIF5nOYbQKd6MV64dGxdex70EcI=;
 b=LELgSZ/LAFNkpSMWlnWngHIHMvLgazopnvvAfbNTiSf9G3K/OYNmRffhH+HZQ0DL8Q
 15szgYSaNRfqh8d6qDMMEuV73zZTgMVrFBUh0/BG3QdmepsxoFykHvpSE9+0qWbEzYOG
 AeOmfWHdfv+MkHJ7x7O1eRZO7ZKyvXkg5lObCcLLrse8dM7VZeQ/o/9+C/FYfmBVqdSY
 bal46ZQFVECkXZYNNfzyRn9ABO71Ca5rZAKWBX+GdL0y8Dh5Hzcd5nnzupKLn9pUKxp4
 QsWVehRr6POpYbxd5rT+6A25bWmbFk9Qdxm3Hd8os3IaoPivkGYqGYZOnPyxcuDtVuFE
 UaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689195483; x=1691787483;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gkG+7qZyYpzMB1CIWIF5nOYbQKd6MV64dGxdex70EcI=;
 b=jC5z6Kfmbh/1mFriFKJ/IngBaa22OcSY4cbh6sqg7pLrb14sKNdy73lWFGnvak2KoQ
 A77hrZ0zrgS/a7jNsep+a6TFPq96rvVO8aN+26oe8HfiG6hBq5nKeY+AnplQSIw86Q7C
 lEZTp6wThT37/lJdrtprlVQTU5sZ2igC3kehzaCgRGNOh9TEedfQH4b+4AKrm6Dxh1Ax
 I9hYvr5dDzOH+zyzSveCw4lWnfZdcdCsNU4DScik//0KdzXBFCcmgkpUEv9LRQypzeXi
 YJtwaZDeEzbsaK/bo8vEDSl6SBfkcumcvKSaQyveEsMU3AyjupFthV7V9y3L3MT+JcPz
 maYQ==
X-Gm-Message-State: ABy/qLb5n5bBNj4Nqm3VtI9Gl5bTlRd6WBf0wlVY94AItjVaDQk74TUN
 bErMBLH/2TowtGGk2AeOXDD/lw==
X-Google-Smtp-Source: APBJJlFZ3uesEeuzFFiZE9ecJMpFKktAai5Qi6MMHGHJrt8hgwjqXaE/hVOpvrMWU38SwDLBnXckHg==
X-Received: by 2002:a05:6871:b2a:b0:19f:9495:95ff with SMTP id
 fq42-20020a0568710b2a00b0019f949595ffmr25104043oab.27.1689195483137; 
 Wed, 12 Jul 2023 13:58:03 -0700 (PDT)
Received: from grind.. (201-69-66-19.dial-up.telesp.net.br. [201.69.66.19])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a056870344200b001a9911765efsm2359904oah.40.2023.07.12.13.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 13:58:02 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 v2 0/7] target/riscv: add 'max' CPU type
Date: Wed, 12 Jul 2023 17:57:41 -0300
Message-ID: <20230712205748.446931-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This second version has smalls tweak in patch 6 that I found out
missing while chatting with Conor in the v1 review.

Changes from v1:
- patch 6:
  - enable RVG, RVJ and RVV in riscv_init_max_cpu_extensions()
  - Added the resulting 'riscv,isa' DT in the commit message
- v1 link: https://lore.kernel.org/qemu-riscv/20230712190149.424675-1-dbarboza@ventanamicro.com/T/#t


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
 target/riscv/cpu.c             | 109 +++++++++++++++++++++++++++------
 tests/avocado/riscv_opensbi.py |  16 +++++
 3 files changed, 106 insertions(+), 20 deletions(-)

-- 
2.41.0


