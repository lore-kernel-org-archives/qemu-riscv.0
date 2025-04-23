Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E80C369CB
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 11:06:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u7XwG-0004LF-7z; Wed, 23 Apr 2025 07:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u7XwE-0004L2-7x
 for qemu-riscv@nongnu.org; Wed, 23 Apr 2025 07:06:46 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u7XwB-0000Jx-Lx
 for qemu-riscv@nongnu.org; Wed, 23 Apr 2025 07:06:45 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-22da3b26532so6284465ad.0
 for <qemu-riscv@nongnu.org>; Wed, 23 Apr 2025 04:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745406400; x=1746011200; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+iZUrpG1ItWExXJQX6ZNuv0H4qnbkVqriNVQxExwrvA=;
 b=Qi8jbuzDS5KVpqRn0Y9+fajJ9Up3/yYPKTf44jZkmhuyQWMWniIYe9RJPL78xP+C2Q
 K07NZirZ8YNCtODy6g/Bmb7NWSN32NTJMEgFu3f5vVKA1yGJYJK9juBxMoD3vhzApuik
 SHYMnyV5X9oEF/z2LqX8vKCLkiaeuAWRJumfC2G1fFQdVlNY2GavBxeCUDp6VbiMAbQH
 HYAxK2j9KDlLfh+M4WV+4D2v7d2cM4FkEmNgucuuyXepGI7iiB7OLKhBoucPVm5TWPeC
 nPrZTdAPOnaCQ/N51sKVkL+8nyVJcjMbeqtv2T5J3ndBpybfBbj0Q7sUuR0ANl9vnuvM
 dYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745406400; x=1746011200;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+iZUrpG1ItWExXJQX6ZNuv0H4qnbkVqriNVQxExwrvA=;
 b=Ca4kXLAow/Ta4ud18FIArIsR26BIiEjKBrv9ui8wzM/EvIzG3vXZEeZ8PpimqXGTIr
 sNB0dOuZtILOr+58Vg4O7Ankke2bB7migSgM4r/daU+mMiO6ENSXowooAjcDHPoYGwKQ
 8iffCsewDFj/DwyUqn4To4IeV5VP7YPA8jgX5LOeiWdxOrBqxNy8OgLgAlEcp3SpEKxs
 2YoYJ4dOaUpW2HDBowE/FNbWMH6Acv1fxLwxmFM9u9mHVGG7TJn5/nf3roW9FwBj/WrQ
 qj9/bzXGYGGLFn4lZeiCCd2rzTV8hJPCxK1hIV+PM9vBgY0fAf6y3oK0QHSGPa1l9O2m
 aAWQ==
X-Gm-Message-State: AOJu0YxmoDVPScx24lNgyCecoOz1ZcdlbN976WmbeNothX/bAxSSTB/E
 nWAEFNVNALvWcMg2NOVnmVOcmp7xrJMln4O0ESXB7Qi+AhdWhyJMe0m+/q0+myg=
X-Gm-Gg: ASbGnctLz5RshgYu5wcoEGMpWHgO6gvj4PES2WQ1DZ9UMnxmhnD15Fy8OABPtu1UIN+
 ZbhP3m/MrjZBUaehE5/nOKL3GFSIW3tS66GBDNV2LFYoSlQ2drDBtLx6cOgCHab3wX/1A8mAndY
 eBDNL/qjzOK8sPT0YQ8HqdbTugyJejgEpodO59CSXIRMXShNg8J/zgAX14d3WImwcYSHMe1xdQd
 UmooEQLjirKMVtKqa8Ejiqf/nvezPdXJdvj/vb3WEpNOKVjlotr95mbeEfXiNo5Dj5+YFiQ0rML
 EqfbU+dCiCS5v418tThrCdsK/AQZ5vG9gXulwfLQ0ipCIb2g6HSW38KhQ9LIcCk=
X-Google-Smtp-Source: AGHT+IEaMffSM8rwT2vLvhFPmT3GtiPmXlr8Wpf0bO8qSCIECCxTIHMCzhHd59ekFzMnnJ/Hp43LIA==
X-Received: by 2002:a17:902:f707:b0:223:4d7e:e52c with SMTP id
 d9443c01a7336-22c53566f1cmr311781275ad.5.1745406400560; 
 Wed, 23 Apr 2025 04:06:40 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f0:bcc0:89f4:3b90:a265:963d:8357])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50fdf3b1sm101509895ad.248.2025.04.23.04.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 04:06:40 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/9] hw/riscv/virt.c: memmap usage cleanup
Date: Wed, 23 Apr 2025 08:06:21 -0300
Message-ID: <20250423110630.2249904-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x629.google.com
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

I had this on my backlog and decided to get it out of the way.

We have a lot of 'memmap' uses in virt that aren't made via s->memmap.
In fact most of the accesses are done via the static array virt_memmap
directly. Some fdt functions are using it via an extra argument, which
is unneeded since we can access it directly or via s->memmap.

This current state of affairs will hurt us in the long run when we
decide to version the 'virt' board. We might have multiple memmaps for
each version and then we'll have to deal with all these static
references to a specific memmap.  Using s->memmap right now will make
our lives easier in the future.

Aside from a couple of patches the changes are rather trivial. Patch 9
is a change I decided to make after noticing the amount of 'long' casts
we have when formating a fdt string.


Patches based on alistair/riscv-to-apply.next.

Daniel Henrique Barboza (9):
  hw/riscv/virt.c: enforce s->memmap use in machine_init()
  hw/riscv/virt.c: remove trivial virt_memmap references
  hw/riscv/virt.c: use s->memmap in virt_machine_done()
  hw/riscv/virt.c: add 'base' arg in create_fw_cfg()
  hw/riscv/virt.c: use s->memmap in create_fdt() path
  hw/riscv/virt.c: use s->memmap in create_fdt_sockets() path
  hw/riscv/virt.c: use s->memmap in create_fdt_virtio()
  hw/riscv/virt.c: use s->memmap in finalize_fdt() functions
  hw/riscv/virt.c: remove 'long' casts in fmt strings

 hw/riscv/virt.c | 269 +++++++++++++++++++++++++-----------------------
 1 file changed, 138 insertions(+), 131 deletions(-)

-- 
2.49.0


