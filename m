Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNlj-0006CN-Sr
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNlI-0005xN-T7
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:01:21 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:36474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNlG-0005wO-0n
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:01:20 -0400
Received: by mail-pg1-x531.google.com with SMTP id 75so9330415pga.3
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HdGLIrBmcpm5HZc7pPQz97TjtpgKuH73SRJUsnw3v6I=;
 b=hmPiXCVUmjmrKUv4iVw09YcuzHB2dB9r8NZJmrJU8EYsmCoye/LVSwUFz5T1RssA+H
 8eUqTY0uLKHU0MRm1boucOC1O720NJu3ABp5ZNqbQzgkZ34YNqwTYOC2FI8+OQFqeMn8
 NX/YdfCv3gJ2dg1eMT5pwWm7c9sphjm95M6/RICRkNstFc1KgM6GMfUO5XbR6Z+AZGMK
 sJ0b3Hy+MDgZFBJBC7QoFjLG/qLVVe56cENGEVI4x6+Bhy+AF2blj1kAJqnNQ+mtmGpv
 loaTjDDOUyTvORGT7vK1aNuLzVul3cKxyV2UmBJCljMgj6ZzVwtRcUPrOoZz0TOzR18b
 5DOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HdGLIrBmcpm5HZc7pPQz97TjtpgKuH73SRJUsnw3v6I=;
 b=4Z0/GOvyP8otQWRAn1lMLn+Bxo1IesPnUH5X9YTJTp+/z1amN1bq/P1eg8QsLJEWgn
 JTmLIX4esrwOqdSFrqapKu48mZ5hoKD8MitcK5X+QmkHv7bPj8FiKfOE49efZSjdss86
 4AwT/5EA30dFYHA20e1pfkNtFu9NUejTEG9mqAb8T+94FeB9w81geljzLYwIA3Kz2vbG
 hnTAHHDacLqXqwT+y3Y7gFDLXD2l9pSkUr8vt1HH0SZRGaAe+YuZoJDDCR/PlZyshUWL
 pKbxBagPpiBJGEzr48C67gd6nrS5UDYsQe9YJKgN5vDVABZ9zzWdmovF2J4rrieZt1+Z
 KQ1Q==
X-Gm-Message-State: AOAM532VxrfnKkjLo+kwa8W9cAUnZHOcyP1j695mj7lFzsPXeJ59X5jh
 T9EWJpxcjkig1iEw0DjkeF+qMg==
X-Google-Smtp-Source: ABdhPJyjXdPa5LLbX4b4AZ1LViRZVeJJX0qL+ivj1kQxf2StXIwxJUMi7C0lwyGMQRNgUYSuTNijww==
X-Received: by 2002:a05:6a00:2443:b0:44e:ec:f388 with SMTP id
 d3-20020a056a00244300b0044e00ecf388mr9329853pfj.7.1635498076292; 
 Fri, 29 Oct 2021 02:01:16 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:01:16 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v9 28/76] target/riscv: rvv-1.0: floating-point classify
 instructions
Date: Fri, 29 Oct 2021 16:58:33 +0800
Message-Id: <20211029085922.255197-29-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Oct 2021 09:01:21 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 92a0e6fe51e..f61eaf7c6ba 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -586,7 +586,7 @@ vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
 vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
 vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
 vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
-vfclass_v       100011 . ..... 10000 001 ..... 1010111 @r2_vm
+vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
 vfcvt_xu_f_v    100010 . ..... 00000 001 ..... 1010111 @r2_vm
-- 
2.25.1


