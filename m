Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8FBC021B2
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 16:01:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tmxN2-0007Gj-IZ; Tue, 25 Feb 2025 11:01:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <loic@rivosinc.com>) id 1tmxMy-0007Fc-PF
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2025 11:01:17 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <loic@rivosinc.com>) id 1tmxMs-0001xC-PQ
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2025 11:01:16 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-439a4fc2d65so56287905e9.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Feb 2025 08:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740499260; x=1741104060;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gFwyJsZ9aRSgNbolC4VPZjvH7EqpCkFhCwlagWn/q9A=;
 b=d1lq1bT3TWyNTG2U2qOjnIl/N8TdFcn6qBSioVbhZSYtwlh1TS1Ir9JffHo/5hglUM
 5QXfpz+vgAgRdY7jS6AjN1YIo95NtNGOnnZdRA4HX1qZpaGPrv71/sGAYGM/zjHfV8M+
 YS7AFkvQhjc03qfRVMkhQ+yggEQ3QRNOO+lRB73WjlwqDjRiwOrK2oXvkj/xvWaG2IJf
 4Hspx7w+s3mBAE0A3UgUh/7YRWfUfBLDSEvh8vWeMIerdNDMP99wJmdtzjHpDHyOHx22
 xAfi0Fc6n6IcPf56gapU/NfEzQgj0Jh84EC/K075VzgZ9yMcM1ogMuNbLuitaniRqM69
 NBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740499260; x=1741104060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gFwyJsZ9aRSgNbolC4VPZjvH7EqpCkFhCwlagWn/q9A=;
 b=snOoyui0DCg26w1exl41PPrlT8o5sCTciBA4enGrgV0bOUj1+1Ufuf8e5LE5qbhHYd
 j+MhXGM4Cc5ryHKmgVjSIPHv/8L15Ezhl/D7PkPiWY0F7zM8E+NU4uHQW+2YZabWZrlB
 JfGDrvKfFDAKIeNmpHdzlzs07feHRksDhvrrR02fAAAH3zWrROtROkNbK+RRZOWFa/rp
 HHtYfCWUoadyCPTRQQdoEmrE3HbRzoyqsZ/dTLv1ciil/3F64v2gafz7h5zCBmqY8wtb
 x8bP0g+CYN0eOERfOyEGI9R+uwgiZziPVPwYtim3gGeQFX6eLZRZbShPxyAh+WKgUltX
 z3dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuujcfWN1dBMWYZqR1PsLetowo4Y1I3n0/RqnowrB9Z2ZujVrA+kxNkUi/pw0O7Gfw6DzPmqHW73Aq@nongnu.org
X-Gm-Message-State: AOJu0Yz9SSl/PETjtU4nTYZ5G7yMkQxOZRK/2vDFzbTGDo3EanxKEO8r
 KdgvigC960F0Ubu7KJghWZ5TG5/8pgyXNl6As2+2wu7iqE1NKaF1UsS1qYS+LmQ=
X-Gm-Gg: ASbGnct6bWChXb1dkD7E2TMKYYPkbZjkBnkK8TBG/1/dZUfKRy2tl2gKal6EFRMzxJH
 v/KOQ5jtE2VpZ42mxq6HPWu94Kp9KAhJ+JJA1bj2CfiB97UAuSXOVSXyccA8YQ1LxdST0Cy0/ST
 yzAkJCfIUnNX1BcL4Jsip7d4C46wmsQgaT8aVmYP4alVGa3LnnlkMxK2/LgkwJXuhU2qqTbmewV
 Ty7LdTbi1rNUI2e/D1SAnsGIYx8Ms900/eidEe0XEo4JMhOkWx7F7M8asmFK5QynHSzaR6/MqoE
 XwpRl3ENl6ByCM8w6JQ7O1gXLp0M/n4CqvNud28PxgTNYaeyg4J7X5lA32fYbiPsMKYEtWQS8A=
 =
X-Google-Smtp-Source: AGHT+IF9zC9j0LMpWwQJ9hPqqKtvjzOhmUmKjZiUsWMVEOysBPz5Aa6LQedkEf8EJOFeKLdogLqPKA==
X-Received: by 2002:a05:600c:1d8c:b0:439:98ca:e39b with SMTP id
 5b1f17b1804b1-43ab44b58c3mr27814935e9.29.1740499260185; 
 Tue, 25 Feb 2025 08:01:00 -0800 (PST)
Received: from llx1.cad.pilog.net (lfbn-mar-1-50-94.w86-229.abo.wanadoo.fr.
 [86.229.28.94]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab1546df4sm30530755e9.17.2025.02.25.08.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 08:00:59 -0800 (PST)
From: =?UTF-8?q?Lo=C3=AFc=20Lefort?= <loic@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Lo=C3=AFc=20Lefort?= <loic@rivosinc.com>
Subject: [PATCH 5/5] target/riscv: pmp: remove redundant check in pmp_is_locked
Date: Tue, 25 Feb 2025 17:00:52 +0100
Message-ID: <20250225160052.39564-6-loic@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250225160052.39564-1-loic@rivosinc.com>
References: <20250225160052.39564-1-loic@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=loic@rivosinc.com; helo=mail-wm1-x334.google.com
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

Remove useless check in pmp_is_locked, the function will return 0 in either
case.

Signed-off-by: Loïc Lefort <loic@rivosinc.com>
---
 target/riscv/pmp.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index e4fee10d93..81c8bd71ce 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -58,11 +58,6 @@ static inline int pmp_is_locked(CPURISCVState *env, uint32_t pmp_index)
         return 1;
     }
 
-    /* Top PMP has no 'next' to check */
-    if ((pmp_index + 1u) >= MAX_RISCV_PMPS) {
-        return 0;
-    }
-
     return 0;
 }
 
-- 
2.47.2


