Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC28CC77B73
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 May 2023 12:50:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q14z9-0000W1-Ao; Mon, 22 May 2023 08:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q14z5-0000Tz-6m
 for qemu-riscv@nongnu.org; Mon, 22 May 2023 08:49:55 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q14z3-0002lB-MR
 for qemu-riscv@nongnu.org; Mon, 22 May 2023 08:49:54 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6af78ce91b1so819259a34.1
 for <qemu-riscv@nongnu.org>; Mon, 22 May 2023 05:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684759792; x=1687351792;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QnGRjIMeIOFrJA015pa3GJxAfNs/jyvpf755N6Cm2Ic=;
 b=AOtU9hlfPXHuWEff1pstndWxHJsGNs8tMw2cGMMqoVZyLXUySwrEzLnAkp8JqGFpHr
 Cx0ck5Z7aCPaC6YEa5lQr1AK3i94TY5T0rcp9qd56IPmX9Mfhd1oVPzditKxuFRZHeBT
 xfydboVQAajfL90BNfDnc6pBB1eqnjAuoelL2DKGaVaE56oduZHqxWafmFlIzLeLgeSA
 vxahgjMCZouUVacnLkK1JnCel4mPcXoAG+iFKPLtLaNOctVZfgqGTNjYigcn6VKob8DF
 5G2+/ycNhoMGREMKH9Cm4vHikEJyEPm8qOVuWMp0e0ReJRtpzRmRSldSCaLRn1t8bwrV
 uX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684759792; x=1687351792;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QnGRjIMeIOFrJA015pa3GJxAfNs/jyvpf755N6Cm2Ic=;
 b=DMVDFbjVtM2vIJHb2LrUDfg5thdLu8EQJfcPBlsTrcEJyGv4Bxi+fIWk+0zHWjQu3M
 bXm23v5qf6//AGos08CUvKLBTYSXCKRkYxbZWLVZE2X64xYrl7gUOKsRpTr8evcXb2Tz
 FYkTj1xGQOpcE0S0B4KnUzlxFXZnS6mV/PDLq573XU+FQ3+CVYR0fqxazX6qgFMKO4Ob
 TJr7d7GIQFF9YtrkLF1GAu0HsRDt5qYzJ/QemBHOIp2y+w1sAKWkdJb2n1ZZUWhJLaou
 7M+buqtceuCXsMTZ3WkGD4QphEfMK735AhVNn5CaGgUqgodJW2zjB6dVihC8pA4Q24oK
 R5sg==
X-Gm-Message-State: AC+VfDxWzwxOLPxi0FRDz0PqNQSjoqG2h6eGnSA+MpRX2jITYNKVBd5L
 PK7b0CLr8GEddMxTebZ1IPUhSQ==
X-Google-Smtp-Source: ACHHUZ76AbDeMSLE1kX4qUJjlTmxP9t2EPwrkrjGdFCUlCiC4QIddhIbnz9Q68KU3e3Aq5cBsf6O6A==
X-Received: by 2002:aca:2304:0:b0:38c:5a32:325b with SMTP id
 e4-20020aca2304000000b0038c5a32325bmr5536131oie.41.1684759791954; 
 Mon, 22 May 2023 05:49:51 -0700 (PDT)
Received: from [192.168.68.107] ([179.111.98.125])
 by smtp.gmail.com with ESMTPSA id
 l133-20020acabb8b000000b0038dd5bf922bsm2659787oif.22.2023.05.22.05.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 05:49:51 -0700 (PDT)
Message-ID: <156c8a29-4c14-5dd6-907f-2f7ab8117afc@ventanamicro.com>
Date: Mon, 22 May 2023 09:49:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/7] disas: Change type of disassemble_info.target_info to
 pointer
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230519021926.15362-1-liweiwei@iscas.ac.cn>
 <20230519021926.15362-2-liweiwei@iscas.ac.cn>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230519021926.15362-2-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x330.google.com
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
> Use pointer to pass more information of target to disasembler,
> such as pass cpu.cfg related information in following commits.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   include/disas/dis-asm.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
> index 2f6f91c2ee..2324f6b1a4 100644
> --- a/include/disas/dis-asm.h
> +++ b/include/disas/dis-asm.h
> @@ -397,7 +397,7 @@ typedef struct disassemble_info {
>     char * disassembler_options;
>   
>     /* Field intended to be used by targets in any way they deem suitable.  */
> -  int64_t target_info;
> +  void *target_info;
>   
>     /* Options for Capstone disassembly.  */
>     int cap_arch;

