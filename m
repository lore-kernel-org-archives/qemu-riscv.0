Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyZX-00025Z-Rj
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyZ7-0008W6-Bd
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:35 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYR-0005sv-6g
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:33 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 d22-20020a17090a111600b0023d1b009f52so2769727pja.2
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7nPBJFUV0lX54ZMpUCSnQezprz128nst/H5IYSZCsHw=;
 b=TiS/X/9z9vAJ/AtN9LcuqJIn24hK/cJn0T0PsWujj1S3NELmozS0gYIje3V4giix8p
 dyVCe/9d9Y/v+E93aJA0ZyJSqDYRY3DYYvKoSWOmuLJLEo+0YIqBI1EpmpZ0Qa7ImuKu
 sc9EBXYaWug5Z7whvvZFeb40QoyH+2v3Zre5HfUcekxIb8VlSmrd6oeO35D/DGQk36eL
 qSTQfBKTbFAx93uhYwm0vC80EH4i/DFxxxFIJ2BcxWm8ly24t+dtAFbX8TARZbZ23Mld
 fY1AtLxDLkJ9uP9/m1G/duCoUxrekaiGD5Swi6rB/fAZvnVSgHnUZftMKqv4v+c7yyXT
 8Acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7nPBJFUV0lX54ZMpUCSnQezprz128nst/H5IYSZCsHw=;
 b=WZOdmjXu5HeV8NbbzGPZXDxPqsFCkwdQMMMHbSFeHD1LTM5Mc3Unq3sbt+VSuWW6bl
 MjLYc9zXZkYgVNaKvEdU0V6XcBUtWKMn7CKPZjVIg7LDesvQ2Iccf1YrLPwcDa9w1S0C
 KGI2iQPEV5VFB2mucZAMj71LU5xh45i/L0qEdsl7IzPGZYpOQYeRlELeUD8KLILvr6hr
 W3sUCHyXOTryURHN3LbCdYCpbXhmAKyEQYaAIShpqe+yc2ya1s5PSwKMzTJzc5B+qcR2
 yqunpp/aL/8CYXNSVb3nJvZlb9kf4lxPA76zKUo450/VW+wTtHn6fnm7TfFxXaBhH02B
 9NSQ==
X-Gm-Message-State: AAQBX9cJXSiuWNsk58v7LXqHRuDQdvzQO8CjLKtiuz2C3k3XVXExqUDN
 XTuqVII+yf6PI/nskal32VTqhw==
X-Google-Smtp-Source: AKy350YKdtVvB+Swi+dxev+Yib3LVfkuU3Kb8v59yfk8fKFQ0eZYUD1YXMB3Z+eKzp2a/J7sjYXmag==
X-Received: by 2002:a17:903:228d:b0:1a1:f5dd:2dde with SMTP id
 b13-20020a170903228d00b001a1f5dd2ddemr656762plh.44.1680921829385; 
 Fri, 07 Apr 2023 19:43:49 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 37/42] tcg/ppc: Remove unused constraints A, B, C, D
Date: Fri,  7 Apr 2023 19:43:09 -0700
Message-Id: <20230408024314.3357414-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Sat, 08 Apr 2023 02:44:37 -0000

These constraints have not been used for quite some time.

Fixes: 77b73de67632 ("Use rem/div[u]_i32 drop div[u]2_i32")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-str.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index f3bf030bc3..9dcbc3df50 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -10,10 +10,6 @@
  */
 REGS('r', ALL_GENERAL_REGS)
 REGS('v', ALL_VECTOR_REGS)
-REGS('A', 1u << TCG_REG_R3)
-REGS('B', 1u << TCG_REG_R4)
-REGS('C', 1u << TCG_REG_R5)
-REGS('D', 1u << TCG_REG_R6)
 
 /*
  * Define constraint letters for constants:
-- 
2.34.1


