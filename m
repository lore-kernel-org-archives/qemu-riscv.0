Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C85C369C2
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 22:35:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u7MDG-0004VB-GL; Tue, 22 Apr 2025 18:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1u7MD6-0004TL-JY
 for qemu-riscv@nongnu.org; Tue, 22 Apr 2025 18:35:28 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1u7MD2-00024Z-Nc
 for qemu-riscv@nongnu.org; Tue, 22 Apr 2025 18:35:24 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-af5085f7861so3985112a12.3
 for <qemu-riscv@nongnu.org>; Tue, 22 Apr 2025 15:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745361317; x=1745966117;
 darn=nongnu.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Nm9FPhOGujzcuwc0fqA5mk8oSCUhAkJUmvwSiBQ8E6k=;
 b=wLmuMwsXHs7t/s754vJMbMxv3/4kWqyDR3oPwkQje7voZerbTl9k5gxzadZEcXrssL
 Y2bAoFn9BcM8zcqQVnvAmWzDVCzxhTQVEfiBX2/AiJNqeVk/3Be3/MqfP1ns2a94A/ms
 yNzigb34aAUqyBiMnkMTk8oVnPYQk+pqjbE/eypToKLacSqjHG3oL/Rs/OJbNvdryFFj
 5gsjNMg/DGok7jzQN0woYYckiJ3BXM7OSBI6LIMnrG3AEXtEZkYpFbrblfB551KdO219
 l7HJQP5X3vTBbN0DsKE2Oj3hOyFwAz+bJzrMcgOQq+xaDHds+Q14PUcn/YYcm9JgiZdd
 FaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745361317; x=1745966117;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nm9FPhOGujzcuwc0fqA5mk8oSCUhAkJUmvwSiBQ8E6k=;
 b=MybF5DLt7he0hRGtw1hLz8k9ACtfX9y9J+34VlB6fAMi+WRi/3lXXKFF+yvbBI4z72
 mMa9NZF2IAphIzzfK98CjDUypZWyzL9mbWp4otDvyfdipVCCPVZ2I7S9a+5wMD3lCsop
 bIrrav4ujRn+5ewhEczAwOwfTtehtt/azmGwelCkmBZRuGV5EwuqtnMojRFJCQUFpELs
 p7csOjqrphNiiUuysZiasoo0Ws8oFmne7VAZambv+GqV6Z46g3ExHesLDDjo6ZDfutpR
 oR3VZGIK01T9TSe2cja/5U99ytQJzv9iUb8B8/Pl1ARNbd4b2pBAKJ1yJOeEwRqfSMaO
 qnIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXisW89H8qBsN4RmF74G6vGpCI+TV7HIScxxRWjJvDHCYQT2nskw2a8M+elTqaDrGRrTtkCa3v+J6He@nongnu.org
X-Gm-Message-State: AOJu0Yw51F71YYfv2gZv3xhUyLn2qsWqm2+yr0rRcVZDqgWCtkS/A2Vr
 pjWktbHT0yIp3S2Q1fo/cButbw7MZEAIeSVJiCzIEZJ3MNN1pH999NthORpXows=
X-Gm-Gg: ASbGncvGO8w1PZMCspFOE5vO+F7un2zokUZuBXSkrVWzFID6U3ODR619z28SpCVUdv5
 ECAkvEHwoRpo8LGel/Nzi6gURmb1x/kzI338mb+MvnmxShaSZus+P0BZWt9DpcoVRY5Tk67J4kl
 nQKgyJ0983IGzbBVXI1THV8uLKOpUeY1sSb9hB8nVG8pV6U0pvnFywoSazEYpDSIiMmCu3AFYZp
 0hrSOFcfTjyNwBP8iUAve3rPDhFB/HlMDJSZXQHqz2TprdNwffdcSWnBC3vWWW2njukZG2YWzLR
 EgNDkOPMZ8LVIxfhRo8Bl90zucYEi9/KvHFIuVCqTe6hyO2YCmd7n62lW86SiA==
X-Google-Smtp-Source: AGHT+IGRtNpcl084SxWJilu3P0E37ULqbnojQ/fPwBeTCEGXrb+sfYtrDiO3cdjyXzbI3RkIBLZUPQ==
X-Received: by 2002:a17:902:f681:b0:224:18bb:44c2 with SMTP id
 d9443c01a7336-22c53472982mr209857705ad.6.1745361317619; 
 Tue, 22 Apr 2025 15:35:17 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50eb491asm90813795ad.116.2025.04.22.15.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 15:35:17 -0700 (PDT)
