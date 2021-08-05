Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBikn-0002Wt-TA
	for mharc-qemu-riscv@gnu.org; Thu, 05 Aug 2021 15:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBikf-0002Vm-W8
 for qemu-riscv@nongnu.org; Thu, 05 Aug 2021 15:10:03 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBike-0001Cx-GX
 for qemu-riscv@nongnu.org; Thu, 05 Aug 2021 15:09:57 -0400
Received: by mail-pj1-x1035.google.com with SMTP id nh14so11253282pjb.2
 for <qemu-riscv@nongnu.org>; Thu, 05 Aug 2021 12:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HCrMpI2T3In3b/FzNBAI4OCu7zAIXYMW2VkiDuK6sHE=;
 b=wNPegbV0K9HqHWrpU/+sQc7RDbN4aS6R+GGZsC4SdL//kvAZva12A/Yw+TGgotA9b4
 rx7o0seKhKmNh3FBGJIJJrdeVyZvscLCum90L0/VnGYW4byzXSjA/bCZ5iWDWPtNJs1Z
 hhYVi6U3cBOGBoVahdx/+3N3gDLQGyg+ipZbIp1kzd6eZtxMd31SYJ3x9jAhRNiJhDUb
 saUy97kdhNMD6wUlPwPW76xSravpQLBuHn8K+w8UKHkQ8anjMQbNrISjGK1AH+qNPlNl
 fy+b90RDLQv5yia63wpRRaIOKZBzXDkSio0SzxHRM7X0ni8kxi3Uz6h8VJGA3aQzxdTZ
 1RWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HCrMpI2T3In3b/FzNBAI4OCu7zAIXYMW2VkiDuK6sHE=;
 b=V7/N4vq1bBxkk18Ob/8TXtgTMMs7JbNYcyfN1ACMUbNYTxkBQVnpspPFl3Q4wTN4bb
 Dnb6GRDBDTdM1wnT4XES8PHg+hEZph+Ng1AivPhDWkkO/AaeNQpQPRUflVMYFIT2OTEa
 wOpXMuauD3PJNn4eeDFuxkYvU/QPxhRohIopuYVFq6YC4zPnupIKPMJdN9qE45XRcLJG
 lOhI8hjCcL2cIjc6WSLfMnulPUtBXb8TBYn0Vravr+xq5xNmjXEyP2FjXbkCSeeHBt8x
 /WcxE5y391osoKPGY6obJ2jXlmej5KXMT4cVnAdN/7tY3/rFijJ/9aJucxIumerb3STg
 8WEg==
X-Gm-Message-State: AOAM532zn+tcRa+k30isSeC+SG2IPg08kw7/9nz0L2jc6A1d60jz53kj
 NxTkoi5cF8MDxdiaDp3hzl6JyOyqGxsXhQ==
X-Google-Smtp-Source: ABdhPJwGunEW2i7T4E+JhAVMfHd5FGChTW7Di4BzSqRj0yKbLC9CUuN8foub/vNQgl2UXiidza8Bjg==
X-Received: by 2002:a63:e74c:: with SMTP id j12mr117265pgk.121.1628190593983; 
 Thu, 05 Aug 2021 12:09:53 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id b26sm7810332pfo.47.2021.08.05.12.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 12:09:53 -0700 (PDT)
Subject: Re: [RFC PATCH 04/13] target/riscv: Support UXL32 for slit/sltiu
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-5-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c33ecc6-3b61-2bb0-f331-548d5e58e129@linaro.org>
Date: Thu, 5 Aug 2021 09:09:50 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805025312.15720-5-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Aug 2021 19:10:04 -0000

On 8/4/21 4:53 PM, LIU Zhiwei wrote:
> +static bool gen_arith_simm_tl(DisasContext *ctx, arg_i *a,
> +                              void (*func)(TCGv, TCGv, TCGv))
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src_s(ctx, a->rs1);
> +    TCGv src2 = tcg_constant_tl(a->imm);
> +
> +    (*func)(dest, src1, src2);
> +    return true;
> +}
> +
> +static bool gen_arith_uimm_tl(DisasContext *ctx, arg_i *a,
> +                              void (*func)(TCGv, TCGv, TCGv))
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv src1 = gpr_src_u(ctx, a->rs1);
> +    TCGv src2 = tcg_constant_tl(ctx->uxl32 ? a->imm & UINT32_MAX : a->imm);
> +
> +    (*func)(dest, src1, src2);
> +    return true;
> +}

Again, unsigned comparisions work fine with sign-extended inputs.


r~

