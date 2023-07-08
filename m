Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D5BEB64DA
	for <qemu-riscv@archiver.kernel.org>; Sat,  8 Jul 2023 09:26:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qI4CI-0002N3-U7; Sat, 08 Jul 2023 05:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qI4CH-0002MI-M0
 for qemu-riscv@nongnu.org; Sat, 08 Jul 2023 05:25:45 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qI4CF-00015z-6k
 for qemu-riscv@nongnu.org; Sat, 08 Jul 2023 05:25:45 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6b7484cbc5dso2344729a34.1
 for <qemu-riscv@nongnu.org>; Sat, 08 Jul 2023 02:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688808341; x=1691400341;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PWLPC0XG46wlzDXbpIzHZcJ/TFHEvo+Z9dhUqxsalfY=;
 b=LKsVHSz6x8uu5r1KvZqPwZ1KUa8robUhcKL0K/VyB64Q/tGIPlpT4RUp68KT8qRM8W
 1drOohj/mI9HF1ALFRHxjXOBnN4mpKHosLzEOW4UjtIGoOI5XZezHWOISUHyEe7hlCoo
 gmg+TWz7sT71t50i73Bed9Z2knA1/V580ZQ3T6fkW4KIkImCQIzQoWDfGJ8O9Z+WEXPd
 VaWm4GGMqHMls3L6KCpNN4Zcy9IRq0sttHfYSn1LJ/BGARriO7b7PSUvSg1h8Pf6MGrF
 2cD4rL1ZuxaxwB8/xYb9Soi8S+wtr5hpsXXj5VHcBA8xVqCBj/YB+kRWyUicVelNaoZJ
 t0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688808341; x=1691400341;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PWLPC0XG46wlzDXbpIzHZcJ/TFHEvo+Z9dhUqxsalfY=;
 b=FoSIxRo7yucHMsJSW00k98Yl3cgLLJALzCgqYF+/uHFPMtAi2mSD6T+O4Nj0m5jT8O
 QTfNWk3faZJm8zGE0lt7cTO940+T+/LLgW/DZfHdcryutjaZgrQt884guuqW3WoJvBu6
 2qft9jYY/MzEJ041574H1ZnUJWFoTcNgF+orXSO7bJ/4onYcUK6DG9uhp6uf+hhD3gL+
 3z+mHtp/AqlwEFF6wzGTnY13xMrlzSOvvlDQgpD8FohxsCPGRLzPvALjWp+cqBs8p3Nh
 Jp6e1RzhsA7y+ocmzsFaYhRdo70WRQlvHZWGc/CYN5Ig/EWavtYI7029Vvva8UDlwhhs
 +9mw==
X-Gm-Message-State: ABy/qLbuSYbZX6NgXXA4louCq2dxg6hHL+sFF5fSE7w64sQvffc+CR+u
 FTTVzPoRFW6tOJcuSPA8m+c5uA==
X-Google-Smtp-Source: APBJJlFol8kTSsVOQp0vVZ6hsSv7rdw+M8jAQQ85h3BTQti14YuHEzF3VKIVxDvaaBeQagO+7GktpA==
X-Received: by 2002:a05:6808:2a4d:b0:3a3:f7a0:baaf with SMTP id
 fa13-20020a0568082a4d00b003a3f7a0baafmr405147oib.22.1688808341171; 
 Sat, 08 Jul 2023 02:25:41 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-19.dial-up.telesp.net.br.
 [201.69.66.19]) by smtp.gmail.com with ESMTPSA id
 bc13-20020a056808170d00b003a38df6284dsm2460528oib.11.2023.07.08.02.25.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jul 2023 02:25:40 -0700 (PDT)
Message-ID: <f943fa94-d105-da53-28e0-04b7afeba165@ventanamicro.com>
Date: Sat, 8 Jul 2023 06:25:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v7 12/15] target/riscv: Add Zvkg ISA extension support
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Nazar Kazakov <nazar.kazakov@codethink.co.uk>,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
References: <20230702155354.2478495-1-max.chou@sifive.com>
 <20230702155354.2478495-13-max.chou@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230702155354.2478495-13-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

Hi,

This patch breaks some gitlab runners because of this:

