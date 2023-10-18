Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E78CDB47E
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 15:45:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qt8j1-0001Ya-4R; Wed, 18 Oct 2023 11:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qt8iy-0001XY-Vd
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 11:44:44 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qt8ix-0004vz-54
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 11:44:44 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40839807e82so7549715e9.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Oct 2023 08:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697643881; x=1698248681;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BsA4KKgtOM0qliqjEIe/huo0hS3uhQsiMmskyenzp2A=;
 b=mQivgUV5Ru1fw9kmAcelYb1CiUnQ76qzKxF/FZ4bzURhj7nw8+46Cl7Nv9CloaKMB9
 paXgx2+5C6rdcbY2soYfHrKbg0jH9l60xRnlBzmVsezxvUAN0crS0G+nZ39YGdz7W3yd
 eK9+0U605DvuV1Sy4SnCyfv3mISI8Sslpp5wccZtD4Ts8AIf2+Tyud5joqT+Hk4RQNak
 zWSQdcSEk15wScRJxSteANLCTKjFCVVuF0v0qEkNz4IKAhHFdF25dfw3fvOGCkNreptZ
 EqHobe/LmcVjbARTnViFKj+2HIvXiQfXL5XEXvL4eFSFdmziE1UVPFxdOKMlDBnnhmTu
 euVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697643881; x=1698248681;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BsA4KKgtOM0qliqjEIe/huo0hS3uhQsiMmskyenzp2A=;
 b=QFBi6SdWvOarNxm/NAY3Rz6LHhe6i/Nplpe1jTGRcO7ZtunBdXnxCWVNYuOXJMAEdA
 gtEFwYdMWf5rXtWSqejTcJtXsFJfCaFuAEWkupTlGoIQevJHTb2Dp148LqK2X3BX7i1P
 bwBaVb1QxCf2DiJMZdhlcokEBZZ8Kp0h6xsVM+x9tC2mHJaUhA61Nx+6C24rWWxQdJXF
 OTplQ5ML1RHax+r4djs3pyFyQfzu2IezC0nwukX/fXzkHtw+vvpOZ/4Sr1c09eHCJpx6
 T2Z8KyUWrvCeT6+J3IWum58VZVGf2l5yg84AyGSUyMiFZ28aGrgguqHVOaXmCFcwrLz8
 Ec9g==
X-Gm-Message-State: AOJu0Yznw+FGGhWRSjp+0TtnYeDKlpz/0ZO4s6KCbPVdRvQBbzxEAtsp
 wZQTV6fUp8u0povEUR0lnI/eEg==
X-Google-Smtp-Source: AGHT+IHtaZ213PUGXZkGnX90BWbqjDMrkfbkDf/ooXl+i+v3udxDyEhmDAn0ix2dM56js5oE7KgrWg==
X-Received: by 2002:a05:600c:1896:b0:405:3be0:c78d with SMTP id
 x22-20020a05600c189600b004053be0c78dmr5208890wmp.3.1697643881365; 
 Wed, 18 Oct 2023 08:44:41 -0700 (PDT)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 b14-20020a05600c4e0e00b0040607da271asm1963580wmq.31.2023.10.18.08.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 08:44:40 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH v4 0/6] Support discontinuous PMU counters
Date: Wed, 18 Oct 2023 16:39:08 +0100
Message-ID: <20231018154434.17367-1-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x334.google.com
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

v4:

* Added more R-B tags (just missing from 4 & 5)
* Added details on how to calculate mask
* Use custom property for "pmu-num" in order to give deprecation warning 
* Special case a zero value for "pmu-num"

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

 docs/about/deprecated.rst  | 12 +++++++++++
 hw/riscv/virt.c            |  2 +-
 target/riscv/cpu.c         | 31 +++++++++++++++++++++++++++-
 target/riscv/cpu_cfg.h     |  3 ++-
 target/riscv/csr.c         |  5 +++--
 target/riscv/machine.c     |  2 +-
 target/riscv/pmu.c         | 41 +++++++++++++++++++++-----------------
 target/riscv/pmu.h         |  5 +++--
 target/riscv/tcg/tcg-cpu.c | 10 ++++++++--
 9 files changed, 83 insertions(+), 28 deletions(-)

-- 
2.41.0


