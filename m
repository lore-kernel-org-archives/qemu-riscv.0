Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE69C04A94
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 11:29:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTKtj-0000cT-4c; Tue, 08 Aug 2023 07:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qTKth-0000bp-Ox
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 07:29:09 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qTKtg-00036U-CT
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 07:29:09 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1bb575a6ed3so4307902fac.2
 for <qemu-riscv@nongnu.org>; Tue, 08 Aug 2023 04:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1691494147; x=1692098947;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dF1FOYFtx1t0CDcmsrHdufDD/kuOcnzmTMhZ1Sjz3DM=;
 b=TI+9yuqd146UVNHQ08aedTPYac0MJETwrvCnT6PWCzdEIMP7qleWvPvIKvAEXd129k
 Y97mSFaEjU3KLQFZU8CePoespCsPvheMAjxJo9uVx34T3WbHkjz9ZMFTpeXNz3RDOC6a
 2j8E+vVYNCb0v4akegy11snuMxdI2nagB3Bs5H0Fqffhs07UsxnnOvxbS5fhKiuRm0zo
 cfhC4zY4N130w5FTysIlnx4gD88EjcTXlL0VgpE07v0FWIuUalcjQozW2obJO6rTfbmp
 eovi3KA21hpQzZiRetcxk0ZPnJgoXnuMgo/iyBagi6+zvNtiPGvldSnmyvpZYi6OS2f6
 ejMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691494147; x=1692098947;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dF1FOYFtx1t0CDcmsrHdufDD/kuOcnzmTMhZ1Sjz3DM=;
 b=DyoWsOkD7IYzwV3NsTXG1BxSgXwi0XzDcqTXrlrSS9XDqwE20uP9DxprI3Qk2uaebT
 DFlKbBy7n+grPzJ28Y/9sgHP5lgNginLBB7uiqPbtDt6Dr8v7PYjb+sK4na5DnTVr6GM
 APXkInIAeWOQo3xON3R6qnRpZKVsOCYkSY7yymKF0Gw8dydaC4iPI3Yu6lKspasTxMsZ
 8NyDsjneFWxCMclXr5foADvCpNKaYggxL8m17OSYBrAo/quwxnuXLHdqgKH+hSTJorfh
 n+SvzTKxAyIYHhZRoXBfRVm0nKkOLBu8Mt0DChPcyw1lz7cM6c/0Sf7bTUvb44Z4VKNe
 q4rg==
X-Gm-Message-State: AOJu0YzmHPJ2sJoWYc+IuxrY1tLIYDxG3yrh8VKIsOtAzJ1k4uiDCfg/
 5CptDiXU4eAcofwz91sBChvEjQ==
X-Google-Smtp-Source: AGHT+IEQaZY31GGgd/eQhrxsw+nxz5qcyVtWrmZEBUni503QtbvxplC00BoGt6n3Nj8rNoOI09sq4Q==
X-Received: by 2002:a05:6871:522c:b0:1b0:883e:3095 with SMTP id
 ht44-20020a056871522c00b001b0883e3095mr14913368oac.56.1691494147278; 
 Tue, 08 Aug 2023 04:29:07 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59?
 ([2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59])
 by smtp.gmail.com with ESMTPSA id
 ef53-20020a0568701ab500b001b03fbfa0c5sm5969856oab.39.2023.08.08.04.29.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 04:29:06 -0700 (PDT)
Message-ID: <810d09a3-89bd-64e8-99e0-6a1035605575@ventanamicro.com>
Date: Tue, 8 Aug 2023 08:29:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] linux-user/riscv: Use abi_ulong for target_ucontext
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org
References: <20230808093434.2059-1-zhiwei_liu@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230808093434.2059-1-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.14,
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



On 8/8/23 06:34, LIU Zhiwei wrote:
> We should not use types dependend on host arch for target_ucontext.
> This bug is found when run rv32 applications.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   linux-user/riscv/signal.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
> index eaa168199a..ff8634a272 100644
> --- a/linux-user/riscv/signal.c
> +++ b/linux-user/riscv/signal.c
> @@ -38,8 +38,8 @@ struct target_sigcontext {
>   }; /* cf. riscv-linux:arch/riscv/include/uapi/asm/ptrace.h */
>   
>   struct target_ucontext {
> -    unsigned long uc_flags;
> -    struct target_ucontext *uc_link;
> +    abi_ulong uc_flags;
> +    abi_ulong uc_link;
>       target_stack_t uc_stack;
>       target_sigset_t uc_sigmask;
>       uint8_t   __unused[1024 / 8 - sizeof(target_sigset_t)];

