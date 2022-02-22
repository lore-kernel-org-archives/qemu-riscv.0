Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMdJf-0005vO-KQ
	for mharc-qemu-riscv@gnu.org; Tue, 22 Feb 2022 17:07:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nMdJa-0005lk-Rx
 for qemu-riscv@nongnu.org; Tue, 22 Feb 2022 17:07:22 -0500
Received: from [2607:f8b0:4864:20::c2e] (port=44745
 helo=mail-oo1-xc2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nMdJV-0005LW-3B
 for qemu-riscv@nongnu.org; Tue, 22 Feb 2022 17:07:22 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 j7-20020a4ad6c7000000b0031c690e4123so10547975oot.11
 for <qemu-riscv@nongnu.org>; Tue, 22 Feb 2022 14:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3g5GZ+uk3CMbwQHosVUdX40FGxQGNQFTnUC30jSO2R8=;
 b=qTEQtAbukFJZMj15HrOKM9ejlBYxkJjKDZ2W0ycz2OvsK3/i1M0AwzMuSM5jcWjo3M
 1b/mtfND4hAuBBGS67Ba+SCzGZ7nZGaemz++GNu2DzEITRQuojYcsGFhYfj8aDyRfUvm
 3KiPR9CqnsIuTBIh5lZSrcuKKRUsR/m5OYEDYjlWMlfkVIfggjYlK14r7va1C/TjgEdv
 2ngZZtdmaqtkttp6VvOBnv5N9VNbieus7tX1Y2p2Pk5J6BAa59HCbePbntbbsC5Mhwno
 yp4ri17/XLPIJVHv5IY0NkTP9MNGyDnKLJS6Tm6dBreToH2NVKHkOKbgBRpyAnCXazOq
 6C6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3g5GZ+uk3CMbwQHosVUdX40FGxQGNQFTnUC30jSO2R8=;
 b=kYAgwz6Ow1m9otKivx3CVhpRlsnfWFp1qNWT3vo+QaZTlNp3wGCJp3K9rl0pQO6VRi
 Fcuh+wbuMDnMWlF0EC4zPcEkdjQ01hQTvbojpeuLrfD8RwewxyMRiVmjMCQ1GI8XFZ7d
 q8MlYtCZekXGrJSJNwvf5Ktjn++9tezqZv/TAsvio6lis2FIXxvue1SIX2XZFcQxhfNI
 3HD5WXzZYHa0a5T4hlVwX2rMtooBx8x698jLJ3ZlE9L9fc2r1EN3L1cDHZWyEAfAiB1h
 AkTxmowtwtWion4LUyZWxwh+QQ/DC42fEB/qeAzX7Y0J4fn77clx52tkDPaf5E0Sy7EX
 OALw==
X-Gm-Message-State: AOAM53260KjUdGiz6zs4Vhi418wUsPlUmVjM1MPYZLLSGkwmG1f+VXWs
 g7pp3IuhN9fSMl6Bfz69tRu8zw==
X-Google-Smtp-Source: ABdhPJzzGlnsxVoUQHG+JSpuTHen+GjPm2PF4uYBy/8cauAULkQ+kQkabUdWFAs+NfYIjknUUotx3g==
X-Received: by 2002:a05:6870:5d88:b0:d3:112c:3e2e with SMTP id
 fu8-20020a0568705d8800b000d3112c3e2emr2710763oab.230.1645567629482; 
 Tue, 22 Feb 2022 14:07:09 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id n25sm4901913otq.78.2022.02.22.14.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 14:07:09 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v4 1/6] target/riscv: Define simpler privileged spec version
 numbering
Date: Tue, 22 Feb 2022 14:06:59 -0800
Message-Id: <20220222220704.2294924-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222220704.2294924-1-atishp@rivosinc.com>
References: <20220222220704.2294924-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 22 Feb 2022 22:07:23 -0000

Currently, the privileged specification version are defined in
a complex manner for no benefit.

Simplify it by changing it to a simple enum based on.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9d24d678e98a..e5ff4c134c86 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -82,8 +82,11 @@ enum {
     RISCV_FEATURE_AIA
 };
 
-#define PRIV_VERSION_1_10_0 0x00011000
-#define PRIV_VERSION_1_11_0 0x00011100
+/* Privileged specification version */
+enum {
+    PRIV_VERSION_1_10_0 = 0,
+    PRIV_VERSION_1_11_0,
+};
 
 #define VEXT_VERSION_1_00_0 0x00010000
 
-- 
2.30.2


