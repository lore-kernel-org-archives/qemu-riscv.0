Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B339606A320
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 09:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wnRyMpc3
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xUL5R-0004kX-Vn; Fri, 20 Nov 2026 04:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1xUL5L-0004j3-Po
 for qemu-riscv@nongnu.org; Fri, 20 Nov 2026 04:39:12 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1xUL5J-00058y-VE
 for qemu-riscv@nongnu.org; Fri, 20 Nov 2026 04:39:11 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2f0458cc9easo3468925ad.3
 for <qemu-riscv@nongnu.org>; Fri, 20 Nov 2026 01:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795167548; x=1795772348; darn=nongnu.org;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=2EsiLYl/myicY/QVfHbK9jOex6+7S/EmglIDVVjLfmo=;
 b=wnRyMpc3X0j2KZkUlcLGYhKi+6bQjnr/tAfHPTKgAxrpHa9KU0IxyDPu5MoYiycAu0
 NB1T/fa9rlbF7ElB73R84mRfjYmqq8pCbt+37rUsltTrrp30+O5Bz3OMjA/hUCWV/wc+
 A3mzvR3bp5jeR8vOEayruF0OOZRGFKbGxtvjsRd9xRZwc79EkrS9ZtCNoNnTNbMg91KO
 b0Dp+Ya1jjVcSq3ISLj31ivoACLe0pGeYFK592vbwljhLUfSqpfmRgKEkh6bZYYYGaQj
 V41HK1D506iFCFf3dRz/YAl9f5AIOo9eUesPPrN50k/c9UnVAhI4wQZ1BszLzYGiZ+g6
 svsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795167548; x=1795772348;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=2EsiLYl/myicY/QVfHbK9jOex6+7S/EmglIDVVjLfmo=;
 b=EPJKKJBLcT44QgukGi2VfzH9esSBCBjr+TZAfvxQ5UxyeT/F+OIKf1TT37O8eG5PcG
 MknMRfzhveZ/Lwh9DZt0ct2ebTiwnt0I/1PXQMSzXm6vG6u9poh62cDgVSldxjM4tJmR
 JgDohJ5paiu4gpvmabjlIoeVZ+HePJYKkfVa3Did0XW0e8VyA7SSQ6J8rudUWm/GCmvw
 81ipVGGs69xBicGKpPtroxzAi+35IlZE7iE2S04WqgimFkakH3rziu9dLmiHuXdaYw0t
 3GneMbFPupSYFC+6q40C9OAYzByZBKQMHCPD6l02zNfm01H/Qu9jRgSnMCfw+NxPyKV4
 lSsw==
X-Forwarded-Encrypted: i=1;
 AL+hErEIUXeHy5+5ItFmKcfniDdo8mrWq4p8ncrTmLKEXDrCqhQu3M1LaC971dLD7xMzaqYcgMpiGqXPoiHy@nongnu.org
X-Gm-Message-State: APuU4Z/55e/W0uPIx4dqqNPRXgHjmHmDsc3TFJlccbzZWpw9vbphPhkq
 aBKYF3r0oif7dcxe/0zv0T6eVqfQyczPckREYUCwCZBv3eHezxaSbBOe
X-Gm-Gg: AZFdTZfxC+qZ9Rc74FIWzZHAj0J3JNbYMrhqgh3x+TEzJ7hRT89DFMC8kqU6GdD9eh2
 SbbPjjD6XImUm+sbevb+3dvHjQEWyp7BG9xDB48qwZQdKeuxz+lMyP4UsOcMTnhHHagPYhoG/XM
 9HtIUpchKTcPAAKbIIsAsV4+i0zPRDP4/uDYIc+7yTaDVr3si2yAQmuaI445kCC56v80UifxMWI
 elWWjm5Y3IshsfKS+85WbVJUPysC/O9IKWodwtOsQnhuSm+Qy4Xy3yiuLOKY4c9s6GtqAOv2gs5
 XElVFeu0uPGjt+S983fyddwuFp+/83MZK4vLuZvqslx5VUSr083ICxemGsaRnJ7iW/XCGzS+eHn
 bn4zcA6xGmiLY7ANVMn7llm3lDCZFPChzXY7mpoZ/D8kNq00znWmdYw6RXarW2rgg14027ILk3k
 B6rWMRqauM/t8JQEZGftSLkavHhYwIR62mP2MZoIpOBPgVMN5VvlZOBpZMFbiuFBXXOrct2pQP8
 pTiVG5Rf7GW1aRaYjdOe4F+QLOl5WnJWDbv/P514gbqRaqSP7qXT2MFWzFThXD12E826BK1b7ni
 kZGOzvg62ft2kYQQUBN0jkEmQu+2umM0
