Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF814D58D78
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Nov 2024 18:15:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tFdbS-00017u-CN; Mon, 25 Nov 2024 13:14:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFdbQ-00016v-Qj
 for qemu-riscv@nongnu.org; Mon, 25 Nov 2024 13:14:28 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFdbN-0005Aj-Ut
 for qemu-riscv@nongnu.org; Mon, 25 Nov 2024 13:14:28 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-382423e1f7aso3362611f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 25 Nov 2024 10:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732558464; x=1733163264; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x4OQHtvWJlI5keyr30zc800rGp/vJUHcuq/CHZvm30Q=;
 b=qGwk8AV8BNf403c+GHo4iHuWcpSaJVVeqDZ6jKCnQSeKJqJe2+0X0FbwZNrN5Snjfo
 ILuXgBiLdzsN0vrq/vKVoYOG0atz72LtDnYgXqlg+qOwCVZ1EVEudYWhYSl+wgXVRsfX
 mB68MYBiPtacyxsT7/0GD6ZPV3L/dVAPEBr51qnUjUKZC+UKSUwEgIVGLC/LzrQANBz3
 pJJWVrCXAInZyN0o9KjuF0XSLSV5tEK5jnLjUBkBfElXjz7lDQbsispjq7ueofXxAw8x
 96jGqw6gjB86XMkov6lP8ybZRR+yHfDsife9Z7dmmeeh1eUj/Qte+MtQ/KLi7eXJhd9/
 Jm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732558464; x=1733163264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x4OQHtvWJlI5keyr30zc800rGp/vJUHcuq/CHZvm30Q=;
 b=r9Oy6UgiUu8jUaOT9VRcatBKWP4GuJWLuuGJnLLCZ4QSL5FgPKiJLvc957VQBYaCDJ
 lh14Bs192obAcGYBTunzBnuyzKP11SImsLD4Z1tpOw0eg3TihqlXHm4gnIAvHxB30yh4
 7r2whmhCULgMOD2WZdQnIGVPZgKYiwidoH/5UuziqGxdhS+O93UkrQieMVHbcpTMVDtG
 y5jdsRABWhUi/u5s9dG7gDhS7+Qw3hrs61x/w9igx3wV54fQnRA5kTo/EJ0mISDBLbSK
 mPqzpkozs6udPrYzKrVScYOnDx06viS0TfpR3EzRHg9VhfVC0A7Z4nnFuAsQQKP/3ns5
 R2JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSSSx9z7dT1S9fUqLRbrRCpygygY7zv7r5XEvu50ZDlrRGW4kzPh0P6M57wjKRkkSNLhqzEcCTb5Mk@nongnu.org
X-Gm-Message-State: AOJu0YxoF7R8l5NAj8hlTJDqKu+2wwxJda1+eK4cg629LxWgqwaDyq7g
 /TmNKK22yDYFr4nyR8kXh3OowpmI50x4KCe1hnnqdan96uLKVsdY0qutXv+/zw4=
X-Gm-Gg: ASbGncsjb4KOSVpTgg6JQyFZ2O7gi+RAyKrSZOOuGgbnTDjdt+C8/Q3dLbFXHskY7uu
 MuUklfqqpU6W7HfgtNjvfwXgeJKh7p84OCkJ2IyegQxj64cy5yt1olO0Zhwy/C/mLQeciqQV4wj
 gub13z4Z+8fv4hZ3sbS1b3Qmd5L3MpWQW1RVOQGkrd1+SCZ0yhzx/75YKg+850ybwyZKADFUZJ6
 ctYEOxmXwgyGtY3WGraiQTqP+zWiFzRo0or481bt8wzZqH+nw9u996uqq7/yO6ISA3nXlSp
X-Google-Smtp-Source: AGHT+IG6W96qbhVf76NBP4G4DNq50TBXW8RSZH344y1V4Q6NiYWi2i90hV2EM1RBdalGEBzZMi1BQA==
X-Received: by 2002:a05:6000:1fab:b0:382:4a15:6928 with SMTP id
 ffacd0b85a97d-38260b5715fmr12267551f8f.14.1732558464046; 
 Mon, 25 Nov 2024 10:14:24 -0800 (PST)
Received: from localhost.localdomain ([176.176.170.239])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad60f0sm11036986f8f.22.2024.11.25.10.14.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Nov 2024 10:14:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 0/3] hw/boards: Try to make sense of
 MachineClass::no_sdcard flag
Date: Mon, 25 Nov 2024 19:14:17 +0100
Message-ID: <20241125181420.24424-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Invert MachineClass 'no_sdcard' flag logic and rename it
to 'create_default_sdcard_drive' to make sense of this
default value applied to all machines. No logical change
intended.

