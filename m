Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2uf0-0001ZC-Cb
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 07:35:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2uew-0001X1-PH
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:35:54 -0500
Received: from [2607:f8b0:4864:20::633] (port=38806
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ueu-0003Dh-MP
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:35:53 -0500
Received: by mail-pl1-x633.google.com with SMTP id c3so4948803pls.5
 for <qemu-riscv@nongnu.org>; Thu, 30 Dec 2021 04:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nMqGk0W7XfrdTRmlcJcxhCvTcCA5k+Lt7a0o0slCIGY=;
 b=KyLp+ZSiX1RIvoixxfU97OqYmo8WMXo4zTw4E5iIfxFAsYFmMwK00B6MkraaMbQO7V
 c3RWTKCL3RfX6DLIkX3/n0fQnKKe3k6qIfhhOtPHIScRSPki8GvTAStS6zkuhNvz0SSm
 GWyVig1jKs4RnQcAyLJMFSVtYhk551aZ11rPeCRCJ/1O3wuZEvt2dbjTX8iyQfd6N/EX
 sXqB4UJvXqGMMsEgbrN7T54kE/2XllMaQtgLRZD6Q8uOOHaDK1S6sdoU/ddLt80ArWel
 IeLU5pLbTunPd5I7EWXzCzZ9auNLZl5viL/c/PPeNWZWlzWfVXDxmeGf13c0M1krvbT4
 gwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nMqGk0W7XfrdTRmlcJcxhCvTcCA5k+Lt7a0o0slCIGY=;
 b=XsUEoaIblkKaaA3iqOC6bju1C/uFrfYXxqFJfmWtRPFYsbLi1kdT2X4keDqxAdyaUg
 rUsneSaI9fIzRPzayDFQBgrcVlRWh24i4QFM2Zp4eyeRLoxzNjKhE6e2rI+rCUP6fubD
 Wnpl+iqzlsVEZTkrGI5Cci8+jySf+bo8gJUtIBBrIDCsmRw2ar62NEBVAYBSG1NR/Fmi
 aRJc/xxYOIIDaw+mx6SZV4fl979X6iJnR/MauzuQrZU6pd45F/zGNxLPM9IdohFeGAw/
 xmHbx0UfdRdWMf1faM0XZpd+6zrUumQnpRnaO/RyREwUkDul9LhZQ4fCD7KXE1ZFV3AT
 EHzA==
X-Gm-Message-State: AOAM531mUGHvraKtpy1woKftaNKtyKrjCpVWgxQvc44PwsEkrYTMD9fN
 D2mseO+ruFv4w3k8VqzPBNS1LHuvb3BnWg==
X-Google-Smtp-Source: ABdhPJzL6aj1O4HjU/6ZdJh+9iuhi1r5pVUmVAoGe2x62SIt6e7/PJBUIfd0aPyfRTp6LeJ8U4xOnA==
X-Received: by 2002:a17:902:e549:b0:149:22b4:530c with SMTP id
 n9-20020a170902e54900b0014922b4530cmr30086104plf.17.1640867750908; 
 Thu, 30 Dec 2021 04:35:50 -0800 (PST)
Received: from localhost.localdomain ([171.61.71.9])
 by smtp.gmail.com with ESMTPSA id a3sm28588348pfv.47.2021.12.30.04.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 04:35:50 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 01/23] target/riscv: Fix trap cause for RV32 HS-mode CSR
 access from RV64 HS-mode
Date: Thu, 30 Dec 2021 18:05:17 +0530
Message-Id: <20211230123539.52786-2-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211230123539.52786-1-anup@brainfault.org>
References: <20211230123539.52786-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::633;
 envelope-from=anup@brainfault.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 30 Dec 2021 12:35:55 -0000

From: Anup Patel <anup.patel@wdc.com>

We should be returning illegal instruction trap when RV64 HS-mode tries
to access RV32 HS-mode CSR.

Fixes: d6f20dacea51 ("target/riscv: Fix 32-bit HS mode access permissions")
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 146447eac5..fd7110c38b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -182,7 +182,7 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
 static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
     if (riscv_cpu_mxl(env) != MXL_RV32) {
-        if (riscv_cpu_virt_enabled(env)) {
+        if (!riscv_cpu_virt_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
         } else {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-- 
2.25.1


