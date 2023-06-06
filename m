Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0501AC77B73
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 10:31:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6Txv-0004Qm-9y; Tue, 06 Jun 2023 06:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6Txu-0004QT-8Z
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 06:31:02 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6Txs-0003Oo-4M
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 06:31:02 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1a28817f70bso5781757fac.2
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 03:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686047458; x=1688639458;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pm48V2/goW6UgERl6Bf+K4AgSKDH0C6KkwTD+CGZX34=;
 b=lC82a1ctL6YfvMk2KMMjCQUQ1XKkxyp1HWQ1o+nk62V6VjO0tes5U3/xPqk/bqjddD
 d//q6q7XuxVeiRc5RMmnmshRns6odO2XCTImSp6Ha5/nexyXNB4T+zYYQKfpb/p27ktJ
 ZWdk5ZUQQ7exd3c6jPKnFpPP410WyGe0+aRdnuJpb+iSuGi1FuZpLWqSirpWSBFlpKnq
 VhRZFBDd2i0AwOGYjmgulHWF6/gThl0NBLngoVXnJUL9xX78Z+mox4RrJDvq5b0HQRZR
 lnfC9sJTyB8vQlIKxGOMU/9ORKlJVQr1mnx5k0r1wCOmIPnWHNjVmb9QRT/VxLSVSyC/
 P+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686047458; x=1688639458;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pm48V2/goW6UgERl6Bf+K4AgSKDH0C6KkwTD+CGZX34=;
 b=C0U32rPeruDKIfpG9tvi3WcCMu0hQ+PFGUiV5AZ55hGBKSeq4d39I0zbtEaYSDwxsG
 YSHt4/Il28MorSxjOhTzh0v/YbG2wzfUAv8F3kMJt98sigrneeAv6OMJzaqNZldjiTaV
 4w4pZzOjf1cBp6VFE5ilPP73S00mgDBUINFjHUPgxO5RiKEpGdq+rVQEwGx9raCLwI6r
 P7wreK3pbItjxn0eS3Nk0GO4foKMKyyGDo5vyFWoQV/VTOFQZ4x4jm1SXVMF2980ARy6
 pofKhSrJXF+FwRZZ6svRC8gLDsoFJ2Cru3+x/zcJc9lyiOL05n6FPtArKir7a7V7ZRqw
 n4Gg==
X-Gm-Message-State: AC+VfDwSxBjZxEr2WuSK8009Uip8K1LixIizJ/u3D8mkQEmaOiZZdUCL
 3oo6uBMjJ2TyCMqJfpC++B0BiQ==
X-Google-Smtp-Source: ACHHUZ46H7+eEdq9bee1UZfmFwfaPeqviwMNxChGbiNucB+zydu2oxv4TKWZAl6ppr7dPbhL5jfwRQ==
X-Received: by 2002:a05:6870:6287:b0:196:cd24:14e6 with SMTP id
 s7-20020a056870628700b00196cd2414e6mr2077770oan.11.1686047458461; 
 Tue, 06 Jun 2023 03:30:58 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a056870954a00b00195e943f958sm4648563oal.1.2023.06.06.03.30.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 03:30:58 -0700 (PDT)
Message-ID: <8ee427d8-3272-c9ba-23e8-78de86ad5cd0@ventanamicro.com>
Date: Tue, 6 Jun 2023 07:30:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] target/riscv/vector_helper.c: Remove the check for extra
 tail elements
Content-Language: en-US
To: Xiao Wang <xiao.w.wang@intel.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20230606083408.3972300-1-xiao.w.wang@intel.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230606083408.3972300-1-xiao.w.wang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


On 6/6/23 05:34, Xiao Wang wrote:
> Commit 752614cab8e6 ("target/riscv: rvv: Add tail agnostic for vector
> load / store instructions") added an extra check for LMUL fragmentation,
> intended for setting the "rest tail elements" in the last register for a
> segment load insn.
> 
> Actually, the max_elements derived in vext_ld*() won't be a fraction of
> vector register size, since the lmul encoded in desc is emul, which has
> already been adjusted to 1 for LMUL fragmentation case by vext_get_emul()
> in trans_rvv.c.inc, for ld_stride(), ld_us(), ld_index() and ldff().
> 
> Besides, vext_get_emul() has also taken EEW/SEW into consideration, so no
> need to call vext_get_total_elems() which would base on the emul to derive
> another emul, the second emul would be incorrect when esz differs from sew.
> 
> Thus this patch removes the check for extra tail elements.
> 
> Fixes: 752614cab8e6 ("target/riscv: rvv: Add tail agnostic for vector load / store instructions")
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
>   target/riscv/vector_helper.c | 21 ++++++---------------
>   1 file changed, 6 insertions(+), 15 deletions(-)
> 
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index f4d0438988..56a79bb5fa 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -264,26 +264,17 @@ GEN_VEXT_ST_ELEM(ste_h, int16_t, H2, stw)
>   GEN_VEXT_ST_ELEM(ste_w, int32_t, H4, stl)
>   GEN_VEXT_ST_ELEM(ste_d, int64_t, H8, stq)
>   
> -static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
> -                                   void *vd, uint32_t desc, uint32_t nf,
> +static void vext_set_tail_elems_1s(target_ulong vl, void *vd,
> +                                   uint32_t desc, uint32_t nf,
>                                      uint32_t esz, uint32_t max_elems)
>   {
> -    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> -    uint32_t vlenb = riscv_cpu_cfg(env)->vlen >> 3;
>       uint32_t vta = vext_vta(desc);
> -    uint32_t registers_used;
>       int k;
>   
>       for (k = 0; k < nf; ++k) {
>           vext_set_elems_1s(vd, vta, (k * max_elems + vl) * esz,
>                             (k * max_elems + max_elems) * esz);
>       }
> -
> -    if (nf * max_elems % total_elems != 0) {
> -        registers_used = ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> -        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> -                          registers_used * vlenb);
> -    }
>   }


Can you please rebase it on top of master? This function has at least one
change (a vta check right at the start) that isn't accounted for in this
patch.

Code LGTM otherwise. Thanks,


Daniel

>   
>   /*
> @@ -319,7 +310,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>       }
>       env->vstart = 0;
>   
> -    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
> +    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
>   }
>   
>   #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
> @@ -378,7 +369,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>       }
>       env->vstart = 0;
>   
> -    vext_set_tail_elems_1s(env, evl, vd, desc, nf, esz, max_elems);
> +    vext_set_tail_elems_1s(evl, vd, desc, nf, esz, max_elems);
>   }
>   
>   /*
> @@ -499,7 +490,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>       }
>       env->vstart = 0;
>   
> -    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
> +    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
>   }
>   
>   #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)                  \
> @@ -629,7 +620,7 @@ ProbeSuccess:
>       }
>       env->vstart = 0;
>   
> -    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
> +    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
>   }
>   
>   #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \

