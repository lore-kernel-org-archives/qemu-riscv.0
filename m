Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE28EC19F32
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 12:14:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tqWa7-0005EG-LX; Fri, 07 Mar 2025 07:13:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tqWZi-0005B8-OO
 for qemu-riscv@nongnu.org; Fri, 07 Mar 2025 07:13:11 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tqWZe-00065m-EC
 for qemu-riscv@nongnu.org; Fri, 07 Mar 2025 07:13:10 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2fec13a4067so2793893a91.2
 for <qemu-riscv@nongnu.org>; Fri, 07 Mar 2025 04:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1741349583; x=1741954383; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oVQe00PkeKkokuh/V5bkj1kPNsp44HBQF5GCMF1z+vI=;
 b=IDiyvrSZVkiZdeBzgthPdw4flGRd2M2Qf7PWCJ02PnZ2r2sAqXVzLdGjyNZk87Y/A4
 ChmWqJQ1EwMpVdKbTaFzqiz5109jiJEDnAhfoYTlRFiu//6/jDS89LAJsAIm8Zq0eoXj
 ntR71xqpLq5nDhBdS4oA4Sn3Z32RS8KN3j/eEunyQs/pVjkdaM0CeW45LkRZJUvpz/vK
 7meirryIDpdVUaJJ+GFfKBBa1KU3MbnMTOrbALvNBZLMODQasrv9EDg0LPf8nsmBFYlJ
 431UayhSIFzIw3fuiNkjNZ8M5orCagHeNRdIQYu5oOm25rkTYXi0Ay8g7cVaMkvuXDAe
 IDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741349583; x=1741954383;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oVQe00PkeKkokuh/V5bkj1kPNsp44HBQF5GCMF1z+vI=;
 b=tU2/8S5nT3/m383YST3LfaW5ygGqoPP3h73IPWWbJ2YDFWsl9Mq/UrWF1HzqKU7sV4
 Uu2wUa5cGSap05DW9g5Smm/M5A0nYMojJB7ukMa/Put8Citb/uRg4/AeKeWsV6bzSzmk
 2A2xnRu7sT0BfPqfc4WcksHfm8mJQ8z2/Xf4nnAfKyuzhV3x9YM4nbzFNw1YjPxqdNGh
 mAgCUAr5eiyZn83gp8bqC4fHam3GL7aZ41xPlQbXclfnC07CnNtG00KPSFOwRkuBuDeo
 dDFaBT728j0hNIN4zvC3xutzbeNMJNS0Wq97MKpmzjKCQcBVWVrXFDrE+g13bA8/JlyE
 Delg==
X-Gm-Message-State: AOJu0YxOIwOkm1RDaudhzIdQ67th0eFR36W4MoZgIEJcJCX/b7COfIon
 5XVb7Ite5dEARewM2/Hf5uG2RWubIaQGoDxuJvUnEOJAuw8TM8aLwxPvex6rZoU=
X-Gm-Gg: ASbGnctg0MGZ07u2VGkILWLycXx5WqlwAaxlbrzVxCcjm2+i273UELHy42r4C91+hOn
 ledTDHwZTqQFb22zjaZ1yuMsi4oA9aSdkVPMow6RAvnTTKx6GasKujotpzpA1fYQPf9mBmY6rWj
 /Bto7sd0I4KiDUBFAZ4GPAGg78aRHJyZhDcz5zE1yg5+kQpekw9kPZULdfE+0AkQ312aoVXeh7R
 0a0uaKpatyIFR+OFpAx67M5zHJUw44M+Vr/KRiENFFAyOOJ99Z9TdnXdL1yOo3NT+z3J5ajisRi
 0tK8a9yKYbj6/VTPhwLhyjCxI4j+h5OYB7OnOKVTI01Hb/ou2wuhn0hK/sw=
X-Google-Smtp-Source: AGHT+IHUZhrnRE372PNq+9PNG2IXSMiDvf/tyHaNMXYsO7uHCJY3DXULOcEUc70Cp/tO7wa2qpV2+g==
X-Received: by 2002:a17:90b:5186:b0:2ff:58c7:a71f with SMTP id
 98e67ed59e1d1-2ff7cf32cacmr4438359a91.32.1741349583113; 
 Fri, 07 Mar 2025 04:13:03 -0800 (PST)
