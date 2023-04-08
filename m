Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyXz-0006wm-B5
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyXy-0006vV-8O
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:22 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyXt-0005Wn-Kb
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:21 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 r21-20020a17090aa09500b0024663a79050so1796322pjp.4
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rcNEhGFLchqZMB3huLw45XXaPWISEFJfrSvpuPV2BPc=;
 b=Ea1zZYA0y6DU1+Jpk3XYzqWFvMO+AsIyzT5p0CZL7dUA/MpgPrTLPHQlxxWoNkempS
 X9MT4q+4VuYPzo7OcJXGP+PTuDdVH8riWLRr7CtGHbkafQ47ETQOHtsnRl59TPodpW6I
 EPOSlxf/IAmKkoofGDfUiPNIPv5T5i1lPES3JqOIfHWb+vpehaBEeqMvFXytmlRQzsGB
 jcl6KmkbAjr8P2bjBz1ZwFWy/rVJdU0q5YFOiadGHD4HzrIE/okBTXSJ8SIHHzBbJD58
 d/sUkyq/0D54H27FNVV4jwZz75Kn3T1hn5YvNJs+WblO/fIKuemmmpW3g/YjkSa/NRwP
 aGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rcNEhGFLchqZMB3huLw45XXaPWISEFJfrSvpuPV2BPc=;
 b=HK+uJ/e+UdSL5qJwTxVvWV4+T+rTreu2w1IWpkfUKgFNhxckASunzgh7eqbPcPtw2k
 usoDXsoy6wEYl68BK/W8Ztd7sd7GQnydJjmWeblH6qrMKG15wTbL9du2gjRKVQmEDH9s
 bCYGHVR4V9kQzkE9w/SiHJO8py8nKJ5buCsodcnA8T8Y9FRsNfSLc2vd6ANR9tfbgSn4
 I6Ea5vzUiyMVzaY7Z397swao5XQ9scz33R/kWaFP3kZ19OTBxKiBQi+3wuc1ZP1m2tcU
 qNSyfQzY8N9ZOCmgelIVURz85U3pHbxjQQffShMhJX6/1fab1apLj0wakSMcJglTRuUr
 gNTQ==
X-Gm-Message-State: AAQBX9e1JytUXGeb5T+9ZT5H4Y4NOnT/pzqK0ad+UxY5Qvzj715OTkFX
 jeHj+rJEkLUo7SnbECrLoZdyAg==
X-Google-Smtp-Source: AKy350Yhn0srUEmNpjRdUNHsBk0rxPoNMgBroWV9RbErYZ5rsf/orDoLJWpM25sEP7TyIe9HbSzmEg==
X-Received: by 2002:a17:902:f94d:b0:1a1:f95a:2505 with SMTP id
 kx13-20020a170902f94d00b001a1f95a2505mr8481645plb.29.1680921796286; 
 Fri, 07 Apr 2023 19:43:16 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.0] tcg/i386: Adjust assert in tcg_out_addi_ptr
Date: Fri,  7 Apr 2023 19:42:32 -0700
Message-Id: <20230408024314.3357414-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Sat, 08 Apr 2023 02:43:22 -0000

We can arrive here on _WIN64 because Int128 is passed by reference.
Change the assert to check that the immediate is in range,
instead of attempting to check the host ABI.

Fixes: 6a6d772e30d ("tcg: Introduce tcg_out_addi_ptr")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1581
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 4444eb9234..5a151fe64a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1082,7 +1082,7 @@ static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
     /* This function is only used for passing structs by reference. */
-    tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
+    tcg_debug_assert(imm == (int32_t)imm);
     tcg_out_modrm_offset(s, OPC_LEA, rd, rs, imm);
 }
 
-- 
2.34.1


