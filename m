Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F3BC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 23:08:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLtGI-0002Cs-2O; Fri, 05 Jan 2024 18:05:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rLtGH-0002CX-60
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 18:05:57 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rLtGF-0002F6-DT
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 18:05:56 -0500
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6d9b267007fso86266b3a.3
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 15:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704495953; x=1705100753; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eCmswZa7Cup2vkyPOcWUoXutKeEtjgEKyXEdxxyULhE=;
 b=EQyZJop/ke0aySmDTWtpaalgePf91exeo+yhMnkaXyly0W9cow5nK2/0w6T1LyRkHW
 4BJfuvLCSbiiS519mLS3y776UZdZNPG94y5vq8R5+BOBd0/itZlhefgBhjhETpuag2ne
 Agy2hSQMOpBxp/ubQNwFfnBnn/fKuEBLGeLBoxP8T9Sn71+U3Lqxos+ijCE4vuYmnpVB
 L55GDVG/dzfijb2FgaSQyRpnvG5prFSeANaRxcbXTYqd3AXO5EKH8lzwjBdczGVG5NPh
 F0O/M4YbMHSHucsejxegvFkU6kQOEMP/QKuf6NVB78b0XcfMBlAUq5/xnjjiW7B/XkIf
 TuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704495953; x=1705100753;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eCmswZa7Cup2vkyPOcWUoXutKeEtjgEKyXEdxxyULhE=;
 b=He+KO4q0ktZhiNXzVVxuAD8JaZ6p/b8tMrfoxp3iLlk5bfgTVqcbb18GyY17ngv0YW
 xxwiC+lbeBkg7Awo4AgsHA9A1BYPyBL6z7LMQGm4qeJxyTnpwj2guWBbUsXcrRFQW20B
 cMZPmpySXtCld9ALNIiHJsRFpAqGqB6NiLFqT4zmF+K7S/ApQ7QqcUduifxaBTgKqlYJ
 mFTC/lVM1szmNoL5h1sTApqtlOchacAGW8Cxtk1nACvxaV0riRQv15gq5APUx3RZitoi
 CLXWNbsybKb6WML2RlW8hBKLuJYWP2Ai3QzXnmicAsR9HGnaljaXW+mQiX9TbryD4XKR
 DF/A==
X-Gm-Message-State: AOJu0YxLU+c4KiQKnKkqCRtl2KQhE9iiU1fY8Ir7Cs7xKrA1ctbO3D3M
 C5XcdC9qJIgmS99UqKt99dy8jjTTqWCebA==
X-Google-Smtp-Source: AGHT+IFn8zyZIEKmZlqUsykuc7xtinL0hsUsxCRCjfCaCYP9/+RZjiVmX/SZnGOawiJ7Bir8eGx1ig==
X-Received: by 2002:a05:6a00:2d8f:b0:6d9:8ae1:7186 with SMTP id
 fb15-20020a056a002d8f00b006d98ae17186mr66388pfb.68.1704495953072; 
 Fri, 05 Jan 2024 15:05:53 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.127.254])
 by smtp.gmail.com with ESMTPSA id
 r19-20020aa78b93000000b006dacfab07b6sm1849249pfd.121.2024.01.05.15.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 15:05:52 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 00/17] target/riscv: deprecate riscv_cpu_options[]
Date: Fri,  5 Jan 2024 20:05:29 -0300
Message-ID: <20240105230546.265053-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x435.google.com
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

This new version contains changes due to a rebase with current
riscv-to-apply.next, after "[PATCH v13 00/26] riscv: RVA22 profiles
support" was queued.

Most notable change is a new patch (12) that was added to handle
'cbop_blocksize' - zicbop was added by the profile work that just got
queued and was missing from v3.

A wrong 'cbom_blocksize' reference in patch 10 was also fixed.

Patches based on Alistair's riscv-to-apply.next. 

Patches missing acks: 10, 12, 15, 16, 17

Changes from v3:
- patch 10:
  - changed wrong cbom_blocksize ref to cboz_blocksize
- patch 12 (new):
  - move cbop_blocksize to riscv_cpu_properties[]
- v3 link: https://lore.kernel.org/qemu-riscv/20240103174013.147279-1-dbarboza@ventanamicro.com/


Daniel Henrique Barboza (17):
  target/riscv/cpu_cfg.h: remove unused fields
  target/riscv: make riscv_cpu_is_vendor() public
  target/riscv: move 'pmu-mask' and 'pmu-num' to riscv_cpu_properties[]
  target/riscv: move 'mmu' to riscv_cpu_properties[]
  target/riscv: move 'pmp' to riscv_cpu_properties[]
  target/riscv: rework 'priv_spec'
  target/riscv: rework 'vext_spec'
  target/riscv: move 'vlen' to riscv_cpu_properties[]
  target/riscv: move 'elen' to riscv_cpu_properties[]
  target/riscv: create finalize_features() for KVM
  target/riscv: move 'cbom_blocksize' to riscv_cpu_properties[]
  target/riscv: move 'cbop_blocksize' to riscv_cpu_properties[]
  target/riscv: move 'cboz_blocksize' to riscv_cpu_properties[]
  target/riscv: remove riscv_cpu_options[]
  target/riscv/cpu.c: move 'mvendorid' to riscv_cpu_properties[]
  target/riscv/cpu.c: move 'mimpid' to riscv_cpu_properties[]
  target/riscv/cpu.c: move 'marchid' to riscv_cpu_properties[]

 target/riscv/cpu.c           | 755 ++++++++++++++++++++++++++++-------
 target/riscv/cpu.h           |   8 +-
 target/riscv/cpu_cfg.h       |   4 -
 target/riscv/kvm/kvm-cpu.c   |  94 +++--
 target/riscv/kvm/kvm_riscv.h |   1 +
 target/riscv/tcg/tcg-cpu.c   |  63 ---
 6 files changed, 676 insertions(+), 249 deletions(-)

-- 
2.43.0


