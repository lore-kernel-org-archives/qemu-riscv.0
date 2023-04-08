Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyYP-0007Sy-Rt
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYM-0007Nu-Be
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:46 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyY6-0005Xd-1i
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:46 -0400
Received: by mail-pl1-x62a.google.com with SMTP id w11so368675plp.13
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FDeASIhXoXuX3vLvF4wYaR7o+wyDzGwiI17/AXuSlGM=;
 b=bX5r0PoiTGPh+kw7i5vjujE6O4dHH9iKb23m1GNMZ5EBw8thUk0VNZ5M5gKuLfMjKB
 ijrrv/6b8FMM4djGDY/HE2cizf2MhcX5xxATBXSQzVc4TKfJZYcfhRk70AUqmp8s4dEZ
 KLRollHOEjdkgFi+mbPDX9fTD1RA3dwQ1jkrKd1HzPbFLORIe3Kx+D9E2+bJeyq6lpEg
 u6PRVs1N8HyzdKhNQVFQLokVihNorFtpvuw2h7Ti5RjUzQY6sJtxb3O9Xwh8Hso1xVn/
 Gm7KTTYugjTh/AzTxX9bOW55MkEuwXesNG4J5GnKzVwsdMexDnC3lL+nbKGb5MYNHICN
 JgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FDeASIhXoXuX3vLvF4wYaR7o+wyDzGwiI17/AXuSlGM=;
 b=o8cj9cV3/J6dEL9AqYsqKPDhOxasL9FQ8a+oV+Gl0bI8I/883LERbM2u7IyF87o9V9
 RDcY1ER9I2cgMdzkgN2sIE//E12gqQjmMC8Dx/BUFDwqS1icYOyO64hoHG7GpdTFNXAP
 dAeAauRBOSawcrg71wcTu1SEdrnFzGvmE5cJrdEYr8azlHYex98bQAGxIMMniKXHbAN9
 +SaZEyTu0DzjseH6MjSnvEjCF/nEDWdRfjcF1MC0z1LuM+NnX9urCipo0QZeUnp2U79s
 Lckz6NFwVjThIDA3A0g/6LcJOgogHKVp/Lt6qbpusvfxRDjII6x1Jhh5+k4/3Ubv+WtT
 UQTQ==
X-Gm-Message-State: AAQBX9eXGhYZCVEddd0V+pTj2FvFRKb/frV4V5p1Y9FCW4fzKcz1a2IV
 UaB8EzGfOfV52XYRwri0BZqNzw==
X-Google-Smtp-Source: AKy350brlMqd7F1ibt7xsBb/+NvTFqDEQXuQQa/rlEhkM0CPq/wGUQjTbq5nKEDqTHr1drnE8Y8JDw==
X-Received: by 2002:a17:902:c111:b0:1a2:9051:f0a3 with SMTP id
 17-20020a170902c11100b001a29051f0a3mr4066030pli.24.1680921809232; 
 Fri, 07 Apr 2023 19:43:29 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 14/42] tcg/i386: Conditionalize tcg_out_extu_i32_i64
Date: Fri,  7 Apr 2023 19:42:46 -0700
Message-Id: <20230408024314.3357414-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 08 Apr 2023 02:43:46 -0000

Since TCG_TYPE_I32 values are kept zero-extended in registers, via
omission of the REXW bit, we need not extend if the register matches.
This is already relied upon by qemu_{ld,st}.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 818e7cbc3d..71a2bff234 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1306,7 +1306,9 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
 
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
 {
-    tcg_out_ext32u(s, dest, src);
+    if (dest != src) {
+        tcg_out_ext32u(s, dest, src);
+    }
 }
 
 static inline void tcg_out_bswap64(TCGContext *s, int reg)
-- 
2.34.1


