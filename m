Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSMyl-0000Kj-Oj
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 13:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyj-0008RI-Ol
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 13:58:05 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyg-00080n-6q
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 13:58:05 -0500
Received: by mail-oi1-x229.google.com with SMTP id bx13so16626070oib.13
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 10:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GvaH81B5hBrpGPqem9kaUkSdCiGN0le0jCxW0/4CJJg=;
 b=jkIr/+wjpIgWgAjVzvrmpKtmvPFIPna3dhunaWVZGCDKCask1VqCI6jcmt/33lCh04
 f74+ZGaCh2tkCVIQIDXWclV1wkolbdlK5WNE2E1m9SmYSKiJ6ntcP6VcjC9IgRzz4UCd
 GhNXMkAICI3/3AzERPUKUSAV7Ez8XlcvUZvj82iUzQSwM6XHCEGP377BbUGZbIKXLS+3
 ZnmfifVg1TOZ01mS/bHBfI8MgGXJq/RENnxQjEpzpBPXZqTEsE13joy1vxg6zNle6+1e
 WTZxOfM7OZBe0XI7RZFnfSbc64foD5Sm5kt3I5P+0XTT3PtijawEiyVz6Cm2N2XOIT/g
 IvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GvaH81B5hBrpGPqem9kaUkSdCiGN0le0jCxW0/4CJJg=;
 b=Tco4a30Ghrw2kQxD4VinhDdAVE40y1fKnnyPYR0McSlmPK6jjAOcGRT1QfGh9d89jr
 +KOTpEBvv4OHHyFhHEofxgk0pe5pEjIhttiXeHVLlwgPo7o4jIyr0MuPiUCT5uVHbkrq
 ORMkKATq2msUwhNT7yFS7S0OaeZNgrKpL1ED4xPDpm3oe1NHyNxNByvNQzEJeJ+cXH+E
 gmsliNgRt7HFBYIyDUUVhYTNiLniZ6rG72YiIn8GEHem1UqQXmymTXo6hoaeYZpOClev
 6H8O9FIxogzAtfipB7tolrp1AHs+3RFPXXLvQZYYuM/x86xrUyh8JGmxTzlNJS6gJbCu
 cv4A==
X-Gm-Message-State: AO0yUKWN0CglQRwYXVee3fsYbr0VxA+UI8RPyLobwz1UWdxRx4Qzjh6K
 1XXEMjIOC20nPnwzDex59gK8xw==
X-Google-Smtp-Source: AK7set9+BX1XPIa2drpEYnGU2E2HncOZOL2DVGS5NOZCl0U7L5WuK8o0ABeHUUX0cFnFnuMsSpSQPA==
X-Received: by 2002:a05:6808:3a9:b0:37d:c268:d3d9 with SMTP id
 n9-20020a05680803a900b0037dc268d3d9mr1504057oie.11.1676487481131; 
 Wed, 15 Feb 2023 10:58:01 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a056808139500b0037d8dbe4308sm4145697oiw.48.2023.02.15.10.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 10:58:00 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 10/10] target/riscv/cpu: remove CPUArchState::features and
 friends
Date: Wed, 15 Feb 2023 15:57:26 -0300
Message-Id: <20230215185726.691759-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215185726.691759-1-dbarboza@ventanamicro.com>
References: <20230215185726.691759-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x229.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 18:58:06 -0000

The attribute is no longer used since we can retrieve all the enabled
features in the hart by using cpu->cfg instead.

Remove env->feature, riscv_feature() and riscv_set_feature(). We also
need to bump vmstate_riscv_cpu version_id and minimal_version_id since
'features' is no longer being migrated.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.h     | 12 ------------
 target/riscv/machine.c |  5 ++---
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7ff4d90261..671734420b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -173,8 +173,6 @@ struct CPUArchState {
     /* 128-bit helpers upper part return value */
     target_ulong retxh;
 
-    uint32_t features;
-
 #ifdef CONFIG_USER_ONLY
     uint32_t elf_flags;
 #endif
@@ -524,16 +522,6 @@ static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
     return (env->misa_ext & ext) != 0;
 }
 
-static inline bool riscv_feature(CPURISCVState *env, int feature)
-{
-    return env->features & (1ULL << feature);
-}
-
-static inline void riscv_set_feature(CPURISCVState *env, int feature)
-{
-    env->features |= (1ULL << feature);
-}
-
 #include "cpu_user.h"
 
 extern const char * const riscv_int_regnames[];
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 67e9e56853..9c455931d8 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -331,8 +331,8 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
 
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
-    .version_id = 6,
-    .minimum_version_id = 6,
+    .version_id = 7,
+    .minimum_version_id = 7,
     .post_load = riscv_cpu_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
@@ -351,7 +351,6 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINT32(env.misa_ext, RISCVCPU),
         VMSTATE_UINT32(env.misa_mxl_max, RISCVCPU),
         VMSTATE_UINT32(env.misa_ext_mask, RISCVCPU),
-        VMSTATE_UINT32(env.features, RISCVCPU),
         VMSTATE_UINTTL(env.priv, RISCVCPU),
         VMSTATE_UINTTL(env.virt, RISCVCPU),
         VMSTATE_UINT64(env.resetvec, RISCVCPU),
-- 
2.39.1


