Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mRfMj-0006O2-Qn
	for mharc-qemu-riscv@gnu.org; Sat, 18 Sep 2021 14:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfMZ-0006IC-O3
 for qemu-riscv@nongnu.org; Sat, 18 Sep 2021 14:47:01 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:44786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfMY-0007hn-5w
 for qemu-riscv@nongnu.org; Sat, 18 Sep 2021 14:46:59 -0400
Received: by mail-pf1-x436.google.com with SMTP id b7so12301578pfo.11
 for <qemu-riscv@nongnu.org>; Sat, 18 Sep 2021 11:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PcKH8XWPzS0JZZC/TfKjpHlJ3lopA1X9EPv+H8eHY+c=;
 b=KRVMX3mDyybLbnIp2j/iDqh5KGzk4xzra2WOzUR5niBiMWtrQGMWusGNjAYaTKtvdz
 O3A+IGIKXRk5IeOSZQvEt/nljlrbmaxUrfRkEWtXmbfi7ERgbz1WdtXrgQvnRp9QfJ/J
 gs1QucPviduYS4D88l1qzMQ/kARITJBjYMU1OOhs4EIdLwSzU8S3867Z/0okZgfTtYAw
 YUtI6Kz4gM/wuDPrpKnXU+45AvzgpATW4mn95XViRlNtCjikQXieJ2CDSHtC0HAQZpX2
 qMTkCFdmleLfx068zQMsBLj7cadbd7GfG0u4Xyl9W1KoAm/s+kDPtzFU4PK4ZW3lxuEs
 D8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PcKH8XWPzS0JZZC/TfKjpHlJ3lopA1X9EPv+H8eHY+c=;
 b=8G2d4oeweX5FETA96W8RILLtH++Z/l4/qccUelp0p6ckHCVaargEgmK+3r5HZH0ziB
 40Cn9HzbCUG+Mlf06c4mk6q90S+TuDlFCLxtGDP1sUnUix2ru/DCOIfC02mkTZGnvZfW
 mw6CGtdfhXO2y7ifFpRZw1IJ9R05xjWCOLw0fKsoMcirHcYW6gqzANVdFNUsSqYRBN3e
 GFgfVRj2Yfneym2I7oSd4DTtp/DKksHkDbX9v0g2y/k4jhBUQFQrSPpAtdkOghQ60s1d
 +ZuA9KyWsMmsPFQiRPOhdUkshy0+XOVMGBOX+CEWmzZfMagj2EfaLNjIQcPZpb26omli
 kr5w==
X-Gm-Message-State: AOAM530cXyQWQ0F2BlkhCuMrDd6TlhZtekG8WT4pYgl08Ed9npPiEacP
 RF5EqCF8ISKm/FgPaP473UQE7Q==
X-Google-Smtp-Source: ABdhPJxSGG6jSZyUkF1OFFSNHl2XIsJw9E5uWiNm3PdxKcZVUmqmpEGF0Fi6ssftUL5oQadYaswVdQ==
X-Received: by 2002:a62:63c6:0:b0:43f:cbf9:4383 with SMTP id
 x189-20020a6263c6000000b0043fcbf94383mr17211791pfb.14.1631990816764; 
 Sat, 18 Sep 2021 11:46:56 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e7sm388938pfc.114.2021.09.18.11.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Sep 2021 11:46:56 -0700 (PDT)
Subject: Re: [PATCH RESEND v2] target/riscv: Set mstatus_hs.[SD|FS] bits if
 Clean and V=1 in mark_fs_dirty()
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Vincent Chen <vincent.chen@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20210917093153.4067812-1-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <93e9a615-94fb-3958-9560-111910668768@linaro.org>
Date: Sat, 18 Sep 2021 11:46:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210917093153.4067812-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.538,
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
X-List-Received-Date: Sat, 18 Sep 2021 18:47:01 -0000

On 9/17/21 2:31 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> When V=1, both vsstauts.FS and HS-level sstatus.FS are in effect.
> Modifying the floating-point state when V=1 causes both fields to
> be set to 3 (Dirty).
> 
> However, it's possible that HS-level sstatus.FS is Clean and VS-level
> vsstatus.FS is Dirty at the time mark_fs_dirty() is called when V=1.
> We can't early return for this case because we still need to set
> sstatus.FS to Dirty according to spec.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
> Tested-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>   target/riscv/cpu.h       |  4 ++++
>   target/riscv/translate.c | 24 +++++++++++++++---------
>   2 files changed, 19 insertions(+), 9 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

>   static void mark_fs_dirty(DisasContext *ctx)
>   {
>       TCGv tmp;
> -    target_ulong sd;
> +    target_ulong sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
> +
> +    if (ctx->virt_enabled && ctx->mstatus_hs_fs != MSTATUS_FS) {
> +        /* Remember the stage change for the rest of the TB. */
> +        ctx->mstatus_hs_fs = MSTATUS_FS;
> +
> +        tmp = tcg_temp_new();
> +        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> +        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
> +        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> +        tcg_temp_free(tmp);
> +    }
>   
>       if (ctx->mstatus_fs == MSTATUS_FS) {
>           return;
>       }
> +
>       /* Remember the state change for the rest of the TB.  */
>       ctx->mstatus_fs = MSTATUS_FS;
>   
>       tmp = tcg_temp_new();
> -    sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
> -
>       tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
>       tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
>       tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> -
> -    if (ctx->virt_enabled) {
> -        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> -        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
> -        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> -    }
>       tcg_temp_free(tmp);

While it works, it would be nicer to keep these two cases as similar as possible.


r~

