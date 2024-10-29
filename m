Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63938D3A697
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 19:45:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t5s8K-0002DM-J4; Tue, 29 Oct 2024 15:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1t5s8I-0002C8-8w
 for qemu-riscv@nongnu.org; Tue, 29 Oct 2024 15:44:02 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.savini@embecosm.com>)
 id 1t5s8E-0006CX-T9
 for qemu-riscv@nongnu.org; Tue, 29 Oct 2024 15:44:01 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4316cce103dso75767715e9.3
 for <qemu-riscv@nongnu.org>; Tue, 29 Oct 2024 12:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1730231036; x=1730835836; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hs0J+Zon4K6/a+jCzPbDVfJjtAZA9W8vE12s+M7Ychc=;
 b=YhjyOWW3j+1m7glekIy1XSibJFq70xTlDMTsKwC21/xm4ja3PJKODH7edPZwjBKOgc
 hptQe5DmIkbpJYEUHDO+mEnlcRQyaQu6+Psz4mzD6tf+5IATmAVq9xVydjyM8Jn8SUPa
 45kYvlzaqD3Fuf69vSGcy+hB6K7InfyMQJ2NxC5Ih4t4/etHApIvfD9RYnYvety6nurI
 pG+gFoNQYVFFR0gdL16qx0ifDJZPk4b9pGl5iKtLjfamh2hoamBZjgQEUEPikurirf6Z
 Z/I8OnZrf1pDzFmJSaFf5is9Ej/PrKvFl69iP+YTR9O50Vp8LYfMZ/8q33xaVOMWzOOt
 jxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730231036; x=1730835836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hs0J+Zon4K6/a+jCzPbDVfJjtAZA9W8vE12s+M7Ychc=;
 b=cOb+2Vg3DgnIqhaXtL30PmeOp7MqNOxRsA7buTELM5vQxtxCosL+Tl7R8lzrcl1gfZ
 g0rWhmeD5eDUe6VSmp5OqN44dw/2YbPhwLrBiUHcACh6zfnklCms8Hf4r8VnWXMJEeZL
 nFOR8zpLXfZiN3beBW0NEZ+RjDdJGUrdQiUZJjhLLnjY862Zz5r6dur2QCx9zWXzoSKF
 QoWieEjDn2+bhdujZ40sI9f8QIFjiEyirA1ndCaH8QyVoJ+OxI6Cv+pjVXMaOvqtTnWR
 mZBI68AglYtHaz2q3x2+9mV6xImwMKynGf4e1DZx9XnlI19cw0i9FWzg56ZEp+i7ep0k
 2sDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWriwYC31e22EZ9FXJGOm5iHB5NaJ1VffwRCrXIRk2l3abuFjmg2c2dLrLbkFhG1NCPOaZhrdVgUB4H@nongnu.org
X-Gm-Message-State: AOJu0Yyu5vu7Q0HQXhFKNEoRtAi8+C/p69dxmSjfnxsZD2Ez8y2b/7Mv
 4UgwqeuS/a9tmpslJ3ZGha8VHAH+CqP3EVorLZ64wQxW99lBTvmND0g67s7FKVk=
X-Google-Smtp-Source: AGHT+IEhmoFJN9bfZKDT2tHD5665gX7TPNGYvLybf3AITID8gGRiO06huAZYUtbnOzlraKgLCfigqg==
X-Received: by 2002:a05:600c:4fce:b0:431:4f29:9539 with SMTP id
 5b1f17b1804b1-4319ad29f7cmr146961045e9.32.1730231036041; 
 Tue, 29 Oct 2024 12:43:56 -0700 (PDT)
Received: from paolo-laptop-amd.. ([2a0e:cb01:d3:f100:2972:f115:541a:90f8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43193573551sm154348445e9.6.2024.10.29.12.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 12:43:55 -0700 (PDT)
From: Paolo Savini <paolo.savini@embecosm.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Savini <paolo.savini@embecosm.com>,
 Richard Handerson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>
Subject: [RFC v4 2/2] target/riscv: rvv: improve performance of RISC-V vector
 loads and stores on large amounts of data.
Date: Tue, 29 Oct 2024 19:43:48 +0000
Message-ID: <20241029194348.59574-3-paolo.savini@embecosm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029194348.59574-1-paolo.savini@embecosm.com>
References: <20241029194348.59574-1-paolo.savini@embecosm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.savini@embecosm.com; helo=mail-wm1-x336.google.com
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

This patch optimizes the emulation of unit-stride load/store RVV instructions
when the data being loaded/stored per iteration amounts to 16 bytes or more.
The optimization consists of calling __builtin_memcpy on chunks of data of 16
bytes between the memory address of the simulated vector register and the
destination memory address and vice versa.
This is done only if we have direct access to the RAM of the host machine,
if the host is little endiand and if it supports atomic 128 bit memory
operations.

Signed-off-by: Paolo Savini <paolo.savini@embecosm.com>
---
 target/riscv/vector_helper.c    | 17 ++++++++++++++++-
 target/riscv/vector_internals.h | 12 ++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 75c24653f0..e1c100e907 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -488,7 +488,22 @@ vext_group_ldst_host(CPURISCVState *env, void *vd, uint32_t byte_end,
     }
 
     fn = fns[is_load][group_size];
-    fn(vd, byte_offset, host + byte_offset);
+
+    /* __builtin_memcpy uses host 16 bytes vector loads and stores if supported.
+     * We need to make sure that these instructions have guarantees of atomicity.
+     * E.g. x86 processors provide strong guarantees of atomicity for 16-byte
+     * memory operations if the memory operands are 16-byte aligned */
+    if (!HOST_BIG_ENDIAN && (byte_offset + 16 < byte_end) &&
+		    ((byte_offset % 16) == 0) && HOST_128_ATOMIC_MEM_OP) {
+      group_size = MO_128;
+      if (is_load) {
+        __builtin_memcpy((uint8_t *)(vd + byte_offset), (uint8_t *)(host + byte_offset), 16);
+      } else {
+        __builtin_memcpy((uint8_t *)(host + byte_offset), (uint8_t *)(vd + byte_offset), 16);
+      }
+    } else {
+      fn(vd, byte_offset, host + byte_offset);
+    }
 
     return 1 << group_size;
 }
diff --git a/target/riscv/vector_internals.h b/target/riscv/vector_internals.h
index f59d7d5c19..92694162ce 100644
--- a/target/riscv/vector_internals.h
+++ b/target/riscv/vector_internals.h
@@ -56,6 +56,18 @@ static inline uint32_t vext_nf(uint32_t desc)
 #define H8(x)   (x)
 #endif
 
+/*
+ * If we use host SIMD memory operations to accelerate the emulation we might
+ * want to rely on host specific flags to check that the memory accesses will
+ * be atomic.
+ */
+#if defined(HOST_X86_64)
+#define HOST_128_ATOMIC_MEM_OP \
+	((cpuinfo & (CPUINFO_ATOMIC_VMOVDQA | CPUINFO_ATOMIC_VMOVDQU)) != 0)
+#else
+#define HOST_128_ATOMIC_MEM_OP false
+#endif
+
 /*
  * Encode LMUL to lmul as following:
  *     LMUL    vlmul    lmul
-- 
2.34.1


