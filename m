Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2ufF-000204-7M
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 07:36:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ufE-0001wv-39
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:36:12 -0500
Received: from [2607:f8b0:4864:20::1031] (port=37839
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ufC-0003GV-0W
 for qemu-riscv@nongnu.org; Thu, 30 Dec 2021 07:36:11 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so27859920pjj.2
 for <qemu-riscv@nongnu.org>; Thu, 30 Dec 2021 04:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uEC+nT7GSuMs5k2atfg2OTN8B+1uoC15pio9zVoZPtc=;
 b=12xUuyWmkFP/GtDW5uFyI7LdSvBfGAbaeJY3e/rWgs2OUg2y8tq+iKuXYqf89ckORJ
 OLk9EFRcUj2qGDCM6v2soyOrRabZbqgQ1DW01O6tNbVE/zkCSZgQ1Z1deCf997Xkqc1e
 Pi18zjEFgo9zynYZPJ0H0hPPbVM2e9sXD1jR0aeYpdf7HIiNQFBUV4M0lU1qpb1SSg5i
 cIKDwoRWhEwNzMGr2Jj4KyKG9dgJrMyMPOo31KtDq4y07HEAid649sJJGvftf3A/FpTf
 Gt83rcLJSHGvJhMOwxwWYIHGmpf1knvRGf72mkDe3Ime3ASz/dZraxM8+vdFapp7dGhY
 eMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uEC+nT7GSuMs5k2atfg2OTN8B+1uoC15pio9zVoZPtc=;
 b=i9rhjV+7GhA8o3TjDoFOUrJS70p0QNdDwRfS3OSqUVMdbCnqZY1b0Kek6wDBlfiolM
 BBvRjgVWNjloVaD5H2OTR5cRsQLNLp84zrPDgl2At560jX/qrm5m1ShFTYix3UqZm7j3
 +s6GLvy2ekvO7duHk9i+oHptkbyD6QYgPXDdzGQIEZNK2olAnXLcjHE8rXpij6pfa5SN
 6qDqOcrAe4kYrouMtsm5i3HYkt9wa/FirdH7C2Eqff+JoYA+DdyQLs7HlZIbW6QF4mQ4
 DLIxJADb9+r/kt7sH8nli8khxUckDboaVlJcTpCJ+s9G9cK2abq83fvrrEe0bcMrUAJu
 Zczw==
X-Gm-Message-State: AOAM533cUEfSOBdYRC42J2lEDtq/4SfbHwudImjOfnaHRhApSyrf/bp9
 Vn5YMCxzfpX8RUw39eh2PMPPYA==
X-Google-Smtp-Source: ABdhPJx9bptPt6emeyG0ysriNmJHc3F2fc+X9vk4vLsBPL++F5yfUo/VwLxwki8w1twMabYVtkvzJA==
X-Received: by 2002:a17:902:7c09:b0:148:e02f:176b with SMTP id
 x9-20020a1709027c0900b00148e02f176bmr17383296pll.130.1640867768784; 
 Thu, 30 Dec 2021 04:36:08 -0800 (PST)
Received: from localhost.localdomain ([171.61.71.9])
 by smtp.gmail.com with ESMTPSA id a3sm28588348pfv.47.2021.12.30.04.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 04:36:08 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 06/23] target/riscv: Add AIA cpu feature
Date: Thu, 30 Dec 2021 18:05:22 +0530
Message-Id: <20211230123539.52786-7-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211230123539.52786-1-anup@brainfault.org>
References: <20211230123539.52786-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=anup@brainfault.org; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Thu, 30 Dec 2021 12:36:12 -0000

From: Anup Patel <anup.patel@wdc.com>

We define a CPU feature for AIA CSR support in RISC-V CPUs which
can be set by machine/device emulation. The RISC-V CSR emulation
will also check this feature for emulating AIA CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1bdd03731f..d0c1725eaf 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -75,7 +75,8 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA
+    RISCV_FEATURE_MISA,
+    RISCV_FEATURE_AIA
 };
 
 #define PRIV_VERSION_1_10_0 0x00011000
-- 
2.25.1


