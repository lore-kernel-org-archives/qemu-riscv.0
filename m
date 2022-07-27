Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGarV-0003Lp-Cl
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 02:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGarT-0003IO-6y
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 02:49:39 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:45031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGarE-0003E0-5O
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 02:49:38 -0400
Received: by mail-pg1-x534.google.com with SMTP id bf13so15130787pgb.11
 for <qemu-riscv@nongnu.org>; Tue, 26 Jul 2022 23:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ThpLPET2Eini7rQ0D0JXvPWeNVDY+aGeRs+Dr2K+CnQ=;
 b=jwU+pAdFs8r0KYc+UP1g6a+QZdTrnBFHQbT4NlYZ1guCTB60I6TeR4LdtTCsXjeNUz
 BrIFBEAc/El8tKFy30dTzjymhtamoqa67Srajh/jqZVgfZ0pJ35+BOQQGcwoAacVfPTK
 LohTN5HLXU12ewZVP7jaxrk7F72cQUK6J7N4mSB0xVUCV4LFpog54vySNNrIj263PiCj
 MEwWDnJiF65xmRiYtuTyVkIMiokUWV14f96guIN9McffnDYoRgIaJzDJUnXurElQHT3I
 6PcSdoQ9KXss7rJZnpunCvgiRi82kEIci6ur6PD1Fr1/kMe8JSkTGKrK0yX6fEzSa53M
 oTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ThpLPET2Eini7rQ0D0JXvPWeNVDY+aGeRs+Dr2K+CnQ=;
 b=UGvdH8yHO3xVuBMzKThWpBta0z5B/NQxkqNu6/Tt8gzxKXhMjvr2czcSKGEULtAcu6
 UMSYZ22w1Ci38ZINDbdABgssqY/9kvzi2znesJxsZbCgZmOo0nKQyWx5JI8TjybCjDfY
 6Wrcipbgsg3KTVIJecA7fV/GVCu+5Iv0BrCSy6ctzolrPSJMbiSRAAlhBCFqae5hMCfs
 oRcseIK8lKwF0BX00Ki20vcLmXX79AXtrbJleMEvj2RSoSBL26nYmLnSuEY+vvG63TZ0
 nH+RGS1EQqlCjtl7zaMzwCXmfWGAGHnwu2DB+ivaaNBPJZK2f3en5CGkoQVkmfTCcfkq
 MfXQ==
X-Gm-Message-State: AJIora/UgMmI9BWvFOqXdDQs/RNYdn1zoFx3yKjbl1NCMGaVDH/KLcrn
 +Ty0tNHKw73tH5P20Y/Hf3Ah3Q==
X-Google-Smtp-Source: AGRyM1tmRmR4H1JSay0RMgvUN0/v4t8D4E4gn3CAYSGYMnlLYYewq4Tbq01hWG6pq8JSWAEVn27IaA==
X-Received: by 2002:a65:5789:0:b0:41a:4a7c:635d with SMTP id
 b9-20020a655789000000b0041a4a7c635dmr17184257pgr.60.1658904562899; 
 Tue, 26 Jul 2022 23:49:22 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a170902ab9000b0016d2d2c7df1sm12764851plr.188.2022.07.26.23.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 23:49:22 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v11 6/6] target/riscv: Remove additional priv version check
 for mcountinhibit
Date: Tue, 26 Jul 2022 23:49:13 -0700
Message-Id: <20220727064913.1041427-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727064913.1041427-1-atishp@rivosinc.com>
References: <20220727064913.1041427-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 27 Jul 2022 06:49:39 -0000

With .min_priv_version, additiona priv version check is uncessary
for mcountinhibit read/write functions.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ec6d7f022ad5..eac003d6b950 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1484,10 +1484,6 @@ static RISCVException write_mtvec(CPURISCVState *env, int csrno,
 static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
                                          target_ulong *val)
 {
-    if (env->priv_ver < PRIV_VERSION_1_11_0) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
     *val = env->mcountinhibit;
     return RISCV_EXCP_NONE;
 }
@@ -1498,10 +1494,6 @@ static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
     int cidx;
     PMUCTRState *counter;
 
-    if (env->priv_ver < PRIV_VERSION_1_11_0) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
     env->mcountinhibit = val;
 
     /* Check if any other counter is also monitoring cycles/instructions */
-- 
2.25.1


