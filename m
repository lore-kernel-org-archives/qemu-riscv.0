Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBF3E7716B
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 13:18:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIpH0-0001oM-PE; Wed, 04 Dec 2024 08:18:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <craig.blackmore@embecosm.com>)
 id 1tIoX8-0002Oh-9j
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 07:31:13 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <craig.blackmore@embecosm.com>)
 id 1tIoX4-0003XN-Bd
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 07:31:09 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-434aa222d96so82019645e9.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Dec 2024 04:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1733315464; x=1733920264; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=28u24Vj/lSvl8CGqo/T7UdhHSDOPZ26LSEmps4xIvKo=;
 b=EFbrlnDDRu1F2qKVMFaxxrs1/txR9eUQXc+pzC9gdejuMybvEj+Shu4pc63jlfZgSO
 Gd55S1EhuOEZnRqMZ1zh45IPndOvRIOAPnhSjDFXvsE6qQVEei7mFbWvYnHq0rTujeFl
 fxvuaelFpKCPJ5T3/V6bqF1qKtmevmUreIAOkYpGGIpf80f933lo9sGccdMR6p0RGFXK
 L20l50+ZRIJwoU0mcJDITT7rZuzRkriB+BaS+ULDvjn/Y5oMUA3B+ttAofHE+LpEyl+j
 hFYWrwWsHl5akbKK94/ZmuWXXKZBZ4zwU7QoPQaPvd79Xd9kgeXU6OZp+ZvY4BnlXEKG
 R45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733315464; x=1733920264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=28u24Vj/lSvl8CGqo/T7UdhHSDOPZ26LSEmps4xIvKo=;
 b=sH9xTQCPi32vVbvS1Uz9NKwj4BIVnXCDOKLvKTLcZcim68ealsgElVkTzje612qZiS
 kRXj2XrDt9p5DIP0sXOMk2g1BSV8G7sVO4AAzXsmUIgvd+FBF/5nVy2IBrBtiY7/METK
 +lko+qC5EQc5kLGQAOECqeOQRgtGGPFf0RRU5W8e+pP0pWD81MUHSwIMoQ2VjOvGgICd
 GiceDuzr+x0iGAouHMkoXur6IN+Pgw/c4qjb859pKkCeq54E4la8GTHkO3Lm57eW2IlK
 Wmn+W3Pm6yOYuqObjsY6a0fwORXRShNnH/ONx4hZ26cVxCMFADTc1ORVdl/F37i2SBei
 wr5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI2i85N1ZR0X6/Uxp7VcIXMqpVW61Lu/Z6wfCrCUAn3hsWetGCS9tb2FfOw/WsrMarC/CYOqKvFGob@nongnu.org
X-Gm-Message-State: AOJu0YwQqqg4DAx8G0ykD2Twtb2S413yIipKHOp872KyruCUoaRaRaBh
 JUiyKmjqUwTkASG9WG/ueV+TDOWNAVIvr+JpE7sZ6fMJjyIeIJTlbRMLUzpvZgY=
X-Gm-Gg: ASbGncvmcVcJ32lMlXoiaBn9r0SICMwJ68dY859nZjTXOtBa8QCt4bP1Ik69bG3kyYn
 P7JihmRfw562PFeL1zMLD74X4j8WB6giPBNXQGJikeJMW/2BnkHDCxNRwKTKo017IbwSr7VOehO
 HaB/OR7OAngx0AdV5VKXyAszV91N2pzwOswtCoc/BbsWpJVMxFMMbQisLLNzyH/tsQXEw5pIoBF
 ++L+W41CZmWYXLWnSozJY0TS77VbfMTE3x7nIn49wpYL1oRGuxcqJY0E9LpeJXrRvMSv3DSkG5b
 38PKBFJ+6jBqOyET3/rEOiYGkDS22J59NjyVjfKn3w==
X-Google-Smtp-Source: AGHT+IFi2KFZsKba+/18vSAev6edhCK/Fo3db89dajnOuEjLIV0y4v72lxJVbJSySEN/EYojYNiIgw==
X-Received: by 2002:a05:600c:35c2:b0:434:a781:f5d9 with SMTP id
 5b1f17b1804b1-434d09c11d7mr58074515e9.11.1733315464670; 
 Wed, 04 Dec 2024 04:31:04 -0800 (PST)
