Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00679E7717D
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 12:52:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tLMCC-0003H6-Gx; Wed, 11 Dec 2024 07:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <craig.blackmore@embecosm.com>)
 id 1tLMBq-0003BK-NC
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2024 07:51:51 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <craig.blackmore@embecosm.com>)
 id 1tLMBp-0001vf-5t
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2024 07:51:42 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso3902355e9.1
 for <qemu-riscv@nongnu.org>; Wed, 11 Dec 2024 04:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embecosm.com; s=google; t=1733921499; x=1734526299; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IXOHZmlwq/2lTmsq1K3b/qfzU9CsxVuPDqF9Ym8Ynug=;
 b=A9r8tN/gGu0VlRKp1Aejd+U3xuqdL2Qj9FktB4Wb+cEEb8JoYZ+SAYewmun1YhT2TE
 NSS5U5/+fv4eywqZRyIoSP1HGOEdZH6zB1AvK/zr7GEjRMxLPjOYLbFaHJgNlymlxAg7
 jhyV9sE3pS+gJlpjVZr4+3RRFXCg2Az9bray3/iRzlb53kSnRshdmSnapkU9g8hfM2BS
 6TKaTFpKoGl7myeFeS9XughsmLDQuynDBYUaaMbnGF7+4vTmj/tdwdj3DpQ2qRiCN2CN
 TaBed9EYJUn+6uxNh/8QGTyIrOkvuTS28IYUGqMsNMbHJS6ED0KP1hrKjITtEzmFTo5K
 UJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733921499; x=1734526299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IXOHZmlwq/2lTmsq1K3b/qfzU9CsxVuPDqF9Ym8Ynug=;
 b=klSocVmq4W+pGo4EHcMEt+WtizMUOYktmjGj6gz1K9BNN1KCtGLh1w+JGadxU5/c1Z
 +8rJsyJZ24/Uw7xHbZlH0/sw8lCPk4UjY4K0gMFC4AJEv299qQbNGvF5qEKE0jzUz6hv
 /NYvQb7VIu2jrkfoycxxRMKBXe4lIiwr/mrA3bKatPDpT4uV87LtkTju83npun6kmnyq
 L0txqvhxPJxt/aDxAFKeXRLI684nqLLDFmvEGLLUjmv68QsioKmZiZLjVI2si39Rq5sO
 PXOZqNn+NOtH7oHHeAkNxOLbtsBCQ7dEwjo+SYtOoAFaYrsXZqrBXfpe1NVUpSgTqV1e
 fVxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdKgmYBfkBb9shbZHnNd7dYeHq2/biB/hVC7jquZHKv5ktXjEojFzyhIh/IE4EhsXkSka9Hutsvz1e@nongnu.org
X-Gm-Message-State: AOJu0YzjiJaYvwy9WUu19bzmMZb7EfJUDtd6sldCgUiTnOOv2o7mKRgw
 B3WLGfmnPW9uZhT4xlQBXh5wyMyO0uG5cIkKtWsXeV/S+hnXgidN3Sz2AOrpZk4=
X-Gm-Gg: ASbGncu16dNrcljivcZcHZa73wqpYxESKqCzTUsaW9aGYHWHhRDibsWvKeM0HhsAOn4
 mD4I/mywocKIuTwqJTEteB3q54DBDGRv8eY9C5iZrjzFKlwYdkYomnqeaA7Z0BItoOyETszkMSo
 Hie6a0vo22W25jTQsurPqsJLqUFazigm3ctejk/D84SeZJSlK0/rzPqCAteSHoP0r0nP+jgHRnx
 GRExxbzJ7DjAMHau08pfUUi0lxtR9GkZ+sFdJ/aNM3i2eQx8capFz9bN9dN3wN4dyK/mVOVmHTI
 wRO2bISwtBisDQF8F9CgksBwHOTGMdJVGYbR/F9NlYfNkw==
X-Google-Smtp-Source: AGHT+IEy5Y7EqcSFlZXlzw/NJliyF1afwJMjcXf8oadlGc4rvWdzLf7BMWEQ6W8FShwKsgFqaswSiQ==
X-Received: by 2002:a7b:c8c9:0:b0:434:e963:6ad9 with SMTP id
 5b1f17b1804b1-4361c5a309emr18173195e9.5.1733921499164; 
 Wed, 11 Dec 2024 04:51:39 -0800 (PST)
Received: from dorian..
 (sals-04-b2-v4wan-167965-cust660.vm36.cable.virginm.net. [80.3.10.149])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434f44eaac7sm120542125e9.42.2024.12.11.04.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 04:51:38 -0800 (PST)
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
Subject: [PATCH v7 2/2] target/riscv: rvv: speed up small unit-stride loads
 and stores
Date: Wed, 11 Dec 2024 12:51:13 +0000
Message-ID: <20241211125113.583902-3-craig.blackmore@embecosm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211125113.583902-1-craig.blackmore@embecosm.com>
References: <20241211125113.583902-1-craig.blackmore@embecosm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=craig.blackmore@embecosm.com; helo=mail-wm1-x336.google.com
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

Calling `vext_continuous_ldst_tlb` for load/stores smaller than 12 bytes
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
index 0f57e48cc5..529b4b261e 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -393,6 +393,22 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         return;
     }
 
+#if defined(CONFIG_USER_ONLY)
+    /*
+     * For data sizes < 12 bits we get better performance by simply calling
+     * vext_continuous_ldst_tlb
+     */
+    if (nf == 1 && (evl << log2_esz) < 12) {
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


