Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHw3-0006K3-NT
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHw1-0006GW-ED
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:47:21 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:54906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvy-0002Hq-Pl
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:47:21 -0400
Received: by mail-pj1-x102f.google.com with SMTP id np13so6641919pjb.4
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fvPwk7n9vJdvdYsmVlfOuImPXPXG52Au8SLcvzIOpkg=;
 b=nGmjhCV4EEv3A2lZPsGSg56k7Lt0AHpyDVr2Wd87VUyy8OpIuAH6C5P4Uz8lO7MwPL
 fVPN2Qxvv+u9yPux3WcKQ4crcZoD9w/ewWaryL07oHyOmCRJCoUTpFpdf/XsKgEz2Ir7
 mzwfyw9Y7Mo0iLQkG1Pceh99ZVKLXZ21VXs6imJXhcHmxmZbejlaYKPtepZ6/tefQmk5
 2dDcp3VySyl3BmTu6cvmvnuZWzyVPinUoSJQ46+AkmzVNeVsOGWBngTsJe57/fPDcIsw
 br5Z500fZ+D23+lnYf4rmbio2/A9l6Lx/GToq84od9iOEshKYn65oy0w2kzSvc+NFYHV
 bKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fvPwk7n9vJdvdYsmVlfOuImPXPXG52Au8SLcvzIOpkg=;
 b=l8xsA9aGDUlY4+cDwfoBhB2Ac8Heb9FzZScYXg8hlT/pXVQEA70C0ISQIqFgnnbdB7
 TxYooF0NvSTMnjWlejOjFAZbxIrwu4L0F7AFpX6cYnLImhRBAxYn9iFqLas0Hxph0VJG
 4lx9J5XfzjswcdjPeu0wjdh39v62mfEKMSWByqfNPVZh31PQa8nfLphV4WWNstATy1f3
 /cgFRYSv+6DjivjiLmny72EVyDHUJ/plBdul758NbKURZIaLUgQWoJhq8a2u7rcX1AKO
 e79bRiGHb0Vnp51cdkq7QMv9m2dZgOyNWAi7BdhZEEsd7B1LDe81W/FXY9n5/wm53TDH
 pDOw==
X-Gm-Message-State: AOAM530gxV6Q8YRxI3BjA6XIymTVxkWZc3/IVmuYQRxmkzfnlDPt9hQl
 nZLPFjSuHEoVHB4SxcgU8xAbzA==
X-Google-Smtp-Source: ABdhPJym1/kzkg+MEV6dIUsHZKOMLijIxfR/AbtcYvJoda0q24LrX3prWHi/Gv77bfufd4xHlCtMEg==
X-Received: by 2002:a17:902:f24c:b0:13f:4db1:976 with SMTP id
 j12-20020a170902f24c00b0013f4db10976mr9841055plc.28.1634284037421; 
 Fri, 15 Oct 2021 00:47:17 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:47:17 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 11/78] target/riscv: rvv-1.0: check MSTATUS_VS when
 accessing vector csr registers
Date: Fri, 15 Oct 2021 15:45:12 +0800
Message-Id: <20211015074627.3957162-12-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:47:21 -0000

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
index 0fb71875654..688dc1533b6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -48,6 +48,11 @@ static RISCVException fs(CPURISCVState *env, int csrno)
 static RISCVException vs(CPURISCVState *env, int csrno)
 {
     if (env->misa & RVV) {
+#if !defined(CONFIG_USER_ONLY)
+        if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+#endif
         return RISCV_EXCP_NONE;
     }
     return RISCV_EXCP_ILLEGAL_INST;
-- 
2.25.1


