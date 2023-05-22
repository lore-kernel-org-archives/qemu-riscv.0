Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBF2C7EE26
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 May 2023 13:03:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q15Bh-0008Cc-9q; Mon, 22 May 2023 09:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q15Bc-000847-Ne
 for qemu-riscv@nongnu.org; Mon, 22 May 2023 09:02:55 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q15Bb-0005du-46
 for qemu-riscv@nongnu.org; Mon, 22 May 2023 09:02:52 -0400
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-38eda4ef362so3520319b6e.2
 for <qemu-riscv@nongnu.org>; Mon, 22 May 2023 06:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684760569; x=1687352569;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G9zlTTuXG1P+ZeZHOMwckQA5OL+x8m1Kt0+JyrhItMU=;
 b=Oeb2XPlw54fpz6Lpsme39ESEzpQ4KGBeTcNnepWl99VZUrTD+YW51m2MKOKnlLWLhB
 u1AZcz/tyv+hLUGchD5PkU+sCWNPK9SL7lYl2AsNKzkCxZNDpASRtNoC5T0hZpPCzvIB
 AxjsCfuk7wQjwp3riU2yAsCgfRMBykoRhPIYAQtkQPf+NcrnzM1QKgDN2zEQdHXg/XZO
 UPVL9bynsQxsRhnehDHk/dosWTXizc4GRhNZAN+RfPK4x08tfspBGyQBnXd0C0VB/hl7
 ZvPyp4sbcrY3dUM/0IGhAQRVGPOp3XPs/OjD+1+0xxPAT++pYxyam+zn4DOYxDgVuect
 wrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684760569; x=1687352569;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G9zlTTuXG1P+ZeZHOMwckQA5OL+x8m1Kt0+JyrhItMU=;
 b=Vo5Y3SGd/wIO9Ubj0ull5yA2J7GYafh0UqYsHCw6j51d62t2DWrpZ805eGyYDW5m8r
 8xATBe1W8YmyPDwWuwSuQrzMJMaGpn/g6XeLphUG31GpjKNm+6q35ht77nm3Z10BSu89
 XOpXS8yixm+dnF88saSdK0C4y0P2fH3wb0Uh59R0NlBBHdv0vJACjzamewyIBpynUlK4
 sEHjCVTqgR1szUg20QQ4MvRSOBeSrCberkLOm7gZzxKrFQWe0Bx7uCqhdrRXpr2LkUOv
 LnrtUo1UnF8S6e3ibTZB5X6K718pO0TMRC58t4A9tzZ0jMXZjlYHd9+bJuSxBrSpHFq2
 VAlw==
X-Gm-Message-State: AC+VfDyPgR4HMP/t9IT8+yuzEw3UZhv4j9J3l9n+6Tck2jslgJYiRmAN
 UV1egz5WJQhDL+a9HatCfcC5eA==
X-Google-Smtp-Source: ACHHUZ7FQwJ+Dbg5HxSwcD3F5eLXO6n+PQHli1vA8Mqbmu/S1KA7yanwBulKj/rsKUo3A9IFMjAzCA==
X-Received: by 2002:a54:410b:0:b0:394:2499:15f8 with SMTP id
 l11-20020a54410b000000b00394249915f8mr5152465oic.33.1684760569649; 
 Mon, 22 May 2023 06:02:49 -0700 (PDT)
Received: from [192.168.68.107] ([179.111.98.125])
 by smtp.gmail.com with ESMTPSA id
 k28-20020a05680808dc00b00383d9700294sm2453060oij.40.2023.05.22.06.02.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 06:02:49 -0700 (PDT)
Message-ID: <a4fc92dc-7ed8-1d40-a311-4bdd17da354e@ventanamicro.com>
Date: Mon, 22 May 2023 10:02:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/7] disas/riscv.c: Support disas for Z*inx extensions
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230519021926.15362-1-liweiwei@iscas.ac.cn>
 <20230519021926.15362-5-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230519021926.15362-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x230.google.com
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
> Support disas for Z*inx instructions only when Zfinx extension is supported.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   disas/riscv.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 9e01810eef..a370bac6ef 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -4590,16 +4590,24 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
>               append(buf, rv_ireg_name_sym[dec->rs2], buflen);
>               break;
>           case '3':
> -            append(buf, rv_freg_name_sym[dec->rd], buflen);
> +            append(buf, dec->cfg->ext_zfinx ? rv_ireg_name_sym[dec->rd] :
> +                                              rv_freg_name_sym[dec->rd],
> +                   buflen);
>               break;
>           case '4':
> -            append(buf, rv_freg_name_sym[dec->rs1], buflen);
> +            append(buf, dec->cfg->ext_zfinx ? rv_ireg_name_sym[dec->rs1] :
> +                                              rv_freg_name_sym[dec->rs1],
> +                   buflen);
>               break;
>           case '5':
> -            append(buf, rv_freg_name_sym[dec->rs2], buflen);
> +            append(buf, dec->cfg->ext_zfinx ? rv_ireg_name_sym[dec->rs2] :
> +                                              rv_freg_name_sym[dec->rs2],
> +                   buflen);
>               break;
>           case '6':
> -            append(buf, rv_freg_name_sym[dec->rs3], buflen);
> +            append(buf, dec->cfg->ext_zfinx ? rv_ireg_name_sym[dec->rs3] :
> +                                              rv_freg_name_sym[dec->rs3],
> +                   buflen);
>               break;
>           case '7':
>               snprintf(tmp, sizeof(tmp), "%d", dec->rs1);

