Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvan0-00047r-FU
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:57:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamx-0003vl-0z
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:57:55 -0500
Received: from [2607:f8b0:4864:20::52d] (port=44831
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamv-0006Hc-Kh
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:57:54 -0500
Received: by mail-pg1-x52d.google.com with SMTP id m15so7358342pgu.11
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6RnqLoIMtIKL3HM6SV5JHjayAFC1Eh8hEupFhHM74x8=;
 b=fQndGaAONu2GFkykHlohkr/+pU+Nz8uEqjzQcun3iW9fyXpelumeCiovAdyLfHUHG1
 cNtTiGErjYpiPzf7uowh6lJSNSXArijD/h2rVlP1VWSv/Wv+iVt1b8J0XlvGuPrDuwGZ
 +iWdrej0XEBzPH+PXjFfrDh0PLh2vPZeyM+7GHb9pz9c3NhmlJInWPjRpidXn4vmlQWJ
 b/MUF4fTeDhM+vSRKNcAH1PLqgjeelz20QUBAbZ/r143nYvQXAMp/AhvYvjwxSvK5a/E
 WOPqgSe0zv4GNpCbt01jTKXedwngNMo5DphRp0HzjbakO//ljExmd/B2OZNJ/93RMc9O
 0Fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6RnqLoIMtIKL3HM6SV5JHjayAFC1Eh8hEupFhHM74x8=;
 b=inKJ2fd6ncV2fMQVB4kJ4ecD7y6ONwpcBHDwqa+HmKSmxH2gULx7HMnWQlzSGtfkdy
 3bIJGxOkbCxgR8XWWcl4Wweh2ySq+QZ7msON4tL23kBnLfFncL/SP9E3FUUVZEMhMGl2
 f2QWXeDawCoRFKK5+PSliHkDJKG1Jp1ug3xWJS8rOzpwNYcme2Ql2bCCYpDFsDRHuEsd
 eb17NE5lg2mtpYnI94oQJRX/ZH41kP/difCfGb5SiJGck0m1VeUtrkiP0jy7u1tG7nEe
 dD+o5bxjJvBWSGwUKPpDimT404/jjGTYRcKMYSunwVZUJzNx447K5kWTVtwzylbiC5bm
 pqWg==
X-Gm-Message-State: AOAM532QaZGrpFL96N780WZacR5dGaKVZyplV2kdMDhLelELwfR6Yulw
 pAz2tedl+/7wm0Dsj8+bVeRxXQ==
X-Google-Smtp-Source: ABdhPJyv2vI7fq97JrtejJk6Kr9wyOMdY7PSu0JYq4Ib+d4qADEDXMHjedJlsYZ01hOGeTmTdabKAw==
X-Received: by 2002:a65:6895:: with SMTP id e21mr2634253pgt.546.1639123072377; 
 Thu, 09 Dec 2021 23:57:52 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:57:52 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v11 11/77] target/riscv: rvv-1.0: check MSTATUS_VS when
 accessing vector csr registers
Date: Fri, 10 Dec 2021 15:55:57 +0800
Message-Id: <20211210075704.23951-12-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52d.google.com
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
X-List-Received-Date: Fri, 10 Dec 2021 07:57:55 -0000

From: Frank Chang <frank.chang@sifive.com>

If VS field is off, accessing vector csr registers should raise an
illegal-instruction exception.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5d1eec1ea0..3dfbc17738 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -48,6 +48,11 @@ static RISCVException fs(CPURISCVState *env, int csrno)
 static RISCVException vs(CPURISCVState *env, int csrno)
 {
     if (env->misa_ext & RVV) {
+#if !defined(CONFIG_USER_ONLY)
+        if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+#endif
         return RISCV_EXCP_NONE;
     }
     return RISCV_EXCP_ILLEGAL_INST;
-- 
2.31.1


