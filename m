Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvane-0005RO-F5
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:58:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanX-00056x-6C
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:31 -0500
Received: from [2607:f8b0:4864:20::52b] (port=36752
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanT-0006mk-1C
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:58:30 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 137so7407997pgg.3
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k9G1dAW6nMK0cDYaM+i2mYTi5BuGz+8IoxMCYf5y+uI=;
 b=L7b6PIU6pBmpLHkVgH5e8KY/5TMxx+/VN4xTg6fC9E8xQESClf5ZFRP7FDbi9nsNLE
 efh2HsnSp4sXr4JmYhthm3g/FfCy79CwZXYBdOIkrqdNvrc7QvkGhlhkYYnowwc8F+l4
 g0xB4lZCLrHufep69uMod0QcF5yDStW0u+Y1ANtB/fCi390Mq+dAfvMkbit9bTp62h4P
 3dcWTEebs5tQKQrec5ykS9/HA0yBUJQno5S4bVzBGaX0joxLZ3gR3fUARtfANA6qmSHw
 JCLEVMJ7hcx1XE9E8Lr6y4GZN5akD5KtWcPLWNRcYXhL9gxxbFBg1hb17Jmm2wnu6UUz
 CEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k9G1dAW6nMK0cDYaM+i2mYTi5BuGz+8IoxMCYf5y+uI=;
 b=lGLCeokk5Tc8gQgKzErN2E48CNNyAqTx3+j/HvvMnVwKYS6gA+He4u638/YTgkgQZ8
 w2u9MCl7V37721QCNTTbCg77UyIfm2VZgYkOa1RlwTMcFX8YaSuRudW9zf/BFLdaglDI
 xcchOUcQnxBP5D1l/KROKCnJdUFBqAXjDb0bHqxzCTubtT5ogRb4TLdqfQJpEcLUhJPL
 csy/Td4rMGcYWa9aRyebVfmNAo5U+xT6Sgqic3PiZAZVgkBQUE3wygf8aqiQVYCGj0Zw
 opvsC5ViZd97yXGNk4Gipot+l5zqnVCwyM6tLZ7tczkM5oQkBbZ3XZVAI9tX1vlxXb+q
 d0Pg==
X-Gm-Message-State: AOAM533qb8S2ypsWVkww8K8WEhsh1UEfoRmraQEVvUMQs77r5p7YfJE7
 dehZVkwZK9Oe7nG50uvY+2gnWN/Ak3HAbWgI
X-Google-Smtp-Source: ABdhPJwCZMgsT7TNmSkdV/iJKOCDa4LTMEArDMngOE6FaI23HCNA0mhPQbUY6fCkr8HvWm9fpLLIfg==
X-Received: by 2002:a65:645a:: with SMTP id s26mr23816039pgv.316.1639123105891; 
 Thu, 09 Dec 2021 23:58:25 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:25 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v11 22/77] target/riscv: rvv-1.0: fix address index overflow
 bug of indexed load/store insns
Date: Fri, 10 Dec 2021 15:56:08 +0800
Message-Id: <20211210075704.23951-23-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 07:58:32 -0000

From: Frank Chang <frank.chang@sifive.com>

Replace ETYPE from signed int to unsigned int to prevent index overflow
issue, which would lead to wrong index address.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index df45c1620c..3da4f3b1e6 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -374,10 +374,10 @@ static target_ulong NAME(target_ulong base,            \
     return (base + *((ETYPE *)vs2 + H(idx)));          \
 }
 
-GEN_VEXT_GET_INDEX_ADDR(idx_b, int8_t,  H1)
-GEN_VEXT_GET_INDEX_ADDR(idx_h, int16_t, H2)
-GEN_VEXT_GET_INDEX_ADDR(idx_w, int32_t, H4)
-GEN_VEXT_GET_INDEX_ADDR(idx_d, int64_t, H8)
+GEN_VEXT_GET_INDEX_ADDR(idx_b, uint8_t,  H1)
+GEN_VEXT_GET_INDEX_ADDR(idx_h, uint16_t, H2)
+GEN_VEXT_GET_INDEX_ADDR(idx_w, uint32_t, H4)
+GEN_VEXT_GET_INDEX_ADDR(idx_d, uint64_t, H8)
 
 static inline void
 vext_ldst_index(void *vd, void *v0, target_ulong base,
-- 
2.31.1


