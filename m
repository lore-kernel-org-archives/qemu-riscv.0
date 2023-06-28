Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CD3EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 09:08:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qER9Q-0008Tz-71; Wed, 28 Jun 2023 05:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qER9P-0008Tj-7v
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 05:07:47 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qER9M-0008ST-UF
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 05:07:46 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fb94b1423eso289455e87.1
 for <qemu-riscv@nongnu.org>; Wed, 28 Jun 2023 02:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687943263; x=1690535263;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yg+Y5FmR7KsY+IEy4o0xFzpFhAX0DMCj+mtO6dzHn3Q=;
 b=QY5ITJ0tZwUOni3jUTYQbNHMu4AW0NPV5ZwOepLnNwyc1Mbkdv9HOV8VEEdo7jYWH0
 Jky3mC8GExhzx/XtbdCTl1RKnle0zF1bsAQk/3dGbLHa4Ro1XxNBDPKMhNbdMHeuqmbE
 BoU9OQN6q7WKGtvjrRSmgxNVWmSGvsuDIkeCbXpcFsEXD6HMHq91lFdOCpYkXaQfwvx5
 z9yKB95Tai34Dtq1KXm7YBfkFY9JspBWgeZwVDdE0sZN87ao/xvFtqxTo1r1bg7THsO2
 33McTrwaRld2Z3JN4Ppg8svHwqWYPK8rZSJa3wxzJJfybj/d6G1PN8XgnBPYTT2B44Xs
 rztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687943263; x=1690535263;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yg+Y5FmR7KsY+IEy4o0xFzpFhAX0DMCj+mtO6dzHn3Q=;
 b=ERoVHgl0ZYcIlDHpQg0ylLmadLkHknMSZKJZ0vUJN61bcGwqXlEl5WYxbKHsxeKwHA
 xduy1WVFpqIC/aFhHBcTneDbnegMiULuHbf6x8zbQepGkPy78mfkGjQhu8v3l61xi0jc
 JX41/LDNUdXZJnupQCXC8J47nsmknpF6JSg2DbDDe8XHw5+lBdcrYG0Vn/+oOf4qc6uO
 VF3U2xhLl+BolKETFcO2xIApP/KmA+GjWKC7cfv0/WSQxbRRSRkYW8yYRerX5em5CBmG
 JWNp8xlbeDJRwwD8grtc0GF/eg2067FbeKV2a6kEW7yJxGSp1H4BxfgS76BcTqV4YItC
 DGzw==
X-Gm-Message-State: AC+VfDxwh5JRPWMYcUmv557+sna0egJ1nm4k3e/emAQcZJAikyUAlods
 rVqsKlLCaxTQLizKJi1x+R7qsg==
X-Google-Smtp-Source: ACHHUZ4oOeon2Qse9QXn/vYmIjvSluaGxsIQHySTcxOQ34NUjbl4AZm6GydbRjsUr4YVb6LAmFsiXQ==
X-Received: by 2002:ac2:4e03:0:b0:4fb:9497:b2a5 with SMTP id
 e3-20020ac24e03000000b004fb9497b2a5mr525870lfr.21.1687943262914; 
 Wed, 28 Jun 2023 02:07:42 -0700 (PDT)
Received: from [192.168.1.208] ([139.47.41.103])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4d10000000b00313eeca9f4asm9207596wrt.14.2023.06.28.02.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jun 2023 02:07:42 -0700 (PDT)
Message-ID: <af36c183-aad0-6e66-62e0-0f97b04eb4cc@linaro.org>
Date: Wed, 28 Jun 2023 11:07:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 09/15] target/riscv: Add Zvkned ISA extension support
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Nazar Kazakov <nazar.kazakov@codethink.co.uk>, 
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 William Salmon <will.salmon@codethink.co.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
References: <20230627174551.65498-1-max.chou@sifive.com>
 <20230627174551.65498-10-max.chou@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230627174551.65498-10-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x130.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.103,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/27/23 19:45, Max Chou wrote:
