Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D813ECCD18D
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 14:39:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v8JhY-0003fo-BC; Mon, 13 Oct 2025 10:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1v8JhW-0003fV-Nf
 for qemu-riscv@nongnu.org; Mon, 13 Oct 2025 10:39:03 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1v8JhS-0006lH-7s
 for qemu-riscv@nongnu.org; Mon, 13 Oct 2025 10:39:01 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-791c287c10dso3671146b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 13 Oct 2025 07:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1760366334; x=1760971134; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ver9Yd3SIbwge5Q1rh7enWDVvrg2cNYeuPXki2eM/Ok=;
 b=C0uD9i9Mpw4wrqZRg6dpQSfV+L4/bar9hguDoZ+ciWeUB2wfVyGs21Q7iM3adm2HrI
 Qf4ZpIcLK0TtD8x6aJPko0xj6QKzAHMYAbyfhOl+F99OS9DF1G2x5pkQVsSNnjUU+Jib
 sjLQynfP4wgtCUtI6RBEhkoTEjpgjAmny9ABeeQqkfCg/H8lwYXEJh34QBOvWBVoAxyW
 //1H+BggEiEWk65ujdh89JW6YcpqD98ZLaTrflQlkp+g7DSRh4FERDwXX9FhRN2Fdnwc
 gVTKXUQNH39YpH5+jdyYULdY2xmx2rIemLBdaOhG1pAt6o4ltEF4wjVSfEnIiKUs9IHu
 CFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760366334; x=1760971134;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ver9Yd3SIbwge5Q1rh7enWDVvrg2cNYeuPXki2eM/Ok=;
 b=Xqil3/m4IfSgzh1QVq/n1WybnYStYxC+2VDxPqrs4jkvCYbwMhR29dFAt1UdsITVG7
 pB5tx4+paTcp3y2+ZsQL9WhDYE4SjapUT2vGctjhcgy5r6CBOe6JTbh27YTOZVz3WZru
 vpQL7AdPZahY5TfxaOHdMP6XV4ki7bi7FsiIBHxxYwYyn9M6a0ktsfYf1OD13eTarMTj
 QsTd2l5vcXxvYoHs4Icmb9PTzESMKyCFzw0Ka7GbYU0HLP5vlh2UWDOozr3BLm5CkzJM
 rVPo3RekcQ/XEgQDftasQzVQn2gUWY5A2P7TH2z0jpyGg/HusVnp1Dv3s7mj6qPRNTHE
 5ZKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyVIhIMlPOm9fK15brL9VQWyiM4msA3QnGqUEzQ7A2tSWgNOE4w3NJjsgiaZT60XLRVMELWSvDsGq5@nongnu.org
X-Gm-Message-State: AOJu0YynKmRfSdMoUY/22ofnCXgR4N+9BCw4SJb6DdGgfixY19rrWPBq
 /pmil2BABtuvS/OugFo0FVRppMOKGrQBVU+4FAjoHBhbFiXsIj/UQQPSxcZ+oOrOAGY347jt87e
 NP6d1It4=
X-Gm-Gg: ASbGncsF3aXXb0axqc78MTEICk/ar1wla+hwAIni5cL9MWLO8vs5+brc/EvJEmyBTUg
 2goD/B+SYVTHOC+KkGp2VmY0twZgm6/K+zkHix7mMKowuMspwoRRAZVLJxVsYAQRKMlpbhG6lk2
 dt9SEasqmj3AcM29rsY8IxgQ0pNuFa5v9t5RQAm1XGS3M6YlltfPsTH5oMnNMvDrvmSRA5UNYuk
 MK8eFcQ5BcZqJbrxjmzk/wNrAEHeq2VG1SuYRIFHIpswVOS3l7UUuPIBmPRI6pLd+yMava3vziM
 Owp6rt7rYVhxJEIA8ywT0y+JM9/eCXI5NiiYx03yRzNNO5INbu/NM41Gx1qFejP5CfelsZHa1Wy
 KH8PklxzpQkHz3cFQoflN8M9Bk+mgYTwSBnnaFzE5B3nEGNbZRc1Y/vRRRVuajNntf3I=
X-Google-Smtp-Source: AGHT+IEXX28oiEHv9mcT2bPwBUtwB/CZPIGGypLpifoTVzx8xiU7T312IiTOoavkoTgyTk9ySw5g3Q==
X-Received: by 2002:a05:6a00:2e92:b0:77f:1ef8:8acb with SMTP id
 d2e1a72fcca58-79385ed596bmr26811968b3a.13.1760366333777; 
 Mon, 13 Oct 2025 07:38:53 -0700 (PDT)
Received: from [192.168.68.110] ([152.234.122.223])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992dd83dcbsm11796845b3a.83.2025.10.13.07.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 07:38:53 -0700 (PDT)
Message-ID: <cca1b0f7-8063-4d53-88f7-a56eb56b3eca@ventanamicro.com>
Date: Mon, 13 Oct 2025 11:38:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/riscv: Correct mmu-type property of sifive_u harts in
 device tree
To: Zejun Zhao <jelly.zhao.42@gmail.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Max Chou <max.chou@sifive.com>
References: <20251013133242.1945681-1-jelly.zhao.42@gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251013133242.1945681-1-jelly.zhao.42@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x431.google.com
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

(Ccing Max)

On 10/13/25 10:32 AM, Zejun Zhao wrote:
> Correct mmu-type property of sifive_u harts from Sv48 to Sv39 in 64-bit
> mode since it's the only supported SATP mode.
> 
> Signed-off-by: Zejun Zhao <jelly.zhao.42@gmail.com>
> ---
>   hw/riscv/sifive_u.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index d69f942cfb..3e1ed209ca 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -176,7 +176,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>               if (is_32_bit) {
>                   qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv32");
>               } else {
> -                qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
> +                qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv39");


Just checked the SATP mode of the SIFIVE_U cpu in target/riscv/cpu.c:

     DEFINE_ABSTRACT_RISCV_CPU(TYPE_RISCV_CPU_SIFIVE_U, TYPE_RISCV_VENDOR_CPU,
         .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU,
         .priv_spec = PRIV_VERSION_1_10_0,

         .cfg.max_satp_mode = VM_1_10_SV39,  <=================


But the documentation I found [1] seems to indicate that it should support sv48. Maybe
we're modelling the wrong satp mode in the CPU. Max, can you comment on it?



As for the patch it looks fine, assuming that we're always going to run a sv39 CPU with
it. Otherwise we could do what we're doing in the 'virt' board:


(in create_fdt_socket_cpus(): )

         if (satp_mode_max != -1) {
             sv_name = g_strdup_printf("riscv,%s",
                                       satp_mode_str(satp_mode_max, is_32_bit));
             qemu_fdt_setprop_string(ms->fdt, cpu_name, "mmu-type", sv_name);
         }

I.e. we would use the CPU satp mode instead of hardcoding it in the board.


Thanks,

Daniel


[1] https://starfivetech.com/uploads/u54_core_complex_manual_21G1.pdf , Table 9


>               }
>               riscv_isa_write_fdt(&s->soc.u_cpus.harts[cpu - 1], fdt, nodename);
>           } else {


