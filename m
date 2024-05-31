Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77471C25B75
	for <qemu-riscv@archiver.kernel.org>; Fri, 31 May 2024 17:45:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sD6Jn-0001o9-MV; Fri, 31 May 2024 13:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sD6Jm-0001ld-34
 for qemu-riscv@nongnu.org; Fri, 31 May 2024 13:45:30 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sD6Jk-0007YA-Bz
 for qemu-riscv@nongnu.org; Fri, 31 May 2024 13:45:29 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1f4a5344ec7so17657475ad.1
 for <qemu-riscv@nongnu.org>; Fri, 31 May 2024 10:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717177527; x=1717782327; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E78ZGy3OpFHzGq7HIlOvBGwIH3ekaZUgpTv+1PnTGBc=;
 b=FlgR1ZAnRfbSXr8atAAqIt02wICb46u/x2dkAwJ5xqeBjWoZ5TQzyDlrhR6wYDUZP2
 vYfWNoDXTcewrcFskZW/7PGAC9SKuu/7oZfXXQRVkJ98HpzkCNeV/ZePDM2zZQJcreWh
 7mrzNM/YWvtnIH7WHD0KUARxOlFu9daa/YxZCiONe5xBquWtPvOP2NRsH2L1rg4Q4AxJ
 4NBYNNH6iMISSxI/6D8gSNVay7yLMKabIPt4QvYfNYR2i3DaiLJHlwBgp4F4CAidjyCc
 Mu4seL6zOrSlpYtv64UUxWsHqExI4DIxN7mz7EoeUUjtSMO2E8SMWDN8vQTklgmNZjVA
 REoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717177527; x=1717782327;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E78ZGy3OpFHzGq7HIlOvBGwIH3ekaZUgpTv+1PnTGBc=;
 b=YPxZ8UQvVuTazWfMTE2V4JnTuzrd4s9/UcROCT6xoQBGFHIkfuGfp1VJDz9h81qg5X
 p17Jgzo0EkkeDBSP9acogOsOnz1QQ6WSCpNUtEHQiA3+bqFsSXtK5RRRnZ0cwWwmDMqZ
 VOJTI/6Trqm/RIjeP7TnTUHi/6DEbqVNEwEn4pPHIkHmyu3xW+MOJSw7XR99d7Yuwik5
 HgoNScFm9QG8go+K6kLbXQvQUWfXVhmS6JD35TR++Z08D1jYezOmC66um7gvDEV7/0JQ
 vazf5rudtHkE3TpsBMtlu+eK6UMwcEKcA/4BrtBEY6mc0SOS4ycGDvGUUWMKKBIMfUcv
 TS4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1+/6vzvw4A1rG74jO6Zio6ZO0SsUw4v7RoDcL93fkaJBiNpCl5AghmWR7oF4C0CzeqqSxp71IGaxSR5QMn2y61cv86ds=
X-Gm-Message-State: AOJu0YxziadRQ4sa3REddRgVT5SQoD8Lcut9qOVyjr6NXM5kHgNHhI27
 kuWDT+kuLidJnV1Kl9bH2g/M/vxg6141WzqieBJg+eEnDHl9v/iHjVPtPeAJHWM=
X-Google-Smtp-Source: AGHT+IEUMBJF6b1FvcfqYtWJcok/WJziyY+Fc3Fm4liI4hAtAOHeA1SNfJWhq2p23lAqFMz8Td3JCA==
X-Received: by 2002:a17:902:ecc6:b0:1f6:2fca:361f with SMTP id
 d9443c01a7336-1f635a8302amr36876745ad.29.1717177526862; 
 Fri, 31 May 2024 10:45:26 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f63236ce6dsm19389875ad.95.2024.05.31.10.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 10:45:26 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Max Chou <max.chou@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [RFC PATCH v2 3/6] target/riscv: Inline vext_ldst_us and
 corresponding function for performance
Date: Sat,  1 Jun 2024 01:44:50 +0800
Message-Id: <20240531174504.281461-4-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240531174504.281461-1-max.chou@sifive.com>
References: <20240531174504.281461-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x630.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

In the vector unit-stride load/store helper functions. the vext_ldst_us
function corresponding most of the execution time. Inline the functions
can avoid the function call overhead to improve the helper function
performance.

Signed-off-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 440c33c141b..cb7267c3217 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -149,25 +149,27 @@ static inline void vext_set_elem_mask(void *v0, int index,
 typedef void vext_ldst_elem_fn(CPURISCVState *env, abi_ptr addr,
                                uint32_t idx, void *vd, uintptr_t retaddr);
 
-#define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)            \
-static void NAME(CPURISCVState *env, abi_ptr addr,         \
-                 uint32_t idx, void *vd, uintptr_t retaddr)\
-{                                                          \
-    ETYPE *cur = ((ETYPE *)vd + H(idx));                   \
-    *cur = cpu_##LDSUF##_data_ra(env, addr, retaddr);      \
-}                                                          \
+#define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)         \
+static inline QEMU_ALWAYS_INLINE                        \
+void NAME(CPURISCVState *env, abi_ptr addr,             \
+          uint32_t idx, void *vd, uintptr_t retaddr)    \
+{                                                       \
+    ETYPE *cur = ((ETYPE *)vd + H(idx));                \
+    *cur = cpu_##LDSUF##_data_ra(env, addr, retaddr);   \
+}                                                       \
 
 GEN_VEXT_LD_ELEM(lde_b, int8_t,  H1, ldsb)
 GEN_VEXT_LD_ELEM(lde_h, int16_t, H2, ldsw)
 GEN_VEXT_LD_ELEM(lde_w, int32_t, H4, ldl)
 GEN_VEXT_LD_ELEM(lde_d, int64_t, H8, ldq)
 
-#define GEN_VEXT_ST_ELEM(NAME, ETYPE, H, STSUF)            \
-static void NAME(CPURISCVState *env, abi_ptr addr,         \
-                 uint32_t idx, void *vd, uintptr_t retaddr)\
-{                                                          \
-    ETYPE data = *((ETYPE *)vd + H(idx));                  \
-    cpu_##STSUF##_data_ra(env, addr, data, retaddr);       \
+#define GEN_VEXT_ST_ELEM(NAME, ETYPE, H, STSUF)         \
+static inline QEMU_ALWAYS_INLINE                        \
+void NAME(CPURISCVState *env, abi_ptr addr,             \
+          uint32_t idx, void *vd, uintptr_t retaddr)    \
+{                                                       \
+    ETYPE data = *((ETYPE *)vd + H(idx));               \
+    cpu_##STSUF##_data_ra(env, addr, data, retaddr);    \
 }
 
 GEN_VEXT_ST_ELEM(ste_b, int8_t,  H1, stb)
@@ -291,7 +293,7 @@ GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d)
  */
 
 /* unmasked unit-stride load and store operation */
-static void
+static inline QEMU_ALWAYS_INLINE void
 vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
              vext_ldst_elem_fn *ldst_elem, uint32_t log2_esz, uint32_t evl,
              uintptr_t ra)
-- 
2.34.1


