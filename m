Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88285C77B73
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 May 2023 12:54:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q153e-0003OL-US; Mon, 22 May 2023 08:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q153c-0003NS-Oi
 for qemu-riscv@nongnu.org; Mon, 22 May 2023 08:54:36 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q153a-0004MK-NK
 for qemu-riscv@nongnu.org; Mon, 22 May 2023 08:54:36 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6af6de9fb74so1159227a34.2
 for <qemu-riscv@nongnu.org>; Mon, 22 May 2023 05:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684760073; x=1687352073;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h/vop7u3ewpIN1+xfvi7+V6u7BR7DCD5DOkZLtkv/4w=;
 b=WDlyG05qic+i7CLr91hY7nIoDX4qwIpUdRKuxbEwmzuTznpOlLtGFE8Vn/hNlFouT5
 cpo/zR55vSRwDTk2zasRds16cmV0prfeKHjyRJoyxStjFnnnzmK1yOz7AQtMmc7B6yCx
 UprLIunEreFdWXfQXqhhUHE4KA5w3yBM/YAcvvLHNDQLaYLF0/aIE6iXCn+BEduOCDPm
 NbMNLeeLO0W4xFB3p/KzR3k1UTrFiPUslOsx1ybttrMo+H5yjH4E4HFLFmxvDAa5ieaG
 kiNdHjJUmHcVMjZWQ+xscQ4IPtv416B7qQzxQUicXXdoi+BywciR2l6aPbegaWFEYhwV
 y3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684760073; x=1687352073;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h/vop7u3ewpIN1+xfvi7+V6u7BR7DCD5DOkZLtkv/4w=;
 b=dtdv8O5wXXVuwbQfHTrIRnqXh8bwX9Q5LP7Z5Xac78JKvgut9ua5Zt5A1VAOq37PzO
 SvRTYHUTMSzb7alDOH1cJrHyQ1w+pjzRRY+EJ7RI7s3kjzx2a6EpPevmhHs0Z/u9Zxjh
 zAxIimvKNknbq3I9toBcgbRLHMxoArTz34DA3SWT2vabMW/BlajhgqAQHycAuja1S/gV
 x/5V6WW0dp60/7CpC5R48NtzNMHXxyN0n/z4uQIfttkYvcJHiqlYNl81UMb7eOgwZipl
 IsoN6gvdzJPSwfV2uv7Oy17MM0Kuq8qBTn2GrcRwECMWAVkvQ9+WikDBcF0hCNm89ig9
 WwIQ==
X-Gm-Message-State: AC+VfDwe5gD9zbTFBBDaccijDjwxdj73WGVtLSU96MDkZFscYVvVnGkp
 IU5YzyQQCsPh11DI5qjnucv7ag==
X-Google-Smtp-Source: ACHHUZ6doRqs95xce432Rqui/Q7rn7+3u4DuOtJ28Pwd5hmQCK2djUJF9uYC9EQTC5cs/iBFQvEf2A==
X-Received: by 2002:a54:4784:0:b0:398:10ef:c9d2 with SMTP id
 o4-20020a544784000000b0039810efc9d2mr1175802oic.36.1684760073516; 
 Mon, 22 May 2023 05:54:33 -0700 (PDT)
Received: from [192.168.68.107] ([179.111.98.125])
 by smtp.gmail.com with ESMTPSA id
 k127-20020aca3d85000000b0038c0a359e74sm2674630oia.31.2023.05.22.05.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 05:54:33 -0700 (PDT)
Message-ID: <29978bd3-97d0-9f17-d13e-b986bd0e7087@ventanamicro.com>
Date: Mon, 22 May 2023 09:54:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/7] target/riscv: Pass RISCVCPUConfig as target_info to
 disassemble_info
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230519021926.15362-1-liweiwei@iscas.ac.cn>
 <20230519021926.15362-3-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230519021926.15362-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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



On 5/18/23 23:19, Weiwei Li wrote:
> Pass RISCVCPUConfig as disassemble_info.target_info to support disas
> of conflict instructions related to specific extensions.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

I suggest split the CPUCfg declarations from cpu.h into the new cpu_cfg.h header
in a separated patch. It makes our lives easier when bissecting for bugs and
so on.

One more nit below:


