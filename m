Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF04DCDB46E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 05:43:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqoTF-0003BI-AF; Thu, 12 Oct 2023 01:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qqoTC-00039h-7F
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 01:42:50 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qqoTA-0005T3-QE
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 01:42:49 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-57e3c2adbf0so310235eaf.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Oct 2023 22:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697089368; x=1697694168;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Uw4xHwZQOzopjarI+ACZdG5SPRQpCnWElX2EooooEY=;
 b=rQpAFrxjB0achPkrsX68cAvJLmEPRuEE1TSrtQb7ZSpbahXfjMUgLwshYU1dPclj1q
 NFm1MLzjrURfYXM9UgYdtCYTWQwa9wi3jqKrAshbe0IfywipzWq40RTMUebx12ivmdJs
 /A7Paw/5NISutq5mdu7EnzclhqyJ3o5LtnH2ONoJJhZ4tefFlkv1lEvlvNfU4prbHQdb
 286SWGfiY0I/tAEQX7ssGUSzy5CkJ02rR+A4JdWl8MLTkCl7mYcyHn45ZSB7GN0Ro8Ys
 7a94h/Wrkx3uaqkpPJ8uf0WArI4u5m5LnfzpQWobvJM+CFsLXDpCDisIrcAEcHkuiqLd
 FTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697089368; x=1697694168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Uw4xHwZQOzopjarI+ACZdG5SPRQpCnWElX2EooooEY=;
 b=OuRXOAQA65Olt93Rc3ledD+867/MJYnxZAkN8xj6UbRooEdDnWFPNBIL4Fw2Cr5ya6
 t0clbsj5S5qERLNN18j9sO0gGelWzkutkUZOOuiWnU0KshS+vSZ9Y8rUi1yIvx/rXmQ2
 Slgc2u8ee2qgrYarqDbdSKyAsNxcHTR7KrUsw1kOM1gsKLo08hLg42ce71QV85uux9bC
 wl6ooq5ulyEzNrp4DtdRFn3PWJF9O18o/AO0Mrv1cH3dKpqLNL22GBQYRDNR2UDaCbeX
 cSeHp/ggmznvMJECu9kDx4o3SPS9X4udA82W9ZnYVhLzYxgbnK1AnVFD+p0hSnryj4dx
 0haA==
X-Gm-Message-State: AOJu0Yz7dX30uL9tXoXpNbe+2KS/NixKK3y4OTdOhBzF/poFcNttflOL
 +6ilZs5TQ2NCi/LufCGJK041vw==
X-Google-Smtp-Source: AGHT+IH9qAzZDUMcnbMbe6wKAcwXz80sQ7JhFvRKesCZ2eUtFdyXq//3m25/PMrh4+SkaTdA5NBhsQ==
X-Received: by 2002:a05:6358:6f08:b0:132:f294:77fe with SMTP id
 r8-20020a0563586f0800b00132f29477femr22637169rwn.2.1697089367747; 
 Wed, 11 Oct 2023 22:42:47 -0700 (PDT)
Received: from localhost ([157.82.206.10]) by smtp.gmail.com with UTF8SMTPSA id
 d13-20020aa7814d000000b00690cd981652sm10926835pfn.61.2023.10.11.22.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 22:42:47 -0700 (PDT)
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
Subject: [PATCH 1/4] target/riscv: Remove misa_mxl validation
Date: Thu, 12 Oct 2023 14:42:16 +0900
Message-ID: <20231012054223.37870-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012054223.37870-1-akihiko.odaki@daynix.com>
References: <20231012054223.37870-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::c33;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-oo1-xc33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

It is initialized with a simple assignment and there is little room for
error. In fact, the validation is even more complex.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/riscv/cpu.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f5572704de..550b357fb7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1042,7 +1042,7 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
     }
 }
 
-static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
+static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu)
 {
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
     CPUClass *cc = CPU_CLASS(mcc);
@@ -1062,11 +1062,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
     default:
         g_assert_not_reached();
     }
-
-    if (env->misa_mxl_max != env->misa_mxl) {
-        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
-        return;
-    }
 }
 
 /*
@@ -1447,11 +1442,7 @@ static void riscv_cpu_realize_tcg(DeviceState *dev, Error **errp)
         return;
     }
 
-    riscv_cpu_validate_misa_mxl(cpu, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
+    riscv_cpu_validate_misa_mxl(cpu);
 
     riscv_cpu_validate_priv_spec(cpu, &local_err);
     if (local_err != NULL) {
-- 
2.42.0


