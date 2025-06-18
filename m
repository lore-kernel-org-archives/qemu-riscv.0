Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974F9C7115A
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 18:00:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uRx4y-000069-K2; Wed, 18 Jun 2025 14:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uRx4x-00005s-Nu
 for qemu-riscv@nongnu.org; Wed, 18 Jun 2025 14:00:07 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uRx4u-0002G1-P5
 for qemu-riscv@nongnu.org; Wed, 18 Jun 2025 14:00:07 -0400
Received: by mail-pl1-x643.google.com with SMTP id
 d9443c01a7336-236192f8770so9468775ad.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Jun 2025 11:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1750269603; x=1750874403; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bp1WJBo6CcoNdEjobnjd2m4IbMa4NtCXAvKOGTrThuU=;
 b=SIXzCtxBrOgCGPfpLt49EGs5rN5x8iuQ47qh55iPGdj0Sdxy0LYMD4PzXAm1l7TlnM
 fecjSsMMauAAKYDHUOiftzaC9Mr/UUxvlUdb2bHfZEwUnbOuLuJTXjNCFA/sScFKHhEU
 OTveYgpontCh2ZCB+rO0URb6TYmkaCPkD/TpG8kIGuwp/BTaXTDydL7l2ep3alzz5G2L
 UUP9PMpDMSl/T1bJevlsOhUMNytntfyUF21srpx8P3SWlK/FZbu/qSgNokQQNu5IWRE1
 e0de4AqoToeBF2pnZ8jTMVgp5I1auQQTtSiWcg44Qp4x+bvT4fFkENM7BrV4sAef7Pp8
 75mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750269603; x=1750874403;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bp1WJBo6CcoNdEjobnjd2m4IbMa4NtCXAvKOGTrThuU=;
 b=BzKXKJyMksmNhZ6Ea8D/NX5PgiL/i5kDNMr3nxPZCG1jxF6A4yVlPkLGIA+7NUlyv8
 pCDQHJOUMnjt62FgUTlw7HYPdFoDhcq4Bz3dwNC/NXRZVQIqTTYQWnyeAD3b2lQnzY5L
 ps4jzpJa2JGAbZML50ts0UF+t8P4Af+JjPZiRx5mfN0FYXBrBDjoks5XlGGjnWa6Jlw3
 5ZsxGByIDHt1vL0d/9DQcJekHEA3BOy/b0etfafNJi2G9qW/3dzasgrGkkD8kuIlhJJG
 Jf9eFsrqLwSlRYJomxGzMZw5fuEsVwDDmFIUaAyLLlFZmRrmBPGqtd0JCQdsp8+njGg6
 FIzg==
X-Gm-Message-State: AOJu0YwqExWmeKFrgA8wkjTTR6daRgdYaGrjfzwfHV+FqnEqBl5tLWya
 pulgFqw0cX7WmizDPjlBLwgVorZkU1rGHdnDq8iUZZ/Pc2MB1JviXI/pi59odXGD4MrFt71trlQ
 Y7sF33nX9bg==
X-Gm-Gg: ASbGnctQ5KlUgL3Njy3qmAVh4js87yY5zFRt49XXxYRRoE9KVI7M0nF3mvXOnGJRyQa
 NfMQk06wOWDSZUHZbkH/VoOqrU+yIbgG5HcWem4HA5WgPHvGrW07p8qJ5wgagUMttcq6BipZ0x2
 u8q/g4vo+iw2b6W4ouo/wayllSc/lRjcA107dHnqA491Q8vqyKIbspHW1lKMaiOjDeaqDMsI+xW
 7HvafNrKDeUy+xGxDHaYneGoQj+ygz9tjHDpvaraQFter41J0gsMRkRmxSCKsMWiuoAlJdcMsQE
 cXI7WuOjm1noLJhkVzOCv1DS0pxpThXHheeDlQlfq//qZQ+nNTe4jWZDoX8M2kkkhfVyU5vc4c7
 6
X-Google-Smtp-Source: AGHT+IEZc+FUJcln/sbQxK1mEF7J1RSxGi+G1jlQsRXcG3s4PqGPTxM3Fbh0bNHabB7zELyLkgz0GQ==
X-Received: by 2002:a17:903:228d:b0:231:d0da:5e1f with SMTP id
 d9443c01a7336-237cbf8215amr5738605ad.21.1750269602834; 
 Wed, 18 Jun 2025 11:00:02 -0700 (PDT)
