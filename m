Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835DEEB8FB0
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 11:28:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeDAM-0004Tp-Sl; Thu, 07 Sep 2023 07:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qeDA7-0004Hc-Qn
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 07:27:04 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1qeD9z-00063f-FZ
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 07:27:02 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31c63cd4ec2so844009f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 04:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1694086012; x=1694690812; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MlEUK+J9E38UXZ/ZpUlBrPwBJQzGbtWVX57ypSwDeSA=;
 b=FmRWaMgigqGKLHEz7cK0mIbW5xKuTX5u9qf8euCAPm6jtZD7zcjCwHBEeYPzpX3wmH
 iQHqf8eJ0Uwy3mcsfhRUt7GM2NQYLJG5b3LaLwGaa4qKhSRWSScGlqmzMO2G4wdtdGsg
 20waaBEOvrH8eUqPdZjxs/ZfwzBj5X0Yz3TKGHeuneTBo6eC/+SzLAp6ISJuD/oSA0K3
 e/045hzJUoCINaA1q3Rd8Jue0/Ql+nS/qsRLHo/eEX9lEAyH2P5SakTzdxBfIJ8fOkfN
 8DywvYuL2+NKoxn8OiOqfHgK9lvG1jgrjduYNiX1nO6JgziVm1HtP+hVu8Ah9ZGks+pB
 l/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694086012; x=1694690812;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MlEUK+J9E38UXZ/ZpUlBrPwBJQzGbtWVX57ypSwDeSA=;
 b=IL62T0F2XkeEJLaikp/y2SfkFj87f9dctnqeetkqyr3cOQW0EdRJ5LtSTkXHGkV4DQ
 kqnRssTZMTaGYa2N9H8mZv+oihOHUrRPEUj4p09wKP36leM1MsOw0DHxt2FiEI6f5pDa
 ioaFCxGvcb1WBZwS8ZRDuGmAIZAl3H29RIhFytdkkcJ1Zec6zUhAwqKfyLBQn2I6f6WK
 XWRGG/wt4SF6Ir9njJ+lqBpJQTzVIyFCaQh+0B1gcjxvn4aawpyVnk2gR04c44j78xi+
 1b4GN1S2zbTaly5TjvukOX6XHZoMDmE2oVWKSlq5TIaRiRNYUsG554mmhLKWY/O8J9NT
 eFsg==
X-Gm-Message-State: AOJu0YyyYcaGp6W9/OcPyUIs+fGiPtsmNYiWQUzoJlbvxGmNDL0TlB6J
 +zvNs82rpsCvFuYARJoNPHcAUg==
X-Google-Smtp-Source: AGHT+IEvSXcouZb2MX2BhBBdTen47+yvDGwFfldIMDH93kfCodPJSU78Qoc2xHl9vgAJE5tgaKFoHA==
X-Received: by 2002:a5d:534c:0:b0:319:71be:9241 with SMTP id
 t12-20020a5d534c000000b0031971be9241mr4757257wrv.25.1694086011648; 
 Thu, 07 Sep 2023 04:26:51 -0700 (PDT)
Received: from chigot-Dell.home ([2a01:cb15:8123:8100:c2c3:52c5:8306:a161])
 by smtp.gmail.com with ESMTPSA id
 y3-20020adfe6c3000000b00317909f9985sm22998755wrm.113.2023.09.07.04.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 04:26:51 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, peter.maydell@linaro.org, alistair23@gmail.com,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH v3 0/5] Risc-V/gdb: replace exit calls with proper shutdown
Date: Thu,  7 Sep 2023 13:26:35 +0200
Message-Id: <20230907112640.292104-1-chigot@adacore.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=chigot@adacore.com; helo=mail-wr1-x436.google.com
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

This series replaces some of the call to exit in hardware used by
Risc-V boards or made when gdb is requested to exit by shutdown
requests. Otherwise, the gdb connection can be abruptly disconnected
resulting in the last gdb packet "Wxx" being not sent.

For the gdbstub modification, gdb_exit calls ensure that the "Wxx"
packet is sent before exiting. However, some features (see
net/vhost-vdpa.c: vhost_vdpa_cleanup for example) are expecting 
that a cleanup is being made before exiting. This, it's probably
safer to follow the same logic here as well.

Difference with v2:
 - Add support to request a shutdown with a specific exit code.
 - Pass the exit code of the main loop to gdb_exit call in qemu_cleanup
 - gdbstub: move the request shutdown in a new new function to avoid
   having to worry about the request having already been sent.

Clément Chigot (5):
  softmmu: add means to pass an exit code when requesting a shutdown
  softmmu: pass the main loop status to gdb "Wxx" packet
  hw/misc/sifive_test.c: replace exit calls with proper shutdown
  hw/char: riscv_htif: replace exit calls with proper shutdown
  gdbstub: replace exit calls with proper shutdown for softmmu

 gdbstub/gdbstub.c          |  5 +++--
 gdbstub/softmmu.c          |  6 ++++++
 gdbstub/user.c             |  6 ++++++
 hw/char/riscv_htif.c       |  5 ++++-
 hw/misc/sifive_test.c      |  9 +++++++--
 include/gdbstub/syscalls.h |  9 +++++++++
 include/sysemu/runstate.h  |  2 ++
 include/sysemu/sysemu.h    |  2 +-
 softmmu/main.c             |  2 +-
 softmmu/runstate.c         | 16 +++++++++++++---
 10 files changed, 52 insertions(+), 10 deletions(-)

-- 
2.25.1