Philippe Mathieu-Daudé (3):
  hw/boards: Convert no_sdcard flag to OnOffAuto tri-state
  hw/boards: Explicit no_sdcard=false as ON_OFF_AUTO_OFF
  hw/boards: Rename no_sdcard -> create_default_sdcard_drive

 include/hw/boards.h                      | 2 +-
 hw/alpha/dp264.c                         | 1 +
 hw/arm/aspeed.c                          | 2 ++
 hw/arm/b-l475e-iot01a.c                  | 1 +
 hw/arm/bananapi_m2u.c                    | 1 +
 hw/arm/collie.c                          | 1 +
 hw/arm/cubieboard.c                      | 1 +
 hw/arm/digic_boards.c                    | 1 +
 hw/arm/exynos4_boards.c                  | 2 ++
 hw/arm/fby35.c                           | 1 +
 hw/arm/highbank.c                        | 2 ++
 hw/arm/imx25_pdk.c                       | 1 +
 hw/arm/integratorcp.c                    | 1 +
 hw/arm/kzm.c                             | 1 +
 hw/arm/mcimx6ul-evk.c                    | 1 +
 hw/arm/mcimx7d-sabre.c                   | 1 +
 hw/arm/microbit.c                        | 1 +
 hw/arm/mps2-tz.c                         | 1 +
 hw/arm/mps2.c                            | 1 +
 hw/arm/mps3r.c                           | 1 +
 hw/arm/msf2-som.c                        | 1 +
 hw/arm/musca.c                           | 1 +
 hw/arm/musicpal.c                        | 1 +
 hw/arm/netduino2.c                       | 1 +
 hw/arm/netduinoplus2.c                   | 1 +
 hw/arm/npcm7xx_boards.c                  | 1 +
 hw/arm/olimex-stm32-h405.c               | 1 +
 hw/arm/omap_sx1.c                        | 2 ++
 hw/arm/orangepi.c                        | 1 +
 hw/arm/raspi.c                           | 1 +
 hw/arm/realview.c                        | 4 ++++
 hw/arm/sabrelite.c                       | 1 +
 hw/arm/sbsa-ref.c                        | 1 +
 hw/arm/stellaris.c                       | 2 ++
 hw/arm/stm32vldiscovery.c                | 1 +
 hw/arm/versatilepb.c                     | 2 ++
 hw/arm/vexpress.c                        | 1 +
 hw/arm/virt.c                            | 1 +
 hw/arm/xen-pvh.c                         | 1 +
 hw/arm/xilinx_zynq.c                     | 3 ++-
 hw/arm/xlnx-versal-virt.c                | 1 +
 hw/arm/xlnx-zcu102.c                     | 1 +
 hw/avr/arduino.c                         | 1 +
 hw/core/null-machine.c                   | 2 +-
 hw/hppa/machine.c                        | 2 ++
 hw/i386/pc.c                             | 1 +
 hw/i386/x86.c                            | 1 +
 hw/i386/xen/xen-pvh.c                    | 1 +
 hw/loongarch/virt.c                      | 1 +
 hw/m68k/an5206.c                         | 1 +
 hw/m68k/mcf5208.c                        | 1 +
 hw/m68k/next-cube.c                      | 1 +
 hw/m68k/q800.c                           | 1 +
 hw/m68k/virt.c                           | 1 +
 hw/microblaze/petalogix_ml605_mmu.c      | 1 +
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 1 +
 hw/microblaze/xlnx-zynqmp-pmu.c          | 1 +
 hw/mips/boston.c                         | 1 +
 hw/mips/fuloong2e.c                      | 1 +
 hw/mips/jazz.c                           | 2 ++
 hw/mips/loongson3_virt.c                 | 1 +
 hw/mips/malta.c                          | 1 +
 hw/mips/mipssim.c                        | 1 +
 hw/openrisc/openrisc_sim.c               | 1 +
 hw/openrisc/virt.c                       | 1 +
 hw/ppc/amigaone.c                        | 1 +
 hw/ppc/e500.c                            | 8 ++++++++
 hw/ppc/e500plat.c                        | 1 +
 hw/ppc/mac_newworld.c                    | 1 +
 hw/ppc/mac_oldworld.c                    | 1 +
 hw/ppc/mpc8544ds.c                       | 1 +
 hw/ppc/pegasos2.c                        | 1 +
 hw/ppc/pnv.c                             | 1 +
 hw/ppc/ppc405_boards.c                   | 1 +
 hw/ppc/ppc440_bamboo.c                   | 1 +
 hw/ppc/prep.c                            | 1 +
 hw/ppc/sam460ex.c                        | 1 +
 hw/ppc/spapr.c                           | 1 +
 hw/ppc/virtex_ml507.c                    | 1 +
 hw/remote/machine.c                      | 1 +
 hw/riscv/microchip_pfsoc.c               | 1 +
 hw/riscv/opentitan.c                     | 1 +
 hw/riscv/shakti_c.c                      | 1 +
 hw/riscv/sifive_e.c                      | 1 +
 hw/riscv/sifive_u.c                      | 1 +
 hw/riscv/spike.c                         | 1 +
 hw/riscv/virt.c                          | 1 +
 hw/rx/rx-gdbsim.c                        | 1 +
 hw/s390x/s390-virtio-ccw.c               | 2 +-
 hw/sh4/r2d.c                             | 1 +
 hw/sparc/leon3.c                         | 1 +
 hw/sparc/sun4m.c                         | 1 +
 hw/sparc64/niagara.c                     | 1 +
 hw/sparc64/sun4u.c                       | 2 ++
 hw/tricore/triboard.c                    | 1 +
 hw/tricore/tricore_testboard.c           | 1 +
 hw/xen/xen-pvh-common.c                  | 1 +
 hw/xenpv/xen_machine_pv.c                | 1 +
 hw/xtensa/sim.c                          | 1 +
 hw/xtensa/virt.c                         | 1 +
 hw/xtensa/xtfpga.c                       | 8 ++++++++
 system/vl.c                              | 2 +-
 102 files changed, 129 insertions(+), 5 deletions(-)

-- 
2.45.2