> +#define GEN_V_UNMASKED_TRANS(NAME, CHECK, EGS)                                \
> +    static bool trans_##NAME(DisasContext *s, arg_##NAME *a)                  \
> +    {                                                                         \
> +        if (CHECK(s, a)) {                                                    \
> +            TCGv_ptr rd_v, rs2_v;                                             \
> +            TCGv_i32 desc;                                                    \
> +            uint32_t data = 0;                                                \
> +            TCGLabel *over = gen_new_label();                                 \
> +            TCGLabel *vl_ok = gen_new_label();                                \
> +            TCGLabel *vstart_ok = gen_new_label();                            \
> +            TCGv_i32 tmp = tcg_temp_new_i32();                                \
> +                                                                              \
> +            /* save opcode for unwinding in case we throw an exception */     \
> +            decode_save_opc(s);                                               \
> +                                                                              \
> +            /* check (vl % EGS == 0) assuming it's power of 2 */              \
> +            tcg_gen_trunc_tl_i32(tmp, cpu_vl);                                \
> +            tcg_gen_andi_i32(tmp, tmp, EGS - 1);                              \
> +            tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 0, vl_ok);                  \
> +            gen_helper_restore_cpu_and_raise_exception(                       \
> +                cpu_env, tcg_constant_i32(RISCV_EXCP_ILLEGAL_INST));          \
> +            gen_set_label(vl_ok);                                             \
> +                                                                              \
> +            /* check (vstart % EGS == 0) assuming it's power of 2 */          \
> +            tcg_gen_trunc_tl_i32(tmp, cpu_vstart);                            \
> +            tcg_gen_andi_i32(tmp, tmp, EGS - 1);                              \
> +            tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 0, vstart_ok);              \
> +            gen_helper_restore_cpu_and_raise_exception(                       \
> +                cpu_env, tcg_constant_i32(RISCV_EXCP_ILLEGAL_INST));          \
> +            gen_set_label(vstart_ok);                                         \
> +                                                                              \
> +            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);        \
> +            data = FIELD_DP32(data, VDATA, VM, a->vm);                        \
> +            data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                    \
> +            data = FIELD_DP32(data, VDATA, VTA, s->vta);                      \
> +            data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);    \
> +            data = FIELD_DP32(data, VDATA, VMA, s->vma);                      \
> +            rd_v = tcg_temp_new_ptr();                                        \
> +            rs2_v = tcg_temp_new_ptr();                                       \
> +            desc = tcg_constant_i32(                                          \
> +                simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data)); \
> +            tcg_gen_addi_ptr(rd_v, cpu_env, vreg_ofs(s, a->rd));              \
> +            tcg_gen_addi_ptr(rs2_v, cpu_env, vreg_ofs(s, a->rs2));            \
> +            gen_helper_##NAME(rd_v, rs2_v, cpu_env, desc);                    \
> +            mark_vs_dirty(s);                                                 \
> +            gen_set_label(over);                                              \
> +            return true;                                                      \
> +        }                                                                     \
> +        return false;                                                         \
> +    }

This kind of massive macro is bad style.
Much better to have a helper function and pass in gen_helper_foo as a parameter.

You can eliminate the vstart % EGS test, and the vstart < vl test, when VSTART_EQ_ZERO.
You can eliminate the vl % EGS test when VL_EQ_VLMAX.

You could move all of these tests out of line, into a helper_foo_chk() function which 
performs the checks and then calls helper_foo().