X-Received: by 2002:a17:902:ebd2:b0:2e9:970c:2c9 with SMTP id
 d9443c01a7336-2f03f1c75bdmr28456465ad.42.1795167547690; 
 Fri, 20 Nov 2026 01:39:07 -0800 (PST)
Received: from [127.0.1.1] ([2406:da18:81e:8b00:7d1a:ab57:b89b:f45b])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2f03f0fdb1fsm11653215ad.42.2026.11.20.01.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 01:39:07 -0800 (PST)
From: WX Chen <wxchen0913@gmail.com>
Date: Fri, 20 Nov 2026 17:34:54 +0800
Subject: [PATCH] Provide weaker memory ordering for RISC-V guest FENCE
 instructions.
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-fix-riscv-fence-20261119-v1-1-aeb9ba142598@gmail.com>
X-B4-Tracking: v=1; b=H4sIAD0UAGsC/yWMQQ7CIBBFr9LM2kkYKDD1KsYF0MGyQQNJY9L07
 qIuX/5/74AurUiH63RAk7308qwD6DJB2kJ9CJZ1MGilHZFWmMsbW+lpxyw1Cf4HWpBUmLWNnp0
 3MPRXk/H9pW/3wTF0wdhCTds3qFjWxSdjkmFiyZaCT2y1mX3QLEt2jpWPFs7zA7V5ra+lAAAA
X-Change-ID: 20261120-fix-riscv-fence-20261119-10a425b78673
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org, 
 Tao Tang <tangtao1634@phytium.com.cn>, WX Chen <wxchen0913@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795167538; l=2168;
 i=wxchen0913@gmail.com; s=20260725; h=from:subject:message-id;
 bh=JTSuK6B9MQjaASTgNs7HQ8xfVK2JLYB+GmD/5hykIn0=;
 b=a4+yXk5xkL2+yS+8xToan7QkyBQ/HFdF5axKlUC2GyRkHx7l7+zmG+5tal/H9uUY/5xjaIe4N
 oAsqRQX3dXEBtFbB4xfC/Lc3XUtVdW9JWYk4Ol5F3i43yWCuUgshjYz
X-Developer-Key: i=wxchen0913@gmail.com; a=ed25519;
 pk=FX63IRxmtz1BCNzHxOOWDPTo8L/D0YUxlIKc1WKi7wo=
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=wxchen0913@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently, they are implemented as full memory barriers, which may introduce stronger host barriers than the guest actually requires.

Signed-off-by: WX Chen <wxchen0913@gmail.com>
---
 target/riscv/tcg/insn_trans/trans_rvi.c.inc | 36 +++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/target/riscv/tcg/insn_trans/trans_rvi.c.inc b/target/riscv/tcg/insn_trans/trans_rvi.c.inc
index 4784ea1607e74eb5b0076425a732b5d3817b3482..6e094e5886360c2f9f7c187e82e6f60da36b84e4 100644
--- a/target/riscv/tcg/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvi.c.inc
@@ -968,8 +968,40 @@ static bool trans_pause(DisasContext *ctx, arg_pause *a)
 
 static bool trans_fence(DisasContext *ctx, arg_fence *a)
 {
-    /* FENCE is a full memory barrier. */
-    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
+    /*
+     * FENCE.TSO orders all R/W pairs except W -> R.
+     * For TSO, the pred and succ should all be RW,
+     * otherwise it should be treated as normal FENCE.
+     */
+    if ((ctx->opcode & 0xf0000000) == 0x80000000 &&
+        a->pred == 3 && a->succ == 3) {
+        tcg_gen_mb(TCG_MO_LD_LD | TCG_MO_LD_ST | TCG_MO_ST_ST | TCG_BAR_SC);
+        return true;
+    }
+
+    /* Reserved case, choose the strongest ordering.  */
+    if (ctx->opcode & 0xf0000000) {
+        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
+        return true;
+    }
+
+    /* Normal FENCE. I/R for BIT 3/BIT 1, O/W for BIT 2/BIT 0 */
+    TCGBar ordering = 0;
+    if ((a->pred & 0xa) && (a->succ & 0xa)) {
+        ordering |= TCG_MO_LD_LD;
+    }
+    if ((a->pred & 0xa) && (a->succ & 0x5)) {
+        ordering |= TCG_MO_LD_ST;
+    }
+    if ((a->pred & 0x5) && (a->succ & 0xa)) {
+        ordering |= TCG_MO_ST_LD;
+    }
+    if ((a->pred & 0x5) && (a->succ & 0x5)) {
+        ordering |= TCG_MO_ST_ST;
+    }
+    if (ordering) {
+        tcg_gen_mb(ordering | TCG_BAR_SC);
+    }
     return true;
 }
 

---
base-commit: 08ed97c33c3818ef51a7c852347a28e9f66807b5
change-id: 20261120-fix-riscv-fence-20261119-10a425b78673

Best regards,
-- 
WX Chen <wxchen0913@gmail.com>