Received: from [192.168.68.110] ([177.170.118.40])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e72basm2870429a91.39.2025.03.07.04.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 04:13:02 -0800 (PST)
Message-ID: <71f15782-ec28-4763-8197-c10ec12811ec@ventanamicro.com>
Date: Fri, 7 Mar 2025 09:12:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] target/riscv: refactor VSTART_CHECK_EARLY_EXIT()
 to accept vl as a parameter
To: Chao Liu <lc00631@tecorigin.com>, alistair.francis@wdc.com,
 bmeng.cn@gmail.com, palmer@dabbelt.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, zqz00548@tecorigin.com
References: <cover.1736130472.git.lc00631@tecorigin.com>
 <a5582f0328b156537074fc79439ba7e5988797b5.1736130472.git.lc00631@tecorigin.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <a5582f0328b156537074fc79439ba7e5988797b5.1736130472.git.lc00631@tecorigin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



On 1/5/25 11:43 PM, Chao Liu wrote:
> Some vector instructions are special, such as the vlm.v instruction,
> where setting its vl actually sets evl = (vl + 7) >> 3. To improve
> maintainability, we will uniformly use VSTART_CHECK_EARLY_EXIT() to
> check for the condition vstart >= vl. This function will also handle
> cases involving evl.
> 
> Fixes: df4252b2ec ("target/riscv/vector_helpers: do early exit when
> vstart >= vl")
> Signed-off-by: Chao Liu <lc00631@tecorigin.com>
> ---



Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/vcrypto_helper.c   | 32 +++++++--------
>   target/riscv/vector_helper.c    | 69 ++++++++++++++++-----------------
>   target/riscv/vector_internals.c |  4 +-
>   target/riscv/vector_internals.h | 12 +++---
>   4 files changed, 57 insertions(+), 60 deletions(-)
> 
> diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
> index f7423df226..1526de96f5 100644
> --- a/target/riscv/vcrypto_helper.c
> +++ b/target/riscv/vcrypto_helper.c
> @@ -222,7 +222,7 @@ static inline void xor_round_key(AESState *round_state, AESState *round_key)
>           uint32_t total_elems = vext_get_total_elems(env, desc, 4);        \
>           uint32_t vta = vext_vta(desc);                                    \
>                                                                             \
> -        VSTART_CHECK_EARLY_EXIT(env);                                     \
> +        VSTART_CHECK_EARLY_EXIT(env, vl);                                 \
>                                                                             \
>           for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {        \
>               AESState round_key;                                           \
> @@ -248,7 +248,7 @@ static inline void xor_round_key(AESState *round_state, AESState *round_key)
>           uint32_t total_elems = vext_get_total_elems(env, desc, 4);        \
>           uint32_t vta = vext_vta(desc);                                    \
>                                                                             \
> -        VSTART_CHECK_EARLY_EXIT(env);                                     \
> +        VSTART_CHECK_EARLY_EXIT(env, vl);                                 \
>                                                                             \
>           for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {        \
>               AESState round_key;                                           \
> @@ -309,7 +309,7 @@ void HELPER(vaeskf1_vi)(void *vd_vptr, void *vs2_vptr, uint32_t uimm,
>       uint32_t total_elems = vext_get_total_elems(env, desc, 4);
>       uint32_t vta = vext_vta(desc);
>   
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, vl);
>   
>       uimm &= 0b1111;
>       if (uimm > 10 || uimm == 0) {
> @@ -357,7 +357,7 @@ void HELPER(vaeskf2_vi)(void *vd_vptr, void *vs2_vptr, uint32_t uimm,
>       uint32_t total_elems = vext_get_total_elems(env, desc, 4);
>       uint32_t vta = vext_vta(desc);
>   
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, vl);
>   
>       uimm &= 0b1111;
>       if (uimm > 14 || uimm < 2) {
> @@ -465,7 +465,7 @@ void HELPER(vsha2ms_vv)(void *vd, void *vs1, void *vs2, CPURISCVState *env,
>       uint32_t total_elems;
>       uint32_t vta = vext_vta(desc);
>   
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, env->vl);
>   
>       for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
>           if (sew == MO_32) {
> @@ -582,7 +582,7 @@ void HELPER(vsha2ch32_vv)(void *vd, void *vs1, void *vs2, CPURISCVState *env,
>       uint32_t total_elems;
>       uint32_t vta = vext_vta(desc);
>   
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, env->vl);
>   
>       for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
>           vsha2c_32(((uint32_t *)vs2) + 4 * i, ((uint32_t *)vd) + 4 * i,
> @@ -602,7 +602,7 @@ void HELPER(vsha2ch64_vv)(void *vd, void *vs1, void *vs2, CPURISCVState *env,
>       uint32_t total_elems;
>       uint32_t vta = vext_vta(desc);
>   
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, env->vl);
>   
>       for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
>           vsha2c_64(((uint64_t *)vs2) + 4 * i, ((uint64_t *)vd) + 4 * i,
> @@ -622,7 +622,7 @@ void HELPER(vsha2cl32_vv)(void *vd, void *vs1, void *vs2, CPURISCVState *env,
>       uint32_t total_elems;
>       uint32_t vta = vext_vta(desc);
>   
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, env->vl);
>   
>       for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
>           vsha2c_32(((uint32_t *)vs2) + 4 * i, ((uint32_t *)vd) + 4 * i,
> @@ -642,7 +642,7 @@ void HELPER(vsha2cl64_vv)(void *vd, void *vs1, void *vs2, CPURISCVState *env,
>       uint32_t total_elems;
>       uint32_t vta = vext_vta(desc);
>   
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, env->vl);
>   
>       for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
>           vsha2c_64(((uint64_t *)vs2) + 4 * i, ((uint64_t *)vd) + 4 * i,
> @@ -676,7 +676,7 @@ void HELPER(vsm3me_vv)(void *vd_vptr, void *vs1_vptr, void *vs2_vptr,
>       uint32_t *vs1 = vs1_vptr;
>       uint32_t *vs2 = vs2_vptr;
>   
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, env->vl);
>   
>       for (int i = env->vstart / 8; i < env->vl / 8; i++) {
>           uint32_t w[24];
> @@ -777,7 +777,7 @@ void HELPER(vsm3c_vi)(void *vd_vptr, void *vs2_vptr, uint32_t uimm,
>       uint32_t *vs2 = vs2_vptr;
>       uint32_t v1[8], v2[8], v3[8];
>   
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, env->vl);
>   
>       for (int i = env->vstart / 8; i < env->vl / 8; i++) {
>           for (int k = 0; k < 8; k++) {
> @@ -802,7 +802,7 @@ void HELPER(vghsh_vv)(void *vd_vptr, void *vs1_vptr, void *vs2_vptr,
>       uint32_t vta = vext_vta(desc);
>       uint32_t total_elems = vext_get_total_elems(env, desc, 4);
>   
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, env->vl);
>   
>       for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
>           uint64_t Y[2] = {vd[i * 2 + 0], vd[i * 2 + 1]};
> @@ -841,7 +841,7 @@ void HELPER(vgmul_vv)(void *vd_vptr, void *vs2_vptr, CPURISCVState *env,
>       uint32_t vta = vext_vta(desc);
>       uint32_t total_elems = vext_get_total_elems(env, desc, 4);
>   
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, env->vl);
>   
>       for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
>           uint64_t Y[2] = {brev8(vd[i * 2 + 0]), brev8(vd[i * 2 + 1])};
> @@ -879,7 +879,7 @@ void HELPER(vsm4k_vi)(void *vd, void *vs2, uint32_t uimm5, CPURISCVState *env,
>       uint32_t esz = sizeof(uint32_t);
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>   
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, env->vl);
>   
>       for (uint32_t i = group_start; i < group_end; ++i) {
>           uint32_t vstart = i * egs;
> @@ -937,7 +937,7 @@ void HELPER(vsm4r_vv)(void *vd, void *vs2, CPURISCVState *env, uint32_t desc)
>       uint32_t esz = sizeof(uint32_t);
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>   
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, env->vl);
>   
>       for (uint32_t i = group_start; i < group_end; ++i) {
>           uint32_t vstart = i * egs;
> @@ -973,7 +973,7 @@ void HELPER(vsm4r_vs)(void *vd, void *vs2, CPURISCVState *env, uint32_t desc)
>       uint32_t esz = sizeof(uint32_t);
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>   
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, env->vl);
>   
>       for (uint32_t i = group_start; i < group_end; ++i) {
>           uint32_t vstart = i * egs;
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index a85dd1d200..4f14395808 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -265,7 +265,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base, target_ulong stride,
>       uint32_t esz = 1 << log2_esz;
>       uint32_t vma = vext_vma(desc);
>   
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, env->vl);
>   
>       for (i = env->vstart; i < env->vl; env->vstart = ++i) {
>           k = 0;
> @@ -388,10 +388,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>       uint32_t msize = nf * esz;
>       int mmu_index = riscv_env_mmu_index(env, false);
>   
> -    if (env->vstart >= evl) {
> -        env->vstart = 0;
> -        return;
> -    }
> +    VSTART_CHECK_EARLY_EXIT(env, evl);
>   
>       /* Calculate the page range of first page */
>       addr = base + ((env->vstart * nf) << log2_esz);
> @@ -533,7 +530,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>       uint32_t esz = 1 << log2_esz;
>       uint32_t vma = vext_vma(desc);
>   
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, env->vl);
>   
>       /* load bytes from guest memory */
>       for (i = env->vstart; i < env->vl; env->vstart = ++i) {
> @@ -625,7 +622,7 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
>       target_ulong addr, offset, remain, page_split, elems;
>       int mmu_index = riscv_env_mmu_index(env, false);
>   
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, env->vl);
>   
>       /* probe every access */
>       for (i = env->vstart; i < env->vl; i++) {
> @@ -1092,7 +1089,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>       uint32_t vta = vext_vta(desc);                            \
>       uint32_t i;                                               \
>                                                                 \
> -    VSTART_CHECK_EARLY_EXIT(env);                             \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                         \
>                                                                 \
>       for (i = env->vstart; i < vl; i++) {                      \
>           ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
> @@ -1126,7 +1123,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,        \
>       uint32_t vta = vext_vta(desc);                                       \
>       uint32_t i;                                                          \
>                                                                            \
> -    VSTART_CHECK_EARLY_EXIT(env);                                        \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                                    \
>                                                                            \
>       for (i = env->vstart; i < vl; i++) {                                 \
>           ETYPE s2 = *((ETYPE *)vs2 + H(i));                               \
> @@ -1163,7 +1160,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>       uint32_t vta_all_1s = vext_vta_all_1s(desc);              \
>       uint32_t i;                                               \
>                                                                 \
> -    VSTART_CHECK_EARLY_EXIT(env);                             \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                         \
>                                                                 \
>       for (i = env->vstart; i < vl; i++) {                      \
>           ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
> @@ -1203,7 +1200,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
>       uint32_t vta_all_1s = vext_vta_all_1s(desc);                \
>       uint32_t i;                                                 \
>                                                                   \
> -    VSTART_CHECK_EARLY_EXIT(env);                               \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                           \
>                                                                   \
>       for (i = env->vstart; i < vl; i++) {                        \
>           ETYPE s2 = *((ETYPE *)vs2 + H(i));                      \
> @@ -1301,7 +1298,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,                          \
>       uint32_t vma = vext_vma(desc);                                        \
>       uint32_t i;                                                           \
>                                                                             \
> -    VSTART_CHECK_EARLY_EXIT(env);                                         \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                                     \
>                                                                             \
>       for (i = env->vstart; i < vl; i++) {                                  \
>           if (!vm && !vext_elem_mask(v0, i)) {                              \
> @@ -1350,7 +1347,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,      \
>       uint32_t vma = vext_vma(desc);                          \
>       uint32_t i;                                             \
>                                                               \
> -    VSTART_CHECK_EARLY_EXIT(env);                           \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                       \
>                                                               \
>       for (i = env->vstart; i < vl; i++) {                    \
>           if (!vm && !vext_elem_mask(v0, i)) {                \
> @@ -1414,7 +1411,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>       uint32_t vma = vext_vma(desc);                            \
>       uint32_t i;                                               \
>                                                                 \
> -    VSTART_CHECK_EARLY_EXIT(env);                             \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                         \
>                                                                 \
>       for (i = env->vstart; i < vl; i++) {                      \
>           ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
> @@ -1481,7 +1478,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
>       uint32_t vma = vext_vma(desc);                                  \
>       uint32_t i;                                                     \
>                                                                       \
> -    VSTART_CHECK_EARLY_EXIT(env);                                   \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                               \
>                                                                       \
>       for (i = env->vstart; i < vl; i++) {                            \
>           ETYPE s2 = *((ETYPE *)vs2 + H(i));                          \
> @@ -2030,7 +2027,7 @@ void HELPER(NAME)(void *vd, void *vs1, CPURISCVState *env,           \
>       uint32_t vta = vext_vta(desc);                                   \
>       uint32_t i;                                                      \
>                                                                        \
> -    VSTART_CHECK_EARLY_EXIT(env);                                    \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                                \
>                                                                        \
>       for (i = env->vstart; i < vl; i++) {                             \
>           ETYPE s1 = *((ETYPE *)vs1 + H(i));                           \
> @@ -2056,7 +2053,7 @@ void HELPER(NAME)(void *vd, uint64_t s1, CPURISCVState *env,         \
>       uint32_t vta = vext_vta(desc);                                   \
>       uint32_t i;                                                      \
>                                                                        \
> -    VSTART_CHECK_EARLY_EXIT(env);                                    \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                                \
>                                                                        \
>       for (i = env->vstart; i < vl; i++) {                             \
>           *((ETYPE *)vd + H(i)) = (ETYPE)s1;                           \
> @@ -2081,7 +2078,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,          \
>       uint32_t vta = vext_vta(desc);                                   \
>       uint32_t i;                                                      \
>                                                                        \
> -    VSTART_CHECK_EARLY_EXIT(env);                                    \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                                \
>                                                                        \
>       for (i = env->vstart; i < vl; i++) {                             \
>           ETYPE *vt = (!vext_elem_mask(v0, i) ? vs2 : vs1);            \
> @@ -2107,7 +2104,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,               \
>       uint32_t vta = vext_vta(desc);                                   \
>       uint32_t i;                                                      \
>                                                                        \
> -    VSTART_CHECK_EARLY_EXIT(env);                                    \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                                \
>                                                                        \
>       for (i = env->vstart; i < vl; i++) {                             \
>           ETYPE s2 = *((ETYPE *)vs2 + H(i));                           \
> @@ -2154,7 +2151,7 @@ vext_vv_rm_1(void *vd, void *v0, void *vs1, void *vs2,
>                uint32_t vl, uint32_t vm, int vxrm,
>                opivv2_rm_fn *fn, uint32_t vma, uint32_t esz)
>   {
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, vl);
>   
>       for (uint32_t i = env->vstart; i < vl; i++) {
>           if (!vm && !vext_elem_mask(v0, i)) {
> @@ -2281,7 +2278,7 @@ vext_vx_rm_1(void *vd, void *v0, target_long s1, void *vs2,
>                uint32_t vl, uint32_t vm, int vxrm,
>                opivx2_rm_fn *fn, uint32_t vma, uint32_t esz)
>   {
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, vl);
>   
>       for (uint32_t i = env->vstart; i < vl; i++) {
>           if (!vm && !vext_elem_mask(v0, i)) {
> @@ -3080,7 +3077,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>       uint32_t vma = vext_vma(desc);                        \
>       uint32_t i;                                           \
>                                                             \
> -    VSTART_CHECK_EARLY_EXIT(env);                         \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                     \
>                                                             \
>       for (i = env->vstart; i < vl; i++) {                  \
>           if (!vm && !vext_elem_mask(v0, i)) {              \
> @@ -3125,7 +3122,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1,        \
>       uint32_t vma = vext_vma(desc);                        \
>       uint32_t i;                                           \
>                                                             \
> -    VSTART_CHECK_EARLY_EXIT(env);                         \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                     \
>                                                             \
>       for (i = env->vstart; i < vl; i++) {                  \
>           if (!vm && !vext_elem_mask(v0, i)) {              \
> @@ -3713,7 +3710,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
>       uint32_t vma = vext_vma(desc);                     \
>       uint32_t i;                                        \
>                                                          \
> -    VSTART_CHECK_EARLY_EXIT(env);                      \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                  \
>                                                          \
>       if (vl == 0) {                                     \
>           return;                                        \
> @@ -4236,7 +4233,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>       uint32_t vma = vext_vma(desc);                            \
>       uint32_t i;                                               \
>                                                                 \
> -    VSTART_CHECK_EARLY_EXIT(env);                             \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                         \
>                                                                 \
>       for (i = env->vstart; i < vl; i++) {                      \
>           ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
> @@ -4278,7 +4275,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
>       uint32_t vma = vext_vma(desc);                                  \
>       uint32_t i;                                                     \
>                                                                       \
> -    VSTART_CHECK_EARLY_EXIT(env);                                   \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                               \
>                                                                       \
>       for (i = env->vstart; i < vl; i++) {                            \
>           ETYPE s2 = *((ETYPE *)vs2 + H(i));                          \
> @@ -4473,7 +4470,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
>       uint32_t vta = vext_vta(desc);                            \
>       uint32_t i;                                               \
>                                                                 \
> -    VSTART_CHECK_EARLY_EXIT(env);                             \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                         \
>                                                                 \
>       for (i = env->vstart; i < vl; i++) {                      \
>           ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
> @@ -4799,7 +4796,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>       uint32_t i;                                           \
>       int a, b;                                             \
>                                                             \
> -    VSTART_CHECK_EARLY_EXIT(env);                         \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                     \
>                                                             \
>       for (i = env->vstart; i < vl; i++) {                  \
>           a = vext_elem_mask(vs1, i);                       \
> @@ -4994,7 +4991,7 @@ void HELPER(NAME)(void *vd, void *v0, CPURISCVState *env, uint32_t desc)  \
>       uint32_t vma = vext_vma(desc);                                        \
>       int i;                                                                \
>                                                                             \
> -    VSTART_CHECK_EARLY_EXIT(env);                                         \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                                     \
>                                                                             \
>       for (i = env->vstart; i < vl; i++) {                                  \
>           if (!vm && !vext_elem_mask(v0, i)) {                              \
> @@ -5031,7 +5028,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>       uint32_t vma = vext_vma(desc);                                        \
>       target_ulong offset = s1, i_min, i;                                   \
>                                                                             \
> -    VSTART_CHECK_EARLY_EXIT(env);                                         \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                                     \
>                                                                             \
>       i_min = MAX(env->vstart, offset);                                     \
>       for (i = i_min; i < vl; i++) {                                        \
> @@ -5066,7 +5063,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>       uint32_t vma = vext_vma(desc);                                        \
>       target_ulong i_max, i_min, i;                                         \
>                                                                             \
> -    VSTART_CHECK_EARLY_EXIT(env);                                         \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                                     \
>                                                                             \
>       i_min = MIN(s1 < vlmax ? vlmax - s1 : 0, vl);                         \
>       i_max = MAX(i_min, env->vstart);                                      \
> @@ -5110,7 +5107,7 @@ static void vslide1up_##BITWIDTH(void *vd, void *v0, uint64_t s1,           \
>       uint32_t vma = vext_vma(desc);                                          \
>       uint32_t i;                                                             \
>                                                                               \
> -    VSTART_CHECK_EARLY_EXIT(env);                                           \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                                       \
>                                                                               \
>       for (i = env->vstart; i < vl; i++) {                                    \
>           if (!vm && !vext_elem_mask(v0, i)) {                                \
> @@ -5161,7 +5158,7 @@ static void vslide1down_##BITWIDTH(void *vd, void *v0, uint64_t s1,           \
>       uint32_t vma = vext_vma(desc);                                            \
>       uint32_t i;                                                               \
>                                                                                 \
> -    VSTART_CHECK_EARLY_EXIT(env);                                             \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                                         \
>                                                                                 \
>       for (i = env->vstart; i < vl; i++) {                                      \
>           if (!vm && !vext_elem_mask(v0, i)) {                                  \
> @@ -5238,7 +5235,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
>       uint64_t index;                                                       \
>       uint32_t i;                                                           \
>                                                                             \
> -    VSTART_CHECK_EARLY_EXIT(env);                                         \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                                     \
>                                                                             \
>       for (i = env->vstart; i < vl; i++) {                                  \
>           if (!vm && !vext_elem_mask(v0, i)) {                              \
> @@ -5283,7 +5280,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>       uint64_t index = s1;                                                  \
>       uint32_t i;                                                           \
>                                                                             \
> -    VSTART_CHECK_EARLY_EXIT(env);                                         \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                                     \
>                                                                             \
>       for (i = env->vstart; i < vl; i++) {                                  \
>           if (!vm && !vext_elem_mask(v0, i)) {                              \
> @@ -5379,7 +5376,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,                 \
>       uint32_t vma = vext_vma(desc);                               \
>       uint32_t i;                                                  \
>                                                                    \
> -    VSTART_CHECK_EARLY_EXIT(env);                                \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                            \
>                                                                    \
>       for (i = env->vstart; i < vl; i++) {                         \
>           if (!vm && !vext_elem_mask(v0, i)) {                     \
> diff --git a/target/riscv/vector_internals.c b/target/riscv/vector_internals.c
> index 05b2d01e58..b490b1d398 100644
> --- a/target/riscv/vector_internals.c
> +++ b/target/riscv/vector_internals.c
> @@ -66,7 +66,7 @@ void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
>       uint32_t vma = vext_vma(desc);
>       uint32_t i;
>   
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, vl);
>   
>       for (i = env->vstart; i < vl; i++) {
>           if (!vm && !vext_elem_mask(v0, i)) {
> @@ -92,7 +92,7 @@ void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
>       uint32_t vma = vext_vma(desc);
>       uint32_t i;
>   
> -    VSTART_CHECK_EARLY_EXIT(env);
> +    VSTART_CHECK_EARLY_EXIT(env, vl);
>   
>       for (i = env->vstart; i < vl; i++) {
>           if (!vm && !vext_elem_mask(v0, i)) {
> diff --git a/target/riscv/vector_internals.h b/target/riscv/vector_internals.h
> index a11cc8366d..8eee7e5c31 100644
> --- a/target/riscv/vector_internals.h
> +++ b/target/riscv/vector_internals.h
> @@ -25,11 +25,11 @@
>   #include "tcg/tcg-gvec-desc.h"
>   #include "internals.h"
>   
> -#define VSTART_CHECK_EARLY_EXIT(env) do { \
> -    if (env->vstart >= env->vl) {         \
> -        env->vstart = 0;                  \
> -        return;                           \
> -    }                                     \
> +#define VSTART_CHECK_EARLY_EXIT(env, vl) do { \
> +    if (env->vstart >= vl) {                  \
> +        env->vstart = 0;                      \
> +        return;                               \
> +    }                                         \
>   } while (0)
>   
>   static inline uint32_t vext_nf(uint32_t desc)
> @@ -159,7 +159,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
>       uint32_t vma = vext_vma(desc);                     \
>       uint32_t i;                                        \
>                                                          \
> -    VSTART_CHECK_EARLY_EXIT(env);                      \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                  \
>                                                          \
>       for (i = env->vstart; i < vl; i++) {               \
>           if (!vm && !vext_elem_mask(v0, i)) {           \