>   disas/riscv.c          |  10 ++-
>   target/riscv/cpu.c     |   1 +
>   target/riscv/cpu.h     | 114 +---------------------------------
>   target/riscv/cpu_cfg.h | 135 +++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 144 insertions(+), 116 deletions(-)
>   create mode 100644 target/riscv/cpu_cfg.h
> 
> diff --git a/disas/riscv.c b/disas/riscv.c
> index e61bda5674..729ab684da 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -19,7 +19,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "disas/dis-asm.h"
> -
> +#include "target/riscv/cpu_cfg.h"
>   
>   /* types */
>   
> @@ -967,6 +967,7 @@ typedef enum {
>   /* structures */
>   
>   typedef struct {
> +    RISCVCPUConfig *cfg;
>       uint64_t  pc;
>       uint64_t  inst;
>       int32_t   imm;
> @@ -4855,11 +4856,13 @@ static void decode_inst_decompress(rv_decode *dec, rv_isa isa)
>   /* disassemble instruction */
>   
>   static void
> -disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst inst)
> +disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst inst,
> +            RISCVCPUConfig *cfg)
>   {
>       rv_decode dec = { 0 };
>       dec.pc = pc;
>       dec.inst = inst;
> +    dec.cfg = cfg;
>       decode_inst_opcode(&dec, isa);
>       decode_inst_operands(&dec, isa);
>       decode_inst_decompress(&dec, isa);
> @@ -4914,7 +4917,8 @@ print_insn_riscv(bfd_vma memaddr, struct disassemble_info *info, rv_isa isa)
>           break;
>       }
>   
> -    disasm_inst(buf, sizeof(buf), isa, memaddr, inst);
> +    disasm_inst(buf, sizeof(buf), isa, memaddr, inst,
> +                (RISCVCPUConfig *)info->target_info);
>       (*info->fprintf_func)(info->stream, "%s", buf);
>   
>       return len;
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index db0875fb43..4fe926cdd1 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -818,6 +818,7 @@ static void riscv_cpu_reset_hold(Object *obj)
>   static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>   {
>       RISCVCPU *cpu = RISCV_CPU(s);
> +    info->target_info = &cpu->cfg;
>   
>       switch (riscv_cpu_mxl(&cpu->env)) {
>       case MXL_RV32:
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index de7e43126a..dc1229b69c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -27,6 +27,7 @@
>   #include "qom/object.h"
>   #include "qemu/int128.h"
>   #include "cpu_bits.h"
> +#include "cpu_cfg.h"
>   #include "qapi/qapi-types-common.h"
>   #include "cpu-qom.h"
>   
> @@ -368,119 +369,6 @@ struct CPUArchState {
>       uint64_t kvm_timer_frequency;
>   };
>   
> -/*
> - * map is a 16-bit bitmap: the most significant set bit in map is the maximum
> - * satp mode that is supported. It may be chosen by the user and must respect
> - * what qemu implements (valid_1_10_32/64) and what the hw is capable of
> - * (supported bitmap below).
> - *
> - * init is a 16-bit bitmap used to make sure the user selected a correct
> - * configuration as per the specification.
> - *
> - * supported is a 16-bit bitmap used to reflect the hw capabilities.
> - */
> -typedef struct {
> -    uint16_t map, init, supported;
> -} RISCVSATPMap;
> -
> -struct RISCVCPUConfig {
> -    bool ext_zba;
> -    bool ext_zbb;
> -    bool ext_zbc;
> -    bool ext_zbkb;
> -    bool ext_zbkc;
> -    bool ext_zbkx;
> -    bool ext_zbs;
> -    bool ext_zca;
> -    bool ext_zcb;
> -    bool ext_zcd;
> -    bool ext_zce;
> -    bool ext_zcf;
> -    bool ext_zcmp;
> -    bool ext_zcmt;
> -    bool ext_zk;
> -    bool ext_zkn;
> -    bool ext_zknd;
> -    bool ext_zkne;
> -    bool ext_zknh;
> -    bool ext_zkr;
> -    bool ext_zks;
> -    bool ext_zksed;
> -    bool ext_zksh;
> -    bool ext_zkt;
> -    bool ext_ifencei;
> -    bool ext_icsr;
> -    bool ext_icbom;
> -    bool ext_icboz;
> -    bool ext_zicond;
> -    bool ext_zihintpause;
> -    bool ext_smstateen;
> -    bool ext_sstc;
> -    bool ext_svadu;
> -    bool ext_svinval;
> -    bool ext_svnapot;
> -    bool ext_svpbmt;
> -    bool ext_zdinx;
> -    bool ext_zawrs;
> -    bool ext_zfh;
> -    bool ext_zfhmin;
> -    bool ext_zfinx;
> -    bool ext_zhinx;
> -    bool ext_zhinxmin;
> -    bool ext_zve32f;
> -    bool ext_zve64f;
> -    bool ext_zve64d;
> -    bool ext_zmmul;
> -    bool ext_zvfh;
> -    bool ext_zvfhmin;
> -    bool ext_smaia;
> -    bool ext_ssaia;
> -    bool ext_sscofpmf;
> -    bool rvv_ta_all_1s;
> -    bool rvv_ma_all_1s;
> -
> -    uint32_t mvendorid;
> -    uint64_t marchid;
> -    uint64_t mimpid;
> -
> -    /* Vendor-specific custom extensions */
> -    bool ext_xtheadba;
> -    bool ext_xtheadbb;
> -    bool ext_xtheadbs;
> -    bool ext_xtheadcmo;
> -    bool ext_xtheadcondmov;
> -    bool ext_xtheadfmemidx;
> -    bool ext_xtheadfmv;
> -    bool ext_xtheadmac;
> -    bool ext_xtheadmemidx;
> -    bool ext_xtheadmempair;
> -    bool ext_xtheadsync;
> -    bool ext_XVentanaCondOps;
> -
> -    uint8_t pmu_num;
> -    char *priv_spec;
> -    char *user_spec;
> -    char *bext_spec;
> -    char *vext_spec;
> -    uint16_t vlen;
> -    uint16_t elen;
> -    uint16_t cbom_blocksize;
> -    uint16_t cboz_blocksize;
> -    bool mmu;
> -    bool pmp;
> -    bool epmp;
> -    bool debug;
> -    bool misa_w;
> -
> -    bool short_isa_string;
> -
> -#ifndef CONFIG_USER_ONLY
> -    RISCVSATPMap satp_mode;
> -#endif
> -};
> -
> -typedef struct RISCVCPUConfig RISCVCPUConfig;
> -
>   /*
>    * RISCVCPU:
>    * @env: #CPURISCVState
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> new file mode 100644
> index 0000000000..e2e982fac4
> --- /dev/null
> +++ b/target/riscv/cpu_cfg.h
> @@ -0,0 +1,135 @@
> +/*
> + * QEMU RISC-V CPU CFG
> + *
> + * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
> + * Copyright (c) 2017-2018 SiFive, Inc.

I don't mind keeping these copyrights but it would be good to have a 2023 copyright
as well since the file was just created.


Other than that:


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef RISCV_CPU_CFG_H
> +#define RISCV_CPU_CFG_H
> +
> +/*
> + * map is a 16-bit bitmap: the most significant set bit in map is the maximum
> + * satp mode that is supported. It may be chosen by the user and must respect
> + * what qemu implements (valid_1_10_32/64) and what the hw is capable of
> + * (supported bitmap below).
> + *
> + * init is a 16-bit bitmap used to make sure the user selected a correct
> + * configuration as per the specification.
> + *
> + * supported is a 16-bit bitmap used to reflect the hw capabilities.
> + */
> +typedef struct {
> +    uint16_t map, init, supported;
> +} RISCVSATPMap;
> +
> +struct RISCVCPUConfig {
> +    bool ext_zba;
> +    bool ext_zbb;
> +    bool ext_zbc;
> +    bool ext_zbkb;
> +    bool ext_zbkc;
> +    bool ext_zbkx;
> +    bool ext_zbs;
> +    bool ext_zca;
> +    bool ext_zcb;
> +    bool ext_zcd;
> +    bool ext_zce;
> +    bool ext_zcf;
> +    bool ext_zcmp;
> +    bool ext_zcmt;
> +    bool ext_zk;
> +    bool ext_zkn;
> +    bool ext_zknd;
> +    bool ext_zkne;
> +    bool ext_zknh;
> +    bool ext_zkr;
> +    bool ext_zks;
> +    bool ext_zksed;
> +    bool ext_zksh;
> +    bool ext_zkt;
> +    bool ext_ifencei;
> +    bool ext_icsr;
> +    bool ext_icbom;
> +    bool ext_icboz;
> +    bool ext_zicond;
> +    bool ext_zihintpause;
> +    bool ext_smstateen;
> +    bool ext_sstc;
> +    bool ext_svadu;
> +    bool ext_svinval;
> +    bool ext_svnapot;
> +    bool ext_svpbmt;
> +    bool ext_zdinx;
> +    bool ext_zawrs;
> +    bool ext_zfh;
> +    bool ext_zfhmin;
> +    bool ext_zfinx;
> +    bool ext_zhinx;
> +    bool ext_zhinxmin;
> +    bool ext_zve32f;
> +    bool ext_zve64f;
> +    bool ext_zve64d;
> +    bool ext_zmmul;
> +    bool ext_zvfh;
> +    bool ext_zvfhmin;
> +    bool ext_smaia;
> +    bool ext_ssaia;
> +    bool ext_sscofpmf;
> +    bool rvv_ta_all_1s;
> +    bool rvv_ma_all_1s;
> +
> +    uint32_t mvendorid;
> +    uint64_t marchid;
> +    uint64_t mimpid;
> +
> +    /* Vendor-specific custom extensions */
> +    bool ext_xtheadba;
> +    bool ext_xtheadbb;
> +    bool ext_xtheadbs;
> +    bool ext_xtheadcmo;
> +    bool ext_xtheadcondmov;
> +    bool ext_xtheadfmemidx;
> +    bool ext_xtheadfmv;
> +    bool ext_xtheadmac;
> +    bool ext_xtheadmemidx;
> +    bool ext_xtheadmempair;
> +    bool ext_xtheadsync;
> +    bool ext_XVentanaCondOps;
> +
> +    uint8_t pmu_num;
> +    char *priv_spec;
> +    char *user_spec;
> +    char *bext_spec;
> +    char *vext_spec;
> +    uint16_t vlen;
> +    uint16_t elen;
> +    uint16_t cbom_blocksize;
> +    uint16_t cboz_blocksize;
> +    bool mmu;
> +    bool pmp;
> +    bool epmp;
> +    bool debug;
> +    bool misa_w;
> +
> +    bool short_isa_string;
> +
> +#ifndef CONFIG_USER_ONLY
> +    RISCVSATPMap satp_mode;
> +#endif
> +};
> +
> +typedef struct RISCVCPUConfig RISCVCPUConfig;
> +#endif

