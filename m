Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6dm-0004LI-Dg
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dQ-0002vr-LL
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:47 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dK-00075F-Uo
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:44 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f18335a870so29216415e9.0
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097835; x=1685689835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u6ngJlz4BnT3IPA+iAnWpyxcqcDly3tsfFDXkJo5Tbg=;
 b=H/GKTy3elP7oPl/zWmeAblrkKGUV8xQ80Gj1pICA4e/45V7tGUI+iFM300M2+v7Zjc
 1i6vpYhky+t9ojiXA8LBa/y5wes+PkYbZbwaTS3GZx8rEkKGAlVf9kh5uE1Wl9CQQxMs
 Zu+w7TqV4vfxlCCw2SBqavsiS3FGreKHt8PoShR1972U7y6oyI/kztRgNO5/Aen3IUbW
 7UipN31GaQxtuCERPsvEu26IlGO2H7/1G7cIKo2LSz/WTQ/HOx7i7QpvRu7+qcYTvDLM
 IWYD0WYWBj4uSVmP4LjdmDj6HRO12+o/7Q/HYqJeckpAJX/rucTKE1ZIaf8Jq3T3R2Qe
 o6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097835; x=1685689835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u6ngJlz4BnT3IPA+iAnWpyxcqcDly3tsfFDXkJo5Tbg=;
 b=H5gWatVm4S/8VvqowbsPXEIwseXHI/4x6dlBt/MWhAwRpgxFTalTls0anODp+Rjc4v
 AH3WesWS34tb88Ct/qEe6jSSCJdaj8FdGN5hDmhqD+hW0CBAgnyMG/synA148gu/kA7b
 jgYK2kOLdx48t172W5553qYJbV8TEhF7nWPOabNlPYQdLxWst+QvtZ1v84qCyuX3oriX
 EREX1212KLJX7X097trDA4rVvQlLdhQNCZXO21WMBHsAoLAqcdFDQPqF7tE75qgyE15l
 s88l33XreBVKMVALdTwSS+k8B9fenJG9kvqCi2YO+peXTy5SE2G0bAo0AP4eM7eQKfBg
 Zlqg==
X-Gm-Message-State: AC+VfDwjchYcVM8CfU5iVEyQZmTZGtqxtUHs6ryc8zoMWh5sCJAN+aGf
 EFXAzoVAmyeQV+3vMHZJkZ3MPg==
X-Google-Smtp-Source: ACHHUZ45dMLSnUU5HfafjsjVH1gjaAHODaY602NWTzwu6WfvSKI4HDdFWxZOi94wBEsHWaILeyETlQ==
X-Received: by 2002:a1c:7205:0:b0:3f1:6e88:5785 with SMTP id
 n5-20020a1c7205000000b003f16e885785mr14757198wmc.14.1683097834872; 
 Wed, 03 May 2023 00:10:34 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 49/57] tcg/riscv: Use atom_and_align_for_opc
Date: Wed,  3 May 2023 08:06:48 +0100
Message-Id: <20230503070656.1746170-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 03 May 2023 07:10:50 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 37870c89fc..4dd33c73e8 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -910,8 +910,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1u << a_bits) - 1;
+    MemOp a_bits, atom_a, atom_u;
+    unsigned a_mask;
+
+    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
+                                    MO_ATOM_IFALIGN, false);
+    a_mask = (1u << a_bits) - 1;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
-- 
2.34.1


