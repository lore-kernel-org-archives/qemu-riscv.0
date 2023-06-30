Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63987EB64DC
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 12:15:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFD1i-0007iB-0n; Fri, 30 Jun 2023 08:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFD1g-0007hT-Uf
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 08:15:00 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFD1f-0001uX-67
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 08:15:00 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6b87d505e28so1549757a34.2
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 05:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688127298; x=1690719298;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gkf4HCPTdUDdg+T4J3xcas8CgkC+v2hBTYJw1g0DTPU=;
 b=mNODsRtSXh47S/lJkLnWcuRIQeSwAQtf5ZfgPZZDTaLKcznGJn34nTKsGShQ4/zNuK
 8fRI+FmnKoyRBtIcNCK41k3v3So4Ej9Zde7ETiFu9bHAumqriB+56dxfviDjLLX+leX5
 lSd4779kowcUpBir6/NZ8vPiPt+7tPCruuCs1qBlqY3wHDhRqm+rFS/W/SMznWxUYoPN
 ZYoBHYhdwplJzcnLTYT6fFPD209dRfTGdqKVw6sBcLmnjDQm6TjNYcJp3IlA0O04mj8s
 gHonInj+tItENHlbj+dF4cCxa7tenw1rqxVKag2InjqGO/7DES0hR1+gYZ0+m2QVKGEy
 ehKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688127298; x=1690719298;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gkf4HCPTdUDdg+T4J3xcas8CgkC+v2hBTYJw1g0DTPU=;
 b=QoOfeuV6QBsr1O05AG36jC+nPhLhzNzHzZaTC1dXs7QdG/d5kI9YqOz/GqfqQj72h3
 20p9cggYYE4ptM+TdZfDYpTHYzpofkkj0CUj6PxbZsh5ADJioFxPi29XCIRD096WCxDh
 G6yIznn3Cqe5/gZs1CiMjJTep2AuEaxOtBURiJ2ARN28AUiQfXfrBfJnWdUTwyTyyIG2
 jmQQXSxu5gvh8xxJPYBh9np8F9Wn5foJWNp2JEw33xzXK46CV68sQCtVl3GIxnBAJY+E
 0T3BX/RDsMQJAuMVSyOq7BLTH2KLf0/qUVuEKQddE1/PqfhJAY1BJ3WpROu70M7rYk7u
 zlHQ==
X-Gm-Message-State: AC+VfDxRUJQ/iQIXkbHPwMFWANHc+7xaigjLEPg6CsaAuboxY1zOAcXN
 Oe+JfjvlBOl0XOxLL7ZIwoEDYQ==
X-Google-Smtp-Source: ACHHUZ5BMQZrXBRlasz6txDBYWXV5+bYMOI+ocWjlSkz9hePYZeXDo0yR4XwbqVIlfpf5Q2T+UlyHw==
X-Received: by 2002:a05:6830:10b:b0:6b7:4c0a:5de7 with SMTP id
 i11-20020a056830010b00b006b74c0a5de7mr2773214otp.33.1688127297904; 
 Fri, 30 Jun 2023 05:14:57 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59?
 ([2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59])
 by smtp.gmail.com with ESMTPSA id
 t19-20020a0568301e3300b00697be532609sm6415206otr.73.2023.06.30.05.14.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jun 2023 05:14:57 -0700 (PDT)
Message-ID: <e2d5b51a-6741-ab98-11a3-45b11a9351c9@ventanamicro.com>
Date: Fri, 30 Jun 2023 09:14:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/4] target/riscv: Remove unused 'instmap.h' header in
 translate.c
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
References: <20230628063234.32544-1-philmd@linaro.org>
 <20230628063234.32544-2-philmd@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230628063234.32544-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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



On 6/28/23 03:32, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/translate.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 98d54c5617..c0379af418 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -30,7 +30,6 @@
>   #include "exec/log.h"
>   #include "semihosting/semihost.h"
>   
> -#include "instmap.h"
>   #include "internals.h"
>   
>   #define HELPER_H "helper.h"

