Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9A1EB64DC
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 17:44:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qKMpZ-0004eX-G9; Fri, 14 Jul 2023 13:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qKMpW-0004dN-RN
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 13:43:46 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qKMpR-00047m-Gv
 for qemu-riscv@nongnu.org; Fri, 14 Jul 2023 13:43:46 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1b05d63080cso1783852fac.2
 for <qemu-riscv@nongnu.org>; Fri, 14 Jul 2023 10:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689356620; x=1691948620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hk0qetmG4EQeNyl9I2p1Lk6EwsQ8OOD67MmgFw0wUAc=;
 b=R9xXAUMDI0Up4zq3w4ek5a3afzHUY1QjqWhjx1Njt2qtLojHy5lh3nfYVDuLR7JDgm
 ge88uH2nLsndi/x0LXMD1qqaBihAEodOdl2LMPOJJvv6a7X9PgKhY0XocTJn3lI/U7/l
 J1s3hkiNhvyDJOI+bC7trudB1x8jkjTSbNZCQSYiDKOEsZBKDurVw7OdA2buAOp+bJM4
 EcQBEnOA5B1a3mlkyTDqeKABB42GD+L8raN3xAQkYr4iVvGsSVcNwRrSMS4VCvWafCTW
 GuNzbvDA4NLqwrDB+0+UYYP3wem6/CivnicB1Ez7ifhYxnt4oFvI+WvrGb6AiiHtgoZx
 YuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689356620; x=1691948620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hk0qetmG4EQeNyl9I2p1Lk6EwsQ8OOD67MmgFw0wUAc=;
 b=OrXIQ6GeF3+Gbe8j5YbgV0zTgtmo7BEDRIS5WPF7YJOwIJzPwN5tENiWMOrXPI/dYl
 twZ+vveAda2EzTNcqeynzd4cKow118HsvrhxjXC07MaqOSd3xHziJd0ZqS0BnGB3usSP
 rukU/SCxGS+9wBQdw/64jRP+jkbNTrdZozAci6uBC8yhnCiYcJUxtmZY9WTpJXV6koE8
 ycvzW/rDhrSwj5aO8K++tD0+hckUJZRMd5ZzzDgFdsSI0UFgC1+TOA5o2HBRpJKVRHUI
 W6N2kCZZjVJtSKVj99BRNQTNM04miwOVlatKuhOPpxPkHdFfGX67rajkxR04jjYvSWgM
 ucLg==
X-Gm-Message-State: ABy/qLaYoRJ742AxlEv0DH8tyGbh/+qY87e37pB4n56xUNVk+M3AsQjJ
 NXeHClJQYC2Dauo6fTnQpTSpVQ==
X-Google-Smtp-Source: APBJJlEYzdoJs7NOCHSedHiWJelcIjoh4qcKYd0nKWmpPjbFcDEyxp0S9v8DFca3M34q2ONr7RnYqw==
X-Received: by 2002:a05:6870:41d5:b0:1b0:4253:64de with SMTP id
 z21-20020a05687041d500b001b0425364demr6792034oac.11.1689356620374; 
 Fri, 14 Jul 2023 10:43:40 -0700 (PDT)
Received: from grind.. (201-69-66-19.dial-up.telesp.net.br. [201.69.66.19])
 by smtp.gmail.com with ESMTPSA id
 dw18-20020a056870771200b001b05c4b3b3dsm4240968oab.31.2023.07.14.10.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 10:43:40 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 v3 8/8] target/riscv: deprecate the 'any' CPU type
Date: Fri, 14 Jul 2023 14:43:11 -0300
Message-ID: <20230714174311.672359-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714174311.672359-1-dbarboza@ventanamicro.com>
References: <20230714174311.672359-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The 'any' CPU type was introduced in commit dc5bd18fa5725 ("RISC-V CPU
Core Definition"), being around since the beginning. It's not an easy
CPU to use: it's undocumented and its name doesn't tell users much about
what the CPU is supposed to bring. 'git log' doesn't help us either in
knowing what was the original design of this CPU type.

The closest we have is a comment from Alistair [1] where he recalls from
memory that the 'any' CPU is supposed to behave like the newly added
'max' CPU. He also suggested that the 'any' CPU should be removed.

The default CPUs are rv32 and rv64, so removing the 'any' CPU will have
impact only on users that might have a script that uses '-cpu any'.
And those users are better off using the default CPUs or the new 'max'
CPU.

We would love to just remove the code and be done with it, but one does
not simply remove a feature in QEMU. We'll put the CPU in quarantine
first, letting users know that we have the intent of removing it in the
future.

[1] https://lists.gnu.org/archive/html/qemu-devel/2023-07/msg02891.html

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 docs/about/deprecated.rst | 12 ++++++++++++
 target/riscv/cpu.c        |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 02ea5a839f..68afa43fd0 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -371,6 +371,18 @@ QEMU's ``vhost`` feature, which would eliminate the high latency costs under
 which the 9p ``proxy`` backend currently suffers. However as of to date nobody
 has indicated plans for such kind of reimplemention unfortunately.
 
+RISC-V 'any' CPU type ``-cpu any`` (since 8.2)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The 'any' CPU type was introduced back in 2018 and has been around since the
+initial RISC-V QEMU port. Its usage has always been unclear: users don't know
+what to expect from a CPU called 'any', and in fact the CPU does not do anything
+special that aren't already done by the default CPUs rv32/rv64.
+
+After the introduction of the 'max' CPU type RISC-V now has a good coverage
+of generic CPUs: rv32 and rv64 as default CPUs and 'max' as a feature complete
+CPU for both 32 and 64 bit builds. Users are then discouraged to use the 'any'
+CPU type starting in 8.2.
 
 Block device options
 ''''''''''''''''''''
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1cdffd5927..0f7c76e286 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1470,6 +1470,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
+    if (object_dynamic_cast(OBJECT(dev), TYPE_RISCV_CPU_ANY) != NULL) {
+        warn_report("The 'any' CPU is deprecated and will be "
+                    "removed in the future.");
+    }
+
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
-- 
2.41.0


