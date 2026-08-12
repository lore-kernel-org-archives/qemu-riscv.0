Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAE1C5CFEB
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:34:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHUZ-0007LR-Uo; Wed, 12 Aug 2026 18:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUY-0007KL-HK
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:10 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUT-0000zq-BL
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:10 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-cbedf6a6fe8so124870a12.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573924; x=1787178724; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6RUz6C0Ue74nBlLgIkSOBkYE1Df0XP1aeVHBqrZxGXE=;
 b=SA76rjKs9v+wdhH2bFHmFPemqCha8vAx1plQXi/seukx5fgL9bYtgvgzu27FpMeBb5
 l5YM6phqJqJ1NmD0tNd15HphnRLkVL2cK4wZNQc/bxs6z+w5gcu0R+Lx4g8eHmlOYtLH
 AGQSk0DGCp1WWzrDreRe7+Y66e2AByp08wBaDTFX1WFZwKmr39AhBxb2JE+0JOj1Dmm8
 /F+JTbmVVO7KxgwIvY1aXr3jvqANCFmRG+alO0EWo5YP1RiFyfKmSq8sE6buFXB+iY0w
 tGUyrc4dp0ZW4GIKAAT+ma6jYBRjX5xvtX1KvCRk2fqmO/JIaNFjrV9LW9R8FEUpEVb2
 H2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573924; x=1787178724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6RUz6C0Ue74nBlLgIkSOBkYE1Df0XP1aeVHBqrZxGXE=;
 b=D7RLuoZnVIzMGq6aLWhdIcj8xLiO6pOCzGA20T/5VXQPxh1er0WZANeMhBMU0Ja9bs
 NnyHUH9yWNoxZ90aQSf5zwcNl9i5y08ZBum/2LtAy/mlfG+f6uRByJVKM2MHdZuMI9c6
 BQLCdbls6ty1ifQkPBmLJwp6s1onSXzeGD5pPD0P8d/F7GKKtoIqMhK3HBilY2udcnzK
 sVAm54loKGVGU1LR3S7h5W3F9sIPwpSun4+j03imIHTkGtJQs7CDkIRmw0yY1r+wdL6r
 xbJo0bAFBow9HDHCb/bjXFfmslTxc6gCk9vDgg6x6XkviD/Pilg8xgTxid5vn0/o4yvN
 1z/g==
X-Gm-Message-State: AOJu0Yz7wEZCXA7X+P2IXnwc4npn7eL1KCz06IxqTAgW0/iP+9K81f6O
 W50autCETwW1Gpa5YiSm1Fec2TXvdqPSjm+r/DVioL+gqXO7eXD0B1CcWnW3ve1IqKo=
X-Gm-Gg: AR+sD12uCun001nJMXk98XApc5hHyz5ylN+XghITQ16wVDkWoRB0ANUDtKXg0M1R9Ub
 brYHnixRQQlTlJ29k5qd4zI0O9bm1b7ZixNcjR43OkuLFbp/D6sN+U000dqbvObrQq0txnOXwul
 F1skb9idRQkGLnlQDTgPAe7FSrWL+ElpMJkNN+el7YJCv3kie3aboHSA2XmfpulIYhIuNnCtmGX
 Tij3rFGui/p3dUgZy6Flk+Jqzf54DgqXZor7oxmC5HL2pNQZ0sApdRhVWRrYHmJ0cN6xqAb7vzz
 M7FJODD+HYidAOWPmwl5XuPrBiYttyKeO0Op7R9a2NHdVreIpGn8hSGpt+Q4oz/xlRhWaXhIMnw
 Q70uibBlChy6Nyes4PFXgHSxyV8jGbNSU5wZjbJyzun2hJu4sAKCAPQ2y6QoEfNLhqtPxU2hNYs
 H6kwFMow3NCZQYZYm8G3RIczFb0iC2uupgqEGUkX/vv+g2Ugx36GfhDYskRKzkGok6l4T6HsRC4
 xicm1luRagLSTCDAnLB
X-Received: by 2002:a05:6a20:ce43:b0:3bf:49c8:f7b with SMTP id
 adf61e73a8af0-3cc5503993emr2442654637.13.1786573923656; 
 Wed, 12 Aug 2026 15:32:03 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:32:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 18/52] disas/riscv: Do not recognize c.{addw,
 subw} with rv32
Date: Wed, 12 Aug 2026 15:31:08 -0700
Message-ID: <20260812223142.349142-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

These code points are reserved with RV32.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 77347b557d..ddc2f73eae 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -3060,8 +3060,16 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 1: op = rv_op_c_xor; break;
                 case 2: op = rv_op_c_or; break;
                 case 3: op = rv_op_c_and; break;
-                case 4: op = rv_op_c_subw; break;
-                case 5: op = rv_op_c_addw; break;
+                case 4:
+                    if (isa != rv32) {
+                        op = rv_op_c_subw;
+                    }
+                    break;
+                case 5:
+                    if (isa != rv32) {
+                        op = rv_op_c_addw;
+                    }
+                    break;
                 case 6: op = rv_op_c_mul; break;
                 case 7:
                     switch ((inst >> 2) & 0b111) {
-- 
2.43.0


