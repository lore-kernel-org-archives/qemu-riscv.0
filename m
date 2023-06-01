Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92941C7EE23
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 05:01:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4aPP-0004i6-9B; Thu, 01 Jun 2023 00:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q4aPO-0004hx-LW
 for qemu-riscv@nongnu.org; Thu, 01 Jun 2023 00:59:34 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1q4aPN-0006GS-2R
 for qemu-riscv@nongnu.org; Thu, 01 Jun 2023 00:59:34 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-5584f8ec30cso369774eaf.0
 for <qemu-riscv@nongnu.org>; Wed, 31 May 2023 21:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685595571; x=1688187571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oUp0Hkzi0ARsGZ5vAJModrlI2+NQ/dPTpIk4U6SEfYA=;
 b=FOYIwsAzcPtI4cc9Rl3YwU+KWJ+shgFScyAePagcPF4VarTqbmusT0LfYdD6Gg6EoX
 mwAPtJF23rBSYvSzrNXMgAnD/tiQSCiPxI9Y/XwQ+5ua08iIu1TzzniossdCfykW/QRZ
 d7jn+5IvRCF1QtFQ/7wDPARiWetFGQmlt/knnA82co0XwCG4vfdGRcCkZ11yIuVAsEda
 u95EW+CGnjIPuILTof7mga2fPK9346dBK5eAoeKnp6NyFiHaWUsZyvuzP4V4dCZJQDXZ
 wbNyHjq0504sJ9872QVODwwVC1d49GB7CjHIwSxep4KMOLErRqyCU688oLam4FwuP9eG
 5m3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685595571; x=1688187571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oUp0Hkzi0ARsGZ5vAJModrlI2+NQ/dPTpIk4U6SEfYA=;
 b=X/MaAZxCBmARQDATJRuR63tLUnmHmfOX+FKofUwkryWdxTOwhnDZC48OK89fJrWMUf
 vpgCAxE1C6ov+5a4wE4blNhNm0UyAwiEt2KALhh6Dg31TTZzBoZjyUhnSRdu2gOWIFLn
 pi/feEQzCDXZZouN9RAQsvew47ZW42CQeaqLsP406ve5xYRC4j7/lYFOuKVUs4j4NwM6
 LLdTkKVk4FHgqjkL6nJWjwN+OChP4zYLPdxVVNMeMjL8mN6W3AZ4tuQhK/F+eK2vMDNf
 JpdsRhpIjB0TijbP+oAcoAWCOrNyEmgAKGYIF6yhzF8tXoWxx2a2H2zJDW9DJj4ID6pS
 Ftjw==
X-Gm-Message-State: AC+VfDx5O6irK7zb6Qz2bE+yiY4ma0MjpfHyTLyzQioJxbsl5LzI23wP
 8I45Oo1yE2bAZE59JvLIcIJwuPLsHkMMUERA4DW2JA==
X-Google-Smtp-Source: ACHHUZ4RyYaSL3n9YE+qi6jw+L4Za0LHXhPxtaRgwUim6/Hm5RmboIdxZpcssZVNNMme7vNHkjTe/w==
X-Received: by 2002:a4a:97ed:0:b0:555:2ba8:a75b with SMTP id
 x42-20020a4a97ed000000b005552ba8a75bmr4537638ooi.1.1685595571577; 
 Wed, 31 May 2023 21:59:31 -0700 (PDT)
Received: from sunil-laptop.dc1.ventanamicro.com ([106.51.83.242])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a4ab648000000b0055530a42ce3sm3985608ooo.34.2023.05.31.21.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 21:59:31 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 3/3] docs/system: riscv: Add pflash usage details
Date: Thu,  1 Jun 2023 10:29:10 +0530
Message-Id: <20230601045910.18646-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230601045910.18646-1-sunilvl@ventanamicro.com>
References: <20230601045910.18646-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oo1-xc32.google.com
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

pflash devices can be used in virt machine for different
purposes like for ROM code or S-mode FW payload. Add a
section in the documentation on how to use pflash devices
for different purposes.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/system/riscv/virt.rst | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index 4b16e41d7f..b33f45e5b3 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -53,6 +53,37 @@ with the default OpenSBI firmware image as the -bios. It also supports
 the recommended RISC-V bootflow: U-Boot SPL (M-mode) loads OpenSBI fw_dynamic
 firmware and U-Boot proper (S-mode), using the standard -bios functionality.
 
+Using flash devices
+-------------------
+
+By default, the first flash device (pflash0) is expected to contain
+S-mode firmware code. It can be configured as read-only, with the
+second flash device (pflash1) available to store configuration data.
+
+For example, booting edk2 looks like
+
+.. code-block:: bash
+
+  $ qemu-system-riscv64 \
+     -blockdev node-name=pflash0,driver=file,read-only=on,filename=<edk2_code> \
+     -blockdev node-name=pflash1,driver=file,filename=<edk2_vars> \
+     -M virt,pflash0=pflash0,pflash1=pflash1 \
+     ... other args ....
+
+For TCG guests only, it is also possible to boot M-mode firmware from
+the first flash device (pflash0) by additionally passing ``-bios
+none``, as in
+
+.. code-block:: bash
+
+  $ qemu-system-riscv64 \
+     -bios none \
+     -blockdev node-name=pflash0,driver=file,read-only=on,filename=<m_mode_code> \
+     -M virt,pflash0=pflash0 \
+     ... other args ....
+
+Firmware images used for pflash must be exactly 32 MiB in size.
+
 Machine-specific options
 ------------------------
 
-- 
2.34.1


