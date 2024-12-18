Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852FEE77187
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 14:25:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNuz2-0006o0-GM; Wed, 18 Dec 2024 09:25:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <craig.blackmore@embecosm.com>)
 id 1tNuz0-0006my-Qt
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 09:25:02 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <craig.blackmore@embecosm.com>)
 id 1tNuyv-00035O-9k
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 09:25:02 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38637614567so3045593f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 06:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1734531896; x=1735136696; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fibA9P5DcKjb0lcJZvsMnFiP02fLzLXn2ydFUHy670g=;
 b=hZYLVEzXgc7LI04ccuSWwOUOcSXxjsje2HTExHNZB75FM2ST3YHstq697ihDhRdbyn
 spy2GH7M+R3sq77RDSrZD5nyQYtQVKypnlockH1j1hJm+PICDMTj3pbgiJHez/iiFfmL
 1vO3fPznBUstyTxosbMQ3hagScnFpkl/JArAtYWZmcMtOcbvW+hen8Q1r2WOfvfysS3H
 qK58UTI1uKPbEUgyMZaW8HCpgqfZYrjoQ1DVe+00/mnSvA1Yew/6NgyVr5q+UKADbvfm
 sAB1mfU2egDXAU+AHBnIy0kyewJUt++pit5/ZDECRbhxpdvodCpGn49d370ZPeDzq/+R
 qx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734531896; x=1735136696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fibA9P5DcKjb0lcJZvsMnFiP02fLzLXn2ydFUHy670g=;
 b=HK5GPHhtkGeTC+Vtm6qR+4cSz6zIjZcWfYejKxVD0i6ogwkD8pAJr7t/C/fYcg0DFD
 pC9R/QgbbcRufjIVtrkQJ9bWLcDAEZGeBEgB9bFQQjky8Wl6tFjEFFgFtHuEZvpCg+eQ
 zJCsNyXoJmtfS3qp0FQv49QqSjfJKa+z8IRzSFT4yt4Cj3KWyXQwOs92v8VrEBGcqg7r
 2c1k0Z0IlP9howyrhvdXmF+inEHDtY/WA7eFMjDf0sUIXffgPI57RUkxFT06HUvwfdk+
 9LiHYdRNnCbKZxbBq3kKZxmn1sg1NHBCyc65u5Z2b4e1w5tRbRCbAjWUG6rSVSj2UxAR
 AA5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjK1HnUwu+j2s6wf3HlWQzzzrnYHuNCYGvZleWazeOvOd725Gn4gjEF8//yiFYwlWgbl2oSXmdwzjL@nongnu.org
X-Gm-Message-State: AOJu0Yyys6QisAlf8C59MP5h9OIpCX6sRoqXOJfEYuOzM53AbutbQJcr
 TtfSgtoJ8hK0h2rM2vvOK2wQPvPcT8F9dx12JTcsTfqUVx49SYdGM3fg+ZAHuKo=
X-Gm-Gg: ASbGncupXsIqvNrqHPx5WthKFE4/mysP05QNEoiW8y1VS2H4AGq+24CzG/OZuLT09a4
 ZFjx2SOS2FjQnR9wuZ0EVbETsVrfG7TAUQn/XKZHtl4gEO7tQokYoYWCIRucEKRAOjTIIT8kxI1
 Ig1qnuhI8jn63wEPe5/yGm0O84AlQeudWcB9W7Yhic9UIbW7g86PQcz9K4/2iHPuVk8UBKzVjtZ
 +TDAIweZ/2fqs4DDcKd4XZUNNQuxPq9migP8CCByqNWLBdFBI1uywWXkl7QScD/U/PotN9C+CdA
 4PafpOHnPFzOaJK3Mo5qFPTFYzbVH0QFVyMZaSblUUYKUaYS
X-Google-Smtp-Source: AGHT+IFGBZsjiha20+zyh73y3gbHe7IR9uF+K4VumG9CI3EmqNSjVAbN+ewTNGXcu9AW2CyesaXWYA==
X-Received: by 2002:a05:6000:4703:b0:385:f271:a22c with SMTP id
 ffacd0b85a97d-388e4da3fcbmr2630820f8f.59.1734531895661; 
 Wed, 18 Dec 2024 06:24:55 -0800 (PST)
Received: from dorian..
 (sals-04-b2-v4wan-167965-cust660.vm36.cable.virginm.net. [80.3.10.149])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c806115asm14075200f8f.107.2024.12.18.06.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 06:24:55 -0800 (PST)
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
Subject: [PATCH v8 2/2] target/riscv: rvv: speed up small unit-stride loads
 and stores
Date: Wed, 18 Dec 2024 14:23:53 +0000
Message-ID: <20241218142353.1027938-3-craig.blackmore@embecosm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <14dfb7b7-98bb-4e8c-a223-c568512180b7@embecosm.com>
References: <14dfb7b7-98bb-4e8c-a223-c568512180b7@embecosm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=craig.blackmore@embecosm.com; helo=mail-wr1-x42a.google.com
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

Calling `vext_continuous_ldst_tlb` for load/stores up to 6 bytes
significantly improves performance.

Co-authored-by: Helene CHELIN <helene.chelin@embecosm.com>
Co-authored-by: Paolo Savini <paolo.savini@embecosm.com>
Co-authored-by: Craig Blackmore <craig.blackmore@embecosm.com>

Signed-off-by: Helene CHELIN <helene.chelin@embecosm.com>
Signed-off-by: Paolo Savini <paolo.savini@embecosm.com>
Signed-off-by: Craig Blackmore <craig.blackmore@embecosm.com>
---
 target/riscv/vector_helper.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 0f57e48cc5..ead3ec5194 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -393,6 +393,22 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         return;
     }
 
+#if defined(CONFIG_USER_ONLY)
+    /*
+     * For data sizes <= 6 bytes we get better performance by simply calling
+     * vext_continuous_ldst_tlb
+     */
+    if (nf == 1 && (evl << log2_esz) <= 6) {
+        addr = base + (env->vstart << log2_esz);
+        vext_continuous_ldst_tlb(env, ldst_tlb, vd, evl, addr, env->vstart, ra,
+                                 esz, is_load);
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


