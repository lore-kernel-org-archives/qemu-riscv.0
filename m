Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg2Rj-0004WV-2p
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 07:52:31 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2Rf-0004D7-Ji
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 07:52:27 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2RZ-0007jV-Rl
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 07:52:24 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-17ec8963db8so4446691fac.8
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 04:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EbGNFLVkiqPgbxaUqmz1zDM/6rQ/gc8PTX9QSSUbkHs=;
 b=E49NmsWhvxdZv5mtWSDxG/qt0FdtJ9mfu9FedLNihRMlEi6kVRqnFqqhJNf/Hsqq6S
 gR5DFrqrevd5Lr1LmBs+cs0X6wcOTD6znrYif7cNKA6h9jDQpoB/+N/JqaI8XZfZ0Z0i
 glge3K7OoGPv4IU2Bm1VbjLfNQhHCZspVNeUjF6uk7kfFA19GzuHH3CAq2twsBkkgdyG
 Z9T2duHNATZ3i995/vFVwbr1EOTAGbZrMbBA0110uOiql9Pl+xTsPlxhQ6h8uoCzfC+v
 UF5trYmtJwjzYKIsjB9DgJXw4e9t3VpV0IPsgwEtXy0/TcIf5HZcKE7S3FCEXYMHz/tw
 /2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EbGNFLVkiqPgbxaUqmz1zDM/6rQ/gc8PTX9QSSUbkHs=;
 b=KrG+99oN6tGVIR0okwSkDLkxJc7Nx855tGGb4aqbpiG7WAzn82ntHNKgLnxj2eR5hp
 UOEFQVN0SYWYHoNOOP4PCDmAe8k8I41bjXRDeVvmHkOdXGhNZP/90C55yEQgxS6Wy3xd
 GPOcNHyd2OkIZqtLNf6ozR5F1qvSgVFuXVcmeI1v3vO7YOHA2C5Q2kRPj50QzSCXW6ky
 VldTB0ofE8p4cF2XRG/7VYofSKr6rv4TMXETUzHQHBc6RDEiii8TRgKsVWNLBFN2GO9W
 DrmAJwCokt6fepctUvlX+WYDMq9DZG8A3ThKZ3d+FUzWotUKrqUqFdlGdLoL+cOBzP3T
 rZ9w==
X-Gm-Message-State: AAQBX9dkdgi2Ornm7lFt3A/wvRV9KUT/KTvT/cMd+fnY1PznQgenEYtL
 56wkCPQXUJZaU+zRVT1lG/Aq/ZixMrI1CAfTB5E=
X-Google-Smtp-Source: AKy350aTa3VPVvqTzxSdnc6xjuldI2NaHAOCXD97O3QgrAvlt6BQI+nmAgdLgVxyNSL8vZpOLBWl2A==
X-Received: by 2002:a17:90b:180e:b0:23f:ae99:3c94 with SMTP id
 lw14-20020a17090b180e00b0023fae993c94mr5094749pjb.23.1679741691002; 
 Sat, 25 Mar 2023 03:54:51 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 23/25] target/riscv: Merge checks for reserved pte flags
Date: Sat, 25 Mar 2023 03:54:27 -0700
Message-Id: <20230325105429.1142530-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 25 Mar 2023 11:52:27 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 850817edfd..82a7c5f9dd 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -976,14 +976,14 @@ restart:
         /* Reserved without Svpbmt. */
         return TRANSLATE_FAIL;
     }
-    if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
-        /* Reserved leaf PTE flags: PTE_W */
-        return TRANSLATE_FAIL;
-    }
-    if ((pte & (PTE_R | PTE_W | PTE_X)) == (PTE_W | PTE_X)) {
-        /* Reserved leaf PTE flags: PTE_W + PTE_X */
+
+    /* Check for reserved combinations of RWX flags. */
+    switch (pte & (PTE_R | PTE_W | PTE_X)) {
+    case PTE_W:
+    case PTE_W | PTE_X:
         return TRANSLATE_FAIL;
     }
+
     if ((pte & PTE_U) &&
         ((mode != PRV_U) && (!sum || access_type == MMU_INST_FETCH))) {
         /*
-- 
2.34.1


