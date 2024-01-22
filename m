Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706D6C46CD2
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 22:15:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rS2a0-0004nL-R5; Mon, 22 Jan 2024 17:15:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rS2Zv-0004m7-PG
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 17:15:41 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rS2Zt-0005tO-71
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 17:15:39 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6dbe3fc1421so736590b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 14:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705961735; x=1706566535; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/8mrrojUFIXViIyax3XRM0xJu20LN1yz7kE9Ge+ZwVc=;
 b=OMR2MqcVXeonmMeD4VJ1cylHi6kGFKd9EEYBXeS4IzkmhykVfKbwAnboylf3OW9HkZ
 W2XDZb8frhX8lldTsXzgSa2qMEukRQiTz5V5lTtriZEPAq8MN/XDEB39+4Ta3jLYSvPf
 fOcovRm6oQbA6JGd+mYyhnSEIaRtvQ4eXKm7HF57lu6JfN0brys99uACTfaHlGKyh/eF
 tv2PO7wstlF08lGQb457dtsscs3dAtl9dO8kZ8kfbUMcm1wY1iIZNuZeCZHaz590He4l
 pGNrGk9b5XU24pAq2iLXeb3+Dem7dA/uXxteiLEWS6tVT11eaPgGhBXT/1HG44+tk+wy
 gTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705961735; x=1706566535;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/8mrrojUFIXViIyax3XRM0xJu20LN1yz7kE9Ge+ZwVc=;
 b=QhDFZm8x0YFGYVntn7cel06URzElWz1tDpHDW4duGclsEh0sR5aaGkIeDJBTL7a0mt
 Bj7INCyuG232UemOi7Y0QJx64KQ/hleB7GDUpqAN3+39KIeWjqy0rgQPnKnm0wd0ueL7
 L5Q0NE0YNi7vAYdr18LU5IP+oB58yUVbyKmKBZq6Ly+XSwdeaS3mbfWM44JurYCBcq89
 vU9N53V2A0AIuMNy+N+Hk/tQNYoYdRZIbiPKaxP3O/RJvEBufcwgybQYJfYX0LBEf4vo
 V1hquwTGzzahrPWyHLzP4XtHPsIg1hHR3+rAJTpBC213NEXS1Gy8KYCD+9duCZOtL+kL
 NSYA==
X-Gm-Message-State: AOJu0Yx6++SpKBPPwPpszbbkBqcuqMyh3YDYtd8rNf6yzuT98JiA2G10
 8ViajvLXUXErd+lK/VLYldUuaQw2UsRCA7dGO711SXGddjwfKRekCqIxKrYLDiY=
X-Google-Smtp-Source: AGHT+IEsSvt8iUfv8UY72ZhesyuUQt+ymEWn0hwaIrvvkVfabBZfes+3Glxg3ay4ot4vOcpCkMy0ow==
X-Received: by 2002:a17:902:b283:b0:1d4:e011:8f2a with SMTP id
 u3-20020a170902b28300b001d4e0118f2amr2772615plr.67.1705961735330; 
 Mon, 22 Jan 2024 14:15:35 -0800 (PST)
Received: from grind.. ([152.234.127.94]) by smtp.gmail.com with ESMTPSA id
 kr8-20020a170903080800b001d7338977e6sm4029104plb.223.2024.01.22.14.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 14:15:34 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/7] hw/riscv: fix leak, add more g_autofree
Date: Mon, 22 Jan 2024 19:15:22 -0300
Message-ID: <20240122221529.86562-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42b.google.com
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

First patch fixes a leak found when using Valgrind. The root cause is a
missing g_free() in a string. 

In fact, I found while doing reviews that we keep repeating the same
pattern:

====
char *name;
name = g_strdup_printf(...);
(...)
g_free(name);
====

With this in mind, I ended up making this rather trivial series to
introduce more string/array autocleaning in the 'virt' machine code. The
advantage of doing 'g_autofree' is that we'll guarantee that we'll clean
ourselves up when the variable goes out of scope, avoiding leaks like
the one patch 1 fixes. We want to enforce this autoclean style in
reviews, and for that we need to get rid of at least some of the uses we
do it right now.

I didn't bother changing the 'spike' and the 'sifive' boards for now
because the bulk of new patches is done on top of the 'virt' machine,
so it's more important to tidy this board first.


Daniel Henrique Barboza (7):
  hw/riscv/virt-acpi-build.c: fix leak in build_rhct()
  hw/riscv/numa.c: use g_autofree in socket_fdt_write_distance_matrix()
  hw/riscv/virt.c: use g_autofree in create_fdt_socket_cpus()
  hw/riscv/virt.c: use g_autofree in create_fdt_sockets()
  hw/riscv/virt.c: use g_autofree in create_fdt_virtio()
  hw/riscv/virt.c: use g_autofree in virt_machine_init()
  hw/riscv/virt.c: use g_autofree in create_fdt_*

 hw/riscv/numa.c            |   4 +-
 hw/riscv/virt-acpi-build.c |   2 +-
 hw/riscv/virt.c            | 109 ++++++++++++-------------------------
 3 files changed, 37 insertions(+), 78 deletions(-)

-- 
2.43.0


