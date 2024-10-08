Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEE7CF042A
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 22:54:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1syJ2Y-0000Th-Qo; Tue, 08 Oct 2024 18:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1syJ2U-0000NK-L8
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2024 18:50:46 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1syJ2Q-000419-60
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2024 18:50:46 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-20bb610be6aso68086195ad.1
 for <qemu-riscv@nongnu.org>; Tue, 08 Oct 2024 15:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427840; x=1729032640;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FLg+s4rzz0OrmKj4UlRhD/WmbjGBPBMHWdNHXxUKfXo=;
 b=d+Zd1zrpeB3JdrPG0nsnd0YC7iuT+fVECWv2Sm7uZtWH/TStHMQYLJ0bhwTLXQ4syW
 qc4sRHriCjJNJsFooX5Y46+wCfw0uax44JcxmbwXfHQFwJrm1ssgNaUIyyyKkQFmJdyS
 OIjY3XBymuPasDQRR4vNGnKvv/l5wqSmfBTvT7BN6PSS2EcF79GC8ZR/uVbWKq2DKV9/
 u0CPR4rObpuKJmJIliCRwo3DaH1I99SvByWAkZGaVSs/HbBwNbPyzuiseUi5/xMHCfug
 adtITCc209oMDqUqw4kYsWj+tHsHlWmTnLSY+isg+0vvEawi9tMW6ctiSQIsV6qXA7TN
 XgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728427840; x=1729032640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FLg+s4rzz0OrmKj4UlRhD/WmbjGBPBMHWdNHXxUKfXo=;
 b=k081gwatJmkb8Ifnw+qvEzMobcruN4ykgKVB8Xo1agbGvyizrK2hvSlxV8TUrAeyD6
 UbAX1wtjmYkdvLJvY1iMM7hDct+8eIWuV37RIRt+NVD/Crjne58R3rSYyQuP8Ca1E9iS
 5dboP9aMqgbhk1iTid5DSFjw8cMaoHe/mnBzv1KFJySExUMTTRcJDPm6Jxloja5ScK1E
 oYWky5BN7vDeWxK+csjgCvvkEvhv6kF4dRxA0iRbr/ZZ//S5VujiwySwWD6QYT3PqJox
 6QeMiqPCPjgMdEl8G1/PYD+aMpZlQFGAR/QkIBlLpxof8zmPWiR8nyl5NqIHNVcs10X1
 4qPA==
X-Gm-Message-State: AOJu0YxrFsMZZ7DhYNbQiQCPGG1uIuYtP0UKpJLbZFHT/Us9IhOYGHCM
 vR0RYRdkzQZdQFz38bMZKe7+r7Q0CuTjMJ63rcrN7u+2seArfrsRjVhH47F0ZmHb5H6X38Ni93Z
 Z
X-Google-Smtp-Source: AGHT+IEWo+OwTN8wk7H9DcHXvWRcdB4QQeyPRO3aE5PjZR+n5lZst3NZv8jmD1LxE+0q2mwd+D+CAg==
X-Received: by 2002:a17:902:d3c1:b0:20b:57f0:b378 with SMTP id
 d9443c01a7336-20c63791688mr5523685ad.50.1728427839796; 
 Tue, 08 Oct 2024 15:50:39 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20c138af962sm60006105ad.26.2024.10.08.15.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 15:50:39 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, kito.cheng@sifive.com,
 Deepak Gupta <debug@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v16 20/20] target/riscv: Expose zicfiss extension as a cpu
 property
Date: Tue,  8 Oct 2024 15:50:10 -0700
Message-ID: <20241008225010.1861630-21-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241008225010.1861630-1-debug@rivosinc.com>
References: <20241008225010.1861630-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ac5ad6fa9d..0751d08d85 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1473,6 +1473,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("smcntrpmf", ext_smcntrpmf, false),
     MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
     MULTI_EXT_CFG_BOOL("zicfilp", ext_zicfilp, false),
+    MULTI_EXT_CFG_BOOL("zicfiss", ext_zicfiss, false),
     MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
     MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
     MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpause, true),
-- 
2.45.0


