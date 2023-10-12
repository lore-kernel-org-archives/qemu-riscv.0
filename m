Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509DACDB46E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 10:03:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqsVP-0007Bx-IO; Thu, 12 Oct 2023 06:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qqsVK-00078A-Ta
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 06:01:20 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qqsVI-0006zF-PB
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 06:01:18 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso664921f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 12 Oct 2023 03:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697104875; x=1697709675;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xCYl2ITD4wBOSdR+ouSLn64FfrgWlxT7ZNZhf+YF/cY=;
 b=woNO6CBhHoLe0p/NTlTHcO16ZDJBrpM9MScLOjzmOhBljQXeHEzEqijeDVbT8OazSF
 4PS+9RVVSWUWVAZ6Mp5vUtsfS68LykNmG49MznLt4KVBiVSocqUHzvqb4H4Jx/ZMRdx9
 RMM42xD2u0xQ1rqVRj8mQ6xs/GcDxpyMgqipyBN58Pu5MpwYcYAW8hr7yNoZWm89LJcF
 CtZY+fI3a/rk2YKcE+xr1unhyLhLYEqm0EvHRv9u5Hpuq8KbR6PILmwHneY0c9UzJd0T
 b8bbmmecSIrX8K+GO7N4zeATkXNlaTLfKISegSxOxxS02CXTKgTNZaW61Sk1Z4XKgwkp
 gm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697104875; x=1697709675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xCYl2ITD4wBOSdR+ouSLn64FfrgWlxT7ZNZhf+YF/cY=;
 b=he6IpIANmu112F3yh5kGtI4DdQIFpsk2KZx/8zn+uQIxbU27uwTjnL4xPZaCEGW+lL
 07zls1sMq9fgO6Ezg8WIMuAdbxxSxD+IJCwABq4FwHmQ6lQXwddMIRHnvM2ah2fZTue+
 gNrrnhIfQ8RVfpa9rYiyuLAoFUuUCYIhNKjGKNu3b7cUven/cRp9EtFkBiN8O492B+DZ
 MnWghFADvzYcWIiJpDbkydhaD27ru2ZS5xpzilkprx280LVZ7gYd0JeHwt694ilqzwH8
 P0Sx0gMXL2pseoPzciGjhWUHR4Ta5J6GiOeXvtU3psd1daSKZlCIJxxaSaJkwuOm2Tcw
 P4Ew==
X-Gm-Message-State: AOJu0Yy0HuOlnHlmgFe0kExCNjWjunqJCQ2vV6RDtjCb/RrPc+ZyysQD
 ox0Iu2stgSuKTLX3X/VY65wv7XriW0P8oFTg2s23rw==
X-Google-Smtp-Source: AGHT+IFfI9o1IKSKwDw2npe/u9/rNys0e/h6DSPXioXPAT/NHZDT34YNbrPNHHxIx2KhBPU7BJbj1g==
X-Received: by 2002:a5d:58ca:0:b0:31f:9b4f:1910 with SMTP id
 o10-20020a5d58ca000000b0031f9b4f1910mr20831327wrf.63.1697104874892; 
 Thu, 12 Oct 2023 03:01:14 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91760-watf12-2-0-cust235.15-2.cable.virginm.net. [81.111.69.236])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a056000024c00b0032d88e370basm3803122wrz.34.2023.10.12.03.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:01:14 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, apatel@ventanamicro.com,
 rkanwal@rivosinc.com
Subject: [PATCH v4 3/6] target/riscv: Set VS* bits to one in mideleg when
 H-Ext is enabled
Date: Thu, 12 Oct 2023 11:01:00 +0100
Message-Id: <20231012100103.28612-4-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012100103.28612-1-rkanwal@rivosinc.com>
References: <20231012100103.28612-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wr1-x429.google.com
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

With H-Ext supported, VS bits are all hardwired to one in MIDELEG
denoting always delegated interrupts. This is being done in rmw_mideleg
but given mideleg is used in other places when routing interrupts
this change initializes it in riscv_cpu_realize to be on the safe side.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/tcg/tcg-cpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index a28918ab30..34e034b9f3 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -618,7 +618,12 @@ static bool tcg_cpu_realize(CPUState *cs, Error **errp)
             cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                           riscv_pmu_timer_cb, cpu);
         }
-     }
+    }
+
+    /* With H-Ext, VSSIP, VSTIP, VSEIP and SGEIP are hardwired to one. */
+    if (riscv_has_ext(env, RVH)) {
+        env->mideleg = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP | MIP_SGEIP;
+    }
 #endif
 
     return true;
-- 
2.34.1


