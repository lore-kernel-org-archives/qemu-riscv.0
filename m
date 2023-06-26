Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DC2EB64DA
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 08:03:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDhBf-0003tm-6z; Mon, 26 Jun 2023 04:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qDhBb-0003sH-06
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 04:02:59 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qDhBV-0006Ss-UZ
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 04:02:56 -0400
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-345ad94db0aso1450325ab.1
 for <qemu-riscv@nongnu.org>; Mon, 26 Jun 2023 01:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687766571; x=1690358571;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MvkjMPRn1ycbgvwekgZMshuyjatEUBQBC8wNlNdbf0Y=;
 b=FqEKi6aGTj/tPH6pE9A2yT2Z95ibvrQB2++8pEkDi9YEcGYSK0VE5LpS1z4unj9ke1
 1uYvjsSFDGMNYVwIo6x9RWXz/ssw7Ig1LphnkZNNP5ouz7braqD4ibOA61c8hKVnfnRA
 UuCPgfCFxVtec2zcwb0TZxmK30dtEfv+pviNX63sfLDDkHqM4bOYinYgbHoT8j9cfg7A
 ZS6cw0VuMAwjcgccnRRBQyJFp5GUct0ovrJool351+LdI1gWU8+NbCRIV6pyVqmuwLWb
 37cZazofhZjm4/3QICATc1Ry192XUC6JIUnpVPd+LOnfI/Qvgrgvq3i4LYo0lbvli0FJ
 zIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687766571; x=1690358571;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MvkjMPRn1ycbgvwekgZMshuyjatEUBQBC8wNlNdbf0Y=;
 b=a3aeuoKK8AZcn/zp9/hKhZ8e/kXxeS4VNoR4SbCfs18CfRyUY5zm7SxKZ48wx1McWk
 pWO9fC5RtGyeU34bVgGeMuMPJkYcmWg1ElQq52wSFkJZ4dDi+V/Y9HhE6FYsuVAe93YK
 TcTzL+i4XZsHKSigWkstmpWSnxfM9/lhIKfqNavPwEGEDQhKnOemVsqFo/4gi1cKoGUr
 42DDEojvRk8fH802iK1jEyIAbwX5tj0Y0CGEWo413HjxLkmzJbChD+9IFKwnXMgdkNwh
 zS9iqlDsCVijXi84GFB/0HINF5M7nVSfjCeZ4VgiLTklbPCx5xBx+54FB+X+3HGy4NQL
 AuTA==
X-Gm-Message-State: AC+VfDwbs5XC3EnyN19X/UIsozrwF8jT59T3DVBMSRsm8EY48X+lpOUz
 HHYixMpmKGSJR8wqo/ip2FLxRg==
X-Google-Smtp-Source: ACHHUZ5udQtK28UzxHmB7VPIzpOziv0zxM+0VhiDTEXrrcPvboyGHBSGh+eLXrX0ZEQ5LpqTR/AuAA==
X-Received: by 2002:a92:daca:0:b0:345:7c3a:e68 with SMTP id
 o10-20020a92daca000000b003457c3a0e68mr4711475ilq.1.1687766571617; 
 Mon, 26 Jun 2023 01:02:51 -0700 (PDT)
Received: from [192.168.100.101] (59-124-168-89.hinet-ip.hinet.net.
 [59.124.168.89]) by smtp.gmail.com with ESMTPSA id
 v1-20020a634641000000b00548fb73874asm3475358pgk.37.2023.06.26.01.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 01:02:51 -0700 (PDT)
Message-ID: <0be48869-7df8-bb81-be01-eb0ac2e7428e@sifive.com>
Date: Mon, 26 Jun 2023 16:02:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 10/17] target/riscv: Add Zvkned ISA extension support
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Nazar Kazakov <nazar.kazakov@codethink.co.uk>, 
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 William Salmon <will.salmon@codethink.co.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
References: <20230622161646.32005-1-max.chou@sifive.com>
 <20230622161646.32005-11-max.chou@sifive.com>
 <323d7da1-3e66-bf22-42c1-1afa4df3aeb4@linaro.org>
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <323d7da1-3e66-bf22-42c1-1afa4df3aeb4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=max.chou@sifive.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 2023/6/23 3:33 PM, Richard Henderson wrote:

> On 6/22/23 18:16, Max Chou wrote:
>> --- a/target/riscv/vcrypto_helper.c
>> +++ b/target/riscv/vcrypto_helper.c
>> @@ -22,6 +22,7 @@
>>   #include "qemu/bitops.h"
>>   #include "qemu/bswap.h"
>>   #include "cpu.h"
>> +#include "crypto/aes.h"
>>   #include "exec/memop.h"
>>   #include "exec/exec-all.h"
>>   #include "exec/helper-proto.h"
>> @@ -195,3 +196,310 @@ RVVCALL(OPIVX2, vwsll_vx_w, WOP_UUU_W, H8, H4, 
>> DO_SLL)
>>   GEN_VEXT_VX(vwsll_vx_b, 2)
>>   GEN_VEXT_VX(vwsll_vx_h, 4)
>>   GEN_VEXT_VX(vwsll_vx_w, 8)
>> +
>> +static inline void aes_sub_bytes(uint8_t round_state[4][4])
>> +{
>> +    for (int j = 0; j < 16; j++) {
>> +        round_state[j / 4][j % 4] = AES_sbox[round_state[j / 4][j % 
>> 4]];
>> +    }
>> +}
>> +
>> +static inline void aes_shift_bytes(uint8_t round_state[4][4])
>> +{
>> +    uint8_t temp;
>> +    temp = round_state[0][1];
>> +    round_state[0][1] = round_state[1][1];
>> +    round_state[1][1] = round_state[2][1];
>> +    round_state[2][1] = round_state[3][1];
>> +    round_state[3][1] = temp;
>> +    temp = round_state[0][2];
>> +    round_state[0][2] = round_state[2][2];
>> +    round_state[2][2] = temp;
>> +    temp = round_state[1][2];
>> +    round_state[1][2] = round_state[3][2];
>> +    round_state[3][2] = temp;
>> +    temp = round_state[0][3];
>> +    round_state[0][3] = round_state[3][3];
>> +    round_state[3][3] = round_state[2][3];
>> +    round_state[2][3] = round_state[1][3];
>> +    round_state[1][3] = temp;
>> +}
>> +
>> +static inline void xor_round_key(uint8_t round_state[4][4], uint8_t 
>> *round_key)
>> +{
>> +    for (int j = 0; j < 16; j++) {
>> +        round_state[j / 4][j % 4] = round_state[j / 4][j % 4] ^ 
>> (round_key)[j];
>> +    }
>> +}
>> +
>> +static inline void aes_inv_sub_bytes(uint8_t round_state[4][4])
>> +{
>> +    for (int j = 0; j < 16; j++) {
>> +        round_state[j / 4][j % 4] = AES_isbox[round_state[j / 4][j % 
>> 4]];
>> +    }
>> +}
>> +
>> +static inline void aes_inv_shift_bytes(uint8_t round_state[4][4])
>> +{
>> +    uint8_t temp;
>> +    temp = round_state[3][1];
>> +    round_state[3][1] = round_state[2][1];
>> +    round_state[2][1] = round_state[1][1];
>> +    round_state[1][1] = round_state[0][1];
>> +    round_state[0][1] = temp;
>> +    temp = round_state[0][2];
>> +    round_state[0][2] = round_state[2][2];
>> +    round_state[2][2] = temp;
>> +    temp = round_state[1][2];
>> +    round_state[1][2] = round_state[3][2];
>> +    round_state[3][2] = temp;
>> +    temp = round_state[0][3];
>> +    round_state[0][3] = round_state[1][3];
>> +    round_state[1][3] = round_state[2][3];
>> +    round_state[2][3] = round_state[3][3];
>> +    round_state[3][3] = temp;
>> +}
>> +
>> +static inline uint8_t xtime(uint8_t x)
>> +{
>> +    return (x << 1) ^ (((x >> 7) & 1) * 0x1b);
>> +}
>> +
>> +static inline uint8_t multiply(uint8_t x, uint8_t y)
>> +{
>> +    return (((y & 1) * x) ^ ((y >> 1 & 1) * xtime(x)) ^
>> +            ((y >> 2 & 1) * xtime(xtime(x))) ^
>> +            ((y >> 3 & 1) * xtime(xtime(xtime(x)))) ^
>> +            ((y >> 4 & 1) * xtime(xtime(xtime(xtime(x))))));
>> +}
>> +
>> +static inline void aes_inv_mix_cols(uint8_t round_state[4][4])
>> +{
>> +    uint8_t a, b, c, d;
>> +    for (int j = 0; j < 4; ++j) {
>> +        a = round_state[j][0];
>> +        b = round_state[j][1];
>> +        c = round_state[j][2];
>> +        d = round_state[j][3];
>> +        round_state[j][0] = multiply(a, 0x0e) ^ multiply(b, 0x0b) ^
>> +                            multiply(c, 0x0d) ^ multiply(d, 0x09);
>> +        round_state[j][1] = multiply(a, 0x09) ^ multiply(b, 0x0e) ^
>> +                            multiply(c, 0x0b) ^ multiply(d, 0x0d);
>> +        round_state[j][2] = multiply(a, 0x0d) ^ multiply(b, 0x09) ^
>> +                            multiply(c, 0x0e) ^ multiply(d, 0x0b);
>> +        round_state[j][3] = multiply(a, 0x0b) ^ multiply(b, 0x0d) ^
>> +                            multiply(c, 0x09) ^ multiply(d, 0x0e);
>> +    }
>> +}
>> +
>> +static inline void aes_mix_cols(uint8_t round_state[4][4])
>> +{
>> +    uint8_t a, b;
>> +    for (int j = 0; j < 4; ++j) {
>> +        a = round_state[j][0];
>> +        b = round_state[j][0] ^ round_state[j][1] ^ round_state[j][2] ^
>> +            round_state[j][3];
>> +        round_state[j][0] ^= xtime(round_state[j][0] ^ 
>> round_state[j][1]) ^ b;
>> +        round_state[j][1] ^= xtime(round_state[j][1] ^ 
>> round_state[j][2]) ^ b;
>> +        round_state[j][2] ^= xtime(round_state[j][2] ^ 
>> round_state[j][3]) ^ b;
>> +        round_state[j][3] ^= xtime(round_state[j][3] ^ a) ^ b;
>> +    }
>> +}
>> +
>> +#define GEN_ZVKNED_HELPER_VV(NAME, 
>> ...)                                   \
>> +    void HELPER(NAME)(void *vd_vptr, void *vs2_vptr, CPURISCVState 
>> *env,  \
>> +                      uint32_t 
>> desc)                                      \
>> + { \
>> +        uint64_t *vd = 
>> vd_vptr;                                           \
>> +        uint64_t *vs2 = 
>> vs2_vptr;                                         \
>> +        uint32_t vl = 
>> env->vl;                                            \
>> +        uint32_t total_elems = vext_get_total_elems(env, desc, 
>> 4);        \
>> +        uint32_t vta = 
>> vext_vta(desc);                                    \
>> + \
>> +        for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) 
>> {        \
>> +            uint64_t round_key[2] = 
>> {                                     \
>> +                cpu_to_le64(vs2[i * 2 + 
>> 0]),                              \
>> +                cpu_to_le64(vs2[i * 2 + 
>> 1]),                              \
>> + };                                                            \
>> +            uint8_t 
>> round_state[4][4];                                    \
>> +            cpu_to_le64s(vd + i * 2 + 
>> 0);                                 \
>> +            cpu_to_le64s(vd + i * 2 + 
>> 1);                                 \
>> +            for (int j = 0; j < 16; j++) 
>> {                                \
>> +                round_state[j / 4][j % 4] = ((uint8_t *)(vd + i * 
>> 2))[j]; \
>> + }                                                             \
>> + __VA_ARGS__;                                                  \
>> +            for (int j = 0; j < 16; j++) 
>> {                                \
>> +                ((uint8_t *)(vd + i * 2))[j] = round_state[j / 4][j 
>> % 4]; \
>> + }                                                             \
>> +            le64_to_cpus(vd + i * 2 + 
>> 0);                                 \
>> +            le64_to_cpus(vd + i * 2 + 
>> 1);                                 \
>> + } \
>> +        env->vstart = 
>> 0;                                                  \
>> +        /* set tail elements to 1s 
>> */                                     \
>> +        vext_set_elems_1s(vd, vta, vl * 4, total_elems * 
>> 4);              \
>> +    }
>> +
>> +#define GEN_ZVKNED_HELPER_VS(NAME, 
>> ...)                                   \
>> +    void HELPER(NAME)(void *vd_vptr, void *vs2_vptr, CPURISCVState 
>> *env,  \
>> +                      uint32_t 
>> desc)                                      \
>> + { \
>> +        uint64_t *vd = 
>> vd_vptr;                                           \
>> +        uint64_t *vs2 = 
>> vs2_vptr;                                         \
>> +        uint32_t vl = 
>> env->vl;                                            \
>> +        uint32_t total_elems = vext_get_total_elems(env, desc, 
>> 4);        \
>> +        uint32_t vta = 
>> vext_vta(desc);                                    \
>> + \
>> +        for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) 
>> {        \
>> +            uint64_t round_key[2] = 
>> {                                     \
>> + cpu_to_le64(vs2[0]),                                      \
>> + cpu_to_le64(vs2[1]),                                      \
>> + };                                                            \
>> +            uint8_t 
>> round_state[4][4];                                    \
>> +            cpu_to_le64s(vd + i * 2 + 
>> 0);                                 \
>> +            cpu_to_le64s(vd + i * 2 + 
>> 1);                                 \
>> +            for (int j = 0; j < 16; j++) 
>> {                                \
>> +                round_state[j / 4][j % 4] = ((uint8_t *)(vd + i * 
>> 2))[j]; \
>> + }                                                             \
>> + __VA_ARGS__;                                                  \
>> +            for (int j = 0; j < 16; j++) 
>> {                                \
>> +                ((uint8_t *)(vd + i * 2))[j] = round_state[j / 4][j 
>> % 4]; \
>> + }                                                             \
>> +            le64_to_cpus(vd + i * 2 + 
>> 0);                                 \
>> +            le64_to_cpus(vd + i * 2 + 
>> 1);                                 \
>> + } \
>> +        env->vstart = 
>> 0;                                                  \
>> +        /* set tail elements to 1s 
>> */                                     \
>> +        vext_set_elems_1s(vd, vta, vl * 4, total_elems * 
>> 4);              \
>> +    }
>
> See
>
> https://lore.kernel.org/qemu-devel/20230620110758.787479-1-richard.henderson@linaro.org/ 
>
>
> which should greatly simplify all of this.
>
>
> r~
Thanks a lot.

I'll update the patch set for this.

With regards,
Max


