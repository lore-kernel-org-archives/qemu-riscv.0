Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35451C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 05:21:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rDHev-0003K9-0S; Wed, 13 Dec 2023 00:19:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rDHes-0003JY-VD
 for qemu-riscv@nongnu.org; Wed, 13 Dec 2023 00:19:46 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rDHer-0002WI-9s
 for qemu-riscv@nongnu.org; Wed, 13 Dec 2023 00:19:46 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5d33574f64eso66221197b3.3
 for <qemu-riscv@nongnu.org>; Tue, 12 Dec 2023 21:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702444784; x=1703049584;
 darn=nongnu.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BDZ8jZutIMtJlsViReu5YTppEsrOhcVzMzQHGoLlyE4=;
 b=UC1GGo6W5P07enSTf2yImsB9xitEw0xHwE0liS/9L5JNR+DEzoa5l3j6fLGW2C6W0r
 KEddnSXsLY7pw3j72xPG2+X5tSJGd+r56zQGWk8pmvqJbyRw3usE5WKlCjxOcvP+ENXN
 y5kupOEwZblZHfU+UIxPRNgSCdIqz2YCBQrUvzjK+47+RsieVkEuP5xnBcJGkWtZZs2P
 GJzOMJI6lLJI9rncLE+g0hWZlFvFawzQr8B8shczRtkozYWdTUHdsM2aIdWN1HhtSs0c
 TIJOeYmzPfQogIESmtC9a2lVzjCfebb/qbVgNl9nBZQuvkXBxvyds7cVKtVmrQdXiQso
 /HRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702444784; x=1703049584;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BDZ8jZutIMtJlsViReu5YTppEsrOhcVzMzQHGoLlyE4=;
 b=QTeoTioSfDry9m+rnUTeTZw76Xi5HKXLInIQqgHOTRfY6GdiRGkCjV7RMafvepX3W7
 gK4Vn35SKWj5vJj49BO++5DaUsCS8E3HXPEqaUNGHuhybDyIGx0T4lSirPgRvwRKl51B
 EDv7o1sszFE679/EJnvMHgqFuhWJzqZQ04YZJHV2hTLYKtiBXyxkAjprlhJ3KKN4Mwsu
 oACJUZjJQv27luxGYR8F+tf0MmZ1wQaDPkgioHf7GAsGcOnT+swUzXGHsVZnEBuw5UxF
 NokHPbSl4ZUvkhx2JSFEILESKiVvepSAjQIFHMNCjOeRrv1UShj8zmSvazPM5N/Z9cIH
 t3Cg==
X-Gm-Message-State: AOJu0YzjhA0inHh9IPY0rBpb0baBxaAm9Pd0SHRsqEhHuM7Yd0EI/QGC
 gX5S74BVejCwEUj3tukWazqMvA==
X-Google-Smtp-Source: AGHT+IFbM++G/MiNLOcJ3LDKlIw1vPpiTTsg3KUdPOcBbPZFYsp8IQep/p01VH+FJknGUqxpZha7yg==
X-Received: by 2002:a0d:ccce:0:b0:5d7:1940:b39d with SMTP id
 o197-20020a0dccce000000b005d71940b39dmr6440161ywd.105.1702444783724; 
 Tue, 12 Dec 2023 21:19:43 -0800 (PST)
Received: from localhost ([157.82.205.15]) by smtp.gmail.com with UTF8SMTPSA id
 b8-20020a170903228800b001d052d1aaf2sm9446438plh.101.2023.12.12.21.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 21:19:43 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v7 0/4] gdbstub and TCG plugin improvements
Date: Wed, 13 Dec 2023 14:19:28 +0900
Message-Id: <20231213-riscv-v7-0-a760156a337f@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOA+eWUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHUUlJIzE
 vPSU3UzU4B8JSMDI2NDI0Nj3aLM4uQy3bTkZEszEwNLC7PkNCWg2oKi1LTMCrA50bG1tQAquOi
 hVwAAAA==
To: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, 
 Aleksandr Anenkov <a.anenkov@yadro.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.12.4
Received-SPF: none client-ip=2607:f8b0:4864:20::1135;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This series extracts fixes and refactorings that can be applied
independently from "[PATCH v9 00/23] plugins: Allow to read registers".

The patch "target/riscv: Move MISA limits to class" was replaced with
patch "target/riscv: Move misa_mxl_max to class" since I found instances
may have different misa_ext_mask.

V6 -> V7:
  Rebased.

V5 -> V6:
  Added patch "default-configs: Add TARGET_XML_FILES definition".
  Rebased.

V4 -> V5:
  Added patch "hw/riscv: Use misa_mxl instead of misa_mxl_max".

V3 -> V4:
  Added patch "gdbstub: Check if gdb_regs is NULL".

V2 -> V3:
  Restored patch sets from the previous version.
  Rebased to commit 800485762e6564e04e2ab315132d477069562d91.

V1 -> V2:
  Added patch "target/riscv: Do not allow MXL_RV32 for TARGET_RISCV64".
  Added patch "target/riscv: Initialize gdb_core_xml_file only once".
  Dropped patch "target/riscv: Remove misa_mxl validation".
  Dropped patch "target/riscv: Move misa_mxl_max to class".
  Dropped patch "target/riscv: Validate misa_mxl_max only once".

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Akihiko Odaki (4):
      hw/riscv: Use misa_mxl instead of misa_mxl_max
      target/riscv: Remove misa_mxl validation
      target/riscv: Move misa_mxl_max to class
      target/riscv: Validate misa_mxl_max only once

 target/riscv/cpu.h         |   4 +-
 hw/riscv/boot.c            |   2 +-
 target/riscv/cpu.c         | 139 ++++++++++++++++++++++++++-------------------
 target/riscv/gdbstub.c     |  12 ++--
 target/riscv/kvm/kvm-cpu.c |  10 ++--
 target/riscv/machine.c     |   7 +--
 target/riscv/tcg/tcg-cpu.c |  44 ++------------
 target/riscv/translate.c   |   3 +-
 8 files changed, 109 insertions(+), 112 deletions(-)
---
base-commit: 9c74490bff6c8886a922008d0c9ce6cae70dd17e
change-id: 20231213-riscv-fcc9640986cf

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>


