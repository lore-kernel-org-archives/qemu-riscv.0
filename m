Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSdx7-0004Ul-7p
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 08:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdx3-0004TX-66
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 08:05:29 -0500
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwz-0002CK-VB
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 08:05:27 -0500
Received: by mail-oo1-xc33.google.com with SMTP id
 z25-20020a4ad1b9000000b00517affa07c0so201898oor.7
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 05:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GvaH81B5hBrpGPqem9kaUkSdCiGN0le0jCxW0/4CJJg=;
 b=EQRrHyZJa51674sQhWplIv6fecOyvEHgyYtijEchbT/S8ypIZ1DV+uZ91I21qFNFGy
 suKo6GRcIcuUCJtyc+JrXSZqKMm4XyoPjufdb+SgftEyA1LiUM17LPug6jT5jxKqBefB
 5M/qyzYIe+kq0rwAnJgki+yRNTaPNcijk0T5Kt0iLXICLCJgaljgkGKsIGHmfyWbueOh
 Zhp8J5P3o6b8k6zKfvWiYlyY/+UV3PjU7uiAtsWbbvNCV9Q8LG27WRv/utOKMwvE79Oq
 ALNJk1+FqJcI+OwN5jNtMum2xj1ByJSLMhnU3fsxQt6XHAzlAe4Z4ksMSNQ4hVYYKzJl
 IAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GvaH81B5hBrpGPqem9kaUkSdCiGN0le0jCxW0/4CJJg=;
 b=MvHO1AnPreL5SPJkFeoSriPybAu3E62lfutnXlGcepefiElJ30z35KSgbtEcbHgokQ
 TscrRZrneSXoaqs06+LXRFop64iY/iiCrWDhaCOJuHJf4zsjhsOMbGvLMcOW6lg1p3Uq
 9K7Ewkt0onDe3e1iu53BYwGpZnUM4v/VJx4xCnDaeFIP6d/Rc0jxy5zl+TbzCN1baq4W
 SvJKFK4SdfunbG81bjpOTh5VV3u7vBdKAzRqLxJR4FDFoOywpx3EKI7/5lyHAZEK2Kw4
 VxL2j35DSJBWglgr90hHCLYHmK4VuI+Z+VhCm6fz6slMp2FLLhLH+ehYAR53OmQ+d3Ed
 EdyA==
X-Gm-Message-State: AO0yUKUA7ebxps8iLyHl4xntERI8B40hBYh8mtHu3N5lQfv3SM8iQD04
 0E17yrZ8RYtUcQ9L+XbC9wJICA==
X-Google-Smtp-Source: AK7set9SuXlB4yKcBgavleAnsejW5UCFlavlev4MYns7+uSPv6zvsNpXc4CW/QneGy4hhsjkFnCVxA==
X-Received: by 2002:a05:6820:1895:b0:51a:48f4:75de with SMTP id
 bm21-20020a056820189500b0051a48f475demr889666oob.0.1676552725190; 
 Thu, 16 Feb 2023 05:05:25 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c74-20020a4a4f4d000000b0051f97e8a1d5sm594315oob.35.2023.02.16.05.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:05:24 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 10/10] target/riscv/cpu: remove CPUArchState::features and
 friends
Date: Thu, 16 Feb 2023 10:04:44 -0300
Message-Id: <20230216130444.795997-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216130444.795997-1-dbarboza@ventanamicro.com>
References: <20230216130444.795997-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc33.google.com
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
X-List-Received-Date: Thu, 16 Feb 2023 13:05:31 -0000

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


