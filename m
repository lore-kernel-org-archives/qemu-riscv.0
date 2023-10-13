Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232DDCDB47E
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 11:01:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrFvB-0000BD-Qc; Fri, 13 Oct 2023 07:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qrFv8-0000AQ-5f
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 07:01:32 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qrFv3-00025O-PZ
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 07:01:27 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40675f06f1fso19796225e9.1
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 04:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697194884; x=1697799684;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iQ308IkT3zOq9EntSd1ZUYX5VAgQrSY0/sKbYCybMWU=;
 b=Tmef132pR9qyHktdTv9WqwDfVqduig6NiCnBXVeERgFmODQL0OtvJOsBkEdxNWktZ1
 lPeMADYSGQU1AGIsAxGKfFkjBEi2NMB11mpPCvrSsucasxN+LHC8R7i7/KYYyonDGdxu
 TSnbr6VECmQosalkFL0JXYPIUu0tb50kumYZXAwvHcUVWZ3y7mI66rUmru3vfsHHSFmb
 v0uIP2vpuXzOSqVRp4C23cpQ0nj4geq5fuR3oJpuXLPPn3WAmULfqaS8EXBsc9p40xxR
 Pxz0Sgad+eaq0apj+g2h5MsVBYsFK3jRaeVNwP/HrBZOKZQ2iKP+N7miRcdxWTj7Se7f
 x+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697194884; x=1697799684;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iQ308IkT3zOq9EntSd1ZUYX5VAgQrSY0/sKbYCybMWU=;
 b=gNE4R8ZyR8t9+HeH7YrhNLzi7315Tc52Kmhtrxtj8o8ZI2fDrgTd1lqfS1RqnsNM0L
 dfNh5OAffPgaIf813r7s6qnIlR3vac7X8zMQI3/XdIqAKb9AXWxoDOWJCS2TYqzG6fp3
 15e1lX5L84N1/I7GHB1LfwX8sIhuI6qeJ2qfwCgDN3vADWIAXUyI/gLh/aMnOWgOI6tB
 10t7uRzN+wE782Wki2dGa62J+n7jKdVV79jdfYzqhiDTrdILXN+l2JHDIivZX54JFx4A
 jgqHu0k0ffgXNphYlat9BG79Sz8LQyLqyv6JfCE0VqFy4xmSVMAbgVC/sxzmywNbHeYD
 uD+g==
X-Gm-Message-State: AOJu0YyLZdcusdv56sYjsd9/BOx6w90wv5GxDdivyDR5/ba8WZanRsjV
 nzogFTwIvwS94F+xPsBQ3OWusQ==
X-Google-Smtp-Source: AGHT+IFMst30oTzlQBe28yUBdq+Q6/oCYTSUD30EaLVcw/O8qsW4F/BpJ9XZtQys4+XmkSPkMJhnpw==
X-Received: by 2002:a5d:4e42:0:b0:313:f75b:c552 with SMTP id
 r2-20020a5d4e42000000b00313f75bc552mr19593918wrt.15.1697194883689; 
 Fri, 13 Oct 2023 04:01:23 -0700 (PDT)
Received: from rockhopper.. (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 p8-20020adfce08000000b003271be8440csm20455185wrn.101.2023.10.13.04.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 04:01:23 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH v3 0/6] Support discontinuous PMU counters
Date: Fri, 13 Oct 2023 11:54:42 +0100
Message-ID: <20231013110111.34619-1-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Currently the available PMU counters start at HPM3 and run through to
the number specified by the "pmu-num" property. There is no
requirement in the specification that the available counters be
continously numbered. This series add suppport for specifying a
discountinuous range of counters though a "pmu-mask" property.

v3:

* Use env_archcpu() in csr.c
* Re-added check to enforce deprectated "num-pmu" below limit
* Check that standard counters are not included in mask
* Remove use of MAKE_32BIT_MASK()

v2:

* Use cfg.pmu_mask wherever cfg.pmu_num was used previously
* Deprecate pmu_num property (warning, comment & updated documentation)
* Override default pmu_mask value iff pmu_num changed from default

Rob Bradford (6):
  target/riscv: Propagate error from PMU setup
  target/riscv: Don't assume PMU counters are continuous
  target/riscv: Use existing PMU counter mask in FDT generation
  target/riscv: Add "pmu-mask" property to replace "pmu-num"
  docs/about/deprecated: Document RISC-V "pmu-num" deprecation
  target/riscv: Use MAKE_64BIT_MASK instead of custom macro

 docs/about/deprecated.rst | 10 ++++++++++
 hw/riscv/virt.c           |  2 +-
 target/riscv/cpu.c        | 13 ++++++++++---
 target/riscv/cpu_cfg.h    |  3 ++-
 target/riscv/csr.c        |  5 +++--
 target/riscv/machine.c    |  2 +-
 target/riscv/pmu.c        | 41 ++++++++++++++++++++++-----------------
 target/riscv/pmu.h        |  5 +++--
 8 files changed, 53 insertions(+), 28 deletions(-)

-- 
2.41.0


