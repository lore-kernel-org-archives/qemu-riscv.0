Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EADE95A91
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 11:28:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpoR8-0006hG-Ux; Mon, 09 Oct 2023 07:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qpoR3-0006Zv-4W
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 07:28:32 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qpoR1-0000OP-8R
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 07:28:28 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-57d086365f7so2573906eaf.0
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 04:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1696850904; x=1697455704; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NmUj66uLSsE0KdjySEtBHBduHxy3GwkU/G2edSmHWZk=;
 b=hPI3JmkQQ87RAqSEcFL6Foksxa48R+RfG5HFIbqLVUvjDVkOZmM8RjxM7BBvhUM/Hf
 0oC3XBaGqKqdxFsL52t21OzWPtNDzRZqF82VRcGdFXglnQgE+AHnAMtkstab0KXERfOT
 9jyhQpr5D3jXkSJhxXa3tPDtPcF632loY6i8R0xcBg0V83TejNtFLbGFZEQ9NWFlBXeK
 tCnRqeYr8o5ZT75L6UWaiMBptcdnaj0Wli4P/c4hpIpncno0Ew3wIRtBgYidoCrzG2Bf
 WNWyvazyFrUkVR+k+kGwewz82MYWiHG69O8ToEOwZVpB10oXcMEEnqTiZNcrlTcIdh41
 PWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696850904; x=1697455704;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NmUj66uLSsE0KdjySEtBHBduHxy3GwkU/G2edSmHWZk=;
 b=cRPzNdkwYDSp8bj5J74s+KkyhC69vkofiH7eGW4/ZL5k7l6GbHvI/T2ugPFyj537/g
 QWNxVi/V/ayIp/bQkR/VHPG7Y2Pv6YG0jcrlMTlT2smVyn33S71dTYfOfGsEEO3Yg/Oe
 XiFidyu/1f7qz5QMg5X1s/KcrbDw+kqC8XIBuhotGCXo/KQ/tVJ+iRHmQa9ay6rESR4Z
 rMqDd8EbWH66lAwj9EHR1GhisLUnug+oOAK/iwBSGW2JIWfpUeHlpT8N91NrWPb7Vmru
 UlJzSnsUnGxibl4YUlFFzuOQJM17GkA4EgfUyNnOB/Ml07c4YR0poOyTbWk1xWXEYVCu
 qgqQ==
X-Gm-Message-State: AOJu0Yxt1wI3X6UMn95IxbE5vNdvis7q2VYDdtj/SCW2EgMoq0fdezVO
 meljqLRBgvXhNRVFvl5JIyV0VA==
X-Google-Smtp-Source: AGHT+IGOZu/kU4O1EPrvNZPWXu4sC6PJ/mFCvaCnkpD1n++JFLik/vhpi6EmIm/s9lHPe6ZKNhAz1A==
X-Received: by 2002:a05:6358:528f:b0:13f:411:c1a9 with SMTP id
 g15-20020a056358528f00b0013f0411c1a9mr20004362rwa.17.1696850904243; 
 Mon, 09 Oct 2023 04:28:24 -0700 (PDT)
Received: from grind.. ([177.94.42.196]) by smtp.gmail.com with ESMTPSA id
 30-20020a17090a001e00b002791d5a3e29sm8830705pja.6.2023.10.09.04.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 04:28:23 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 0/1] riscv: deprecate capital 'Z' CPU properties
Date: Mon,  9 Oct 2023 08:28:16 -0300
Message-ID: <20231009112817.8896-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc30.google.com
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

This second version of the patch fixes a 'with with' typo in the
deprecated.rst document. No other changes made.

Patch already acked.

Changes from v1:
- remove 'with with' from docs/about/deprecated.rst
- v1 link: https://lore.kernel.org/qemu-riscv/20231007171427.1210117-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (1):
  target/riscv: deprecate capital 'Z' CPU properties

 docs/about/deprecated.rst  | 23 ++++++++++++++++++++++
 target/riscv/cpu.c         | 39 +++++++++++++++++++++++++++-----------
 target/riscv/cpu.h         |  1 +
 target/riscv/tcg/tcg-cpu.c | 31 +++++++++++++++++++++++++++++-
 4 files changed, 82 insertions(+), 12 deletions(-)

-- 
2.41.0


