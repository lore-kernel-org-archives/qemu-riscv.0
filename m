Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBAFC77B7F
	for <qemu-riscv@archiver.kernel.org>; Sat, 20 May 2023 05:47:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q0FPN-0007KN-2e; Sat, 20 May 2023 01:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0FP8-0007DY-6w
 for qemu-riscv@nongnu.org; Sat, 20 May 2023 01:45:22 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0FP5-0007bz-VM
 for qemu-riscv@nongnu.org; Sat, 20 May 2023 01:45:21 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f423ac6e2dso26175745e9.2
 for <qemu-riscv@nongnu.org>; Fri, 19 May 2023 22:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684561518; x=1687153518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QoiLKMEOX41tFLy0qcfFWPV2O7S+2JSUpMk1QMM25jk=;
 b=V76Eq+YECNX7VaDfDoQ/AsLC3xPuSpCb7UZocxiXVHsnBJkZ5N5WqVSdD1YGA0TMiU
 J7MPqWxTwZx2HkF0Uoy4+IoYKcmL2LSnSG895WdDUj9bx/QGTXyyfkv7QHVyRpcL5aI3
 Gfzf+CFn4Njd8KjaT8nl4H+pFX644qN8ZnBjogR39sf+IXWMudIf+ur0W/4ayLw6NpCN
 Px2dmXOKp1b3KJUgBdAslLx0ID8GW+Mx0nxvk5Dc4WgKNbC4p8iQtj3x0DH4KkpmwM8n
 2UC1009K7PTAyb0njdpUFh1TFC6qK6YnenNuTkukHL5mR/FJwUcbk6tNg2nnPVNKvqDs
 UE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684561518; x=1687153518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QoiLKMEOX41tFLy0qcfFWPV2O7S+2JSUpMk1QMM25jk=;
 b=NOm8uN8jsAndhdIXsImxFvu1thdy89pLzRELYWJXB3TxHdgTNZkObuq4pL95T+rcyk
 uM2vQRTystsp5jrbOlrIWQnVE1UeNSJBkKAiBVoC7cCMuQs2ZlxD2/7l5kIdBGEQ78Ms
 fAUTbmuXTEhIagH7y3WinBDLh+CH4HXvt71ju/reSt6UGehMBs/o+ey+d2QJTGdSFFLS
 j0MM9uk1TlzJbZz8OPIoy+s07iGpTRO6y0nqz0xIuQlO/saQpHhcvhxQ77qFEmikqeMq
 mQ7qJrJrJuNh9REoDMgY5x7QoABYTHyj9sAdfhcFYq5e2J80q+uGrSC3gbNWezNdGWFs
 zlJA==
X-Gm-Message-State: AC+VfDyFsRYVXU++SDhEbboYAfJ6Y3lMA88io9A2T15SshBq2/yEbwC8
 7zyrI8DmUHIdpBfIofvX6IAVlg==
X-Google-Smtp-Source: ACHHUZ4csgNyyT/psF7HgptwDPAqaL5PythaxSAos8jHh6FNFfYt6y9UmPWol2OiVVQ6gEzfs4yH4A==
X-Received: by 2002:a05:600c:ac6:b0:3f1:8c5f:dfc5 with SMTP id
 c6-20020a05600c0ac600b003f18c5fdfc5mr2749103wmr.39.1684561518473; 
 Fri, 19 May 2023 22:45:18 -0700 (PDT)
Received: from localhost.localdomain
 (mau49-h01-176-184-41-228.dsl.sta.abo.bbox.fr. [176.184.41.228])
 by smtp.gmail.com with ESMTPSA id
 4-20020a05600c020400b003f19b3d89e9sm4304862wmi.33.2023.05.19.22.45.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 May 2023 22:45:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/5] hw/riscv/opentitan: Rename machine_[class]_init()
 functions
Date: Sat, 20 May 2023 07:45:06 +0200
Message-Id: <20230520054510.68822-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230520054510.68822-1-philmd@linaro.org>
References: <20230520054510.68822-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

Follow QOM style which declares FOO_init() as instance
initializer and FOO_class_init() as class initializer:
rename the OpenTitan machine class/instance init()
accordingly.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/opentitan.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index bc678766e7..2d21ee39c5 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -75,7 +75,7 @@ static const MemMapEntry ibex_memmap[] = {
     [IBEX_DEV_FLASH_VIRTUAL] =  {  0x80000000,  0x80000     },
 };
 
-static void opentitan_board_init(MachineState *machine)
+static void opentitan_machine_init(MachineState *machine)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const MemMapEntry *memmap = ibex_memmap;
@@ -108,17 +108,17 @@ static void opentitan_board_init(MachineState *machine)
     }
 }
 
-static void opentitan_machine_init(MachineClass *mc)
+static void opentitan_machine_class_init(MachineClass *mc)
 {
     mc->desc = "RISC-V Board compatible with OpenTitan";
-    mc->init = opentitan_board_init;
+    mc->init = opentitan_machine_init;
     mc->max_cpus = 1;
     mc->default_cpu_type = TYPE_RISCV_CPU_IBEX;
     mc->default_ram_id = "riscv.lowrisc.ibex.ram";
     mc->default_ram_size = ibex_memmap[IBEX_DEV_RAM].size;
 }
 
-DEFINE_MACHINE("opentitan", opentitan_machine_init)
+DEFINE_MACHINE("opentitan", opentitan_machine_class_init)
 
 static void lowrisc_ibex_soc_init(Object *obj)
 {
-- 
2.38.1


