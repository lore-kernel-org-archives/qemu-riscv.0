Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD796CDB474
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 18:56:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qspD7-0001Gr-OL; Tue, 17 Oct 2023 14:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qspD4-0001Ed-DA
 for qemu-riscv@nongnu.org; Tue, 17 Oct 2023 14:54:30 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qspD2-0006zk-4g
 for qemu-riscv@nongnu.org; Tue, 17 Oct 2023 14:54:30 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1c0ecb9a075so40777465ad.2
 for <qemu-riscv@nongnu.org>; Tue, 17 Oct 2023 11:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697568867; x=1698173667;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8RGOKdeWRbxy057ThQm8YJtuzOYESlVJp/H5jW1kGqg=;
 b=cHWOlrXLoVpvr4BYv8N7sDV7wrfgLvCISbO2gIDsi4ZPkOVpK1CfjJiPqknnAIcgj3
 siNQ4IuhdccEIO6NBpmhl/baHCVeHRiDpJL6oKiX2p8m+dFny1fR2PW/z7IkBbmU3Hqy
 7w9BnklsxCMDWGjCAj2PKyIMmeqOTggtY9gJDuOFhU6P2JNj2jLD2C4y064H88D0M5NJ
 DPWVGlziwAvqCS+97OXKeOZlUhZ41FGRfjFiv7iqq8HMW/gomMu/BVssXK+yAK9kkcnE
 oj/T58aP/8qEi0n89rCOGAZ3yhv96PEqFfMqZK9nmtOwXdvrZ+fAglNfmMgfcoZDAnVr
 a2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697568867; x=1698173667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8RGOKdeWRbxy057ThQm8YJtuzOYESlVJp/H5jW1kGqg=;
 b=otEinmZZ5eqbkH5gDVYtCPA0ZcycCFjhtTpqiHxvO7eRJs8ZBnN8GiIw4PkzWaNxkf
 nedTC19gG3iaNNYZoNPQvsIQ3sh5gI7cJgL3VOd3KIrsEOYOwatgWBbBIUImw1hBLT8D
 mVl6ewUXQm4r5p/3Nh3Yj1DrfF2A3l0O88sQr+F//TkLdwVaGNP/p0jQ1PiTLa6dSQ8U
 Qeg6IojbskeyIzTCO7cnwQZ4xrs90RX9+Wb2xCpH+Ji3XEjWBPODjpJXDViq5Jl8cf4W
 h8c/UYD9f5vVk33hQ8lUl1GnkbvtLpxNq9CgXA9pyJ8PZ35dkmY475pJkSHtO5ZNstuS
 ZdaA==
X-Gm-Message-State: AOJu0Yw8fm1WuOvExFlUZW7pq6j2BSRUNfRqkF8E71JjDu9FdpuUYd17
 C/0j/lK5Azo9Goa5eHvwvt6fTh3FvSXzl1f+bQWyWA==
X-Google-Smtp-Source: AGHT+IF1Hb2f+5AaHy7MRn9//LnI5N5MeKQUEZnRYeG/0GUBHnoAKnn2OMsQJ1MqmFuduE6eXfwjLA==
X-Received: by 2002:a17:903:278a:b0:1c5:d063:b70e with SMTP id
 jw10-20020a170903278a00b001c5d063b70emr2959336plb.53.1697568866706; 
 Tue, 17 Oct 2023 11:54:26 -0700 (PDT)
Received: from localhost ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with UTF8SMTPSA id
 c5-20020a170902c1c500b001c755810f89sm1935692plc.181.2023.10.17.11.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 11:54:26 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>,
 Aleksandr Anenkov <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Subject: [PATCH v4 2/5] target/riscv: Remove misa_mxl validation
Date: Wed, 18 Oct 2023 03:53:57 +0900
Message-ID: <20231017185406.13381-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017185406.13381-1-akihiko.odaki@daynix.com>
References: <20231017185406.13381-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x636.google.com
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
 target/riscv/tcg/tcg-cpu.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index a28918ab30..7f45e42000 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -148,7 +148,7 @@ static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
     }
 }
 
-static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
+static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu)
 {
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
     CPUClass *cc = CPU_CLASS(mcc);
@@ -168,11 +168,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
     default:
         g_assert_not_reached();
     }
-
-    if (env->misa_mxl_max != env->misa_mxl) {
-        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
-        return;
-    }
 }
 
 static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
@@ -573,11 +568,7 @@ static bool tcg_cpu_realize(CPUState *cs, Error **errp)
         return false;
     }
 
-    riscv_cpu_validate_misa_mxl(cpu, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return false;
-    }
+    riscv_cpu_validate_misa_mxl(cpu);
 
     riscv_cpu_validate_priv_spec(cpu, &local_err);
     if (local_err != NULL) {
-- 
2.42.0


