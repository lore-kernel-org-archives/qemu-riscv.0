Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A55CDB46E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 05:44:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqoTV-0003Gu-Mu; Thu, 12 Oct 2023 01:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qqoTM-0003DD-3K
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 01:43:00 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qqoTK-0005Ut-K8
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 01:42:59 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c60778a3bfso5420035ad.1
 for <qemu-riscv@nongnu.org>; Wed, 11 Oct 2023 22:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697089377; x=1697694177;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9kepgm6YNQrj2IaKpZZ0+nFaqULFW8VUbTjbRtsqPp8=;
 b=rByAp9akpzP5FEzssMuJl1e0a1bZh0rnkSK5bmwgm1441KVGTU08ZnC6lPUntghtMT
 VXpLnf6OvvFXVIBAVi5+j8WDl6hWswq/LapLJGgHf1MOccFAXOTyawPrTmGMxyI/Fa5k
 R0IrseD4caeaomduyowNgu04vfuGOMtUJaOTXVuhoEiJQqr4G/ROWItI2aC8HgINulyq
 fkLk9MydcV47INU1G+RXrkmZI6/D9lOMs1rwqkIurKbUg9DjRVtWyeH8WtE6Q9xz90fZ
 H2UM4lPHjuIlwYp5BMatculhPKtGUOBPiivfxz2PnYE2kACViOt9aRaNut+aAXGIKkUT
 ZdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697089377; x=1697694177;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9kepgm6YNQrj2IaKpZZ0+nFaqULFW8VUbTjbRtsqPp8=;
 b=sRaqz2onfd539SOC9EUd32WZmDolPMc8NTrEGbqx1t6hzkFgQL7b6hPu2CSrVvIZz8
 ACFuMUlgMaGFGukKfvjW04RZO8bjFz0zNRNZcNNiyJorsMOeb3+ANfocT+vBdRq/nLIh
 CjcfAjJEWcBiRxb0EL0DL5QYkWFRD2ZRn7d2YiQt0+pb6r0BzREajK1+83N1H981cCgj
 qdsYZodW9u+i8ye7hY1MaKAWkUeuf/HPXRyAVvaIdbz4EwjsFfuZSaf9s9BPoLk35k93
 tztqrO46LZzvNRovUZYDbNtiN46nHjga0wJ29X+y8kNFS2NZna8rJmWDJZ3QTlwRG97H
 nN1w==
X-Gm-Message-State: AOJu0Yz8tRNTyX2psvdgIQiNiqnh9LcoX+NANoqQ3aLKm/zSoCJIZIyN
 ZEJNf5smoI6DQG74xFmyLdIPVw==
X-Google-Smtp-Source: AGHT+IHF2lbxHJNUHaIwYgTQdCEn2tHSgTdhDNHOsJ30/45aPQCDCQ0VE5cU//QQLgZsqlthfJ1tPA==
X-Received: by 2002:a17:902:db0c:b0:1c7:49dd:2fe with SMTP id
 m12-20020a170902db0c00b001c749dd02femr28038757plx.50.1697089377250; 
 Wed, 11 Oct 2023 22:42:57 -0700 (PDT)
Received: from localhost ([157.82.206.10]) by smtp.gmail.com with UTF8SMTPSA id
 q10-20020a170902daca00b001c631e9ddffsm908048plx.170.2023.10.11.22.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 22:42:56 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>,
 Aleksandr Anenkov <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH 3/4] target/riscv: Validate misa_mxl_max only once
Date: Thu, 12 Oct 2023 14:42:18 +0900
Message-ID: <20231012054223.37870-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012054223.37870-1-akihiko.odaki@daynix.com>
References: <20231012054223.37870-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

misa_mxl_max is now a class member and initialized only once for each
class. This also moves the initialization of gdb_core_xml_file which
will be referenced before realization in the future.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/riscv/cpu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 48983e8467..02c85bf1ac 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1018,9 +1018,8 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
     }
 }
 
-static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu)
+static void riscv_cpu_validate_misa_mxl(RISCVCPUClass *mcc)
 {
-    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
     CPUClass *cc = CPU_CLASS(mcc);
 
     /* Validate that MISA_MXL is set properly. */
@@ -1418,8 +1417,6 @@ static void riscv_cpu_realize_tcg(DeviceState *dev, Error **errp)
         return;
     }
 
-    riscv_cpu_validate_misa_mxl(cpu);
-
     riscv_cpu_validate_priv_spec(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -2198,6 +2195,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
 
     mcc->misa_mxl_max = (uint32_t)(uintptr_t)data;
+    riscv_cpu_validate_misa_mxl(mcc);
 }
 
 static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
-- 
2.42.0


