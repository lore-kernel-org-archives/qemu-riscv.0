Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23437EB64DA
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 07:17:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHfi4-0002v1-8W; Fri, 07 Jul 2023 03:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHfi2-0002uB-2R
 for qemu-riscv@nongnu.org; Fri, 07 Jul 2023 03:16:54 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHfi0-00014f-Dy
 for qemu-riscv@nongnu.org; Fri, 07 Jul 2023 03:16:53 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-5634db21a58so1102892eaf.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Jul 2023 00:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688714210; x=1691306210;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zv9gIjS82L5+OWY0+arteaIf4C3sR4crycr5MrZ+BUM=;
 b=AIPYH9ivrxNo/SisRpzbXbNoIge2+BjNO7ocSHZoC3BDV3AMf+ETHpbvWJhJnhnOYi
 tzuiDksOQMWb/uzUvwFscyJldHj8TAB+yIv0wRXS/dSOamj8S8SZ70x42d29F7gUKgji
 gMxZptHCEstADgK4+/+ffLd6RMBTGADond2lis9+UyNUhuTZEcEuF44MAIbZRO4Wj04T
 A6uUnIaFyC/p4Ia0Nt4MSFneZVQgCoHsUyykpDbNvhwjBjmafNB7n1T4FAJawFDiUBUl
 pSvQFqlKXbnfgYA5Myct3BgBAtjmSo2GRIlyNN3EUkDhh+yZ/bhDhA7B4udkFBOhTuVd
 28Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688714210; x=1691306210;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zv9gIjS82L5+OWY0+arteaIf4C3sR4crycr5MrZ+BUM=;
 b=W10aLZI+NhrVETNMT7lirfkI+Jv0pQb/UXSacEbfjr2XBTG8cMJy5jTegRncvFWsK5
 xUOqYrwCltz79XF1ek7jxpy0At+6ZTxNOgz8zIOy9n+ifLlPefCvNepL30GTGb+lwPMU
 iLkQAmIwDWRWwSLfSlrO+qG5xRxX0N65i9irTm41LsZ8UZA/WTbCrJhkt2WueL4o1LgV
 AyiznKKPrewGWw3/jZWLYm3N94xl0mIjtdWiVFrmyPpI5yjOCqekRnS0VilmYtMP6Wb+
 GPE1xMbu6XPmyOnxedo1shsr09Xv4XkHa1QDo1t62yR5eyN2M1i6+Usnm3wfcK1jRXb1
 sd+A==
X-Gm-Message-State: ABy/qLYlLa88l3VaeJmm/Ra0XKN3hYmIsn0r9knVzu5K9cTZgl3VwkBV
 qfNEQbNMAQ5hFW9FmmGoDzngYw==
X-Google-Smtp-Source: APBJJlG4lud8+n8QUDPhrJlFA0hLEMwvNl/6xyDqQa5sqZ9WgCFMbPzW0buVWpAJkn7U3gJYTBA9JQ==
X-Received: by 2002:a4a:4110:0:b0:563:53fa:324f with SMTP id
 x16-20020a4a4110000000b0056353fa324fmr3581280ooa.6.1688714210659; 
 Fri, 07 Jul 2023 00:16:50 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-19.dial-up.telesp.net.br.
 [201.69.66.19]) by smtp.gmail.com with ESMTPSA id
 x22-20020a4ab916000000b0056082ad01desm1278956ooo.14.2023.07.07.00.16.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 00:16:50 -0700 (PDT)
Message-ID: <fdd959fc-6630-99fe-d5ef-4b6b73998b9c@ventanamicro.com>
Date: Fri, 7 Jul 2023 04:16:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] target/riscv KVM_RISCV_SET_TIMER macro is not configured
 correctly
Content-Language: en-US
To: "yang.zhang" <gaoshanliukou@163.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 zhiwei_liu@linux.alibaba.com, "yang.zhang" <yang.zhang@hexintek.com>
References: <20230707032306.4606-1-gaoshanliukou@163.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230707032306.4606-1-gaoshanliukou@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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



On 7/7/23 00:23, yang.zhang wrote:
> From: "yang.zhang" <yang.zhang@hexintek.com>
> 
> Should set/get riscv all reg timer,i.e, time/compare/frequency/state.

Nice catch.

The reason why this went under the radar for 18 months is because kvm.c is using
an external 'time' variable.

> 
> Signed-off-by:Yang Zhang <yang.zhang@hexintek.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1688
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/kvm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 30f21453d6..0c567f668c 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -99,7 +99,7 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
>   
>   #define KVM_RISCV_SET_TIMER(cs, env, name, reg) \
>       do { \
> -        int ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(env, time), &reg); \
> +        int ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(env, name), &reg); \
>           if (ret) { \
>               abort(); \
>           } \

