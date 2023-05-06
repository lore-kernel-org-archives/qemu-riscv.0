Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvCGZ-0005w9-OA
	for mharc-qemu-riscv@gnu.org; Sat, 06 May 2023 03:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCGW-0005k3-Tj
 for qemu-riscv@nongnu.org; Sat, 06 May 2023 03:23:37 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFv-0004Lq-Nb
 for qemu-riscv@nongnu.org; Sat, 06 May 2023 03:23:36 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3078c092056so17533f8f.1
 for <qemu-riscv@nongnu.org>; Sat, 06 May 2023 00:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357779; x=1685949779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WrmqAOuR2/yJANGPopXn5FwM+vXCIwdTliCaNgd+uz0=;
 b=AlTo+1iIaFMaKTLUngVBwZ7LoNaDenv9K07t7v4Drur3M+qp3yNmfrrwBBARTUlOVG
 TP789aXPGsX1hnLD1vfJimaK76dMQS40aecOt7gjlhwq6gtVY4j2dYhSF9jhWx3+yZM3
 sEHSmzKFPNvIIu3x0N/XkqqIeaA+W0d2ilsRAP8v6ljc8sJttI4rWg7hHxuNfzKHYA6z
 0AmT1SEbQ/k9UEBBlloPGtxLlhNPM2PqeWykt0i4fvdSzQb26X6GFT/35nFqihBnHIz6
 E0Y0N1SB65JbVUZQlRr/UmS1Rc7qU7UcFmCzd6v7E7vKlBRCbL3iTSZX2FNhqTi+yggA
 08lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357779; x=1685949779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WrmqAOuR2/yJANGPopXn5FwM+vXCIwdTliCaNgd+uz0=;
 b=Aj1Wd3OkiRbEQYJlCjAbf+txCwCGQPqpX3VLgwmEP+6zLbISvONngMTBHpq21TvC3C
 FPZo8jyrCJpwklM1ML/XZFH5ZK8s/kQqPVXq96HfMeYtnNuw6vVSKbb5ie1ii/Vg+C5u
 zfalgTSi7WLO4PBLYFRUMrsS5Zoe+yB0RsDl49f/weNhzbpdqQWLfzhlSXjwW4IPyVem
 sqQMhwxEyidLLYU/ljvgztCAKE6k0AVbCmo0Gfg9mBZOySNezxXzWBZDYAOOHLSPdW7p
 1u8i53mc0dlJ+4PYw4uLjBicVyREAMhRQitN5q3Pw5O1+VPD6HEDJFi/SV3AcU/Jlahg
 pRqA==
X-Gm-Message-State: AC+VfDzBel8cgzhbQL8ThLDg/xYgCdPNcfukxaM/L6VMAoaqqxKi8ISy
 B/4L+fRBGl3XSXQxVb0xWAJdZQ==
X-Google-Smtp-Source: ACHHUZ7z2OEu5BRFZ8ww5XEvNhuNoswH/Ro+/uVdF6mo3XMPvdJhPgoDuOGD50DG4V/OpbKFf0uhFg==
X-Received: by 2002:adf:df0c:0:b0:307:5912:789 with SMTP id
 y12-20020adfdf0c000000b0030759120789mr2872297wrl.66.1683357778828; 
 Sat, 06 May 2023 00:22:58 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 29/30] tcg/s390x: Use ALGFR in constructing softmmu host
 address
Date: Sat,  6 May 2023 08:22:34 +0100
Message-Id: <20230506072235.597467-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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
X-List-Received-Date: Sat, 06 May 2023 07:23:37 -0000

Rather than zero-extend the guest address into a register,
use an add instruction which zero-extends the second input.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index dfcf4d9e34..dd13326670 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -149,6 +149,7 @@ typedef enum S390Opcode {
     RRE_ALGR    = 0xb90a,
     RRE_ALCR    = 0xb998,
     RRE_ALCGR   = 0xb988,
+    RRE_ALGFR   = 0xb91a,
     RRE_CGR     = 0xb920,
     RRE_CLGR    = 0xb921,
     RRE_DLGR    = 0xb987,
@@ -1853,10 +1854,11 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_insn(s, RXY, LG, h->index, TCG_REG_R2, TCG_REG_NONE,
                  offsetof(CPUTLBEntry, addend));
 
-    h->base = addr_reg;
     if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_R3, addr_reg);
-        h->base = TCG_REG_R3;
+        tcg_out_insn(s, RRE, ALGFR, h->index, addr_reg);
+        h->base = TCG_REG_NONE;
+    } else {
+        h->base = addr_reg;
     }
     h->disp = 0;
 #else
-- 
2.34.1


