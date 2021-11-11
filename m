Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ml8Xm-0003Fv-Ov
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 06:47:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8Xl-0003EN-2t
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 06:47:01 -0500
Received: from [2a00:1450:4864:20::332] (port=41703
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8Xj-0008Ap-FM
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 06:47:00 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso4241020wmf.0
 for <qemu-riscv@nongnu.org>; Thu, 11 Nov 2021 03:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wuh310FhYzfbx8Y3YdttUDfQL0Gw+6CiVMqPZ7y9UjE=;
 b=jQdQtB99IhOP+BzBK9T1Q++USERMKSoY+dng0DggMc97t1Acy00WUVJ5zpBJr43/9z
 HeUGK3DF64qESLthHDysQWo/HvN4qkQ01qVigIGibzWdJ+4ZiRtXSZK3wqHvR3KBOVMO
 tY3cqjkduLpfMy4m3/O9rNonZF7X7SxLf0ji0z4sJ/Iyi67hgaIF7bt/g1uu7277hYjr
 VTDTm0fWURlB4fgKTHv3sam6jMeDnTsCn1pqrbllMLBKGaZkREOZUXKLnjvTYuTw3Kd1
 WY79AAnYE0+2QtKEa01go8bukhjv/LKVITVbjhQBRjVE5tsCcybnh9WelN1ZfCh4dN+a
 sZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wuh310FhYzfbx8Y3YdttUDfQL0Gw+6CiVMqPZ7y9UjE=;
 b=q5dp9te2rF00b25JidZE92/cqbv++BNh4gTVANtohiQNDawzJKUPNwNxmjQDkK+SCf
 +c5J0LUD66uCat2+Lm1ZFhIYH5WaPi5VHJrRHY3kBnbHFpAdRHXsKUPNeWKXsJLA2iEL
 NQuNGyXNQ7Htp06rfmM950fJTjYs1jVO5TZ4xbNY3ACV3fe6ZdB2WrhIOpz6eZnpqATz
 dWOjsuzbQNvX3R/wVElYSld0tnMPcWVRJs9EeCVfNQ7qAc1Nil7LVGxrPeD/ld+TjDRb
 rFRFturKTxKaUBq6rWPR25nQZU0dzYvGZwppYBkJVzkcKYGiZENYIDjesYKnSF7IGjZ9
 uz0A==
X-Gm-Message-State: AOAM532lpS5nUR+e906GB0Cy0tQBEI1JSYLxervkTE3pUpVV9eM9GRru
 errYDc0DIVdq7qlI9I0H956XCA==
X-Google-Smtp-Source: ABdhPJxLDnu/ZGN/x9+7Oo/pqGYUZF7nmBdkO28Y0SO7RUrhqUT6s9PRXonIGZSy54A63Q0fTrQGSw==
X-Received: by 2002:a05:600c:1549:: with SMTP id
 f9mr7581555wmg.118.1636631217964; 
 Thu, 11 Nov 2021 03:46:57 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id k8sm2583590wrn.91.2021.11.11.03.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:46:57 -0800 (PST)
Subject: Re: [PATCH v3 19/20] target/riscv: Adjust scalar reg in vector with
 XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
 <20211111055800.42672-20-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b1d8f47a-a6fc-3d49-89dd-2ec0af867999@linaro.org>
Date: Thu, 11 Nov 2021 12:46:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111055800.42672-20-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 11 Nov 2021 11:47:01 -0000

On 11/11/21 6:57 AM, LIU Zhiwei wrote:
> @@ -2670,6 +2672,7 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
>           /* This instruction ignores LMUL and vector register groups */
>           int maxsz = s->vlen >> 3;
>           TCGv_i64 t1;
> +        TCGv src1 = get_gpr(s, a->rs1, EXT_ZERO);

A reminder that this is zero-extend for v0.7.1 and sign-extend for v1.0.0.

> @@ -2679,7 +2682,7 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
>           }
>   
>           t1 = tcg_temp_new_i64();
> -        tcg_gen_extu_tl_i64(t1, cpu_gpr[a->rs1]);
> +        tcg_gen_extu_tl_i64(t1, src1);

Likewise.

>           vec_element_storei(s, a->rd, 0, t1);
>           tcg_temp_free_i64(t1);
>       done:
> @@ -2748,12 +2751,28 @@ static bool slideup_check(DisasContext *s, arg_rmrr *a)
>               (a->rd != a->rs2));
>   }
>   
> +/* OPIVXU without GVEC IR */
> +#define GEN_OPIVXU_TRANS(NAME, CHECK)                                    \
> +static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
> +{                                                                        \
> +    if (CHECK(s, a)) {                                                   \
> +        static gen_helper_opivx * const fns[4] = {                       \
> +            gen_helper_##NAME##_b, gen_helper_##NAME##_h,                \
> +            gen_helper_##NAME##_w, gen_helper_##NAME##_d,                \
> +        };                                                               \
> +                                                                         \
> +        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm,                 \
> +                           fns[s->sew], s, EXT_ZERO);                    \
> +    }                                                                    \
> +    return false;                                                        \
> +}
> +
>   GEN_OPIVX_TRANS(vslideup_vx, slideup_check)
> -GEN_OPIVX_TRANS(vslide1up_vx, slideup_check)
> +GEN_OPIVXU_TRANS(vslide1up_vx, slideup_check)
>   GEN_OPIVI_TRANS(vslideup_vi, 1, vslideup_vx, slideup_check)
>   
>   GEN_OPIVX_TRANS(vslidedown_vx, opivx_check)
> -GEN_OPIVX_TRANS(vslide1down_vx, opivx_check)
> +GEN_OPIVXU_TRANS(vslide1down_vx, opivx_check)
>   GEN_OPIVI_TRANS(vslidedown_vi, 1, vslidedown_vx, opivx_check)

Likewise.

So if this patch set goes in after rvv 1.0, this whole patch may be dropped.


r~