Received: from [192.168.68.110] ([191.255.35.152])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365dfc6982sm103464645ad.221.2025.06.18.11.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 11:00:02 -0700 (PDT)
Message-ID: <4d82db02-7584-434e-8404-c3d1c2122517@ventanamicro.com>
Date: Wed, 18 Jun 2025 14:59:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] target/riscv: Add MIPS P8700 CSRs
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cfu@mips.com" <cfu@mips.com>
References: <20250618122715.1929966-1-djordje.todorovic@htecgroup.com>
 <20250618122715.1929966-5-djordje.todorovic@htecgroup.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250618122715.1929966-5-djordje.todorovic@htecgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x643.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 6/18/25 9:27 AM, Djordje Todorovic wrote:
> Define MIPS CSRs used for P8700 CPU.
> 
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> ---
>   target/riscv/cpu.c       |   3 +
>   target/riscv/cpu.h       |  12 +++
>   target/riscv/meson.build |   1 +
>   target/riscv/mips_csr.c  | 219 +++++++++++++++++++++++++++++++++++++++
>   4 files changed, 235 insertions(+)
>   create mode 100644 target/riscv/mips_csr.c
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index be362e1644..1e85a16971 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -3179,6 +3179,9 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>           .cfg.ext_zba = true,
>           .cfg.ext_zbb = true,
>           .cfg.marchid = 0x8000000000000201,
> +#ifndef CONFIG_USER_ONLY
> +        .custom_csrs = mips_csr_list,
> +#endif
>       ),
>   
>   #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index fba0b0506b..bf1a931e60 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -199,6 +199,13 @@ typedef struct PMUFixedCtrState {
>           uint64_t counter_virt_prev[2];
>   } PMUFixedCtrState;
>   
> +struct MIPSCSR {
> +    uint64_t tvec;
> +    uint64_t config[12];
> +    uint64_t pmacfg[15];
> +};
> +typedef struct MIPSCSR MIPSCSR;
> +
>   struct CPUArchState {
>       target_ulong gpr[32];
>       target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */
> @@ -497,6 +504,8 @@ struct CPUArchState {
>       target_ulong rnmip;
>       uint64_t rnmi_irqvec;
>       uint64_t rnmi_excpvec;
> +
> +    MIPSCSR mips_csrs;

I suggest a static MIPSCSR struct inside mips_csr.c so you can read/write the CSRs
locally instead of adding MIPS-only attibutes in the common CPU state.


Thanks,

Daniel

>   };
>   
>   /*
> @@ -972,5 +981,8 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
>   /* In th_csr.c */
>   extern const RISCVCSR th_csr_list[];
>   
> +/* Implemented in mips_csr.c */
> +extern const RISCVCSR mips_csr_list[];
> +
>   const char *priv_spec_to_str(int priv_version);
>   #endif /* RISCV_CPU_H */
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index a4bd61e52a..fbb6c8fb45 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -32,6 +32,7 @@ riscv_system_ss.add(files(
>     'debug.c',
>     'monitor.c',
>     'machine.c',
> +  'mips_csr.c',
>     'pmu.c',
>     'th_csr.c',
>     'time_helper.c',
> diff --git a/target/riscv/mips_csr.c b/target/riscv/mips_csr.c
> new file mode 100644
> index 0000000000..aab7f832a0
> --- /dev/null
> +++ b/target/riscv/mips_csr.c
> @@ -0,0 +1,219 @@
> +/*
> + * MIPS-specific CSRs.
> + *
> + * Copyright (c) 2025 MIPS
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
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "cpu_vendorid.h"
> +
> +/* MIPS CSR */
> +#define CSR_MIPSTVEC        0x7c0
> +#define CSR_MIPSCONFIG0     0x7d0
> +#define CSR_MIPSCONFIG1     0x7d1
> +#define CSR_MIPSCONFIG2     0x7d2
> +#define CSR_MIPSCONFIG3     0x7d3
> +#define CSR_MIPSCONFIG4     0x7d4
> +#define CSR_MIPSCONFIG5     0x7d5
> +#define CSR_MIPSCONFIG6     0x7d6
> +#define CSR_MIPSCONFIG7     0x7d7
> +#define CSR_MIPSCONFIG8     0x7d8
> +#define CSR_MIPSCONFIG9     0x7d9
> +#define CSR_MIPSCONFIG10    0x7da
> +#define CSR_MIPSCONFIG11    0x7db
> +#define CSR_MIPSPMACFG0     0x7e0
> +#define CSR_MIPSPMACFG1     0x7e1
> +#define CSR_MIPSPMACFG2     0x7e2
> +#define CSR_MIPSPMACFG3     0x7e3
> +#define CSR_MIPSPMACFG4     0x7e4
> +#define CSR_MIPSPMACFG5     0x7e5
> +#define CSR_MIPSPMACFG6     0x7e6
> +#define CSR_MIPSPMACFG7     0x7e7
> +#define CSR_MIPSPMACFG8     0x7e8
> +#define CSR_MIPSPMACFG9     0x7e9
> +#define CSR_MIPSPMACFG10    0x7ea
> +#define CSR_MIPSPMACFG11    0x7eb
> +#define CSR_MIPSPMACFG12    0x7ec
> +#define CSR_MIPSPMACFG13    0x7ed
> +#define CSR_MIPSPMACFG14    0x7ee
> +#define CSR_MIPSPMACFG15    0x7ef
> +
> +static RISCVException any(CPURISCVState *env, int csrno)
> +{
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_mipstvec(CPURISCVState *env, int csrno,
> +                                    target_ulong *val)
> +{
> +    *val = env->mips_csrs.tvec;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mipstvec(CPURISCVState *env, int csrno,
> +                                     target_ulong val, uintptr_t ra)
> +{
> +    env->mips_csrs.tvec = val;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_mipsconfig(CPURISCVState *env, int csrno,
> +                                      target_ulong *val)
> +{
> +    *val = env->mips_csrs.config[csrno - CSR_MIPSCONFIG0];
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mipsconfig(CPURISCVState *env, int csrno,
> +                                       target_ulong val, uintptr_t ra)
> +{
> +    env->mips_csrs.config[csrno - CSR_MIPSCONFIG0] = val;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_mipspmacfg(CPURISCVState *env, int csrno,
> +                                      target_ulong *val)
> +{
> +    *val = env->mips_csrs.pmacfg[csrno - CSR_MIPSPMACFG0];
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mipspmacfg(CPURISCVState *env, int csrno,
> +                                       target_ulong val, uintptr_t ra)
> +{
> +    env->mips_csrs.pmacfg[csrno - CSR_MIPSPMACFG0] = val;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +const RISCVCSR mips_csr_list[] = {
> +    {
> +        .csrno = CSR_MIPSTVEC,
> +        .csr_ops = { "mipstvec", any, read_mipstvec, write_mipstvec }
> +    },
> +    {
> +        .csrno = CSR_MIPSCONFIG0,
> +        .csr_ops = { "mipsconfig0", any, read_mipsconfig, write_mipsconfig }
> +    },
> +    {
> +        .csrno = CSR_MIPSCONFIG1,
> +        .csr_ops = { "mipsconfig1", any, read_mipsconfig, write_mipsconfig }
> +    },
> +    {
> +        .csrno = CSR_MIPSCONFIG2,
> +        .csr_ops = { "mipsconfig2", any, read_mipsconfig, write_mipsconfig }
> +    },
> +    {
> +        .csrno = CSR_MIPSCONFIG3,
> +        .csr_ops = { "mipsconfig3", any, read_mipsconfig, write_mipsconfig }
> +    },
> +    {
> +        .csrno = CSR_MIPSCONFIG4,
> +        .csr_ops = { "mipsconfig4", any, read_mipsconfig, write_mipsconfig }
> +    },
> +    {
> +        .csrno = CSR_MIPSCONFIG5,
> +        .csr_ops = { "mipsconfig5", any, read_mipsconfig, write_mipsconfig }
> +    },
> +    {
> +        .csrno = CSR_MIPSCONFIG6,
> +        .csr_ops = { "mipsconfig6", any, read_mipsconfig, write_mipsconfig }
> +    },
> +    {
> +        .csrno = CSR_MIPSCONFIG7,
> +        .csr_ops = { "mipsconfig7", any, read_mipsconfig, write_mipsconfig }
> +    },
> +    {
> +        .csrno = CSR_MIPSCONFIG8,
> +        .csr_ops = { "mipsconfig8", any, read_mipsconfig, write_mipsconfig }
> +    },
> +    {
> +        .csrno = CSR_MIPSCONFIG9,
> +        .csr_ops = { "mipsconfig9", any, read_mipsconfig, write_mipsconfig }
> +    },
> +    {
> +        .csrno = CSR_MIPSCONFIG10,
> +        .csr_ops = { "mipsconfig10", any, read_mipsconfig, write_mipsconfig }
> +    },
> +    {
> +        .csrno = CSR_MIPSCONFIG11,
> +        .csr_ops = { "mipsconfig11", any, read_mipsconfig, write_mipsconfig }
> +    },
> +    {
> +        .csrno = CSR_MIPSPMACFG0,
> +        .csr_ops = { "mipspmacfg0", any, read_mipspmacfg, write_mipspmacfg }
> +    },
> +    {
> +        .csrno = CSR_MIPSPMACFG1,
> +        .csr_ops = { "mipspmacfg1", any, read_mipspmacfg, write_mipspmacfg }
> +    },
> +    {
> +        .csrno = CSR_MIPSPMACFG2,
> +        .csr_ops = { "mipspmacfg2", any, read_mipspmacfg, write_mipspmacfg }
> +    },
> +    {
> +        .csrno = CSR_MIPSPMACFG3,
> +        .csr_ops = { "mipspmacfg3", any, read_mipspmacfg, write_mipspmacfg }
> +    },
> +    {
> +        .csrno = CSR_MIPSPMACFG4,
> +        .csr_ops = { "mipspmacfg4", any, read_mipspmacfg, write_mipspmacfg }
> +    },
> +    {
> +        .csrno = CSR_MIPSPMACFG5,
> +        .csr_ops = { "mipspmacfg5", any, read_mipspmacfg, write_mipspmacfg }
> +    },
> +    {
> +        .csrno = CSR_MIPSPMACFG6,
> +        .csr_ops = { "mipspmacfg6", any, read_mipspmacfg, write_mipspmacfg }
> +    },
> +    {
> +        .csrno = CSR_MIPSPMACFG7,
> +        .csr_ops = { "mipspmacfg7", any, read_mipspmacfg, write_mipspmacfg }
> +    },
> +    {
> +        .csrno = CSR_MIPSPMACFG8,
> +        .csr_ops = { "mipspmacfg8", any, read_mipspmacfg, write_mipspmacfg }
> +    },
> +    {
> +        .csrno = CSR_MIPSPMACFG9,
> +        .csr_ops = { "mipspmacfg9", any, read_mipspmacfg, write_mipspmacfg }
> +    },
> +    {
> +        .csrno = CSR_MIPSPMACFG10,
> +        .csr_ops = { "mipspmacfg10", any, read_mipspmacfg, write_mipspmacfg }
> +    },
> +    {
> +        .csrno = CSR_MIPSPMACFG11,
> +        .csr_ops = { "mipspmacfg11", any, read_mipspmacfg, write_mipspmacfg }
> +    },
> +    {
> +        .csrno = CSR_MIPSPMACFG12,
> +        .csr_ops = { "mipspmacfg12", any, read_mipspmacfg, write_mipspmacfg }
> +    },
> +    {
> +        .csrno = CSR_MIPSPMACFG13,
> +        .csr_ops = { "mipspmacfg13", any, read_mipspmacfg, write_mipspmacfg }
> +    },
> +    {
> +        .csrno = CSR_MIPSPMACFG14,
> +        .csr_ops = { "mipspmacfg14", any, read_mipspmacfg, write_mipspmacfg }
> +    },
> +    {
> +        .csrno = CSR_MIPSPMACFG15,
> +        .csr_ops = { "mipspmacfg15", any, read_mipspmacfg, write_mipspmacfg }
> +    },
> +    { },
> +};


