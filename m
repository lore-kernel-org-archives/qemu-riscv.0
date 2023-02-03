Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNzMB-0003lF-FA
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 11:56:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNzM9-0003l3-Pu
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 11:56:09 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNzM6-0005RA-V7
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 11:56:09 -0500
Received: by mail-pl1-x629.google.com with SMTP id jh15so5823183plb.8
 for <qemu-riscv@nongnu.org>; Fri, 03 Feb 2023 08:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EegqBsg0QSIpZwv3KqlkQAGMC2z5DsMS8fq/MNA1j50=;
 b=zj5HoMdS4RyVMG7ouiLUKGLekV36U1INXz1G76WSvn6X0ukt6ThnM0rbsj/qdnAS+R
 FcHD4Iqh/DZgy3u5Rj+PpewH2Lp9nUTvb5RDC6/lOMsl5pw8nNMj4k/q8jILUJaAd83v
 aFMj2FbJ1Y4yGAOxSyi07/2LjXzrF6McFgV0TBYcSBEF5dwaeu+qEa7gCN9T1QW6Z/IB
 mf9jqMbIot277V+JDz0j5bUgETR3D20JOF+IbdWzmgqGb2DVjhK7r6NBSEve3RG8yYVa
 0e4UQ6nI9l6L3mAL/8L0Fbkt665cZt7GVKOjq/6tkC/NGT6FEz67yS7A91HP5VhR2dt8
 I2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EegqBsg0QSIpZwv3KqlkQAGMC2z5DsMS8fq/MNA1j50=;
 b=BIPQcyb7u3tOlD6IrhYNTZlKF/tB4EpZKVa1S9xwcWJHPYhsLCCT3jnCeBRPpCisKo
 96lBzGEvlortpknyAj1APv6KRWDm8WE7LBypMsO77fZzky1AxzhlreSne8mGWit8byz9
 qYBybFCa9fzgjl8/PLfj6sTby3BUG+2ibiphVx8Ckjl7JJDYTsmegh0AqmmZF3CwhWvT
 JpFgLiJYS9NPgmErRqXLz1gi5gNND0jO9sAlfMNrH+udKCV2SxuWC4XLWnof3Lr+GftG
 dTLpYhNt0VKXoUAXqxumh5/Sy+Mkv5FZXRjYgxKilAid2fwjHfsQJnM67IWfMrD8WQDn
 wAWA==
X-Gm-Message-State: AO0yUKWVL55F9pH8kDyYVKbwIanYPPMRR7x+pUMHoiJ7w0VUNCyduUbw
 U7b5V4sCZfLiUHdQ4qGeZALnBQ==
X-Google-Smtp-Source: AK7set/ZlqJj2U0W/u8tKy67X4i2oJqQFN57BmPwU2KUzA1mLVquSu2iBlONGSbYvk9ALgLTorpmsw==
X-Received: by 2002:a05:6a20:1613:b0:bf:9c3:f6ab with SMTP id
 l19-20020a056a20161300b000bf09c3f6abmr13466614pzj.35.1675443365288; 
 Fri, 03 Feb 2023 08:56:05 -0800 (PST)
Received: from [192.168.50.177] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 x37-20020a056a0018a500b0058baf8694e1sm2013961pfh.71.2023.02.03.08.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 08:56:04 -0800 (PST)
Message-ID: <0078f162-02ca-628e-7695-27944b491144@linaro.org>
Date: Fri, 3 Feb 2023 06:56:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/riscv: fix ctzw behavior
Content-Language: en-US
To: Vladimir Isaev <vladimir.isaev@syntacore.com>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20230203140059.13068-1-vladimir.isaev@syntacore.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230203140059.13068-1-vladimir.isaev@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Fri, 03 Feb 2023 16:56:10 -0000

On 2/3/23 04:00, Vladimir Isaev wrote:
> According to spec, ctzw should work with 32-bit register, not 64.
> 
> For example, previous implementation returns 33 for (1<<33) input
> when the new one returns 32.
> 
> Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
> ---
>   target/riscv/insn_trans/trans_rvb.c.inc | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index e2b8329f1e5b..42c6ded13de8 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -80,7 +80,14 @@ static void gen_ctz(TCGv ret, TCGv arg1)
>   
>   static void gen_ctzw(TCGv ret, TCGv arg1)
>   {
> -    tcg_gen_ctzi_tl(ret, arg1, 32);
> +    TCGv_i32 t = tcg_temp_new_i32();
> +
> +    tcg_gen_trunc_tl_i32(t, arg1);
> +    tcg_gen_ctzi_i32(t, t, 32);
> +
> +    tcg_gen_extu_i32_tl(ret, t);
> +
> +    tcg_temp_free_i32(t);

This was supposed to be handled by EXT_ZERO in gen_unary.
Looks like trans_ctzw is missing

     ctx->ol = MXL_RV32;

similar to trans_ctpopw just below.


r~


