Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D431CCD185
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 15:51:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7FOi-0003wC-MS; Fri, 10 Oct 2025 11:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7FOf-0003vz-SG
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 11:51:09 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7FOU-0002C1-OU
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 11:51:08 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46e326e4e99so16585425e9.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 08:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760111452; x=1760716252; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PbZf/4lXCFUtVLVqfehR/2skaY6PUFbfsiZG7sUkFCE=;
 b=OI55x86LqEo74Lu/CE1hVZ51R54tFwIUBxO+GMplWQHwoCrrJ7iPtT4i2DHSKWEN7W
 k1BzY0YHf5oDV4UcEtnJBUb+d8GCRDrNeHq8Khg0Z/uUo7GTnCBJ9gGcvt/RiZL89RBi
 9C9WbaG6mhDXq+pznqj3+13GQeGO+X+C+8FFckx/6iiRT4/JNkxbrjZ34R9M3sb/91R1
 aXZR5mEOqb1EKVmQmFISWZPn1/um30aSwrwpzdE3OnDVyzyaQA59oEdaaAjzAyj6SGFC
 8xiXZtJhwwlk4odO1qSqcMLEzSegeEjKSmKPe6MVFTDS6j8r0sBGVsS/NPXpIwDfcvLj
 S2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760111452; x=1760716252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PbZf/4lXCFUtVLVqfehR/2skaY6PUFbfsiZG7sUkFCE=;
 b=YSViPmweClz6cFL4WRivPDzbEeJzTV3DO28kZDRmN0kc8RMALwkQDPHWUJlp5tjixw
 FA740BqKJdgcJOEPhjDtzt2DxCmDaJLbcqz8iTjhahw2Se50NpJP6JbQd4a0V7JpWFmq
 uJJvC3U0KvGNerBYVBNSVyhrKFC+FDVUHjXjbfUQKmz1Z3VrKvjszQzhR8A8cBwYAMwf
 +hAuiLqT/TpoKLNsvJjo0xh9CEAfYBtJHL/gBp7rXvQ3jjxpw1edIzHE2vg5BWWWCSjc
 jHAM7XlGlLYVsAtoPJ2XnMQcsmoluzYaGPjP7K/KVKpUlDjjY9o9cgIMnVBExiFV2pev
 u+Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfYuXS/Cyb7RCNBNxKnVqFeLCrZzrn9v3R30bS227HucHY/uD09vj/p4ebRdYRUdNBB3j2l4uvpmHY@nongnu.org
X-Gm-Message-State: AOJu0YyDmKcs54UrO5tUkORXU4Ebrb3UD+3/sdWsOQi5qyiazVlmoswg
 IjgVQlTf3J95kIIpAh8HozOrcrMHtvUbUbk7D+LSJMe057tbiPGBpvBHmZCF98S4Eko=
X-Gm-Gg: ASbGncuIbS3TOJ2NmNPlUggaij8sjvJG9SyMbu6KOqcGVJofcCIVaqtxue92DB8Tg8N
 FheVCG0rjJtJ9LYi1a5AqY+XBWuL4ZsrNK12375N25ok8Y+kPQyQQorozalxoHV7/ALIDIUXixJ
 ObXSECFQ2tZXJa0F6fjNZRSBx+SOidXIGsJykPF9oYcprITCgnZFVanaP1FxyOhEk2Snp3/Mei2
 YAKYQwg9QILkBOOhfuIiGcDptBhqwz2I90UzoZSyecYk34nAlLu9FEs8lswPOCr1QvuXJIYLa62
 1yxAb7HNDxz40c6QDg4UvhmrQMkv5kiZ3fqEU0yXbSp4647EDfHvNh7+tSOneJCMHURPceRWHs+
 BcJS5R0EuHCmTJiJIY6DktTinvq4a0lxVl2+jhd4QmtV7PJDrd+SqoBl6dkhaqsSOkvFMnnq+8U
 X8oJFyFASYikbLQDWr8n0=
X-Google-Smtp-Source: AGHT+IFec6tJzjkxLlLlFEt9D93P56h780sUOKmKiYIRaBVsCLtJOjjOVVGcddk5slz4ufCRS09q2Q==
X-Received: by 2002:a5d:588c:0:b0:3f4:5bda:2710 with SMTP id
 ffacd0b85a97d-425829b0578mr10312452f8f.9.1760111452485; 
 Fri, 10 Oct 2025 08:50:52 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb55ac08dsm45452255e9.13.2025.10.10.08.50.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 08:50:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH 01/13] target/riscv: Really use little endianness for 128-bit
 loads/stores
Date: Fri, 10 Oct 2025 17:50:32 +0200
Message-ID: <20251010155045.78220-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010155045.78220-1-philmd@linaro.org>
References: <20251010155045.78220-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Per commit a2f827ff4f4 ("target/riscv: accessors to registers upper
part and 128-bit load/store") description:

 > The 128-bit ISA adds ldu, lq and sq. We provide support for these
 > instructions. Note that (a) we compute only 64-bit addresses to
 > actually access memory, cowardly utilizing the existing address
 > translation mechanism of QEMU, and (b) we assume for now
 > little-endian memory accesses.

   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

However this commit used MO_TE (target endianness) for the
gen_load_i128() and gen_store_i128() helpers. Likely it was
unnoticed because current targets are only built using little
endianness:

  $ git grep -L TARGET_BIG_ENDIAN=y configs/targets/riscv*
  configs/targets/riscv32-linux-user.mak
  configs/targets/riscv32-softmmu.mak
  configs/targets/riscv64-bsd-user.mak
  configs/targets/riscv64-linux-user.mak
  configs/targets/riscv64-softmmu.mak

Replace by MO_TE -> MO_LE to really use little endianness.

Cc: Fabien Portas <fabien.portas@grenoble-inp.org>
Cc: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Fixes: a2f827ff4f4 ("target/riscv: accessors to registers upper part and 128-bit load/store")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index b9c71604687..df0b555176a 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -389,9 +389,11 @@ static bool gen_load_i128(DisasContext *ctx, arg_lb *a, MemOp memop)
         }
     } else {
         /* assume little-endian memory access for now */
-        tcg_gen_qemu_ld_tl(destl, addrl, ctx->mem_idx, MO_TEUQ);
+        MemOp memop = MO_LEUQ;
+
+        tcg_gen_qemu_ld_tl(destl, addrl, ctx->mem_idx, memop);
         tcg_gen_addi_tl(addrl, addrl, 8);
-        tcg_gen_qemu_ld_tl(desth, addrl, ctx->mem_idx, MO_TEUQ);
+        tcg_gen_qemu_ld_tl(desth, addrl, ctx->mem_idx, memop);
     }
 
     gen_set_gpr128(ctx, a->rd, destl, desth);
@@ -494,9 +496,11 @@ static bool gen_store_i128(DisasContext *ctx, arg_sb *a, MemOp memop)
         tcg_gen_qemu_st_tl(src2l, addrl, ctx->mem_idx, memop);
     } else {
         /* little-endian memory access assumed for now */
-        tcg_gen_qemu_st_tl(src2l, addrl, ctx->mem_idx, MO_TEUQ);
+        MemOp memop = MO_LEUQ;
+
+        tcg_gen_qemu_st_tl(src2l, addrl, ctx->mem_idx, memop);
         tcg_gen_addi_tl(addrl, addrl, 8);
-        tcg_gen_qemu_st_tl(src2h, addrl, ctx->mem_idx, MO_TEUQ);
+        tcg_gen_qemu_st_tl(src2h, addrl, ctx->mem_idx, memop);
     }
     return true;
 }
-- 
2.51.0


