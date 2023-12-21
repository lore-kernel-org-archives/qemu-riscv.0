Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B19C35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 16:04:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGLWY-0002II-MH; Thu, 21 Dec 2023 11:03:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGLWO-0002Bv-FJ
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 11:03:43 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGLWM-0005P2-Kc
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 11:03:40 -0500
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3ba31cc0d77so667671b6e.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 08:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703174617; x=1703779417; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W/+UOSMOl9cvWCpiBW/FNXNUrwwIMbPapGI3Cuf5G/0=;
 b=mosMzU2vuHdqc5A/bb/KvV8NkZNwTftJA/NngpXxi7zeJxqovcVfem5H5FO7GHb1kr
 VOE+ifKU43B7Sehg985LyoRnlo28qkx5Xn/FTUGNMU7RiSuSaCBRYFNJ3HJAYX3oETDw
 OZFyzL79T/8saiC8tOgBhWqOMYVa6oLe0YikC+ar5wkVww+cTQHaIZSCVshAKvUQ0eXK
 Xfldphu0FiIiZbba+S5EgEKfZ1CJNQmNe/8CApqCHeYyPOD8izKVTa4J6buIznyimy04
 Qb0l7eYskjaMeTNUFNp2NcFpxIM0xMtK6YVbpnW1E0j9WN1fMAEE90jb8Odj6wH4//5/
 pj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703174617; x=1703779417;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W/+UOSMOl9cvWCpiBW/FNXNUrwwIMbPapGI3Cuf5G/0=;
 b=rYayI9Ta+F9TsH8aA1hyfoz8qH5vaq3QFS3r0O2WpZ5NHpNI8U156o5uuOKJRNj9Fl
 c48fyVDD9DYM5EwLJm+5/0b999QdPAauXoYuwg0Yx7gCGJdlC95Mlq+aY90uOUt3wN7o
 N54+s8aXYqPAXlQYBOKjTpwMUGNIbRQ01jjI8/9mkTCzt1We4gsbPm8jNwQ5bBfbs10c
 6eMG5NvFxjef06jEZAXfi8pTuOuU/9pWwNvmhNe8woqZnnXRkxNzfAmKdMrL5l39xNz2
 xDdPYYisR1YvVA1XXn1p+Bez+48OFqKZvGzt48qpk2RNjzp4OgBRk5TK54c/1u0WFBCs
 7sdQ==
X-Gm-Message-State: AOJu0YxVvtMjPds1TN/M1ckIcBLapzTbSVfK+1FsD13n0rYkFKP6zjmA
 XP4xZ3OLK/cPripyRvmTx/xibw==
X-Google-Smtp-Source: AGHT+IEgWKOUDiOC3pm910w0LLm+gngMCG55xpmzZNMslMXU61kwMwB7QSaz4JK9+OEULOgzhh5+Cw==
X-Received: by 2002:a05:6358:7e56:b0:172:fe13:7f8e with SMTP id
 p22-20020a0563587e5600b00172fe137f8emr1756064rwm.7.1703174617567; 
 Thu, 21 Dec 2023 08:03:37 -0800 (PST)
Received: from [192.168.68.110] ([179.93.21.205])
 by smtp.gmail.com with ESMTPSA id
 o184-20020a6341c1000000b005c6aa4d4a0dsm1766670pga.45.2023.12.21.08.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 08:03:37 -0800 (PST)
Message-ID: <9613811d-2630-4a3f-a0dc-97641d8fc7a5@ventanamicro.com>
Date: Thu, 21 Dec 2023 13:03:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/riscv/csr: Added the ability to delegate LCOFI
 to VS
Content-Language: en-US
To: Vadim Shakirov <vadim.shakirov@syntacore.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
References: <20231221113628.41038-1-vadim.shakirov@syntacore.com>
 <20231221113628.41038-3-vadim.shakirov@syntacore.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231221113628.41038-3-vadim.shakirov@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 12/21/23 08:36, Vadim Shakirov wrote:
> In the AIA specification in the paragraph "Virtual interrupts for VS level"
> it is indicated for interrupts 13-63: if the bit in hideleg is enabled,
> then the corresponding vsip and vsie bits are aliases to sip and sie
> 
> Signed-off-by: Vadim Shakirov <vadim.shakirov@syntacore.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/csr.c | 36 ++++++++++++++++++++++++++----------
>   1 file changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 36f807d5f6..46a5d0c69a 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1129,7 +1129,7 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
>   
>   static const uint64_t delegable_ints = S_MODE_INTERRUPTS |
>                                         VS_MODE_INTERRUPTS | LOCAL_INTERRUPTS;
> -static const uint64_t vs_delegable_ints = VS_MODE_INTERRUPTS;
> +static const uint64_t vs_delegable_ints = VS_MODE_INTERRUPTS | LOCAL_INTERRUPTS;
>   static const uint64_t all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
>                                   HS_MODE_INTERRUPTS | LOCAL_INTERRUPTS;
>   #define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
> @@ -1167,7 +1167,7 @@ static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP |
>   static const target_ulong hip_writable_mask = MIP_VSSIP;
>   static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP |
>                                                  MIP_VSEIP;
> -static const target_ulong vsip_writable_mask = MIP_VSSIP;
> +static const target_ulong vsip_writable_mask = MIP_VSSIP | LOCAL_INTERRUPTS;
>   
>   const bool valid_vm_1_10_32[16] = {
>       [VM_1_10_MBARE] = true,
> @@ -2416,20 +2416,34 @@ static RISCVException write_sstatus(CPURISCVState *env, int csrno,
>       return write_mstatus(env, CSR_MSTATUS, newval);
>   }
>   
> +
> +static uint64_t vsi_to_mi(uint64_t vsi)
> +{
> +    uint64_t mi;
> +
> +    mi = (vsi & (VS_MODE_INTERRUPTS >> 1)) << 1;
> +    mi |= vsi & LOCAL_INTERRUPTS;
> +
> +    return mi;
> +}
> +
>   static RISCVException rmw_vsie64(CPURISCVState *env, int csrno,
>                                    uint64_t *ret_val,
>                                    uint64_t new_val, uint64_t wr_mask)
>   {
>       RISCVException ret;
> -    uint64_t rval, mask = env->hideleg & VS_MODE_INTERRUPTS;
> +    uint64_t rval, mask = env->hideleg & (VS_MODE_INTERRUPTS |
> +                                                        LOCAL_INTERRUPTS);
>   
>       /* Bring VS-level bits to correct position */
> -    new_val = (new_val & (VS_MODE_INTERRUPTS >> 1)) << 1;
> -    wr_mask = (wr_mask & (VS_MODE_INTERRUPTS >> 1)) << 1;
> +    new_val = vsi_to_mi(new_val);
> +    wr_mask = vsi_to_mi(wr_mask);
>   
>       ret = rmw_mie64(env, csrno, &rval, new_val, wr_mask & mask);
> +
>       if (ret_val) {
> -        *ret_val = (rval & mask) >> 1;
> +        *ret_val = (rval & (env->hideleg & VS_MODE_INTERRUPTS)) >> 1;
> +        *ret_val |= rval & (env->hideleg & LOCAL_INTERRUPTS);
>       }
>   
>       return ret;
> @@ -2630,16 +2644,18 @@ static RISCVException rmw_vsip64(CPURISCVState *env, int csrno,
>                                    uint64_t new_val, uint64_t wr_mask)
>   {
>       RISCVException ret;
> -    uint64_t rval, mask = env->hideleg & VS_MODE_INTERRUPTS;
> +    uint64_t rval, mask = env->hideleg & (VS_MODE_INTERRUPTS |
> +                                                        LOCAL_INTERRUPTS);
>   
>       /* Bring VS-level bits to correct position */
> -    new_val = (new_val & (VS_MODE_INTERRUPTS >> 1)) << 1;
> -    wr_mask = (wr_mask & (VS_MODE_INTERRUPTS >> 1)) << 1;
> +    new_val = vsi_to_mi(new_val);
> +    wr_mask = vsi_to_mi(wr_mask);
>   
>       ret = rmw_mip64(env, csrno, &rval, new_val,
>                       wr_mask & mask & vsip_writable_mask);
>       if (ret_val) {
> -        *ret_val = (rval & mask) >> 1;
> +        *ret_val = (rval & (env->hideleg & VS_MODE_INTERRUPTS)) >> 1;
> +        *ret_val |= rval & (env->hideleg & LOCAL_INTERRUPTS);
>       }
>   
>       return ret;