Received: from dorian..
 (sals-04-b2-v4wan-167965-cust660.vm36.cable.virginm.net. [80.3.10.149])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d5206649sm23324415e9.0.2024.12.04.04.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 04:31:04 -0800 (PST)
From: Craig Blackmore <craig.blackmore@embecosm.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Craig Blackmore <craig.blackmore@embecosm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>, Paolo Savini <paolo.savini@embecosm.com>
Subject: [PATCH v6 1/1] target/riscv: rvv: reduce the overhead for simple
 RISC-V vector unit-stride loads and stores
Date: Wed,  4 Dec 2024 12:29:52 +0000
Message-ID: <20241204122952.53375-2-craig.blackmore@embecosm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204122952.53375-1-craig.blackmore@embecosm.com>
References: <20241204122952.53375-1-craig.blackmore@embecosm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=craig.blackmore@embecosm.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 04 Dec 2024 08:18:32 -0500
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

This patch improves the performance of the emulation of the RVV unit-stride
loads and stores in the following cases:

- when the data being loaded/stored per iteration amounts to 8 bytes or less.
- when the vector length is 16 bytes (VLEN=128) and there's no grouping of the
  vector registers (LMUL=1).

The optimization consists of avoiding the overhead of probing the RAM of the
host machine and doing a loop load/store on the input data grouped in chunks
of as many bytes as possible (8,4,2,1 bytes).

Co-authored-by: Helene CHELIN <helene.chelin@embecosm.com>
Co-authored-by: Paolo Savini <paolo.savini@embecosm.com>
Co-authored-by: Craig Blackmore <craig.blackmore@embecosm.com>

Signed-off-by: Helene CHELIN <helene.chelin@embecosm.com>
Signed-off-by: Paolo Savini <paolo.savini@embecosm.com>
Signed-off-by: Craig Blackmore <craig.blackmore@embecosm.com>
---
 target/riscv/vector_helper.c | 54 ++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a85dd1d200..068010ccd2 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -393,6 +393,60 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         return;
     }
 
+#if defined(CONFIG_USER_ONLY) && !HOST_BIG_ENDIAN
+    /*
+     * For data sizes <= 64 bits and for LMUL=1 with VLEN=128 bits we get a
+     * better performance by doing a simple simulation of the load/store
+     * without the overhead of prodding the host RAM
+     */
+    if ((nf == 1) && ((evl << log2_esz) <= 8 ||
+        ((vext_lmul(desc) == 0) && (simd_maxsz(desc) == 16)))) {
+
+        uint32_t evl_b = evl << log2_esz;
+
+        for (uint32_t j = env->vstart; j < evl_b;) {
+            addr = base + j;
+            if ((evl_b - j) >= 8) {
+                if (is_load) {
+                    lde_d_tlb(env, adjust_addr(env, addr), j, vd, ra);
+                } else {
+                    ste_d_tlb(env, adjust_addr(env, addr), j, vd, ra);
+                }
+                env->vstart += (8 >> log2_esz);
+                j += 8;
+            } else if ((evl_b - j) >= 4) {
+                if (is_load) {
+                    lde_w_tlb(env, adjust_addr(env, addr), j, vd, ra);
+                } else {
+                    ste_w_tlb(env, adjust_addr(env, addr), j, vd, ra);
+                }
+                env->vstart += (4 >> log2_esz);
+                j += 4;
+            } else if ((evl_b - j) >= 2) {
+                if (is_load) {
+                    lde_h_tlb(env, adjust_addr(env, addr), j, vd, ra);
+                } else {
+                    ste_h_tlb(env, adjust_addr(env, addr), j, vd, ra);
+                }
+                env->vstart += (2 >> log2_esz);
+                j += 2;
+            } else {
+                if (is_load) {
+                    lde_b_tlb(env, adjust_addr(env, addr), j, vd, ra);
+                } else {
+                    ste_b_tlb(env, adjust_addr(env, addr), j, vd, ra);
+                }
+                env->vstart++;
+                j += 1;
+            }
+        }
+
+        env->vstart = 0;
+        vext_set_tail_elems_1s(evl, vd, desc, nf, esz, max_elems);
+        return;
+    }
+#endif
+
     /* Calculate the page range of first page */
     addr = base + ((env->vstart * nf) << log2_esz);
     page_split = -(addr | TARGET_PAGE_MASK);
-- 
2.43.0


