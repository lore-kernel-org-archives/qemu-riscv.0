Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A10EB64D8
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 18:07:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCOht-0004fn-33; Thu, 22 Jun 2023 14:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCOhs-0004fX-16
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 14:06:56 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCOhp-0007HA-I1
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 14:06:55 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6b2f0a140b7so6740306a34.3
 for <qemu-riscv@nongnu.org>; Thu, 22 Jun 2023 11:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687457212; x=1690049212;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mRmYlX7/crRZKhkMluRju5jccrRjDGd10HV7zKQj31Y=;
 b=kJO7VqFrw6i7dw7nhaor0yeNXxzuOx7areseAamDy28/lUdgiHi1UdMn6FtdOd+cmE
 VucEEPyFwohl3zm/K3kFurxraCu/WJVmEEsjz2V8s/UlB2xkWcMFP+v7uGJqdcykZqv5
 SmBC5iAJxK/hnL+VI9FmOZi+TxllobYM3fIaiBYcLmxQeqY6tuEzGt1qrILuqyWvds1W
 mAKZApXtZbyv9izLVgBUpsW887Ty5Gf9EmCDkZqs/QJgNvw5Kz5gQEZ5C0VraUOiBqmb
 ZD40wewS7GEBdT5LNHRXp/HMQIASWCBjnQdBYj+7Xwc1SHRYvd8G7DiZo2qdrpRM4b3d
 CVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687457212; x=1690049212;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mRmYlX7/crRZKhkMluRju5jccrRjDGd10HV7zKQj31Y=;
 b=hB3ZjdvqiwJNC83B/QY44Wy9sMGt1qLjh8BbbCsADxhDuA6lmH7v88zjkRJP0V+auq
 prwtrG77naxptJbVhtltyDUxFNVvz8k1Bo9L3MaM5+523ZdBH/mYE7kq8Yin5qiTrH3W
 s8NgdpH97P4Y1KmYrL0IFh9XChk2sRHk1o48aeNjjyOnOQE0YTN0m0n5GIRFos+7W7gT
 NTmW1JUDvm3PTMVaQX9XR8cPIdJuwY79T0bjFcllAoVrHxrv3GBMd9NXI9l/0qBoU+2W
 J2rYVJRK7ou4MHRtv12fjWZx6XpDsrHHeuHkklvxqRqLDnF3A5i3cFDXyvIVO6DrN2Qc
 W1mg==
X-Gm-Message-State: AC+VfDyqegRcm6QNHMJrMkhTuvvG/h6M/jO6g6daY7LGjJhGTqK/O9OE
 R8jf9EPsnr21yvxF2pRH2QA0Vg==
X-Google-Smtp-Source: ACHHUZ6fkF+hLUgp2jHmDRINTY0Y8PpIpggDYq6CTsUTKclMS5TFkDVdF3TiOkve2sFMBt02D9LMoA==
X-Received: by 2002:a05:6830:4ac:b0:6b4:d3b6:574c with SMTP id
 l12-20020a05683004ac00b006b4d3b6574cmr9677098otd.31.1687457212251; 
 Thu, 22 Jun 2023 11:06:52 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 b2-20020a9d7542000000b006b71f315814sm146584otl.8.2023.06.22.11.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 11:06:51 -0700 (PDT)
Message-ID: <51d15a14-d2d2-9364-cb43-e2c30ffc3f07@ventanamicro.com>
Date: Thu, 22 Jun 2023 15:06:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 11/17] target/riscv: Add Zvknh ISA extension support
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>,
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 William Salmon <will.salmon@codethink.co.uk>
References: <20230622161646.32005-1-max.chou@sifive.com>
 <20230622161646.32005-12-max.chou@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230622161646.32005-12-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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



