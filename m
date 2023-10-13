Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5A5CDB47E
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 14:06:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrImU-0004ht-Mm; Fri, 13 Oct 2023 10:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIky-0008Aw-5f
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:03:13 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIkv-0002Rp-3h
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:03:10 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9b64b98656bso342239266b.0
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 07:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205785; x=1697810585; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0NHkF48NQwYUtwEuXHiOGrGxMidZGr1dxHAYpW0iraY=;
 b=zrAkMmQ9YRQuQ+8mzJf63kEUdBSWPU6K8gr5om45UY0XoPwFeViWSsLu8tD8v6hsEw
 OS6xUf3DbW++WZWEA3qHqeqLSZbALsgQwL+Ne8ucrCoM0t4k0E3K6Xo9Y4VZ70RJFThc
 NLnXjVQZkeS2XBsc73oGHVgpcfrYZyohXtWcVt6q2ey2OTnaUVAEahTnDFgDm1vCGwb7
 dyngPSPVOjTEf8BgVN24tlr1RMFKxGtWQ/Dfci/r4TIKTn44oBZsAlZuuWaPBCpi7iBb
 0uYti9KLlQ8tIwTN7ydYs9r+sv40c+OSKzklUABSDPotbSFBSQjZnICMwI1ynYwo/RXn
 vzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205785; x=1697810585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0NHkF48NQwYUtwEuXHiOGrGxMidZGr1dxHAYpW0iraY=;
 b=m19dY8jfvxjyeG4iTH4H4sS91moXHf1iNQpkatvcO9IbLR4h+icHCkX2kc8UxsCURT
 LZ14QVpbtD/c/Ep3q6tNACcMB2aVVPB1BE7iOIxJf7NeffbH7KRVsFJeLwF7BZjPwv2C
 3y8n6+GUeOhBeNw/5wP1evxdZrEtcHH740y6AuFVdSV8ufKmWDSd4eu+xLx3p5GBkYC1
 vkzteFmtIvj5xurCvaiBEd1G/0zkvILGMMmasVzWUFt6nGLdLQTTB6En2mi6VV7G7dzX
 0hv0utXQvsxLLDX2WHWECfcR/2VUS4OJ4yAR7sesHASICGLFJC9inlDXd+CDyvu37SHe
 o1RQ==
X-Gm-Message-State: AOJu0YziIsNVPEgOsyz9fZ+FGo3XbMYySXvLo3RO4G4etzO2OoyoAbLR
 RyrBQVtBbe9rZ0AV0mkug7isLw==
X-Google-Smtp-Source: AGHT+IFHV1FcEguQQzGyWxk/AajR6Lx80H5M/9I1C/BZ7d0uL1bWAfizdH9D8WNdGbvMAFr0CK/K2w==
X-Received: by 2002:a17:907:2cd9:b0:9ba:1f02:77f2 with SMTP id
 hg25-20020a1709072cd900b009ba1f0277f2mr11695399ejc.56.1697205785417; 
 Fri, 13 Oct 2023 07:03:05 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 x20-20020a170906299400b009b2f2451381sm12507640eje.182.2023.10.13.07.03.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:03:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Marek Vasut <marex@denx.de>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 11/16] target/riscv: Move TYPE_RISCV_CPU_BASE definition to
 'cpu.h'
Date: Fri, 13 Oct 2023 16:01:10 +0200
Message-ID: <20231013140116.255-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013140116.255-1-philmd@linaro.org>
References: <20231013140116.255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
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

TYPE_RISCV_CPU_BASE depends on the TARGET_RISCV32/TARGET_RISCV64
definitions which are target specific. Such target specific
definition taints "cpu-qom.h".

Since "cpu-qom.h" must be target agnostic, remove its target
specific definition uses by moving TYPE_RISCV_CPU_BASE to
"target/riscv/cpu.h".

"target/riscv/cpu-qom.h" is now fully target agnostic.

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/cpu-qom.h | 8 +-------
 target/riscv/cpu.h     | 6 ++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index b78169093f..76efb614a6 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU RISC-V CPU QOM header
+ * QEMU RISC-V CPU QOM header (target agnostic)
  *
  * Copyright (c) 2023 Ventana Micro Systems Inc.
  *
@@ -44,12 +44,6 @@
 #define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1")
 #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
 
-#if defined(TARGET_RISCV32)
-# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
-#elif defined(TARGET_RISCV64)
-# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
-#endif
-
 typedef struct CPUArchState CPURISCVState;
 
 OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 144cc94cce..d832696418 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -34,6 +34,12 @@
 
 #define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
 
+#if defined(TARGET_RISCV32)
+# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
+#elif defined(TARGET_RISCV64)
+# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
+#endif
+
 #define TCG_GUEST_DEFAULT_MO 0
 
 /*
-- 
2.41.0


