Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABA4CAC5A5
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 07:49:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v1KF6-0000qP-Gv; Wed, 24 Sep 2025 03:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1v1KF4-0000qA-GR
 for qemu-riscv@nongnu.org; Wed, 24 Sep 2025 03:48:46 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1v1KF1-0007cw-BY
 for qemu-riscv@nongnu.org; Wed, 24 Sep 2025 03:48:46 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7704f3c46ceso6099398b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 24 Sep 2025 00:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1758700119; x=1759304919; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bt6FROfWVPEeXPVJk3keuUb3yGmPAjxGB9eCdrJ47Vs=;
 b=AR6aK6ALuqHb1Bzo3Pwab61xPuXHw/9Y7OzTSHPV5VcXnUw12T9+l5iQ4PpoOCl4at
 IZxeOvY3pvEGC1ZBudsCA3M506huZVrw4I19a5rGxeZZzZEqwoh4umW1F2TBZrgdBUJu
 N5haAF08bxGfkalG8Da0MS/KUx3CHxYipRE50rGut+Dor2t6wtdWnJfs/bGzIBxpsHLO
 jdKZ8gzU7I6tuEYOb5K3yt9n1zBUQVkPQ4zypz9qQCj46H4oWrDWnKHrk+zaSl69y2js
 dQV9XeF8KrWCUMbQo0tIJ+92IRQ64x0U4igROqs5ir016Z9XHBJRSDjpM1q+dchHLCwr
 Nnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758700119; x=1759304919;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bt6FROfWVPEeXPVJk3keuUb3yGmPAjxGB9eCdrJ47Vs=;
 b=H7TcYJpsHzKk7pvlWqitRQslYvBGgvf5uFBf3R6m4NLGLEABBE3WKsnmEEju/bAUMd
 MYWMrXQLAd/vuz8Py9N2yH9YUtHMooPR/7Y56cbR9B8fHjByq3ihTyNSRhx4yO4PnSt9
 M1uBpQWlecRPibasQIuFcrfM0HY94l5qfdBViIxQlrStUqRpom+Jyvp5lYUq9CbvkWsw
 X/oqfqgd4SuuOncRarPx02Ofq1wDW9plHiemEdNQjqK0i6N8cryzwxwT/w6WvniBOQfc
 s0n63SW+VJVEwxbf/4dMcHlk4Dp+gFjRUwN5zfUQ07+A2fclNUnpdZlWPl5ZZjmBnEMb
 jcBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDkuutjHKrqi49GSWiv684Qd4acsApeI4ACn1OMflwWAr5fdszXPefs7ur90eoVnNWBEBF5Eoq3W/p@nongnu.org
X-Gm-Message-State: AOJu0YzSGqZUrQDW4jnAOAJiwSgwJldOsRT8bSRAsnoEuTTBKU7R84S+
 mO/uURNh7Z6+JET1KUJdv6d0X7pEfu6xOh7koeWXNyppQzOuLslU77kr2dPh11chWvE=
X-Gm-Gg: ASbGncu73jPeIhy+kPMti/17FxI6axmpz4OZGxRpuWG1eS73JnRvSS6Z2wYE1nKTorU
 wU0yutWKzF28FyZfenuv+poTl8fijNWEiJdegkGzJve33nPv3ZtdKCoVhkoiQELFl5gB+m1iUI4
 lWVd8lai63a1pjtxjOrllMOqNtgTioQAd8iQaVfqa1sCtQO/z8Qs7Q7pLnVNO6g+O8WNHlQ/qQq
 yIv1NJWuxs/VAwAML570w6tufhCQTsvcf4cWKw+3hQ74CBZBWVX4K0kkdMW+nwpE4FnJ7p572gB
 n2lWJDzSyj0mWbY2ODPBbEIxt+AtypIkT0uS0l8v5BJnI2MDM7E6a/GTVwgfo6Em3ulNC2QKXXV
 +qPMImolv1Ra/QsijGJgzwEq5lCsnYCKNRFj8hkVnmvaN
X-Google-Smtp-Source: AGHT+IElm6viL79BKQVSbOUsKh70z86hI/2kfhje80Chyz3P+lsg2VqTQnGhXh76LFfc1fkQZJWx1w==
X-Received: by 2002:a05:6a20:3d08:b0:2ca:1b5:9d4d with SMTP id
 adf61e73a8af0-2cfd4836d5cmr7731771637.2.1758700119682; 
 Wed, 24 Sep 2025 00:48:39 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b5541f0374csm8778502a12.49.2025.09.24.00.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 00:48:39 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v1 0/3] Minor fixes of RISC-V CFI
Date: Wed, 24 Sep 2025 15:48:15 +0800
Message-ID: <20250924074818.230010-1-jim.shu@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x433.google.com
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

This patch series contains several CFI fixes:
  (1) Fix the mepc in the exception from sspopchk instruction
  (2) Fix the exception type from SSP CSR and ssamoswap instruction

Jim Shu (3):
  target/riscv: Fix the mepc when sspopchk triggers the exception
  target/riscv: Fix SSP CSR error handling in VU/VS mode
  target/riscv: Fix ssamoswap error handling

 target/riscv/csr.c                            |  2 +
 target/riscv/helper.h                         |  5 ++
 target/riscv/insn_trans/trans_rvzicfiss.c.inc |  9 ++++
 target/riscv/op_helper.c                      | 49 +++++++++++++++++++
 4 files changed, 65 insertions(+)

-- 
2.43.0


