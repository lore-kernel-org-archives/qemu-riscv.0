Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1olTnr-0006SP-HC
	for mharc-qemu-riscv@gnu.org; Thu, 20 Oct 2022 07:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olTmL-0005Sc-UN
 for qemu-riscv@nongnu.org; Thu, 20 Oct 2022 07:32:11 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olTmH-0001NL-0O
 for qemu-riscv@nongnu.org; Thu, 20 Oct 2022 07:32:00 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 p6-20020a17090a748600b002103d1ef63aso2773813pjk.1
 for <qemu-riscv@nongnu.org>; Thu, 20 Oct 2022 04:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u9Qe7Jx8nw6RSUQ5K5ELFTWQN+HxVh9NKWZmwGQCIis=;
 b=QeLBtBR2/ss/GK+RiBp/EMlOzBDtuYg9pz5o/6EUMqdOCTRPPVyKjXFgBCtKsILAR7
 sVV1WYHchIBYvHoCCiHjxakP22EG+bNNGCO7c3/hxFNEffE4bKOP5igdjI4cgbAeVZKF
 5arxX5rZIdmlgGGeuW7TibKZysoSbDXwd5AsBO4cXCjkk6l9ynNkoG442OzsEEK+AKu2
 k7LL97QeYd+Z9U6JPGchc+rzWwCfBQBfIYd7Raac1gIdT9uyetETO1RB8/sJurUFHnA5
 AGYYUF+4pgdTrYsvOleAgVj/D3fzThYKz4QjSur7M91EhrWmIYD2YKfkDqN7jBaZ4N0y
 nddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u9Qe7Jx8nw6RSUQ5K5ELFTWQN+HxVh9NKWZmwGQCIis=;
 b=PstJ2ntTM6bVHVwVkms87MuYA4T6723r38sTg+jgylvDppUnPATLpJGizHbesgtA4O
 yaz0Cepk/uBcoJ38WYr2DU9Ux1aBkgmTCbEL+0wiW4vEZMrNVONuCpggaBBTwIfF3LC0
 lDdIHHQr93kXkhRncQzc3bYM09zJ4MBJQjxdEQnlLMPv6xotMcVI1S03vUuW08P2LWdt
 H4GCqa/zV1g+9rxgVDzj/Fh9tuVcGD1tdNZnL2Ev3pFEPstTBXL+jUqORIZymUG7G00Z
 ZR+pm3tW3vTG/PHc2BtdRCC0OoXhnW7ZJuKV5DD07dUOwYWeONC/5K/R92+3EJ65OLsf
 Xnvw==
X-Gm-Message-State: ACrzQf2rpB8gbRFQ/9R1/de8JDboC8Vnx8pbNdt4th8tJKBbQc4h5Liv
 hknzZ8kfMOMPkkSVaG8FCthZdQ==
X-Google-Smtp-Source: AMsMyM7+SbLeLHrlgFsMSDnFVhjOcDtwPmDSMv18jTemBQLJleO0Kb2ZAUNg8xI0mjt47Da+2/WU2g==
X-Received: by 2002:a17:902:db05:b0:185:537a:7440 with SMTP id
 m5-20020a170902db0500b00185537a7440mr13394151plx.13.1666265514297; 
 Thu, 20 Oct 2022 04:31:54 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a63ee55000000b00439d071c110sm11510476pgk.43.2022.10.20.04.31.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:31:53 -0700 (PDT)
Message-ID: <3390d4b8-ce83-ef7a-5384-302109915eb8@linaro.org>
Date: Thu, 20 Oct 2022 21:31:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH 3/3] tcg/riscv: Remove a wrong optimization for addsub2
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 lzw194868@alibaba-inc.com
References: <20221020104154.4276-1-zhiwei_liu@linux.alibaba.com>
 <20221020104154.4276-4-zhiwei_liu@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221020104154.4276-4-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 20 Oct 2022 11:32:21 -0000

On 10/20/22 20:41, LIU Zhiwei wrote:
> It's not clear what it is doing here. And it's wrong because bl and
> al are both register, so we can't add them by an ADDI instruction.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   tcg/riscv/tcg-target.c.inc | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index bfdf2bea69..a07fd0864f 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -705,9 +705,6 @@ static void tcg_out_addsub2(TCGContext *s,
>                   tcg_out_opc_reg(s, OPC_SLTU, TCG_REG_TMP0,
>                                   rl, al);
>               }
> -        } else if (rl == al && rl == bl) {
> -            tcg_out_opc_imm(s, OPC_SLTI, TCG_REG_TMP0, al, 0);
> -            tcg_out_opc_reg(s, opc_addi, rl, al, bl);
>           } else {

Removing this is incorrect; it's a simple typo for opc_add.

The case being required for rl == al == bl, which the following else will treat incorrectly.


r~