On 7/2/23 12:53, Max Chou wrote:
> From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> 
> This commit adds support for the Zvkg vector-crypto extension, which
> consists of the following instructions:
> 
> * vgmul.vv
> * vghsh.vv
> 
> Translation functions are defined in
> `target/riscv/insn_trans/trans_rvvk.c.inc` and helpers are defined in
> `target/riscv/vcrypto_helper.c`.
> 
> Co-authored-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
> [max.chou@sifive.com: Replaced vstart checking by TCG op]
> Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
> Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> Signed-off-by: Max Chou <max.chou@sifive.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> [max.chou@sifive.com: Exposed x-zvkg property]
> ---
>   target/riscv/cpu.c                       |  6 +-
>   target/riscv/cpu_cfg.h                   |  1 +
>   target/riscv/helper.h                    |  3 +
>   target/riscv/insn32.decode               |  4 ++
>   target/riscv/insn_trans/trans_rvvk.c.inc | 30 ++++++++++
>   target/riscv/vcrypto_helper.c            | 72 ++++++++++++++++++++++++
>   6 files changed, 114 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 08b8355f52..699ab5e9fa 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -118,6 +118,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zve64d, PRIV_VERSION_1_10_0, ext_zve64d),
>       ISA_EXT_DATA_ENTRY(zvfh, PRIV_VERSION_1_12_0, ext_zvfh),
>       ISA_EXT_DATA_ENTRY(zvfhmin, PRIV_VERSION_1_12_0, ext_zvfhmin),
> +    ISA_EXT_DATA_ENTRY(zvkg, PRIV_VERSION_1_12_0, ext_zvkg),
>       ISA_EXT_DATA_ENTRY(zvkned, PRIV_VERSION_1_12_0, ext_zvkned),
>       ISA_EXT_DATA_ENTRY(zvknha, PRIV_VERSION_1_12_0, ext_zvknha),
>       ISA_EXT_DATA_ENTRY(zvknhb, PRIV_VERSION_1_12_0, ext_zvknhb),
> @@ -1194,8 +1195,8 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>        * In principle Zve*x would also suffice here, were they supported
>        * in qemu
>        */
> -    if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkned || cpu->cfg.ext_zvknha ||
> -         cpu->cfg.ext_zvksh) && !cpu->cfg.ext_zve32f) {
> +    if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkg || cpu->cfg.ext_zvkned ||
> +         cpu->cfg.ext_zvknha || cpu->cfg.ext_zvksh) && !cpu->cfg.ext_zve32f) {
>           error_setg(errp,
>                      "Vector crypto extensions require V or Zve* extensions");
>           return;
> @@ -1710,6 +1711,7 @@ static Property riscv_cpu_extensions[] = {
>       /* Vector cryptography extensions */
>       DEFINE_PROP_BOOL("x-zvbb", RISCVCPU, cfg.ext_zvbb, false),
>       DEFINE_PROP_BOOL("x-zvbc", RISCVCPU, cfg.ext_zvbc, false),
> +    DEFINE_PROP_BOOL("x-zvkg", RISCVCPU, cfg.ext_zvkg, false),
>       DEFINE_PROP_BOOL("x-zvkned", RISCVCPU, cfg.ext_zvkned, false),
>       DEFINE_PROP_BOOL("x-zvknha", RISCVCPU, cfg.ext_zvknha, false),
>       DEFINE_PROP_BOOL("x-zvknhb", RISCVCPU, cfg.ext_zvknhb, false),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 27062b12a8..960761c479 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -85,6 +85,7 @@ struct RISCVCPUConfig {
>       bool ext_zve64d;
>       bool ext_zvbb;
>       bool ext_zvbc;
> +    bool ext_zvkg;
>       bool ext_zvkned;
>       bool ext_zvknha;
>       bool ext_zvknhb;
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 172c91c65c..238343cb42 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1244,3 +1244,6 @@ DEF_HELPER_5(vsha2cl64_vv, void, ptr, ptr, ptr, env, i32)
>   
>   DEF_HELPER_5(vsm3me_vv, void, ptr, ptr, ptr, env, i32)
>   DEF_HELPER_5(vsm3c_vi, void, ptr, ptr, i32, env, i32)
> +
> +DEF_HELPER_5(vghsh_vv, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_4(vgmul_vv, void, ptr, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 5ca83e8462..b10497afd3 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -957,3 +957,7 @@ vsha2cl_vv  101111 1 ..... ..... 010 ..... 1110111 @r_vm_1
>   # *** Zvksh vector crypto extension ***
>   vsm3me_vv   100000 1 ..... ..... 010 ..... 1110111 @r_vm_1
>   vsm3c_vi    101011 1 ..... ..... 010 ..... 1110111 @r_vm_1
> +
> +# *** Zvkg vector crypto extension ***
> +vghsh_vv    101100 1 ..... ..... 010 ..... 1110111 @r_vm_1
> +vgmul_vv    101000 1 ..... 10001 010 ..... 1110111 @r2_vm_1
> diff --git a/target/riscv/insn_trans/trans_rvvk.c.inc b/target/riscv/insn_trans/trans_rvvk.c.inc
> index 6469dd2f02..af7cd62e7d 100644
> --- a/target/riscv/insn_trans/trans_rvvk.c.inc
> +++ b/target/riscv/insn_trans/trans_rvvk.c.inc
> @@ -531,3 +531,33 @@ static inline bool vsm3c_check(DisasContext *s, arg_rmrr *a)
>   
>   GEN_VV_UNMASKED_TRANS(vsm3me_vv, vsm3me_check, ZVKSH_EGS)
>   GEN_VI_UNMASKED_TRANS(vsm3c_vi, vsm3c_check, ZVKSH_EGS)
> +
> +/*
> + * Zvkg
> + */
> +
> +#define ZVKG_EGS 4
> +
> +static bool vgmul_check(DisasContext *s, arg_rmr *a)
> +{
> +    int egw_bytes = ZVKG_EGS << s->sew;
> +    return s->cfg_ptr->ext_zvkg == true &&
> +           vext_check_isa_ill(s) &&
> +           require_rvv(s) &&
> +           MAXSZ(s) >= egw_bytes &&
> +           vext_check_ss(s, a->rd, a->rs2, a->vm) &&
> +           s->sew == MO_32;
> +}
> +
> +GEN_V_UNMASKED_TRANS(vgmul_vv, vgmul_check, ZVKG_EGS)
> +
> +static bool vghsh_check(DisasContext *s, arg_rmrr *a)
> +{
> +    int egw_bytes = ZVKG_EGS << s->sew;
> +    return s->cfg_ptr->ext_zvkg == true &&
> +           opivv_check(s, a) &&
> +           MAXSZ(s) >= egw_bytes &&
> +           s->sew == MO_32;
> +}
> +
> +GEN_VV_UNMASKED_TRANS(vghsh_vv, vghsh_check, ZVKG_EGS)
> diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
> index ff7fb11928..f127fc0d3a 100644
> --- a/target/riscv/vcrypto_helper.c
> +++ b/target/riscv/vcrypto_helper.c
> @@ -769,3 +769,75 @@ void HELPER(vsm3c_vi)(void *vd_vptr, void *vs2_vptr, uint32_t uimm,
>       vext_set_elems_1s(vd_vptr, vta, env->vl * esz, total_elems * esz);
>       env->vstart = 0;
>   }
> +
> +void HELPER(vghsh_vv)(void *vd_vptr, void *vs1_vptr, void *vs2_vptr,
> +                      CPURISCVState *env, uint32_t desc)
> +{
> +    uint64_t *vd = vd_vptr;
> +    uint64_t *vs1 = vs1_vptr;
> +    uint64_t *vs2 = vs2_vptr;
> +    uint32_t vta = vext_vta(desc);
> +    uint32_t total_elems = vext_get_total_elems(env, desc, 4);
> +
> +    for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
> +        uint64_t Y[2] = {vd[i * 2 + 0], vd[i * 2 + 1]};
> +        uint64_t H[2] = {brev8(vs2[i * 2 + 0]), brev8(vs2[i * 2 + 1])};
> +        uint64_t X[2] = {vs1[i * 2 + 0], vs1[i * 2 + 1]};
> +        uint64_t Z[2] = {0, 0};
> +
> +        uint64_t S[2] = {brev8(Y[0] ^ X[0]), brev8(Y[1] ^ X[1])};
> +
> +        for (uint j = 0; j < 128; j++) {

^

and this

     FAILED:
     libqemu-riscv64-softmmu.fa.p/target_riscv_vcrypto_helper.c.obj
     i686-w64-mingw32-gcc -m32 -Ilibqemu-riscv64-softmmu.fa.p -I. -I..
     -Itarget/riscv -I../target/riscv -Isubprojects/dtc/libfdt
     -I../subprojects/dtc/libfdt -Iqapi -Itrace -Iui -Iui/shader
     -I/usr/i686-w64-mingw32/sys-root/mingw/include/pixman-1
     -I/usr/i686-w64-mingw32/sys-root/mingw/include/glib-2.0
     -I/usr/i686-w64-mingw32/sys-root/mingw/lib/glib-2.0/include
     -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g
     -fstack-protector-strong -Wundef -Wwrite-strings -Wmissing-prototypes
     -Wstrict-prototypes -Wredundant-decls -Wold-style-declaration
     -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
     -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
     -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2
     -Wmissing-format-attribute -Wno-missing-include-dirs
     -Wno-shift-negative-value -Wno-psabi -iquote . -iquote
     /builds/danielhb/qemu -iquote /builds/danielhb/qemu/include -iquote
     /builds/danielhb/qemu/host/include/i386 -iquote
     /builds/danielhb/qemu/host/include/generic -iquote
     /builds/danielhb/qemu/tcg/i386 -mms-bitfields -D_GNU_SOURCE
     -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -fno-strict-aliasing
     -fno-common -fwrapv -fno-pie -no-pie -DNEED_CPU_H
     '-DCONFIG_TARGET="riscv64-softmmu-config-target.h"'
     '-DCONFIG_DEVICES="riscv64-softmmu-config-devices.h"' -MD -MQ
     libqemu-riscv64-softmmu.fa.p/target_riscv_vcrypto_helper.c.obj -MF
     libqemu-riscv64-softmmu.fa.p/target_riscv_vcrypto_helper.c.obj.d -o
     libqemu-riscv64-softmmu.fa.p/target_riscv_vcrypto_helper.c.obj -c
     ../target/riscv/vcrypto_helper.c
     ../target/riscv/vcrypto_helper.c: In function 'helper_vghsh_vv':
     ../target/riscv/vcrypto_helper.c:791:14: error: unknown type name
     'uint'; did you mean 'u_int'?
       791 |         for (uint j = 0; j < 128; j++) {
           |              ^~~~
           |              u_int
     ../target/riscv/vcrypto_helper.c: In function 'helper_vgmul_vv':
     ../target/riscv/vcrypto_helper.c:825:14: error: unknown type name
     'uint'; did you mean 'u_int'?
       825 |         for (uint j = 0; j < 128; j++) {
           |              ^~~~
           |              u_int
     [2503/3700] Compiling C object
     libqemu-riscv64-softmmu.fa.p/target_riscv_vector_helper.c.obj


If you want to take a look yourself:

https://gitlab.com/danielhb/qemu/-/jobs/4615946161

The fix is to use 'int' instead of 'uint' in both cases.

I apologize for noticing the error this late. I haven't had the chance to run
Gitlab runners in these patches until now.

Alistair, in case you decide to take this series you'll have to amend this
in-tree I'm afraid. It's too late to ask for another review.


Thanks,


Daniel


> +            if ((S[j / 64] >> (j % 64)) & 1) {
> +                Z[0] ^= H[0];
> +                Z[1] ^= H[1];
> +            }
> +            bool reduce = ((H[1] >> 63) & 1);
> +            H[1] = H[1] << 1 | H[0] >> 63;
> +            H[0] = H[0] << 1;
> +            if (reduce) {
> +                H[0] ^= 0x87;
> +            }
> +        }
> +
> +        vd[i * 2 + 0] = brev8(Z[0]);
> +        vd[i * 2 + 1] = brev8(Z[1]);
> +    }
> +    /* set tail elements to 1s */
> +    vext_set_elems_1s(vd, vta, env->vl * 4, total_elems * 4);
> +    env->vstart = 0;
> +}
> +
> +void HELPER(vgmul_vv)(void *vd_vptr, void *vs2_vptr, CPURISCVState *env,
> +                      uint32_t desc)
> +{
> +    uint64_t *vd = vd_vptr;
> +    uint64_t *vs2 = vs2_vptr;
> +    uint32_t vta = vext_vta(desc);
> +    uint32_t total_elems = vext_get_total_elems(env, desc, 4);
> +
> +    for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
> +        uint64_t Y[2] = {brev8(vd[i * 2 + 0]), brev8(vd[i * 2 + 1])};
> +        uint64_t H[2] = {brev8(vs2[i * 2 + 0]), brev8(vs2[i * 2 + 1])};
> +        uint64_t Z[2] = {0, 0};
> +
> +        for (uint j = 0; j < 128; j++) {

^

The error being thrown:

     FAILED:
     libqemu-riscv64-softmmu.fa.p/target_riscv_vcrypto_helper.c.obj
     i686-w64-mingw32-gcc -m32 -Ilibqemu-riscv64-softmmu.fa.p -I. -I..
     -Itarget/riscv -I../target/riscv -Isubprojects/dtc/libfdt
     -I../subprojects/dtc/libfdt -Iqapi -Itrace -Iui -Iui/shader
     -I/usr/i686-w64-mingw32/sys-root/mingw/include/pixman-1
     -I/usr/i686-w64-mingw32/sys-root/mingw/include/glib-2.0
     -I/usr/i686-w64-mingw32/sys-root/mingw/lib/glib-2.0/include
     -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g
     -fstack-protector-strong -Wundef -Wwrite-strings -Wmissing-prototypes
     -Wstrict-prototypes -Wredundant-decls -Wold-style-declaration
     -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
     -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
     -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2
     -Wmissing-format-attribute -Wno-missing-include-dirs
     -Wno-shift-negative-value -Wno-psabi -iquote . -iquote
     /builds/danielhb/qemu -iquote /builds/danielhb/qemu/include -iquote
     /builds/danielhb/qemu/host/include/i386 -iquote
     /builds/danielhb/qemu/host/include/generic -iquote
     /builds/danielhb/qemu/tcg/i386 -mms-bitfields -D_GNU_SOURCE
     -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -fno-strict-aliasing
     -fno-common -fwrapv -fno-pie -no-pie -DNEED_CPU_H
     '-DCONFIG_TARGET="riscv64-softmmu-config-target.h"'
     '-DCONFIG_DEVICES="riscv64-softmmu-config-devices.h"' -MD -MQ
     libqemu-riscv64-softmmu.fa.p/target_riscv_vcrypto_helper.c.obj -MF
     libqemu-riscv64-softmmu.fa.p/target_riscv_vcrypto_helper.c.obj.d -o
     libqemu-riscv64-softmmu.fa.p/target_riscv_vcrypto_helper.c.obj -c
     ../target/riscv/vcrypto_helper.c
     ../target/riscv/vcrypto_helper.c: In function 'helper_vghsh_vv':
     ../target/riscv/vcrypto_helper.c:791:14: error: unknown type name
     'uint'; did you mean 'u_int'?
       791 |         for (uint j = 0; j < 128; j++) {
           |              ^~~~
           |              u_int
     ../target/riscv/vcrypto_helper.c: In function 'helper_vgmul_vv':
     ../target/riscv/vcrypto_helper.c:825:14: error: unknown type name
     'uint'; did you mean 'u_int'?
       825 |         for (uint j = 0; j < 128; j++) {
           |              ^~~~
           |              u_int
     [2503/3700] Compiling C object
     libqemu-riscv64-softmmu.fa.p/target_riscv_vector_helper.c.obj


> +            if ((Y[j / 64] >> (j % 64)) & 1) {
> +                Z[0] ^= H[0];
> +                Z[1] ^= H[1];
> +            }
> +            bool reduce = ((H[1] >> 63) & 1);
> +            H[1] = H[1] << 1 | H[0] >> 63;
> +            H[0] = H[0] << 1;
> +            if (reduce) {
> +                H[0] ^= 0x87;
> +            }
> +        }
> +
> +        vd[i * 2 + 0] = brev8(Z[0]);
> +        vd[i * 2 + 1] = brev8(Z[1]);
> +    }
> +    /* set tail elements to 1s */
> +    vext_set_elems_1s(vd, vta, env->vl * 4, total_elems * 4);
> +    env->vstart = 0;
> +}

