Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58106C35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 17:52:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGND4-0002U0-Bl; Thu, 21 Dec 2023 12:51:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGND1-0002TV-TJ
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 12:51:48 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGNCz-0007uK-Mv
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 12:51:47 -0500
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5cd870422c8so621740a12.0
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 09:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703181104; x=1703785904; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NyRmzaKwHApH9j1z664mnPBjPmPdME76kWN5omNMN6c=;
 b=AxOIpReINMxIORHWa1HjjrwndteACGR06PdEzbaM3Py5xxz/v9aD4ksZu2RapKEuLx
 TRn74+KAo03YoSzgn3wCVo2pfS9NBOzdaU4+FNOt3EwFBDs9MiqTaDsLgunZpzhjuqUv
 Mos86p5jAxAEcrcHsfuUq93lk11/+FD8QkhfI7at6EobZgQQn6KPQQQJV6FonN6FSxX2
 JGP1QyQnS7WBdGz6B7qqK9/3n0yojS5dByC1oK6zOhi/uEs3lUwkasIICuLN7cCTEGf4
 2vixImUsPLh/rymQoU3OseAmZxjRBaGuebwqSP1sz3sSgYZaaD0HvudMkzI0GeX1RTjK
 UC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703181104; x=1703785904;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NyRmzaKwHApH9j1z664mnPBjPmPdME76kWN5omNMN6c=;
 b=eCrYsEjR0nr2ysVZ9y4bYtG/W+iPSS965w/8wAa+TQ93MRaTgiibrfTcEPfXJaCoZ2
 XDx6kqsl3ZCVAMItv3SLTwlrhStduZmt+q/6dqruG/8lQ3tSpxT9Si049rXi+KDVXdOA
 AXcHlzrPBWstINWvG5H+4LhUYxIXznkAhWUoiqKXMEbDl57sQLaVInzC17bzNFknIMwh
 Aej55o81mWiiXJqnL2l+qgw/FuYmeUVSwh4sNkcILT67piRHpC/yERliu5lU+kO0WR93
 Vz7yG5tKzIDFapMkWs52tynwWjXx2TjcsfC4Ml5IoawCjx/f00wdTmZ3AWkNkvDnM9Yu
 9CJA==
X-Gm-Message-State: AOJu0YyjxMRbBgAgz17KlfX1l3VV+LbiaNWmg3iuK6TSxD6Drrrx8w7m
 F8gP9HR8Sgg+qlROxhEQwCX9R/DfyyHP+w==
X-Google-Smtp-Source: AGHT+IF3I6EYPwd2jy+wvleHhbycNPXAlHIdWqPaCt1lz5PR38MLgp1v9l569PBdT1YUolPuCFzmzg==
X-Received: by 2002:a05:6a20:3d94:b0:190:d1d2:56ff with SMTP id
 s20-20020a056a203d9400b00190d1d256ffmr30218pzi.88.1703181104022; 
 Thu, 21 Dec 2023 09:51:44 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([179.93.21.205])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a63f50a000000b005b18c53d73csm1806261pgh.16.2023.12.21.09.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 09:51:43 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 00/16] target/riscv: deprecate riscv_cpu_options[]
Date: Thu, 21 Dec 2023 14:51:21 -0300
Message-ID: <20231221175137.497379-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x536.google.com
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

Rob reported a few days ago about vendor properties overrides that we're
having with riscv_cpu_options [1]. At that time I was doing changes in
the 'vlen' and 'elen' properties due to (yet to be sent) changes I'm
making in Vector code. I decided to extend the work I was doing and it
resulted in this cleanup.

As Rob mentioned, the defaults in riscv_cpu_options[] properties will
overwrite settings that comes from cpu_init() due to how the
accelerators are adding them during post_init() time. The KVM driver
does validations in init() time, so it needs to overwrite
riscv_cpu_options[] with its own versions. Vendor CPUs can be changed
via these options because the default constructor does not allow for any
customization. Last, but not the least, we have validations for these
options that are being done by the TCG driver, but should be done in the
common code since it also affects KVM.

The first problem is solved by moving all properties from
riscv_cpu_options[] to riscv_cpu_properties[]. They'll be changed into
class properties, their default values will be initialized earlier, and
any changes in cpu_init() will overwrite them.

The second problem requires changes in the KVM driver. We'll need a
finalize() mechanic, like TCG already has, to validate options during
realize() time. This will relieve the driver from having to re-implement
the setters for each option. 

The third and forth problems can be solved by implementing getters and
setters for these class options. We have a precedent for that - the
machine IDs work this way - but we want to center everything in
riscv_cpu_properties[] for simplicity. We have an example of how this is
done in the pmu-* properties, and we'll do the same for every other
class property.

Another noticeable change made in this series is the removal of the
string properties 'priv_spec' and 'vext_spec'. We'll manipulate strings
as needed but won't store them in cpu->cfg. This will also make it
easier to migrate those properties to bools, like we already do with
satp_mode.

Series based on Alistair's riscv-to-apply.next. It can also be retrieved
via:

https://gitlab.com/danielhb/qemu/-/tree/fix_cpu_opts_v1


[1] https://lore.kernel.org/qemu-riscv/b815ab5fdf33d9b9000c8165d50d000f387a3463.camel@rivosinc.com/


Daniel Henrique Barboza (16):
  target/riscv/cpu_cfg.h: remove user_spec and bext_spec
  target/riscv: move 'pmu-mask' and 'pmu-num' to riscv_cpu_properties[]
  target/riscv: make riscv_cpu_is_generic() public
  target/riscv: move 'mmu' to riscv_cpu_properties[]
  target/riscv: move 'pmp' to riscv_cpu_properties[]
  target/riscv: rework 'priv_spec'
  target/riscv: rework 'vext_spec'
  target/riscv: move 'vlen' to riscv_cpu_properties[]
  target/riscv: move 'elen' to riscv_cpu_properties[]
  target/riscv: create finalize_features() for KVM
  target/riscv: move 'cbom_blocksize' to riscv_cpu_properties[]
  target/riscv: move 'cboz_blocksize' to riscv_cpu_properties[]
  target/riscv: remove riscv_cpu_options[]
  target/riscv/cpu.c: move 'mvendorid' to riscv_cpu_properties[]
  target/riscv/cpu.c: move 'mimpid' to riscv_cpu_properties[]
  target/riscv/cpu.c: move 'marchid' to riscv_cpu_properties[]

 target/riscv/cpu.c           | 582 ++++++++++++++++++++++++++++++-----
 target/riscv/cpu.h           |   7 +-
 target/riscv/cpu_cfg.h       |   4 -
 target/riscv/kvm/kvm-cpu.c   |  94 +++---
 target/riscv/kvm/kvm_riscv.h |   1 +
 target/riscv/tcg/tcg-cpu.c   |  63 ----
 6 files changed, 560 insertions(+), 191 deletions(-)

-- 
2.43.0


