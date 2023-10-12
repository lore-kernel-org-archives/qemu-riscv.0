Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4FECDB47E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 16:46:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqypF-0000I3-5P; Thu, 12 Oct 2023 12:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qqypD-0000EN-0D
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 12:46:15 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qqypB-0004ZE-5I
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 12:46:14 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-69101022969so1061143b3a.3
 for <qemu-riscv@nongnu.org>; Thu, 12 Oct 2023 09:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697129171; x=1697733971; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MlK3zb7yGg87vZz/T83GgWOBD0YL9Ahtx9UtdcO1MPY=;
 b=jJc8xcYtYXb8PsiBEgs5I9kiuKcEZ9fV2iG3xnVP18FyFHLOU5YKToSLfU3GNn1Pfl
 7pLR8nbBnUjXszhRojyyAyrUIqJysKzIW1fJcuuAlzMlQ4RH8TxWpXYMNk4o/E0a6XGA
 eJvRcMRNgAZDJJ+W+f6XVAVWV0Qdm5dhhW0sRd7F4C+pA7KCBuC42bHE4tvwnyEi/iwm
 UuwQWUVgcfLrF32Rb5KRDt4R0Pe29PlpxapT4SFAhEkIA3H++Xn5awAoSxRi/c8qg03b
 4orU8iTi9Cjt/6wMTEBNeHhKfJCsLAjKVY2pXUG4d3Eaz+r3UVcIA7LP2KSfcCy7A8Xi
 dEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697129171; x=1697733971;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MlK3zb7yGg87vZz/T83GgWOBD0YL9Ahtx9UtdcO1MPY=;
 b=BcfSdcOvqD6Vnn0MpH1tmdVj9srGwepsjboIuveBcIX6xM34AfWun8QW+AjWx5Qmxw
 gNsxowcnXEzqAB+me2N+NQtBAO3Lj3vohzyrO2eepGnpOw+UJ4r2xgmOLraRnil3QtS0
 +2b+iRbZUwXhcXM7o9Yeo07dgg7TiaASCli4DGhDsqfNcKInVFMcawgCYSHiluQDsej0
 YR2hoWl7LJGs0Ta1zD3UBGAL/sdiyWYltudermji8HK6I62wlxZTxPjrRC30zu6nFrDB
 IoMC5om+xCltl/xHCTuPTcf6VrhUPlOzkMmnlQStfjrSvtMdAXXAm6FLORM5EgKI4k6h
 WcSw==
X-Gm-Message-State: AOJu0YxkM97Mdn1vL1oNRZW0Gn96z2yb3ZdCSLTsA21W65igZxTVwpQX
 kwItFCF9vyLpXTy3XosF/5dBXw==
X-Google-Smtp-Source: AGHT+IGSjK51ba6kjQ+dOh/lZ2O4Zko4GwOHnY/5vTXrhIWtuUBTjjdtQ/C3W5LikTN18CSBCCmFYQ==
X-Received: by 2002:a05:6a00:198f:b0:68f:a661:d037 with SMTP id
 d15-20020a056a00198f00b0068fa661d037mr27082568pfl.3.1697129171313; 
 Thu, 12 Oct 2023 09:46:11 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.94.42.196])
 by smtp.gmail.com with ESMTPSA id
 g5-20020aa78185000000b0068feb378b89sm12416805pfi.171.2023.10.12.09.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 09:46:10 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/4] target/riscv: rename ext_i* to ext_zi*
Date: Thu, 12 Oct 2023 13:46:00 -0300
Message-ID: <20231012164604.398496-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x435.google.com
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

This series renames the following internal extensions flags:

ext_ifencei, ext_icsr, ext_icbom, ext_icboz

To add a leading 'z':

ext_zifencei, ext_zicsr, ext_zicbom, ext_zicboz

This was proposed by Andrew Jones. The motivation, in his own words:

"I'd prefer we name the booleans with their 'z' to improve grepping.
When one wants to search for uses of zifencei, I imagine they're more
likely to do 'grep -i zifencei' than 'grep -i ifencei', particularly
because the 's' is maintained for S extensions. "


Aside from that, these are the only 4 Z-extension flags that don't use a
leading 'z' in their name, so there's also the benefit of making
everything equal.



Daniel Henrique Barboza (4):
  target/riscv: rename ext_ifencei to ext_zifencei
  target/riscv: rename ext_icsr to ext_zicsr
  target/riscv: rename ext_icbom to ext_zicbom
  target/riscv: rename ext_icboz to ext_zicboz

 hw/riscv/boot.c                             |  2 +-
 hw/riscv/virt.c                             |  4 +-
 target/riscv/cpu.c                          | 56 ++++++++++-----------
 target/riscv/cpu_cfg.h                      |  8 +--
 target/riscv/csr.c                          |  2 +-
 target/riscv/gdbstub.c                      |  2 +-
 target/riscv/insn_trans/trans_rvi.c.inc     |  2 +-
 target/riscv/insn_trans/trans_rvzicbo.c.inc | 16 +++---
 target/riscv/kvm/kvm-cpu.c                  | 12 ++---
 target/riscv/tcg/tcg-cpu.c                  | 20 ++++----
 10 files changed, 62 insertions(+), 62 deletions(-)

-- 
2.41.0


