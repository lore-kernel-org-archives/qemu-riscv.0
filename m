Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1i6C-0006gE-0S
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 00:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i60-0006RY-Jx
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:36 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5h-0001Wx-HV
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:36 -0400
Received: by mail-pl1-x634.google.com with SMTP id j3so2430413plx.7
 for <qemu-riscv@nongnu.org>; Thu, 08 Jul 2021 21:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a9fFt/OsBBNeqd2GgITsOvAQFQxqc8/6WAR/vy/k/Xw=;
 b=eMr3FHxZndFr8anybtBF8DTSreUootsdK/Y8ylvRqqU1dABB2W6nsZbIkawnCtvKmi
 IlicbULInGKvZEO4HXVy4K+qjYXGV8Ae/welJYNTBQExgQ6tt2nii9EPZwA/gdDbJ0Qh
 NrMgadsjszUPUzH3VGMS8+GlKzLeUhVMhAgzx5vT1n++2rQpTc0IES9IfS8EiVzUVRzb
 vx3R9GDUjb5XiPReWXVxVPkOWYBv/s053ZrwsjnKJSX9E6n+NNUFOa6E87GvEte7P7H1
 439anK0E6dk9QnsQBT7xdU1d0jvkSACEs1zG8pk3cDaTNcrtCa//EzOUqSiCH40kDQ2u
 vU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a9fFt/OsBBNeqd2GgITsOvAQFQxqc8/6WAR/vy/k/Xw=;
 b=o1AO1+/UigWmnzCaBeRBrxuWHjGNozkWzG1kb/qxLOUJLGOV0SXgd23UpnCFlwfzRi
 9wm2LoE1Rzy5Ifdou4EAx6lch4aXZry1NbL/dGZF+EZEAffIqjaKZASSqoN4i8LxYZnw
 q12mxxLlii+dIUu06b89Y0gxNzYpKNaQBf8QcaUECrHQPUoieuFR4QEDAyKJBRxox/It
 BqeiQY9NA4lVka7VkpfAGImO6fmphl3OMr7Nqf86OrnAwj1dIbOf3Qv86+5mO3Mezhf/
 Ytvv0Ayv8pkSDXA9+kFZicAsM6n1xMMsz0R78FptGOHb/PSUxRNONr0QpGEOb83cQoma
 POzg==
X-Gm-Message-State: AOAM533WTJ2bfK/82/HAjBmNFWMWy7dFDhEMjZy6kkQI6LrsP4wdV3In
 fmrjCNcgLS+w86N9RJjSHu/pww==
X-Google-Smtp-Source: ABdhPJzwEKWVTVtwCE9l7sse8HUklrbzGbU9RKe18KfMFeGVRxrul7WnibjJ+Yd9IU6fSSzgKEhDOw==
X-Received: by 2002:a17:90a:880c:: with SMTP id
 s12mr31960030pjn.72.1625804776357; 
 Thu, 08 Jul 2021 21:26:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Subject: [PATCH 11/17] target/riscv: Use gpr_{src,dst} for RVB
Date: Thu,  8 Jul 2021 21:26:02 -0700
Message-Id: <20210709042608.883256-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
References: <20210709042608.883256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 09 Jul 2021 04:26:37 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 9e81f6e3de..58921f3224 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -423,16 +423,13 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
 
-    TCGv source1 = tcg_temp_new();
-    gen_get_gpr(source1, a->rs1);
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
 
     if (a->shamt < 32) {
-        tcg_gen_deposit_z_tl(source1, source1, a->shamt, 32);
+        tcg_gen_deposit_z_tl(dest, src1, a->shamt, 32);
     } else {
-        tcg_gen_shli_tl(source1, source1, a->shamt);
+        tcg_gen_shli_tl(dest, src1, a->shamt);
     }
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
     return true;
 }
-- 
2.25.1