Date: Tue, 22 Apr 2025 15:35:15 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH RFC] target: riscv: Add Svrsw60b59b extension support
Message-ID: <aAgZo68nLYdm186S@debug.ba.rivosinc.com>
References: <20250314104833.369365-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250314104833.369365-1-alexghiti@rivosinc.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=debug@rivosinc.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Mar 14, 2025 at 11:48:33AM +0100, Alexandre Ghiti wrote:
>The Svrsw60b59b extension allows to free the PTE reserved bits 60 and 59
>for software to use.

Apart from what you already caught.
Extension is dependnet on Sv39. So it should be validated somewhere.
Perhaps in `riscv_cpu_validate_set_extensions` (target/riscv/tcg/tcg-cpu.c).

>
>Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>---
>
>I tested it by always setting the bits 60 and 59 in Linux which booted
>fine.
>
> target/riscv/cpu.c        | 2 ++
> target/riscv/cpu_bits.h   | 3 ++-
> target/riscv/cpu_cfg.h    | 1 +
> target/riscv/cpu_helper.c | 3 ++-
> 4 files changed, 7 insertions(+), 2 deletions(-)
>
>diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>index 3d4bd157d2..ee89cdef46 100644
>--- a/target/riscv/cpu.c
>+++ b/target/riscv/cpu.c
>@@ -219,6 +219,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
>     ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
>     ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
>     ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
>+    ISA_EXT_DATA_ENTRY(svrsw60b59b, PRIV_VERSION_1_13_0, ext_svrsw60b59b),
>     ISA_EXT_DATA_ENTRY(svukte, PRIV_VERSION_1_13_0, ext_svukte),
>     ISA_EXT_DATA_ENTRY(svvptc, PRIV_VERSION_1_13_0, ext_svvptc),
>     ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
>@@ -1644,6 +1645,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>     MULTI_EXT_CFG_BOOL("svinval", ext_svinval, false),
>     MULTI_EXT_CFG_BOOL("svnapot", ext_svnapot, false),
>     MULTI_EXT_CFG_BOOL("svpbmt", ext_svpbmt, false),
>+    MULTI_EXT_CFG_BOOL("svrsw60b59b", ext_svrsw60b59b, false),
>     MULTI_EXT_CFG_BOOL("svvptc", ext_svvptc, true),
>
>     MULTI_EXT_CFG_BOOL("zicntr", ext_zicntr, true),
>diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>index f97c48a394..71f9e603c5 100644
>--- a/target/riscv/cpu_bits.h
>+++ b/target/riscv/cpu_bits.h
>@@ -663,7 +663,8 @@ typedef enum {
> #define PTE_SOFT            0x300 /* Reserved for Software */
> #define PTE_PBMT            0x6000000000000000ULL /* Page-based memory types */
> #define PTE_N               0x8000000000000000ULL /* NAPOT translation */
>-#define PTE_RESERVED        0x1FC0000000000000ULL /* Reserved bits */
>+#define PTE_RESERVED(svrsw60b59b)		\
>+		(svrsw60b59b ? 0x07C0000000000000ULL : 0x1FC0000000000000ULL) /* Reserved bits */
> #define PTE_ATTR            (PTE_N | PTE_PBMT) /* All attributes bits */
>
> /* Page table PPN shift amount */
>diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
>index b410b1e603..f6e4b0068a 100644
>--- a/target/riscv/cpu_cfg.h
>+++ b/target/riscv/cpu_cfg.h
>@@ -89,6 +89,7 @@ struct RISCVCPUConfig {
>     bool ext_svinval;
>     bool ext_svnapot;
>     bool ext_svpbmt;
>+    bool ext_svrsw60b59b;
>     bool ext_svvptc;
>     bool ext_svukte;
>     bool ext_zdinx;
>diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>index e1dfc4ecbf..6546cea403 100644
>--- a/target/riscv/cpu_helper.c
>+++ b/target/riscv/cpu_helper.c
>@@ -1156,6 +1156,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>     bool svade = riscv_cpu_cfg(env)->ext_svade;
>     bool svadu = riscv_cpu_cfg(env)->ext_svadu;
>     bool adue = svadu ? env->menvcfg & MENVCFG_ADUE : !svade;
>+    bool svrsw60b59b = riscv_cpu_cfg(env)->ext_svrsw60b59b;
>
>     if (first_stage && two_stage && env->virt_enabled) {
>         pbmte = pbmte && (env->henvcfg & HENVCFG_PBMTE);
>@@ -1225,7 +1226,7 @@ restart:
>         if (riscv_cpu_sxl(env) == MXL_RV32) {
>             ppn = pte >> PTE_PPN_SHIFT;
>         } else {
>-            if (pte & PTE_RESERVED) {
>+            if (pte & PTE_RESERVED(svrsw60b59b)) {
>                 return TRANSLATE_FAIL;
>             }
>
>-- 
>2.39.2
>
>

