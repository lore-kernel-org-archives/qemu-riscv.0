Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7259FCDD54F
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 17:16:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sqyGY-0007km-QI; Wed, 18 Sep 2024 13:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sqyGX-0007fs-Gw
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2024 13:14:58 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1sqyGV-0001vF-LE
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2024 13:14:57 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-7db53a20d1fso2989119a12.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2024 10:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1726679694; x=1727284494; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f408neNmJiHRMFNBITqjdfGcu6sd/hAmiLVrUqm2xBk=;
 b=ZHUYgjXDcDxRq2RdAX2ki5uX15Vgl0RZNgHH57zghRvRfUcRvze05mVuLHz2cmpi7J
 PvNDs9R/6xSzcvd8wbHqF8AQR2Vpq9MsAGYfeOOrIJVZrdKdo8mmU1500RklL4/ZNs4E
 xmc5pFn4vNrwX4pOdydljN6uo+bwWsaJgG/tyElyQJHFtCR80G/xK/Acp8ArVC048MEi
 FHIBQ+0DbXE6fE0IpPrVUwiDLd/pTanld+uAIl6xslaNaZJLTdjPAjLVPun/9+18s+Jk
 avCA+7tOWoo+XIb3l4LzTct9HDpKAWgDcQUBa5wa8VkeX4F+OJ/Fspjkd/rqPo3bMFRw
 FBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726679694; x=1727284494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f408neNmJiHRMFNBITqjdfGcu6sd/hAmiLVrUqm2xBk=;
 b=tVm3xPSyFdITdmT/FPks4uqGqNMST15naqrqbCApde9+LymYkomsuKNGLwDyLG2mrG
 +HKk1E5YhtJjEVSTaokiNYY3tR25Gmabkz/xPDVsdZT0D8FWYrVnYZ5Ny8+8kLhg+n0W
 PY5k30Tm3USzn3IfT+0QisDd6wZiPt7eYXvPBf2L470v69ptGsEP4N3BPglkfEg1ofqW
 JBRlcrWjZ2JCeODuC3fBkclcwyM3XMLXFhh5GLRwf2bW5JiZiPM1cM49ra0O8/KuHfJm
 JG1G71GUYpksQzCUR6MtfYXyvLLkSmjVnadEuvP5gtscu8tST4gWOFPBkpb4hzrqhba3
 z1Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8e+w0VH6pcAcZ47HFf0MWNDKPyyI/oNe5t8NDxZvhZhd3wPR+gQu1u/5mGPYF6Bqjs0bKaLys/pKO@nongnu.org
X-Gm-Message-State: AOJu0YxJpQ2l8EhAh5MYy4/eoOcCYsVx65NKpgHTDw+/RsPuF/2m9hg+
 tQ9PRkyI1HEcvWyFs6K3TG8lRcd+TtA2/2pr13de7IcFJUdzjE4898/KAosv0yg=
X-Google-Smtp-Source: AGHT+IGE90+JXk1/9HlzshqC/Q6QpcF2o6vJM8Xbn1n6a1qvv2LOTEKJguy44zgsNP1e6DDtTd2ABg==
X-Received: by 2002:a05:6a21:1646:b0:1cf:3ec5:e779 with SMTP id
 adf61e73a8af0-1cf75d7fc8emr32031945637.5.1726679694350; 
 Wed, 18 Sep 2024 10:14:54 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2dd608e2318sm1914577a91.32.2024.09.18.10.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 10:14:54 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 negge@google.com, Max Chou <max.chou@sifive.com>
Subject: [PATCH v6 7/7] target/riscv: Inline unit-stride ld/st and
 corresponding functions for performance
Date: Thu, 19 Sep 2024 01:14:12 +0800
Message-Id: <20240918171412.150107-8-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918171412.150107-1-max.chou@sifive.com>
References: <20240918171412.150107-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x535.google.com
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

In the vector unit-stride load/store helper functions. the vext_ldst_us
& vext_ldst_whole functions corresponding most of the execution time.
Inline the functions can avoid the function call overhead to improve the
helper function performance.

Signed-off-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 654d5e111f3..0d5ed950486 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -152,14 +152,16 @@ typedef void vext_ldst_elem_fn_tlb(CPURISCVState *env, abi_ptr addr,
 typedef void vext_ldst_elem_fn_host(void *vd, uint32_t idx, void *host);
 
 #define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)             \
-static void NAME##_tlb(CPURISCVState *env, abi_ptr addr,    \
+static inline QEMU_ALWAYS_INLINE                            \
+void NAME##_tlb(CPURISCVState *env, abi_ptr addr,           \
                 uint32_t idx, void *vd, uintptr_t retaddr)  \
 {                                                           \
     ETYPE *cur = ((ETYPE *)vd + H(idx));                    \
     *cur = cpu_##LDSUF##_data_ra(env, addr, retaddr);       \
 }                                                           \
                                                             \
-static void NAME##_host(void *vd, uint32_t idx, void *host) \
+static inline QEMU_ALWAYS_INLINE                            \
+void NAME##_host(void *vd, uint32_t idx, void *host)        \
 {                                                           \
     ETYPE *cur = ((ETYPE *)vd + H(idx));                    \
     *cur = (ETYPE)LDSUF##_p(host);                          \
@@ -171,14 +173,16 @@ GEN_VEXT_LD_ELEM(lde_w, uint32_t, H4, ldl)
 GEN_VEXT_LD_ELEM(lde_d, uint64_t, H8, ldq)
 
 #define GEN_VEXT_ST_ELEM(NAME, ETYPE, H, STSUF)             \
-static void NAME##_tlb(CPURISCVState *env, abi_ptr addr,    \
+static inline QEMU_ALWAYS_INLINE                            \
+void NAME##_tlb(CPURISCVState *env, abi_ptr addr,           \
                 uint32_t idx, void *vd, uintptr_t retaddr)  \
 {                                                           \
     ETYPE data = *((ETYPE *)vd + H(idx));                   \
     cpu_##STSUF##_data_ra(env, addr, data, retaddr);        \
 }                                                           \
                                                             \
-static void NAME##_host(void *vd, uint32_t idx, void *host) \
+static inline QEMU_ALWAYS_INLINE                            \
+void NAME##_host(void *vd, uint32_t idx, void *host)        \
 {                                                           \
     ETYPE data = *((ETYPE *)vd + H(idx));                   \
     STSUF##_p(host, data);                                  \
@@ -317,7 +321,7 @@ GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d_tlb)
  */
 
 /* unmasked unit-stride load and store operation */
-static void
+static inline QEMU_ALWAYS_INLINE void
 vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
                   uint32_t elems, uint32_t nf, uint32_t max_elems,
                   uint32_t log2_esz, bool is_load, int mmu_index,
@@ -369,7 +373,7 @@ vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
     }
 }
 
-static void
+static inline QEMU_ALWAYS_INLINE void
 vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
              vext_ldst_elem_fn_tlb *ldst_tlb,
              vext_ldst_elem_fn_host *ldst_host, uint32_t log2_esz,
@@ -756,7 +760,7 @@ GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d_tlb, lde_d_host)
 /*
  * load and store whole register instructions
  */
-static void
+static inline QEMU_ALWAYS_INLINE void
 vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
                 vext_ldst_elem_fn_tlb *ldst_tlb,
                 vext_ldst_elem_fn_host *ldst_host, uint32_t log2_esz,
-- 
2.34.1


