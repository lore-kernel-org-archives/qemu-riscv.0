Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOP6u-0000AR-St
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 14:21:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOP6r-0000A4-RV
 for qemu-riscv@nongnu.org; Sun, 27 Feb 2022 14:21:34 -0500
Received: from [2607:f8b0:4864:20::1031] (port=41759
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOP6p-0003c5-NF
 for qemu-riscv@nongnu.org; Sun, 27 Feb 2022 14:21:33 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so9510061pjb.0
 for <qemu-riscv@nongnu.org>; Sun, 27 Feb 2022 11:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iFBMvSLR10D7V9EA0PEk/vCbFBJI6Tq4kaLL70CEjic=;
 b=rgp238+M5QOCSLQLE+WRGOhyd3e6sLy14bZj57g03xXGRA5Ww2TBjGWBZ2eK2x5IaY
 Y2hJVD3w0OiukjqK8mnIPYc28a5NOJZeXxb8MSCJS5215tqi72/tN4PeYz3saWAHGs7i
 WNdiE29HPjh0oqvmekI5KfIU2BV4F/BBEsXbBsqmzadssmjkLsqxSu2uicYKa9VkyhHg
 klOK9/LxI1OVP4wiP7xfaPDcfJqjG5tZ2R5lSehyCnxkklUm6PerYIzp+MkLZktYnmct
 jfqvDWpEIo8lbyWTDRTIz/IR1FuFBoT7WNb1r7bjvcWjbbcJwKecfzglFUrjInYD+ljm
 tg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iFBMvSLR10D7V9EA0PEk/vCbFBJI6Tq4kaLL70CEjic=;
 b=dPQovNczOVFfnVVEe1k8xCrPK3UewjcLb2hABZ1LdDF7G3Rl1wkPeOmAtPJ1bQyz2b
 GWYV4JOV7KjrUzv6e0EwAkDfkGAp4liSJHN1RmPWOcPE3sxPl0wCcXqOoEKAq8nr+4ue
 YQ1p0K/PBs9gvTdVDa/MeFxKLj6EvyW98i3omlgHrxEalnFQ+FGOoO68CWgNK5PhUYau
 yqpohrw61nhe/ECGFO9eIO9pvEXcd2klf9S1yIc46v+L/6W3suzIPAiogtuaxv1+tqE2
 RxAGwpJz91Ppu4fa4gyj69097GZbHePs//zebf7FdGF7goTr82XyIQGUi4XBoMfb9CS7
 qrhQ==
X-Gm-Message-State: AOAM532+xHBhZAEz/LylOCAkXNr7xG4C643bEB9b497UHhh0AzOGVedZ
 58O3ZeoDlxg2mu+BvY6gaJsrxQ==
X-Google-Smtp-Source: ABdhPJw7TI4AgBmTsFdo3vKYW+oM09RWZp+44yxcP7EJfrCTZ4YD+HTiQVhpAZsWhtT3ALl66GmkMQ==
X-Received: by 2002:a17:90b:1a81:b0:1bc:ec26:40a6 with SMTP id
 ng1-20020a17090b1a8100b001bcec2640a6mr13308501pjb.0.1645989690123; 
 Sun, 27 Feb 2022 11:21:30 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:23be:43d9:7006:705a?
 (2603-800c-1201-c600-23be-43d9-7006-705a.res6.spectrum.com.
 [2603:800c:1201:c600:23be:43d9:7006:705a])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a056a001ad200b004bf321765dfsm10845322pfv.95.2022.02.27.11.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 11:21:29 -0800 (PST)
Message-ID: <91b397ee-7b68-653c-8b73-4b0a91b057e0@linaro.org>
Date: Sun, 27 Feb 2022 09:21:26 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 08/14] target/riscv: rvk: add support for sha256
 related instructions in zknh extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
 <20220227142553.25815-9-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220227142553.25815-9-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 27 Feb 2022 19:21:34 -0000

On 2/27/22 04:25, Weiwei Li wrote:
>   - add sha256sig0, sha256sig1, sha256sum0 and sha256sum1 instructions
> 
> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/crypto_helper.c            | 31 +++++++++++++
>   target/riscv/helper.h                   |  5 +++
>   target/riscv/insn32.decode              |  5 +++
>   target/riscv/insn_trans/trans_rvk.c.inc | 58 +++++++++++++++++++++++++
>   4 files changed, 99 insertions(+)
> 
> diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
> index 9e56668627..f5ffc262f2 100644
> --- a/target/riscv/crypto_helper.c
> +++ b/target/riscv/crypto_helper.c
> @@ -272,4 +272,35 @@ target_ulong HELPER(aes64im)(target_ulong rs1)
>   
>       return result;
>   }
> +
> +#define ROR32(a, amt) ((a << (-amt & 31)) | (a >> (amt & 31)))

We already have a ror32 function.  However...

> +target_ulong HELPER(sha256sig0)(target_ulong rs1)
> +{
> +    uint32_t a = rs1;
> +
> +    return sext_xlen(ROR32(a, 7) ^ ROR32(a, 18) ^ (a >> 3));
> +}
> +
> +target_ulong HELPER(sha256sig1)(target_ulong rs1)
> +{
> +    uint32_t a = rs1;
> +
> +    return sext_xlen(ROR32(a, 17) ^ ROR32(a, 19) ^ (a >> 10));
> +}
> +
> +target_ulong HELPER(sha256sum0)(target_ulong rs1)
> +{
> +    uint32_t a = rs1;
> +
> +    return sext_xlen(ROR32(a, 2) ^ ROR32(a, 13) ^ ROR32(a, 22));
> +}
> +
> +target_ulong HELPER(sha256sum1)(target_ulong rs1)
> +{
> +    uint32_t a = rs1;
> +
> +    return sext_xlen(ROR32(a, 6) ^ ROR32(a, 11) ^ ROR32(a, 25));
> +}

All of these functions are quite small, and could easily be generated inline.

     tcg_gen_trunc_tl_i32(a, reg);
     tcg_gen_rotri_i32(t1, a, 7);
     tcg_gen_rotri_i32(t2, a, 18);
     tcg_gen_xor_i32(t1, t1, t2);
     tcg_gen_shri_i32(t2, a, 3);
     tcg_gen_xor_i32(t1, t1, t2);
     tcg_gen_ext_i32_tl(reg, t1);

> +static bool trans_sha256sig0(DisasContext *ctx, arg_sha256sig0 *a)
> +{
> +    REQUIRE_ZKNH(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +
> +    gen_helper_sha256sig0(dest, src1);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}

gen_unary, etc.


r~

