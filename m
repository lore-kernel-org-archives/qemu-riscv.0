Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6du-0004kk-OC
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dQ-0002vp-GP
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:47 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dI-00074q-98
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:44 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f178da21b5so30874705e9.3
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097834; x=1685689834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IuwWU1uPieHcXl9aK8i752yth75yKtHblQaohZpSR+k=;
 b=y92PkcNOpzq+QHGKF1ZrxtDQYUzUeOSQwnRrPHcw2qxlOgHljRVQcn8iZJ8frAW2b6
 93Xmrk+Dx9CZ+oJ+zLgDiAzaixPD7GHC1QcYSHRA5XRycAAW/HKpcyanbgjLcPltfxM8
 ApnJMF6msIP1GtZ4ITEOgutPWlizglZ8bOgwXGcUYRoYq085NBvlTRlzypg6KRUpdYgN
 aPjxV7GsMk4T1Bo6aq7flRTQcozgzPWnKnniaCyfUFhGqeVyZ1jpEYAy49By+I2nXxWP
 srnyOPWtLjA/+18WD3ABDj6uvuIMo/afJlYGx9znIPEYksIVLsrseNXYe+IyY9O9cbde
 xUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097834; x=1685689834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IuwWU1uPieHcXl9aK8i752yth75yKtHblQaohZpSR+k=;
 b=VD+EMEkr9b+2eoi8foQA28Y/eqFIhwEoAX2kS6amHISZV5l2UmdfmObfzUhotmw+jP
 +LiA+kdFRm1AQ2sTDALzV1uFoXNMtKhI0CW7dtO4Lg2iuMavvOZVnESSMHsGJaVtWOMZ
 I+7pBEO2jiAP5lpVGiLaobiWnMipXtVj3NvoIaef4zmPTq12g4RM1GPtIQ4orWeJ95Uv
 NK/+aLFO7OWrjG/5lfyXm70n/BQBcNjWacSTK2Znm2BhWzbBYN3VBbSci2m26Hq8GDVt
 cyjpppyZ8ZeCAnBpZZ39kdBl88Z4zPVx6bL+HqnVUA6DUEXDr+TYJnfBD856ta2AKQyH
 FV1g==
X-Gm-Message-State: AC+VfDya3DDG2qP3aetlo5aJQhZg++VwHbqnshjWMavID7pCU0dEQnma
 6/wga28gppf2snESd2L6Lk1kDQ==
X-Google-Smtp-Source: ACHHUZ49isjk+60aeAYgXdpcIbeFFKV9lpdIO+pfJjqpiBPanr5EL1lis8OQ5KNdlyR8wScsKFOogA==
X-Received: by 2002:a7b:c85a:0:b0:3f0:9e2b:22de with SMTP id
 c26-20020a7bc85a000000b003f09e2b22demr14347444wml.22.1683097834050; 
 Wed, 03 May 2023 00:10:34 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 48/57] tcg/ppc: Use atom_and_align_for_opc
Date: Wed,  3 May 2023 08:06:47 +0100
Message-Id: <20230503070656.1746170-49-richard.henderson@linaro.org>
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
X-List-Received-Date: Wed, 03 May 2023 07:10:50 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index f0a4118bbb..60375804cd 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2034,7 +2034,22 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
+    MemOp a_bits, atom_a, atom_u;
+
+    /*
+     * Book II, Section 1.4, Single-Copy Atomicity, specifies:
+     *
+     * Before 3.0, "An access that is not atomic is performed as a set of
+     * smaller disjoint atomic accesses. In general, the number and alignment
+     * of these accesses are implementation-dependent."  Thus MO_ATOM_IFALIGN.
+     *
+     * As of 3.0, "the non-atomic access is performed as described in
+     * the corresponding list", which matches MO_ATOM_SUBALIGN.
+     */
+    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
+                                    have_isa_3_00 ? MO_ATOM_SUBALIGN
+                                                  : MO_ATOM_IFALIGN,
+                                    false);
 
 #ifdef CONFIG_SOFTMMU
     int mem_index = get_mmuidx(oi);
-- 
2.34.1


