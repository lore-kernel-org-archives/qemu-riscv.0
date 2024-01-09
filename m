Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6108DC4707B
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 22:05:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNKDR-00045h-1Q; Tue, 09 Jan 2024 17:04:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rNKDN-0003xa-13
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 17:04:53 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rNKD8-0001x7-9p
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 17:04:51 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1d3e2972f65so12930685ad.3
 for <qemu-riscv@nongnu.org>; Tue, 09 Jan 2024 14:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704837873; x=1705442673; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fvgMdSQZGX0dlFUyDOqK4oqeb8GiJWe/DqC6EyWEp2o=;
 b=iiW9b/jNIyo0fdVrYLXZUk6EMXCaCDFlTMw//egD/Ybd/QSQ9lKKQg9R8mOisAIqct
 Eb0vx9dUY8bz6m8ZTzGqeGQiA2AgJV8ueMQfTLSwb5NHQOYl238lK7kfSX3aso+1WKzM
 XZdpnX7NuPn9Raru2EPReSXNt60xmyM6+k5xFEJvO7bWmaS51jz1b+VGCxM2hYvRDLDY
 HvZA0fq+DSc0yxPi85xCZi13/fnYfA7sKIHfHY4dj6AvGiyC3iYfsam6RMKmlcReyZUA
 NTHGOkhn1UeBkslr+AdWimfnBSP5R/ft/DFAOVEFg1Umk19kWMczn3D8XBvniwAv0r6T
 y7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704837873; x=1705442673;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fvgMdSQZGX0dlFUyDOqK4oqeb8GiJWe/DqC6EyWEp2o=;
 b=tKovDjlsI4L7YwGBVmObapkqItUzz7sZLHGBP1LGrT24RgJpmvRkonHQu9ni3tOcGg
 d5hUwH4KxZYYpQKsK/trBhT3sA/6muLBfY7sjgKRSlsGgBRBtS+oIZAbfMJzzLIfUHnr
 rMkoxvC5ztbWiTG4jOc5vpmfHPvWNXFhpIaiGbjcFDCd9sk5CtqiY11FOH2SEAAnAcxX
 I4YDVbvJgHMg34YKYlS4RvsSBYg0vditoDXLZaJ0mbX2UH8NfIhgmTrXm/v0P3AJKTS0
 L9wdGZrcqMbbKLrQtt4netKpX9mk/RY7u3e7o2u7ms2/tzgO079gEvkUPW+MGKqMl3WG
 4d0g==
X-Gm-Message-State: AOJu0Yz5Scm4VGAAvfTuajHNe6hfL+RtDISgCsvjYOAoH3pJVBZr/6ul
 3HmEZyQDwVNjblRXZpuAN+CPHDrP66F0pg==
X-Google-Smtp-Source: AGHT+IG9jOT2Tix292OIMOb/M2OJpHoo8G5GVooQu6DbRIA5fbTGQT+6FTU8omIevulOVT9jJyp1TA==
X-Received: by 2002:a17:902:e806:b0:1d4:c245:a5b with SMTP id
 u6-20020a170902e80600b001d4c2450a5bmr84751plg.58.1704837873092; 
 Tue, 09 Jan 2024 14:04:33 -0800 (PST)
Received: from [192.168.68.110] ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a170902a9c600b001d5383ae01csm1892830plr.121.2024.01.09.14.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 14:04:32 -0800 (PST)
Message-ID: <8b57cb47-6344-4563-95f7-21f6b090c1b0@ventanamicro.com>
Date: Tue, 9 Jan 2024 19:04:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: Implement optional CSR mcontext of debug
 Sdtrig extension
Content-Language: en-US
To: Alvin Chang <alvinga@andestech.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com
References: <20231219123244.290935-1-alvinga@andestech.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231219123244.290935-1-alvinga@andestech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 12/19/23 09:32, Alvin Chang wrote:
> The debug Sdtrig extension defines an CSR "mcontext". This commit
> implements its predicate and read/write operations into CSR table.
> Its value is reset as 0 when the trigger module is reset.
> 
> Signed-off-by: Alvin Chang <alvinga@andestech.com>
> ---

The patch per se LGTM:

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


But I have a question: shouldn't we just go ahead and add the 'sdtrig' extension?
We have a handful of its CSRs already. Adding the extension would also add 'sdtrig'
in riscv,isa, allowing software to be aware of its existence in QEMU.


Thanks,

Daniel