> +#define GEN_VI_UNMASKED_TRANS(NAME, CHECK, EGS)                               \
> +    static bool trans_##NAME(DisasContext *s, arg_##NAME *a)                  \
> +    {                                                                         \
> +        if (CHECK(s, a)) {                                                    \
> +            TCGv_ptr rd_v, rs2_v;                                             \
> +            TCGv_i32 uimm_v, desc;                                            \
> +            uint32_t data = 0;                                                \
> +            TCGLabel *over = gen_new_label();                                 \
> +            TCGLabel *vl_ok = gen_new_label();                                \
> +            TCGLabel *vstart_ok = gen_new_label();                            \
> +            TCGv_i32 tmp = tcg_temp_new_i32();                                \
> +                                                                              \
> +            /* save opcode for unwinding in case we throw an exception */     \
> +            decode_save_opc(s);                                               \
> +                                                                              \
> +            /* check (vl % EGS == 0) assuming it's power of 2 */              \
> +            tcg_gen_trunc_tl_i32(tmp, cpu_vl);                                \
> +            tcg_gen_andi_i32(tmp, tmp, EGS - 1);                              \
> +            tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 0, vl_ok);                  \
> +            gen_helper_restore_cpu_and_raise_exception(                       \
> +                cpu_env, tcg_constant_i32(RISCV_EXCP_ILLEGAL_INST));          \
> +            gen_set_label(vl_ok);                                             \
> +                                                                              \
> +            /* check (vstart % EGS == 0) assuming it's power of 2 */          \
> +            tcg_gen_trunc_tl_i32(tmp, cpu_vstart);                            \
> +            tcg_gen_andi_i32(tmp, tmp, EGS - 1);                              \
> +            tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 0, vstart_ok);              \
> +            gen_helper_restore_cpu_and_raise_exception(                       \
> +                cpu_env, tcg_constant_i32(RISCV_EXCP_ILLEGAL_INST));          \
> +            gen_set_label(vstart_ok);                                         \
> +                                                                              \
> +            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);        \
> +            data = FIELD_DP32(data, VDATA, VM, a->vm);                        \
> +            data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                    \
> +            data = FIELD_DP32(data, VDATA, VTA, s->vta);                      \
> +            data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);    \
> +            data = FIELD_DP32(data, VDATA, VMA, s->vma);                      \
> +                                                                              \
> +            rd_v = tcg_temp_new_ptr();                                        \
> +            rs2_v = tcg_temp_new_ptr();                                       \
> +            uimm_v = tcg_constant_i32(a->rs1);                                \
> +            desc = tcg_constant_i32(                                          \
> +                simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, data)); \
> +            tcg_gen_addi_ptr(rd_v, cpu_env, vreg_ofs(s, a->rd));              \
> +            tcg_gen_addi_ptr(rs2_v, cpu_env, vreg_ofs(s, a->rs2));            \
> +            gen_helper_##NAME(rd_v, rs2_v, uimm_v, cpu_env, desc);            \
> +            mark_vs_dirty(s);                                                 \
> +            gen_set_label(over);                                              \
> +            return true;                                                      \
> +        }                                                                     \
> +        return false;                                                         \
> +    }

Likewise.

