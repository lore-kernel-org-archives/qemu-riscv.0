Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2238C49EA1
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 00:08:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sbUD9-00039P-FI; Tue, 06 Aug 2024 20:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sbUCk-0002UN-Ru
 for qemu-riscv@nongnu.org; Tue, 06 Aug 2024 20:07:03 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sbUCh-00017G-GL
 for qemu-riscv@nongnu.org; Tue, 06 Aug 2024 20:07:02 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1fda7fa60a9so10535665ad.3
 for <qemu-riscv@nongnu.org>; Tue, 06 Aug 2024 17:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722989218; x=1723594018;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VJOhnSghwUlcGLtcqpB8a6GrX3vCsWVBjHp5kS9dbdk=;
 b=hoyPcePyiQYvgEykv7/QetK15hlDY1icg1GkSNxQa8HxEkQRvbYwqGVQRdqnV+2+MO
 wkJc496VXG78VfGFp1ImsNOxRK4RgSExhVTO7MSI/h3bVJMVemS8TgN4OTCGD1nClweT
 qlujvCLoUS2evjA0Z9cJyGXX7VByfg8ZSM0MKXVhj+xWr7HitfVBX74A7c8pfRiQINPu
 EX0EJeLey+UHkWeFglrQUAcPn6TEmtCQWQejTBH0kdRSZHIOEZWaf3o8oOen1S7OH9fo
 ULbTJzCZQZbxnm40Fut/f5SsGXnIK6lw2e/sWZ083GZlriJM5ByutGO7Wutz6hbvcTLj
 rLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722989218; x=1723594018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VJOhnSghwUlcGLtcqpB8a6GrX3vCsWVBjHp5kS9dbdk=;
 b=UG5ehIfBOnZRFhxOz8mOipDg7F8+O2caNqDYZQG0THLPg39jD8ajI0Hc0CmSD7mT++
 K687+PP7u5tWvqQm6JbqaCfv2l/5z54BiUvfccSMkZgWGL6R3JuxjDKeE+cqmuzVlGlW
 UqmDIGKg8e7wIeC+IGrey3jHc0L7NCCvl3wlPPCLQMSggVIqYLtnD9padM7wxme69meR
 Wu31EMiyA6pejj+NqWHX0MPCmn00mOaLWDU5uTHHI7uQyAUxHo1FAFqwhFXosCbLrSHG
 G1MVSY8Tk7xD3iORYMv0GcEyzvXORc/eEL1cH41EVEoCC2EO1kJrZCngnmNh3zEycqQD
 oCVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHMAFyJpENcQWY6NFEyzkZq7CsIIwBb4UI9jSrE/Q/K0m4c098vJ/pIv0kKMGj9ekrz+yQ6lyTe0rNOmhQeAjj0zWv70M=
X-Gm-Message-State: AOJu0YzJNDiUhKbGAMxrWnHQ4UieskL+hDVDo9H22M1HIfa6UfZhD6Gn
 gNjqhHxUpMWypzkZRlUhlTkZDXtXAJgvdiMrYPisSQ7TEd2ve2Es94p91D+Qlek=
X-Google-Smtp-Source: AGHT+IHJlLbITAB4l/G2YSjELLMT8UcI2cKdNyRpE2Y6OwSM/+uuC2XMdFqdLfMhjCPrX9zstQqJSQ==
X-Received: by 2002:a17:902:f9c4:b0:1fd:6c5b:afd4 with SMTP id
 d9443c01a7336-1ff574e222amr176216145ad.64.1722989217732; 
 Tue, 06 Aug 2024 17:06:57 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff58f59cc2sm93381845ad.92.2024.08.06.17.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 17:06:57 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, laurent@vivier.eu, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v3 01/20] accel/tcg: restrict assert on icount_enabled to
 qemu-system
Date: Tue,  6 Aug 2024 17:06:32 -0700
Message-ID: <20240807000652.1417776-2-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240807000652.1417776-1-debug@rivosinc.com>
References: <20240807000652.1417776-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

commit 16ad9788 [1] restricted icount to qemu-system only. Although
assert in `cpu_loop_exec_tb` is on `icount_enabled()` which is 0 when
its qemu-user and debug build starts asserting.
Move assert for qemu-system.

[1] - https://lists.gnu.org/archive/html/qemu-riscv/2024-01/msg00608.html

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 accel/tcg/cpu-exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 245fd6327d..8cc2a6104f 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -927,9 +927,9 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
         return;
     }
 
+#ifndef CONFIG_USER_ONLY
     /* Instruction counter expired.  */
     assert(icount_enabled());
-#ifndef CONFIG_USER_ONLY
     /* Ensure global icount has gone forward */
     icount_update(cpu);
     /* Refill decrementer and continue execution.  */
-- 
2.44.0