On 6/22/23 13:16, Max Chou wrote:
> From: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
> 
> This commit adds support for the Zvknh vector-crypto extension, which
> consists of the following instructions:
> 
> * vsha2ms.vv
> * vsha2c[hl].vv
> 
> Translation functions are defined in
> `target/riscv/insn_trans/trans_rvvk.c.inc` and helpers are defined in
> `target/riscv/vcrypto_helper.c`.
> 
> Co-authored-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> Co-authored-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
> [max.chou@sifive.com: Replaced vstart checking by TCG op]
> Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
> Signed-off-by: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c                       |  11 +-
>   target/riscv/cpu_cfg.h                   |   2 +
>   target/riscv/helper.h                    |   4 +
>   target/riscv/insn32.decode               |   5 +
>   target/riscv/insn_trans/trans_rvvk.c.inc |  78 +++++++++
>   target/riscv/vcrypto_helper.c            | 214 +++++++++++++++++++++++
>   6 files changed, 311 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b6c755ba13..6bba8ba8c9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -119,6 +119,8 @@ static const struct isa_ext_data isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zvfh, PRIV_VERSION_1_12_0, ext_zvfh),
>       ISA_EXT_DATA_ENTRY(zvfhmin, PRIV_VERSION_1_12_0, ext_zvfhmin),
>       ISA_EXT_DATA_ENTRY(zvkned, PRIV_VERSION_1_12_0, ext_zvkned),
> +    ISA_EXT_DATA_ENTRY(zvknha, PRIV_VERSION_1_12_0, ext_zvknha),
> +    ISA_EXT_DATA_ENTRY(zvknhb, PRIV_VERSION_1_12_0, ext_zvknhb),
>       ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
>       ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
>       ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
> @@ -1195,14 +1197,17 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>        * In principle Zve*x would also suffice here, were they supported
>        * in qemu
>        */
> -    if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkned) && !cpu->cfg.ext_zve32f) {
> +    if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkned || cpu->cfg.ext_zvknha) &&
> +        !cpu->cfg.ext_zve32f) {
>           error_setg(errp,
>                      "Vector crypto extensions require V or Zve* extensions");
>           return;
>       }
>   
> -    if (cpu->cfg.ext_zvbc && !cpu->cfg.ext_zve64f) {
> -        error_setg(errp, "Zvbc extension requires V or Zve64{f,d} extensions");
> +    if ((cpu->cfg.ext_zvbc || cpu->cfg.ext_zvknhb) && !cpu->cfg.ext_zve64f) {
> +        error_setg(
> +            errp,
> +            "Zvbc and Zvknhb extensions require V or Zve64{f,d} extensions");
>           return;
>       }
>   
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 4636d4c84d..41cce87ffc 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -86,6 +86,8 @@ struct RISCVCPUConfig {
>       bool ext_zvbb;
>       bool ext_zvbc;
>       bool ext_zvkned;
> +    bool ext_zvknha;
> +    bool ext_zvknhb;
>       bool ext_zmmul;
>       bool ext_zvfh;
>       bool ext_zvfhmin;
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 738f20d3ca..19f5a8a28d 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1234,3 +1234,7 @@ DEF_HELPER_4(vaesdm_vs, void, ptr, ptr, env, i32)
>   DEF_HELPER_4(vaesz_vs, void, ptr, ptr, env, i32)
>   DEF_HELPER_5(vaeskf1_vi, void, ptr, ptr, i32, env, i32)
>   DEF_HELPER_5(vaeskf2_vi, void, ptr, ptr, i32, env, i32)
> +
> +DEF_HELPER_5(vsha2ms_vv, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vsha2ch_vv, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vsha2cl_vv, void, ptr, ptr, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 7e0295d493..d2cfb2729c 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -948,3 +948,8 @@ vaesdm_vs   101001 1 ..... 00000 010 ..... 1110111 @r2_vm_1
>   vaesz_vs    101001 1 ..... 00111 010 ..... 1110111 @r2_vm_1
>   vaeskf1_vi  100010 1 ..... ..... 010 ..... 1110111 @r_vm_1
>   vaeskf2_vi  101010 1 ..... ..... 010 ..... 1110111 @r_vm_1
> +
> +# *** Zvknh vector crypto extension ***
> +vsha2ms_vv  101101 1 ..... ..... 010 ..... 1110111 @r_vm_1
> +vsha2ch_vv  101110 1 ..... ..... 010 ..... 1110111 @r_vm_1
> +vsha2cl_vv  101111 1 ..... ..... 010 ..... 1110111 @r_vm_1
> diff --git a/target/riscv/insn_trans/trans_rvvk.c.inc b/target/riscv/insn_trans/trans_rvvk.c.inc
> index c618f76e7e..528a0d3b32 100644
> --- a/target/riscv/insn_trans/trans_rvvk.c.inc
> +++ b/target/riscv/insn_trans/trans_rvvk.c.inc
> @@ -401,3 +401,81 @@ static bool vaeskf2_check(DisasContext *s, arg_vaeskf2_vi *a)
>   
>   GEN_VI_UNMASKED_TRANS(vaeskf1_vi, vaeskf1_check, ZVKNED_EGS)
>   GEN_VI_UNMASKED_TRANS(vaeskf2_vi, vaeskf2_check, ZVKNED_EGS)
> +
> +/*
> + * Zvknh
> + */
> +
> +#define ZVKNH_EGS 4
> +
> +#define GEN_VV_UNMASKED_TRANS(NAME, CHECK, EGS)                            \
> +    static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                 \
> +    {                                                                      \
> +        if (CHECK(s, a)) {                                                 \
> +            uint32_t data = 0;                                             \
> +            TCGLabel *over = gen_new_label();                              \
> +            TCGLabel *vl_ok = gen_new_label();                             \
> +            TCGLabel *vstart_ok = gen_new_label();                         \
> +            TCGv_i32 tmp = tcg_temp_new_i32();                             \
> +                                                                           \
> +            /* save opcode for unwinding in case we throw an exception */  \
> +            decode_save_opc(s);                                            \
> +                                                                           \
> +            /* check (vl % EGS == 0) assuming it's power of 2 */           \
> +            tcg_gen_trunc_tl_i32(tmp, cpu_vl);                             \
> +            tcg_gen_andi_i32(tmp, tmp, EGS - 1);                           \
> +            tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 0, vl_ok);               \
> +            gen_helper_restore_cpu_and_raise_exception(                    \
> +                cpu_env, tcg_constant_i32(RISCV_EXCP_ILLEGAL_INST));       \
> +            gen_set_label(vl_ok);                                          \
> +                                                                           \
> +            /* check (vstart % EGS == 0) assuming it's power of 2 */       \
> +            tcg_gen_trunc_tl_i32(tmp, cpu_vstart);                         \
> +            tcg_gen_andi_i32(tmp, tmp, EGS - 1);                           \
> +            tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 0, vstart_ok);           \
> +            gen_helper_restore_cpu_and_raise_exception(                    \
> +                cpu_env, tcg_constant_i32(RISCV_EXCP_ILLEGAL_INST));       \
> +            gen_set_label(vstart_ok);                                      \
> +                                                                           \
> +            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);     \
> +                                                                           \
> +            data = FIELD_DP32(data, VDATA, VM, a->vm);                     \
> +            data = FIELD_DP32(data, VDATA, LMUL, s->lmul);                 \
> +            data = FIELD_DP32(data, VDATA, VTA, s->vta);                   \
> +            data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s); \
> +            data = FIELD_DP32(data, VDATA, VMA, s->vma);                   \
> +                                                                           \
> +            tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),    \
> +                               vreg_ofs(s, a->rs2), cpu_env,               \
> +                               s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, \
> +                               data, gen_helper_##NAME);                   \
> +                                                                           \
> +            mark_vs_dirty(s);                                              \
> +            gen_set_label(over);                                           \
> +            return true;                                                   \
> +        }                                                                  \
> +        return false;                                                      \
> +    }
> +
> +static bool vsha_check_sew(DisasContext *s)
> +{
> +    return (s->cfg_ptr->ext_zvknha == true && s->sew == MO_32) ||
> +           (s->cfg_ptr->ext_zvknhb == true &&
> +            (s->sew == MO_32 || s->sew == MO_64));
> +}
> +
> +static bool vsha_check(DisasContext *s, arg_rmrr *a)
> +{
> +    int egw_bytes = ZVKNH_EGS << s->sew;
> +    int mult = 1 << MAX(s->lmul, 0);
> +    return opivv_check(s, a) &&
> +           vsha_check_sew(s) &&
> +           MAXSZ(s) >= egw_bytes &&
> +           !is_overlapped(a->rd, mult, a->rs1, mult) &&
> +           !is_overlapped(a->rd, mult, a->rs2, mult) &&
> +           s->lmul >= 0;
> +}
> +
> +GEN_VV_UNMASKED_TRANS(vsha2ms_vv, vsha_check, ZVKNH_EGS)
> +GEN_VV_UNMASKED_TRANS(vsha2cl_vv, vsha_check, ZVKNH_EGS)
> +GEN_VV_UNMASKED_TRANS(vsha2ch_vv, vsha_check, ZVKNH_EGS)
> diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
> index 0988eb74c8..ca09062c6c 100644
> --- a/target/riscv/vcrypto_helper.c
> +++ b/target/riscv/vcrypto_helper.c
> @@ -503,3 +503,217 @@ void HELPER(vaeskf2_vi)(void *vd_vptr, void *vs2_vptr, uint32_t uimm,
>       /* set tail elements to 1s */
>       vext_set_elems_1s(vd, vta, vl * 4, total_elems * 4);
>   }
> +
> +static inline uint32_t sig0_sha256(uint32_t x)
> +{
> +    return ror32(x, 7) ^ ror32(x, 18) ^ (x >> 3);
> +}
> +
> +static inline uint32_t sig1_sha256(uint32_t x)
> +{
> +    return ror32(x, 17) ^ ror32(x, 19) ^ (x >> 10);
> +}
> +
> +static inline uint64_t sig0_sha512(uint64_t x)
> +{
> +    return ror64(x, 1) ^ ror64(x, 8) ^ (x >> 7);
> +}
> +
> +static inline uint64_t sig1_sha512(uint64_t x)
> +{
> +    return ror64(x, 19) ^ ror64(x, 61) ^ (x >> 6);
> +}
> +
> +static inline void vsha2ms_e32(uint32_t *vd, uint32_t *vs1, uint32_t *vs2)
> +{
> +    uint32_t res[4];
> +    res[0] = sig1_sha256(vs1[H4(2)]) + vs2[H4(1)] + sig0_sha256(vd[H4(1)]) +
> +             vd[H4(0)];
> +    res[1] = sig1_sha256(vs1[H4(3)]) + vs2[H4(2)] + sig0_sha256(vd[H4(2)]) +
> +             vd[H4(1)];
> +    res[2] =
> +        sig1_sha256(res[0]) + vs2[H4(3)] + sig0_sha256(vd[H4(3)]) + vd[H4(2)];
> +    res[3] =
> +        sig1_sha256(res[1]) + vs1[H4(0)] + sig0_sha256(vs2[H4(0)]) + vd[H4(3)];
> +    vd[H4(3)] = res[3];
> +    vd[H4(2)] = res[2];
> +    vd[H4(1)] = res[1];
> +    vd[H4(0)] = res[0];
> +}
> +
> +static inline void vsha2ms_e64(uint64_t *vd, uint64_t *vs1, uint64_t *vs2)
> +{
> +    uint64_t res[4];
> +    res[0] = sig1_sha512(vs1[2]) + vs2[1] + sig0_sha512(vd[1]) + vd[0];
> +    res[1] = sig1_sha512(vs1[3]) + vs2[2] + sig0_sha512(vd[2]) + vd[1];
> +    res[2] = sig1_sha512(res[0]) + vs2[3] + sig0_sha512(vd[3]) + vd[2];
> +    res[3] = sig1_sha512(res[1]) + vs1[0] + sig0_sha512(vs2[0]) + vd[3];
> +    vd[3] = res[3];
> +    vd[2] = res[2];
> +    vd[1] = res[1];
> +    vd[0] = res[0];
> +}
> +
> +void HELPER(vsha2ms_vv)(void *vd, void *vs1, void *vs2, CPURISCVState *env,
> +                        uint32_t desc)
> +{
> +    uint32_t sew = FIELD_EX64(env->vtype, VTYPE, VSEW);
> +    uint32_t esz = sew == MO_32 ? 4 : 8;
> +    uint32_t total_elems;
> +    uint32_t vta = vext_vta(desc);
> +
> +    for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
> +        if (sew == MO_32) {
> +            vsha2ms_e32(((uint32_t *)vd) + i * 4, ((uint32_t *)vs1) + i * 4,
> +                        ((uint32_t *)vs2) + i * 4);
> +        } else {
> +            /* If not 32 then SEW should be 64 */
> +            vsha2ms_e64(((uint64_t *)vd) + i * 4, ((uint64_t *)vs1) + i * 4,
> +                        ((uint64_t *)vs2) + i * 4);
> +        }
> +    }
> +    /* set tail elements to 1s */
> +    total_elems = vext_get_total_elems(env, desc, esz);
> +    vext_set_elems_1s(vd, vta, env->vl * esz, total_elems * esz);
> +    env->vstart = 0;
> +}
> +
> +static inline uint64_t sum0_64(uint64_t x)
> +{
> +    return ror64(x, 28) ^ ror64(x, 34) ^ ror64(x, 39);
> +}
> +
> +static inline uint32_t sum0_32(uint32_t x)
> +{
> +    return ror32(x, 2) ^ ror32(x, 13) ^ ror32(x, 22);
> +}
> +
> +static inline uint64_t sum1_64(uint64_t x)
> +{
> +    return ror64(x, 14) ^ ror64(x, 18) ^ ror64(x, 41);
> +}
> +
> +static inline uint32_t sum1_32(uint32_t x)
> +{
> +    return ror32(x, 6) ^ ror32(x, 11) ^ ror32(x, 25);
> +}
> +
> +#define ch(x, y, z) ((x & y) ^ ((~x) & z))
> +
> +#define maj(x, y, z) ((x & y) ^ (x & z) ^ (y & z))
> +
> +static void vsha2c_64(uint64_t *vs2, uint64_t *vd, uint64_t *vs1)
> +{
> +    uint64_t a = vs2[3], b = vs2[2], e = vs2[1], f = vs2[0];
> +    uint64_t c = vd[3], d = vd[2], g = vd[1], h = vd[0];
> +    uint64_t W0 = vs1[0], W1 = vs1[1];
> +    uint64_t T1 = h + sum1_64(e) + ch(e, f, g) + W0;
> +    uint64_t T2 = sum0_64(a) + maj(a, b, c);
> +
> +    h = g;
> +    g = f;
> +    f = e;
> +    e = d + T1;
> +    d = c;
> +    c = b;
> +    b = a;
> +    a = T1 + T2;
> +
> +    T1 = h + sum1_64(e) + ch(e, f, g) + W1;
> +    T2 = sum0_64(a) + maj(a, b, c);
> +    h = g;
> +    g = f;
> +    f = e;
> +    e = d + T1;
> +    d = c;
> +    c = b;
> +    b = a;
> +    a = T1 + T2;
> +
> +    vd[0] = f;
> +    vd[1] = e;
> +    vd[2] = b;
> +    vd[3] = a;
> +}
> +
> +static void vsha2c_32(uint32_t *vs2, uint32_t *vd, uint32_t *vs1)
> +{
> +    uint32_t a = vs2[H4(3)], b = vs2[H4(2)], e = vs2[H4(1)], f = vs2[H4(0)];
> +    uint32_t c = vd[H4(3)], d = vd[H4(2)], g = vd[H4(1)], h = vd[H4(0)];
> +    uint32_t W0 = vs1[H4(0)], W1 = vs1[H4(1)];
> +    uint32_t T1 = h + sum1_32(e) + ch(e, f, g) + W0;
> +    uint32_t T2 = sum0_32(a) + maj(a, b, c);
> +
> +    h = g;
> +    g = f;
> +    f = e;
> +    e = d + T1;
> +    d = c;
> +    c = b;
> +    b = a;
> +    a = T1 + T2;
> +
> +    T1 = h + sum1_32(e) + ch(e, f, g) + W1;
> +    T2 = sum0_32(a) + maj(a, b, c);
> +    h = g;
> +    g = f;
> +    f = e;
> +    e = d + T1;
> +    d = c;
> +    c = b;
> +    b = a;
> +    a = T1 + T2;
> +
> +    vd[H4(0)] = f;
> +    vd[H4(1)] = e;
> +    vd[H4(2)] = b;
> +    vd[H4(3)] = a;
> +}
> +
> +void HELPER(vsha2ch_vv)(void *vd, void *vs1, void *vs2, CPURISCVState *env,
> +                        uint32_t desc)
> +{
> +    uint32_t sew = FIELD_EX64(env->vtype, VTYPE, VSEW);
> +    uint32_t esz = sew == MO_64 ? 8 : 4;
> +    uint32_t total_elems;
> +    uint32_t vta = vext_vta(desc);
> +
> +    for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
> +        if (sew == MO_64) {
> +            vsha2c_64(((uint64_t *)vs2) + 4 * i, ((uint64_t *)vd) + 4 * i,
> +                      ((uint64_t *)vs1) + 4 * i + 2);
> +        } else {
> +            vsha2c_32(((uint32_t *)vs2) + 4 * i, ((uint32_t *)vd) + 4 * i,
> +                      ((uint32_t *)vs1) + 4 * i + 2);
> +        }
> +    }
> +
> +    /* set tail elements to 1s */
> +    total_elems = vext_get_total_elems(env, desc, esz);
> +    vext_set_elems_1s(vd, vta, env->vl * esz, total_elems * esz);
> +    env->vstart = 0;
> +}
> +
> +void HELPER(vsha2cl_vv)(void *vd, void *vs1, void *vs2, CPURISCVState *env,
> +                        uint32_t desc)
> +{
> +    uint32_t sew = FIELD_EX64(env->vtype, VTYPE, VSEW);
> +    uint32_t esz = sew == MO_64 ? 8 : 4;
> +    uint32_t total_elems;
> +    uint32_t vta = vext_vta(desc);
> +
> +    for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
> +        if (sew == MO_64) {
> +            vsha2c_64(((uint64_t *)vs2) + 4 * i, ((uint64_t *)vd) + 4 * i,
> +                      (((uint64_t *)vs1) + 4 * i));
> +        } else {
> +            vsha2c_32(((uint32_t *)vs2) + 4 * i, ((uint32_t *)vd) + 4 * i,
> +                      (((uint32_t *)vs1) + 4 * i));
> +        }
> +    }
> +
> +    /* set tail elements to 1s */
> +    total_elems = vext_get_total_elems(env, desc, esz);
> +    vext_set_elems_1s(vd, vta, env->vl * esz, total_elems * esz);
> +    env->vstart = 0;
> +}

