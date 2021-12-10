Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvamR-00039W-3F
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:57:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamP-00033N-Gi
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:57:21 -0500
Received: from [2607:f8b0:4864:20::1029] (port=42948
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamM-0006AE-Jg
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:57:20 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so6866685pjb.1
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1VmtjWLLaITyA/tipDAtaMtQ7I1x6XXgAVuqbhBYJ20=;
 b=nkiVwOvmnsSnjF4zOuOkiaqTd8SbJEggmvbfyuWbVxiq2UQbB2yWLK0qEX0p7tcPc3
 9ht/1IowTmXsHE9zTrEr/yauxXYqfC/eQoTGShhpyLem5JWXjwILSUFkgjWyS10oFWYk
 tQ8hq8E07BoUaPLGNqkpvT/rffFChj/P9X94Gq461Jb1y8GLY3O71+h2YPzUL3jr8qg7
 LKVU6prWmyNC7sPoQlc8X2qdU/L8K4QoE+AuIZ+KAna6UbCOOqVmxIXn1Nhs2dqS+tnL
 bf4P1GuFqAx8hZYxVHqLJeEHRw9tzxYDGwT+xSLukMhTatUSzF6szT8wm9AAhbO3Fgu7
 EbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1VmtjWLLaITyA/tipDAtaMtQ7I1x6XXgAVuqbhBYJ20=;
 b=2gX4T+8h2WCg3a+mXLFJvZKdXPcV0Xaooy0oDHXPmFMv1mMwMbEzDHYtrclVKQ1Sm2
 zOnkYe++WtXcYkYVQ7IZ9CX2cOqmasOb4EbYm3sLqn5jxqF+0uO/sk9Rq3N/RkBadNCv
 BJmI3AF1zRo03l0v3EjUw/RsvHetP5v7Xr1cYUnJ7Ci1RCrI5cxg+7xOHncEZuG66R83
 bcKhMSIh+tMWav9sQOE7kBkVGF3+Cupp8bfkwHh67gs/05aS1KamE9SM8cE/ob3uzNry
 RJ8fxaiytrHerUDVYpIBXqArdS2Ak5RDEmTQ25q2Y9EUv6uwT1xjnpjMBn2atHq/wT7s
 1lKA==
X-Gm-Message-State: AOAM533YTMP6XqJBWhweT9ytEG1a0bzIQkZMI6mSuFxJONFKD64mA7s6
 tX7MHjcEL9iN2c7vbMElG5kCFg==
X-Google-Smtp-Source: ABdhPJw2jVjXps5zd2+hNWBSmzcFme/DecAQUyS/QpONfMn+CFlbsg6uUgTU3zxJrO/B1RUC/uGqVw==
X-Received: by 2002:a17:90b:155:: with SMTP id
 em21mr22642479pjb.12.1639123036932; 
 Thu, 09 Dec 2021 23:57:16 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:57:16 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v11 02/77] target/riscv: Use FIELD_EX32() to extract wd field
Date: Fri, 10 Dec 2021 15:55:48 +0800
Message-Id: <20211210075704.23951-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Fri, 10 Dec 2021 07:57:21 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 12c31aa4b4..70f589813e 100644
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
2.31.1


