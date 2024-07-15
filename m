Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633E8C3DA59
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 09:05:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sTHdy-0006fZ-4M; Mon, 15 Jul 2024 05:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sTHdw-0006Yg-Ad
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2024 05:05:12 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sTHdp-0007bC-7o
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2024 05:05:12 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-70b702be5e4so1805863b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Jul 2024 02:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1721034302; x=1721639102; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=euMUQoA6pmdSSTynjWf88aNGd2CUj7dK5uGQ85xrAyw=;
 b=UohkUBDurj9CI4s4nrN+jh2w/YULgOZn/+2N7N9TkTTaPy2mz/M0YmxzIogukDlOC7
 VOcqj4x9JfOboiFESLRVSuOH+sZaOV63Ur+Nh9o8OKozpTK6M5wbx4YmYcZXsjKXfzLr
 Yer9QQcL83MCoQeNswGLrXQojLVyfUbWOxlAdmxgSWnf6CSLVgN2gYyljH97XFg2uUjM
 C3Ujbq/l8UZ8UORLxW51E+ibtMobClB9DatcT7LjJfp9cAqGcHZFnH2Cb6ZQLKo/dk1J
 Nt5GdddfBs2u5q2tLwFQBiLfxubZgwKNu7mlJpveYDgLffcs2/gE1Q2j22+fb6EJZLHt
 3MBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721034302; x=1721639102;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=euMUQoA6pmdSSTynjWf88aNGd2CUj7dK5uGQ85xrAyw=;
 b=jIgljRgXA7EGzV9GX9PjyYpuAvgxPG7rSjbIeP8fd2JohX9h8oLmIkg3aAOXNQwhcF
 yZ0YC8XaMIsOYt5mws4ChGqCFLpLB0R0QV2GiK0oneykrZWLtNYtieI+oDoNYd4YVsqP
 zJ7dbEgVJBw2ZPoSaKVHtZL6V0OqFIHciK9TAKz7EcIMv5E+hgTuAkmyC5bldcXiXii0
 a7R6nBAsOoPYdYnIFW4syievhsqZU093z7XDJ4dOd7dp5Cxs8pdxQ/bH3u68L2u8xKv3
 /H5wficpz8jg5vzf2bYEm7oXRZj3ci9VQQ0JgtVNxm+731obMkYUdNd1p2NvCZFToYce
 0CLg==
X-Gm-Message-State: AOJu0YwsmHidaW8jyt1BbiQrZtXmOKObmoS+wkLRFI8B8xCNUSQrXLDU
 ALD1rn51jjwUWo1R3u2Rc2x1YNX5Iuu08P8cVTB95pZiS90hrzab01QwX0cYJtM=
X-Google-Smtp-Source: AGHT+IEppKgtFqTvFVv1EBuRIP5nvpp39DKO6eyhz31qiQOQzoA2x914cJoUBtEtUnFl6o+ubYvk8A==
X-Received: by 2002:a05:6a00:845:b0:705:a7a6:6d11 with SMTP id
 d2e1a72fcca58-70b435ed145mr22812849b3a.24.1721034302459; 
 Mon, 15 Jul 2024 02:05:02 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([179.193.8.43])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ec7ed56sm3826686b3a.125.2024.07.15.02.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 02:05:02 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Conor Dooley <conor@kernel.org>, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2] hw/riscv/virt.c: re-insert and deprecate 'riscv,delegate'
Date: Mon, 15 Jul 2024 06:04:55 -0300
Message-ID: <20240715090455.145888-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Commit b1f1e9dcfa renamed 'riscv,delegate' to 'riscv,delegation' since
it is the correct name as per dt-bindings, and the absence of the
correct name will result in validation fails when dumping the dtb and
using dt-validate.

But this change has a side-effect: every other firmware available that
is AIA capable is using 'riscv,delegate', and it will fault/misbehave if
this property isn't present. The property was added back in QEMU 7.0,
meaning we have 2 years of firmware development using the wrong
property.

Re-introducing 'riscv,delegate' while keeping 'riscv,delegation' allows
older firmwares to keep booting with the 'virt' machine.
'riscv,delegate' is then marked for future deprecation with its use
being discouraged from now on.

Cc: Conor Dooley <conor@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>
Fixes: b1f1e9dcfa ("hw/riscv/virt.c: aplic DT: rename prop to 'riscv, delegation'")
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

v2:
 - changed commit msg to remove the 'dt-validate won't complain about
   it' bit since that was incorrect.

 docs/about/deprecated.rst | 11 +++++++++++
 hw/riscv/virt.c           |  9 +++++++++
 2 files changed, 20 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 20b7a17cf0..88f0f03786 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -479,6 +479,17 @@ versions, aliases will point to newer CPU model versions
 depending on the machine type, so management software must
 resolve CPU model aliases before starting a virtual machine.
 
+RISC-V "virt" board "riscv,delegate" DT property (since 9.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The "riscv,delegate" DT property was added in QEMU 7.0 as part of
+the AIA APLIC support.  The property changed name during the review
+process in Linux and the correct name ended up being
+"riscv,delegation".  Changing the DT property name will break all
+available firmwares that are using the current (wrong) name.  The
+property is kept as is in 9.1, together with "riscv,delegation", to
+give more time for firmware developers to change their code.
+
 Migration
 ---------
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index bc0893e087..9981e0f6c9 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -651,6 +651,15 @@ static void create_fdt_one_aplic(RISCVVirtState *s, int socket,
         qemu_fdt_setprop_cells(ms->fdt, aplic_name, "riscv,delegation",
                                aplic_child_phandle, 0x1,
                                VIRT_IRQCHIP_NUM_SOURCES);
+        /*
+         * DEPRECATED_9.1: Compat property kept temporarily
+         * to allow old firmwares to work with AIA. Do *not*
+         * use 'riscv,delegate' in new code: use
+         * 'riscv,delegation' instead.
+         */
+        qemu_fdt_setprop_cells(ms->fdt, aplic_name, "riscv,delegate",
+                               aplic_child_phandle, 0x1,
+                               VIRT_IRQCHIP_NUM_SOURCES);
     }
 
     riscv_socket_fdt_write_id(ms, aplic_name, socket);
-- 
2.45.2