> Changes from v1: Remove dedicated cfg, always implement mcontext.
> 
>   target/riscv/cpu.h      |  1 +
>   target/riscv/cpu_bits.h |  7 +++++++
>   target/riscv/csr.c      | 36 +++++++++++++++++++++++++++++++-----
>   target/riscv/debug.c    |  2 ++
>   4 files changed, 41 insertions(+), 5 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d74b361..e117641 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -345,6 +345,7 @@ struct CPUArchState {
>       target_ulong tdata1[RV_MAX_TRIGGERS];
>       target_ulong tdata2[RV_MAX_TRIGGERS];
>       target_ulong tdata3[RV_MAX_TRIGGERS];
> +    target_ulong mcontext;
>       struct CPUBreakpoint *cpu_breakpoint[RV_MAX_TRIGGERS];
>       struct CPUWatchpoint *cpu_watchpoint[RV_MAX_TRIGGERS];
>       QEMUTimer *itrigger_timer[RV_MAX_TRIGGERS];
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index ebd7917..3296648 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -361,6 +361,7 @@
>   #define CSR_TDATA2          0x7a2
>   #define CSR_TDATA3          0x7a3
>   #define CSR_TINFO           0x7a4
> +#define CSR_MCONTEXT        0x7a8
>   
>   /* Debug Mode Registers */
>   #define CSR_DCSR            0x7b0
> @@ -905,4 +906,10 @@ typedef enum RISCVException {
>   /* JVT CSR bits */
>   #define JVT_MODE                           0x3F
>   #define JVT_BASE                           (~0x3F)
> +
> +/* Debug Sdtrig CSR masks */
> +#define MCONTEXT32                         0x0000003F
> +#define MCONTEXT64                         0x0000000000001FFFULL
> +#define MCONTEXT32_HCONTEXT                0x0000007F
> +#define MCONTEXT64_HCONTEXT                0x0000000000003FFFULL
>   #endif
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fde7ce1..ff1e128 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3900,6 +3900,31 @@ static RISCVException read_tinfo(CPURISCVState *env, int csrno,
>       return RISCV_EXCP_NONE;
>   }
>   
> +static RISCVException read_mcontext(CPURISCVState *env, int csrno,
> +                                    target_ulong *val)
> +{
> +    *val = env->mcontext;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mcontext(CPURISCVState *env, int csrno,
> +                                     target_ulong val)
> +{
> +    bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
> +    int32_t mask;
> +
> +    if (riscv_has_ext(env, RVH)) {
> +        /* Spec suggest 7-bit for RV32 and 14-bit for RV64 w/ H extension */
> +        mask = rv32 ? MCONTEXT32_HCONTEXT : MCONTEXT64_HCONTEXT;
> +    } else {
> +        /* Spec suggest 6-bit for RV32 and 13-bit for RV64 w/o H extension */
> +        mask = rv32 ? MCONTEXT32 : MCONTEXT64;
> +    }
> +
> +    env->mcontext = val & mask;
> +    return RISCV_EXCP_NONE;
> +}
> +
>   /*
>    * Functions to access Pointer Masking feature registers
>    * We have to check if current priv lvl could modify
> @@ -4794,11 +4819,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>       [CSR_PMPADDR15] =  { "pmpaddr15", pmp, read_pmpaddr, write_pmpaddr },
>   
>       /* Debug CSRs */
> -    [CSR_TSELECT]   =  { "tselect", debug, read_tselect, write_tselect },
> -    [CSR_TDATA1]    =  { "tdata1",  debug, read_tdata,   write_tdata   },
> -    [CSR_TDATA2]    =  { "tdata2",  debug, read_tdata,   write_tdata   },
> -    [CSR_TDATA3]    =  { "tdata3",  debug, read_tdata,   write_tdata   },
> -    [CSR_TINFO]     =  { "tinfo",   debug, read_tinfo,   write_ignore  },
> +    [CSR_TSELECT]   =  { "tselect",  debug, read_tselect,  write_tselect  },
> +    [CSR_TDATA1]    =  { "tdata1",   debug, read_tdata,    write_tdata    },
> +    [CSR_TDATA2]    =  { "tdata2",   debug, read_tdata,    write_tdata    },
> +    [CSR_TDATA3]    =  { "tdata3",   debug, read_tdata,    write_tdata    },
> +    [CSR_TINFO]     =  { "tinfo",    debug, read_tinfo,    write_ignore   },
> +    [CSR_MCONTEXT]  =  { "mcontext", debug, read_mcontext, write_mcontext },
>   
>       /* User Pointer Masking */
>       [CSR_UMTE]    =    { "umte",    pointer_masking, read_umte,  write_umte },
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 4945d1a..e30d99c 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -940,4 +940,6 @@ void riscv_trigger_reset_hold(CPURISCVState *env)
>           env->cpu_watchpoint[i] = NULL;
>           timer_del(env->itrigger_timer[i]);
>       }
> +
> +    env->mcontext = 0;
>   }