> +#define GEN_ZVKNED_HELPER_VV(NAME, ...)                                   \
> +    void HELPER(NAME)(void *vd_vptr, void *vs2_vptr, CPURISCVState *env,  \
> +                      uint32_t desc)                                      \
> +    {                                                                     \
> +        uint64_t *vd = vd_vptr;                                           \
> +        uint64_t *vs2 = vs2_vptr;                                         \
> +        uint32_t vl = env->vl;                                            \
> +        uint32_t total_elems = vext_get_total_elems(env, desc, 4);        \
> +        uint32_t vta = vext_vta(desc);                                    \
> +                                                                          \
> +        for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {        \
> +            AESState round_key;                                           \
> +            round_key.d[HOST_BIG_ENDIAN] = cpu_to_le64(vs2[i * 2 + 0]);   \
> +            round_key.d[!HOST_BIG_ENDIAN] = cpu_to_le64(vs2[i * 2 + 1]);  \
> +            AESState round_state;                                         \
> +            cpu_to_le64s(vd + i * 2 + 0);                                 \
> +            cpu_to_le64s(vd + i * 2 + 1);                                 \
> +            for (int j = 0; j < 16; j++) {                                \
> +                round_state.b[j] = ((uint8_t *)(vd + i * 2))[j];          \
> +            }                                                             \

I think all of this byte swapping is wrong.
With this last loop particularly being particularly silly.

You want to present the 16 bytes in *host* endian order.
Because the words are always in little-endian order (see H1 et al),
we only need to swap the words on big-endian hosts.

See https://lore.kernel.org/qemu-devel/20230620110758.787479-21-richard.henderson@linaro.org/
where I do exactly the same thing for ARM:

+        AESState *ad = (AESState *)(vd + i);
+        AESState *st = (AESState *)(vm + i);
+        AESState t;
+
+        /* Our uint64_t are in the wrong order for big-endian. */
+        if (HOST_BIG_ENDIAN) {
+            t.d[0] = st->d[1];
+            t.d[1] = st->d[0];
+            aesdec_IMC(&t, &t, false);
+            ad->d[0] = t.d[1];
+            ad->d[1] = t.d[0];
+        } else {
+            aesdec_IMC(ad, st, false);
+        }

> +void HELPER(vaeskf1_vi)(void *vd_vptr, void *vs2_vptr, uint32_t uimm,
> +                        CPURISCVState *env, uint32_t desc)
> +{
> +    uint32_t *vd = vd_vptr;
> +    uint32_t *vs2 = vs2_vptr;
> +    uint32_t vl = env->vl;
> +    uint32_t total_elems = vext_get_total_elems(env, desc, 4);
> +    uint32_t vta = vext_vta(desc);
> +
> +    uimm &= 0b1111;
> +    if (uimm > 10 || uimm == 0) {
> +        uimm ^= 0b1000;
> +    }
> +
> +    for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
> +        uint32_t rk[8];
> +        static const uint32_t rcon[] = {
> +            0x01000000, 0x02000000, 0x04000000, 0x08000000, 0x10000000,
> +            0x20000000, 0x40000000, 0x80000000, 0x1B000000, 0x36000000,
> +        };
> +
> +        rk[0] = bswap32(vs2[i * 4 + H4(0)]);
> +        rk[1] = bswap32(vs2[i * 4 + H4(1)]);
> +        rk[2] = bswap32(vs2[i * 4 + H4(2)]);
> +        rk[3] = bswap32(vs2[i * 4 + H4(3)]);
> +
> +        rk[4] = rk[0] ^ (((uint32_t)AES_sbox[(rk[3] >> 16) & 0xff] << 24) |
> +                         ((uint32_t)AES_sbox[(rk[3] >> 8) & 0xff] << 16) |
> +                         ((uint32_t)AES_sbox[(rk[3] >> 0) & 0xff] << 8) |
> +                         ((uint32_t)AES_sbox[(rk[3] >> 24) & 0xff] << 0))
> +                      ^ rcon[uimm - 1];
> +        rk[5] = rk[1] ^ rk[4];
> +        rk[6] = rk[2] ^ rk[5];
> +        rk[7] = rk[3] ^ rk[6];
> +
> +        vd[i * 4 + H4(0)] = bswap32(rk[4]);
> +        vd[i * 4 + H4(1)] = bswap32(rk[5]);
> +        vd[i * 4 + H4(2)] = bswap32(rk[6]);
> +        vd[i * 4 + H4(3)] = bswap32(rk[7]);
> +    }
> +    env->vstart = 0;
> +    /* set tail elements to 1s */
> +    vext_set_elems_1s(vd, vta, vl * 4, total_elems * 4);
> +}

All of this byte swapping is going to be wrong for a big-endian host.
It is also a little bit silly to do for a little-endian host.

You're byte swapping uint32_t words, then extracting bytes from those words.  Just extract 
the exact byte you require from the original input, using the H1() macro, and now you have 
correct code for both big- and little-endian hosts.


r~


