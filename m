Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1CECDB474
	for <qemu-riscv@archiver.kernel.org>; Sat, 14 Oct 2023 03:36:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrVRu-0007Zm-VP; Fri, 13 Oct 2023 23:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qrVRt-0007ZO-CJ
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 23:36:21 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qrVRr-00044T-RS
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 23:36:21 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1c9e072472bso18213445ad.2
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 20:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697254578; x=1697859378;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2WfcBcURCpBzkq/OT9x9ciFFH2S7/N+xn+Vd6QWcFlg=;
 b=s94NspDM6fSidEmi1V7Nhx4DPCiN9F10w5a2FSWfwr9aP4IJ+ssgjpqYmfxELpauMV
 F4hI33UuR665/lLAIh/mxbTEECOjOOEBqayxChN3HYthOMkBf2LueyKvmza9UWbJH7yK
 bvEjzwy0f4iLYbLvjbdRpdxbPFM+gne6F+cNE0cf0eFIwWCk/rWMv/UnOPnMQi7TVgkg
 fiYfTCtjT9bLu4xRZvZ4h6xQ4anq3tAgQfAJ43gi4+hyzEhvnNhSqUf2F5bsHXGEVeaR
 b/gzGT4Mb7Avt/S2R2820k3fOhVO79PZKs81Wmz5wjmpoUH3tLNG1jpGz/crNUyDBgc2
 HBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697254578; x=1697859378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2WfcBcURCpBzkq/OT9x9ciFFH2S7/N+xn+Vd6QWcFlg=;
 b=j9q8j6vEs5WZ5AgojBHCITTQLvQ/gq40lAkiPdGWlk0MmBe5YLS5qlhe2UeS13IQCj
 RBYz0bym0JZzBBwNOxGnyD3ZoZpzk0V7TwtryNMBtp913s9SU0OOBlluzKDlK/jO+ac7
 6Hkovj4xlRanid1EjNnKXSMymVNHK1DqhLpDlJrj6Ymt3CHDeyJvfZzhe+3AITRpzrTv
 YudmsB+EmrSNewy/MNICNDK5Y8vJ0G8JD/w+/xz05oTibLmw6V0iAvBXTRdQNYpcMsT9
 5qMcDzsmG1fq9F+xoNT5fWW0L1Wh9HZw1u3679eavQwm1lMWYX17LrqI3Ftawppzo302
 jy1Q==
X-Gm-Message-State: AOJu0YzDBsyzX6zcSmpF3sHpKAEPZhk1ldIQ2DLgN7bIgVdzoxIt/s8R
 KMzXqkYtjXide4r78IfQIDHYDw==
X-Google-Smtp-Source: AGHT+IGZja6UbuTxM4GCw+iPGvxne5NJyUEYG7T/oYRFLDXvBAnDVXFow4akLsJGqhYRZ92bmmoerQ==
X-Received: by 2002:a17:903:230b:b0:1c7:3558:721a with SMTP id
 d11-20020a170903230b00b001c73558721amr35214656plh.58.1697254578174; 
 Fri, 13 Oct 2023 20:36:18 -0700 (PDT)
Received: from localhost ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with UTF8SMTPSA id
 b6-20020a170902ed0600b001c0cb2aa2easm4563161pld.121.2023.10.13.20.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Oct 2023 20:36:17 -0700 (PDT)
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
Subject: [PATCH v2 1/3] target/riscv: Do not allow MXL_RV32 for TARGET_RISCV64
Date: Sat, 14 Oct 2023 12:35:39 +0900
Message-ID: <20231014033545.15220-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231014033545.15220-1-akihiko.odaki@daynix.com>
References: <20231014033545.15220-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
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

TARGET_RISCV64 does not have riscv-32bit-cpu.xml so it shouldn't accept
MXL_RV32.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/riscv/tcg/tcg-cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index a28918ab30..e0cbc56320 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -161,10 +161,11 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
     case MXL_RV128:
         cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
         break;
-#endif
+#elif defined(TARGET_RISCV32)
     case MXL_RV32:
         cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
         break;
+#endif
     default:
         g_assert_not_reached();
     }
-- 
2.42.0


