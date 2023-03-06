Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZIwa-0006SB-4C
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 17:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwZ-0006S0-Mc
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:31 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwY-0006nv-76
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:31 -0500
Received: by mail-pl1-x629.google.com with SMTP id i10so12065902plr.9
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 14:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140269;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w2GsuBqezAObm8K6pvzmGWqlGyI6qx54Ha8z5VsFlJI=;
 b=XF6aVZiFaDSCfpv5i6wpSJrbo1wnAk4Lg/YKTGAvUNFcnLLFpgYn9j44C25MAnRuKX
 8KCV+rP2Z97dav/lxzZBLrcCwGWto0kC0i/0wZURYB2Qw5trGhIKMBDqeaO3n6KXmsUp
 pgbKlJ3X5AQ20+tBo0tO5XWp5Tuj9ZiQgW8JuXX7mqug/umxWE4VE6mowBEpJhJYTyJT
 IafQ5KHov2DSR3kj2kQLLJUhV6mp7N5EKqMIsuza4PPX9S8pEK0UmOKxFk+u7E0Bwl/s
 jeI7/JYSX+/4um8n6GfhQOcV/1Yf/VvyfcfXKYcFxcUevlaytfUbdAlad1IBnHS8MzZB
 M8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140269;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w2GsuBqezAObm8K6pvzmGWqlGyI6qx54Ha8z5VsFlJI=;
 b=dBLJmkDSlTvp7T2iNo0I5u+4tbvwuR2ZPTT33UCxTPOEo6JjjqOurJVSwx2w4eZ9O0
 HyBomxeM4iUIJT0weLO3U7gvEOiecVVULkr2HFnuHon6RMpBXp4S99EOy0jHer2RdC6O
 DimzrzU93MdEC9vB2KExgit/zyRoEuq3YzwSkW3nJ16qPYj4BgSi7ReTpr1T0nsf7rTr
 VoEu26dwnJSdLpQBg4lJDFivFDjV9J9bdHZcWb0Cd4vbkKVBQ40leY/hm77tgeMJ9/aS
 NSgpwoS6iK9k+UMqtjFYTJTilPwBVCuNn5dMx7I1Pb0mHTzdcWe2af7dkZOq9H9lnW5T
 NbZw==
X-Gm-Message-State: AO0yUKXDgIUeD5oqJkI+gLrKKIXA+xzrblBZtvBWR/E1Hmev0mK4abEU
 g0+A5xJuKkToHT4dbQqM+1f55ZzNHeW9X4B+IIg=
X-Google-Smtp-Source: AK7set86m3SSi3ZuVxAuZrx9wDlNf0KSiK8B16jm2xwyheb+OYFz3XtHidI/Gt1Fudk4Kp6TCPeDAA==
X-Received: by 2002:a17:90a:e7c6:b0:234:8950:6d1f with SMTP id
 kb6-20020a17090ae7c600b0023489506d1fmr13217071pjb.11.1678140269144; 
 Mon, 06 Mar 2023 14:04:29 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 h9-20020a17090acf0900b00219752c8ea5sm6336914pju.37.2023.03.06.14.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:28 -0800 (PST)
Subject: [PULL 05/22] disas/riscv Fix ctzw disassemble
Date: Mon,  6 Mar 2023 14:02:42 -0800
Message-Id: <20230306220259.7748-6-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Ivan Klokov <ivan.klokov@syntacore.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Mon, 06 Mar 2023 22:04:31 -0000

From: Ivan Klokov <ivan.klokov@syntacore.com>

Due to typo in opcode list, ctzw is disassembled as clzw instruction.

Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
Fixes: 02c1b569a15b ("disas/riscv: Add Zb[abcs] instructions")
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230217151459.54649-1-ivan.klokov@syntacore.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 disas/riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index ddda687c13..54455aaaa8 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1645,7 +1645,7 @@ const rv_opcode_data opcode_data[] = {
     { "max", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "maxu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
     { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "ctzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "slli.uw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
     { "add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
-- 
2.39.2


