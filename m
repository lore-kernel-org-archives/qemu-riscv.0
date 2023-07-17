Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3558EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 21:54:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLWAp-0004po-Pg; Mon, 17 Jul 2023 17:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLWAl-0004pN-MU
 for qemu-riscv@nongnu.org; Mon, 17 Jul 2023 17:54:27 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLWAk-00040q-41
 for qemu-riscv@nongnu.org; Mon, 17 Jul 2023 17:54:27 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1b0719dd966so3943460fac.1
 for <qemu-riscv@nongnu.org>; Mon, 17 Jul 2023 14:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689630864; x=1692222864;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UjgKOjBVg5RoJdkiE54ny4j9gWpEU6MbpdXOZnvlujs=;
 b=Qx8HzN+yuMt/MDC4Z1VUpNJqzMkdg4bRROpf8sQDol3oO0b63n+F2UmlhPUDq8PNf2
 J7+BOJmk3xwmGVRiykSlXmqLCzWpewaqS55P1+1Dutt8QBrGN/1b3Zwk+dapxbDZgQMZ
 Gro+yJdw2OwRaKgvXSSg3lFtD9hvrBO7FHGnz5IXMpN+0o5GpUOsUUo3Qr4FMtY0yH7x
 q3N3MCINjEps16MN0yZXal28R8Qha0V9IoMru6Jql7ZTRPvD9QNad9ya58al8VtfmxAx
 Kj8ec5SgawMRe52iplM6YFbfL8EAFNvQtj+gM18aZTL4Sr4lMmQWMXkWq6Lzt2sxJJfE
 YLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689630864; x=1692222864;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UjgKOjBVg5RoJdkiE54ny4j9gWpEU6MbpdXOZnvlujs=;
 b=cjn8PRkuzNCC+O6sQDjRSt0FX5Bm10EcPXJ1We7sIfB/RAT6QuIqnBg/nORUzNng+5
 Hn6RUIYfkFYexHFKsJ1cK6bsU76J7FMizNAIZJUqvynnbOJ5JOUysltqeavK9V6q+/hr
 vhFsXLniSiTFYbaEg6n5bxXjqd0xil9DTfJSb/b9WnacunBujPn/yzon9N9YYsnHC3kB
 yA8kAduItK+MWX25xSSS1SYpPtBO2R/XKVDOkjnpmD5KkBNJIN5xzx5l7raitxHpqCkg
 JsetxLZTS1Te/Fjbg2QwcmuHDMU1hbUCQLbB57p79tN1LQCuP2S0VUDql7BuwBB8FSqm
 F7tQ==
X-Gm-Message-State: ABy/qLbSvw3Qnat6pg2pRw8MEzAtUCuH/wES9bWwkNOtaCXKv+x2MUaD
 zKe3VpB9dAJe/r40mgm8wMm/MA==
X-Google-Smtp-Source: APBJJlGntC/laa9xWPG50VXs6y/blov4QMFGuJtV7IUhwXsd8bzdpwh1a61s+X9pY0Ig1xZhWhLANg==
X-Received: by 2002:a05:6871:1cd:b0:1b7:4b56:fe68 with SMTP id
 q13-20020a05687101cd00b001b74b56fe68mr13600664oad.3.1689630864322; 
 Mon, 17 Jul 2023 14:54:24 -0700 (PDT)
Received: from grind.. (201-69-66-211.dial-up.telesp.net.br. [201.69.66.211])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a056830008100b006b9848f8aa7sm322958oto.45.2023.07.17.14.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 14:54:23 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 0/2] target/riscv: add zicntr and zihpm flags
Date: Mon, 17 Jul 2023 18:54:17 -0300
Message-ID: <20230717215419.124258-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
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

I decided to include flags for both timer/counter extensions to make it
easier for us later on when dealing with the RVA22 profile (which
includes both). 

The features were already implemented by Atish Patra some time ago, but
back then these 2 extensions weren't introduced yet. This means that,
aside from extra stuff in riscv,isa FDT no other functional changes were
made.

Both are defaulted to 'true' since QEMU already implements both
features, but the flag can be disabled if Zicsr isn't present or, in
the case of zihpm, if pmu_num = 0.

Daniel Henrique Barboza (2):
  target/riscv/cpu.c: add zicntr extension flag
  target/riscv/cpu.c: add zihpm extension flag

 target/riscv/cpu.c     | 29 +++++++++++++++++++++++------
 target/riscv/cpu_cfg.h |  2 ++
 2 files changed, 25 insertions(+), 6 deletions(-)

-- 
2.41.0


