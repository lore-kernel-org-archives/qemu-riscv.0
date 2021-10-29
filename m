Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNjf-0004CY-8G
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 04:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNjd-00049I-6J
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 04:59:37 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:38449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNjb-0004Sz-N4
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 04:59:36 -0400
Received: by mail-pl1-x62a.google.com with SMTP id i5so6407006pla.5
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 01:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m3TlB4v4OvGuye+bayybDFINi789G9gn0hTUvZHgOfM=;
 b=Md4D6jd2LhYw9Lc6QQN9kW0FGT06SDypCIZ72gn0A7mrWV6JRqZWcE5INcvpkZBEAL
 ofFBaurhR9+XsYvqb2uVO9oJTd/PAqK+920k4eSIHT/CH/r9o1TGTnKF4fOL4clpMASd
 /D8U23Gdkq1aY2cgqI1s8Q+2SLMZS6PJIk1oVCnKJajWg2muxEKsp6/F0rxz6zjEoDXX
 DTjKuBoYxqksRZlzt3u3icF8iowRZFbAFbehXSMxT9cEcu311LNLqv1y4Hn8rG41KlrR
 +CAjn0P+dRmeBepg6XaI9YIogHsTzq9eVAcuruogQUi9FlAgthxNNIQzs/CRyDE1ptbR
 zlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m3TlB4v4OvGuye+bayybDFINi789G9gn0hTUvZHgOfM=;
 b=KCuXaUdQ1B/PxlEwTwcKPd2X7wWNa7hWeGCCDQeneupKV7ga5fqrZ8ppKKh8tURi1C
 PJN0VnFZA3n86wQsQRfoxwXMMBXEmP/lbatI9/WKAQlecRmYeZOiD1mNBr94stGy4L1X
 iGtCqwTzV/Etrd98ajuYazQxH/29d1vYtQ8fU8PEtL9E+BwBhrsmGR/07/UyNB25qRNF
 6cgnapTdGnYgCrODmU7mWiL99FGjMI9QVOF8dOjt7xw/9nDTLETaSZ8ukcIgbRIEti3A
 68GQPU33EpwofxXiMZQ3H4QPe9PWz/m06q6ge+UNcKkiO5Tus3Zkr/NnQ4KH3HkaqnBb
 gQDw==
X-Gm-Message-State: AOAM532tsLKxviSIHrb5RmRH42UwSHmkfncMkZhHg0d7pMCbS1SO1ItJ
 KWrKwbbwG+Y0UFoC3t0R0Uvx5g==
X-Google-Smtp-Source: ABdhPJxezC62XqcYQjYudfntcTOpIZCGg53anZ/Wz8fchn/9PZ2F1DV/ddC7ENxqwWhFmTpvVBYBMA==
X-Received: by 2002:a17:90a:4890:: with SMTP id
 b16mr10486347pjh.82.1635497974574; 
 Fri, 29 Oct 2021 01:59:34 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.01.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 01:59:34 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v9 02/76] target/riscv: Use FIELD_EX32() to extract wd field
Date: Fri, 29 Oct 2021 16:58:07 +0800
Message-Id: <20211029085922.255197-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62a.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 08:59:37 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 12c31aa4b4d..70f589813ed 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -98,7 +98,7 @@ static inline uint32_t vext_lmul(uint32_t desc)
 
 static uint32_t vext_wd(uint32_t desc)
 {
-    return (simd_data(desc) >> 11) & 0x1;
+    return FIELD_EX32(simd_data(desc), VDATA, WD);
 }
 
 /*
-- 
2.25.1


