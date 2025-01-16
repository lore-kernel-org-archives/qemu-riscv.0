Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDC4C02180
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 00:50:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tYE4x-00086y-GQ; Wed, 15 Jan 2025 19:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tYE4q-00084K-Fv
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 19:49:40 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tYE4n-000134-Vk
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 19:49:40 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-21631789fcdso19354025ad.1
 for <qemu-riscv@nongnu.org>; Wed, 15 Jan 2025 16:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736988576; x=1737593376;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZkbB4hKqhuUPLPk9u5+LDLyPT5P/mS71agdt5ZhzHx0=;
 b=LzzM433GCYkn1RJyndD6jf3/v6zc/K2iaEy6ZDcjnilG7sgaJGvM2aqN75x3qYAUJj
 Ca3qqP8EnGVwXcYVQbBPpSa8yTw5CtWO//cOTRwMQf14X1KWtj2W8TAl/oyu3Qc5x8LY
 rydDoOOAW/ZQDbiSc7IUowYg8F8xlEAUkL8Xg2tHBMZsyvC8Enn8HecnYOwjh9QQVflp
 3H/jwcXyIWhvw3EVbpSpD1ltVIv/ygkwGh1Diu6yO9kBtXS2DOyAz+Acve502LUlH+GW
 78yJsZ2NMgx8ca9EwEfKxzslLECuA+ahS8Cum2yw/8WLzII6pta1TjNNu3yIU2YlNGlR
 zGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736988576; x=1737593376;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZkbB4hKqhuUPLPk9u5+LDLyPT5P/mS71agdt5ZhzHx0=;
 b=QGeA36kUxo9JHHp39xKttG0TI/OzMNBKLdxguM+wFFDDFo1Okz1rTcDqwnmzSnPtER
 011lwEDfO55q6MmFwTpEt3Bo29WcL79GtfKmdiQi+6+b0vos4RYXMpTzs6xm11GIeunX
 ql0eYi1JDoD3uoJSOjzbtmg4ikcsvTgfUOJ4Nw+mVP7aSvITGB5gFzhpx/EpfrIh/uqG
 x5o2W1MQAP2GdvqF7naIvChTVtCLOMIlzv8fk6mcDho6RU98njFWXxxteKmqnII8dPSn
 yyrb9rGkmLBXYU58P2MEKLMktB7r5yRQKhCR6ylv00oBf2K7CUShALCLtUSc25FRIDpd
 DJPA==
X-Gm-Message-State: AOJu0Yzv+8OzZ2OQ8CtZkCxYlDy0snRkH70CmBnWIY7kY5bJZpsjo6IF
 muYZmypXBg+/dj3rZIKgI8bVVltdvTmCE1GvfCS0hzSYpTocpvB3WikfQqhd8jY=
X-Gm-Gg: ASbGnct0TlTjAC0F5fC5gClQIr0a9wu/o2/cPpMQEKY3YuFXV/ZaViWrsGLVWQM0slL
 Hj6YpgpTiBUtLsbvYH0JyVGbYK6/BJwPn+ciaFe9TOfnJJY/Atj4Jcm54cW3Jd7N/n6s8vNfz5Q
 Yyoi4MpC109QIhaEhyF+4iHgsRGALaiwBXEblKCoyi7EDE6mKHjfPMFwLqizLzX0aglFoy9JF2X
 SDpGC4npu4PVq81Cn6JPWgHo+MjXEOxIv1GNByPvqER7Jp4rEQND2Sb2lbiHsxCdw7C2g==
X-Google-Smtp-Source: AGHT+IFd11hEaCIlqsLgYaiVOBiDsWMyOfgilx4UwUmGCpUEsiTWL0OLIlPWjHh2fPeeylkWLc+qxQ==
X-Received: by 2002:a05:6a20:d494:b0:1e1:ad90:dda6 with SMTP id
 adf61e73a8af0-1eb025ac6damr7932449637.20.1736988576259; 
 Wed, 15 Jan 2025 16:49:36 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d406587a1sm10036256b3a.105.2025.01.15.16.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 16:49:35 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 15 Jan 2025 16:49:32 -0800
Subject: [PATCH 1/2] target/riscv: Fix the hpmevent mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-pmu_minor_fixes-v1-1-c32388defb02@rivosinc.com>
References: <20250115-pmu_minor_fixes-v1-0-c32388defb02@rivosinc.com>
In-Reply-To: <20250115-pmu_minor_fixes-v1-0-c32388defb02@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>, liwei1518@gmail.com, 
 zhiwei_liu@linux.alibaba.com, bin.meng@windriver.com, 
 dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

As per the latest privilege specification v1.13[1], the sscofpmf
only reserves first 8 bits of hpmeventX. Update the corresponding
masks accordingly.

[1]https://github.com/riscv/riscv-isa-manual/issues/1578

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu_bits.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index f97c48a3943f..b48c0af9d48e 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -9,6 +9,10 @@
                  (((uint64_t)(val) * ((mask) & ~((mask) << 1))) & \
                  (uint64_t)(mask)))
 
+#ifndef GENMASK_ULL
+#define GENMASK_ULL(h, l) (((~0ULL) >> (63 - (h) + (l))) << (l))
+#endif
+
 /* Extension context status mask */
 #define EXT_STATUS_MASK     0x3ULL
 
@@ -933,9 +937,8 @@ typedef enum RISCVException {
                                             MHPMEVENTH_BIT_VSINH | \
                                             MHPMEVENTH_BIT_VUINH)
 
-#define MHPMEVENT_SSCOF_MASK               _ULL(0xFFFF000000000000)
-#define MHPMEVENT_IDX_MASK                 0xFFFFF
-#define MHPMEVENT_SSCOF_RESVD              16
+#define MHPMEVENT_SSCOF_MASK               GENMASK_ULL(63, 56)
+#define MHPMEVENT_IDX_MASK                 (~MHPMEVENT_SSCOF_MASK)
 
 /* RISC-V-specific interrupt pending bits. */
 #define CPU_INTERRUPT_RNMI                 CPU_INTERRUPT_TGT_EXT_0

-- 
2.34.1


