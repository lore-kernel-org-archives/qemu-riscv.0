Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65B6C7EE23
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 May 2023 12:15:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1QvQ-0002yg-HA; Tue, 23 May 2023 08:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q1QvJ-0002sO-AU
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 08:15:31 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q1QvG-0004JK-8f
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 08:15:29 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6af6de9fb74so1974037a34.2
 for <qemu-riscv@nongnu.org>; Tue, 23 May 2023 05:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684844123; x=1687436123;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C08OibMexkSAbPRQ6igdl6rDK1SBWXg8P93MkwjVikc=;
 b=TWhwRqwYaSgd2DB6j9iM+AsaxlPi5V3vsBF0a1jZCRkjpkGpeaSjprf7c6KltnlOra
 3neJi8+J1nrFm+qtZlSPD8whdjAhyNH+RjvumN3BOL+JHmW3JxF2+Ilg0itBJft6kuNd
 94EK+Pt4NGNtF4T4fhs6L/F5/7cDf6Um7d4JqBci5Mpb4+Ox1JtR2O+5u+oIiszTSUly
 wknPYGU6JuElwqlxqHlgwVNBPTrvMmnel6EFOqQrdqOOlWOywjNsWEFkK4I15ZZqeUIa
 FMPEd8BkCEcdlaegBL0mELQIPVkghrig7gkplIXB8tg0LXejuxD/k+u7rYRSAYTKJe1j
 eW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684844123; x=1687436123;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C08OibMexkSAbPRQ6igdl6rDK1SBWXg8P93MkwjVikc=;
 b=YWKYkh/vK+8T8SV59+kzhMqJkqjXkCpVyN3/CMSumBB4wNgHgQ2BtI4ZFa3huUag3m
 3ZsR5wd7lw2NMXoLNVAs+bxJj4s6nE5Bg6QOhoJ5KhnHvsPQ0DY4QBwh8gtzGQSVzVXy
 ooJtsdZIA8yO8Z7L0ENIOycd6bddO66qnLay62sUKniXvf4c7+4YjRRN5ZxIBonFZCMe
 JmkEXYOwN7biuIIrymulvGjQSDpPz/TYpb4F+sU7pWyavc+Bn/ZfDFrFXU05wSCyy3aN
 rRPqixuN3e/N1ovUaGjZNi47JXuaPsZRsrYYqsp/LLZ9a/DLajNLmzHy+7zIIzXQ/8Wa
 261g==
X-Gm-Message-State: AC+VfDyikpYiUKoBzr6zj/ujIj49+UXfEpKOGjz3kJJiQfkIuXCuIgVQ
 wYcwAuy2DiVcM9dSoLO4O0IQug==
X-Google-Smtp-Source: ACHHUZ6DvvhglU1GdfdCjzJYSA5S7ckuQJri6dNK3HyyVuP9QRUCaRboP2NVDHBwBo/nsS3m4x8bqA==
X-Received: by 2002:a9d:7ad0:0:b0:6a5:f719:c2f2 with SMTP id
 m16-20020a9d7ad0000000b006a5f719c2f2mr7672383otn.30.1684844122850; 
 Tue, 23 May 2023 05:15:22 -0700 (PDT)
Received: from [192.168.68.107] (200-162-225-121.static-corp.ajato.com.br.
 [200.162.225.121]) by smtp.gmail.com with ESMTPSA id
 g7-20020a9d6c47000000b006ae7c3eaf4esm1495931otq.26.2023.05.23.05.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 05:15:22 -0700 (PDT)
Message-ID: <e90416b3-ec16-2455-8369-a0320bf25b51@ventanamicro.com>
Date: Tue, 23 May 2023 09:15:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/8] target/riscv: Split RISCVCPUConfig declarations
 from cpu.h into cpu_cfg.h
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230523093539.203909-1-liweiwei@iscas.ac.cn>
 <20230523093539.203909-3-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230523093539.203909-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32c.google.com
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



On 5/23/23 06:35, Weiwei Li wrote:
> Split RISCVCPUConfig declarations to prepare for passing it to disas.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.h     | 114 +---------------------------------
>   target/riscv/cpu_cfg.h | 136 +++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 137 insertions(+), 113 deletions(-)
>   create mode 100644 target/riscv/cpu_cfg.h
> 
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
> index 0000000000..c4a627d335
> --- /dev/null
> +++ b/target/riscv/cpu_cfg.h
> @@ -0,0 +1,136 @@
> +/*
> + * QEMU RISC-V CPU CFG
> + *
> + * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
> + * Copyright (c) 2017-2018 SiFive, Inc.
> + * Copyright (c) 2021-2023 PLCT Lab
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

