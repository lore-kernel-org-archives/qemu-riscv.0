Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgxT7-0006bL-VV
	for mharc-qemu-riscv@gnu.org; Thu, 04 Jun 2020 17:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgxT5-0006af-Qn
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2020 17:32:07 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgxT4-0004f0-Dv
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2020 17:32:07 -0400
Received: by mail-pf1-x442.google.com with SMTP id s23so2538219pfh.7
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2020 14:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wGt0cVLT9e/HUJvOZ5HkDGJT4IbfWPRDnB2yCxfys1s=;
 b=vuIpJbPILNLEiI56ss0CLX7RWs6xtl+cXpTyvLibK9J9SEjY8ZtAFV9xg4M4xNVRUg
 bX1LuMm6uy6dhQhFrF4fOLKsntB41ifcd7SC5nenyvCj9rO7/sJJgXpaCnTW+MJOEQgR
 //TOh9B26bqCnLK3K7tHqfsqOhsuukUvUn806qCu8iQHOT08DXuNMvcT4TyPUxeJmD0V
 sOvRPLROpVlWuXTdz1y1hmWl/dedq+EgcRXmy0drqMKcg6iwgf5xcPlReDfHj629wCrA
 0XLINWatLAUz0LBMJoOtIK+hi45Z+kQtOnSQl3oYA3M4AlW5T38LoHgMEn8ptAQedCVs
 DEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wGt0cVLT9e/HUJvOZ5HkDGJT4IbfWPRDnB2yCxfys1s=;
 b=ijlg6U2iUjfDNGbNgftXY/4oiDGP/GDyMyurLnnyaGH/EZVzec0yyoD3ZZoAiCABIp
 V4BgLBE1YoIrbHdM3ccszFQ1c5yhk0sn2/f+Pjf96XOZxUIVyinItO5kA+NKs+Vq10Nj
 XRK1Je62KIfv7cbUfIJg1RVElkRpfx+PYMNnt/E0nwuK/Oj2YB/4jaqXQNhsAOmTxkkT
 rTzB0MzHeZClXbRWU6FZyq+eURnjjtQYZhPQ0v4Ybp17CRtW1hK3M2/3/qzZmalDLg10
 KdFqy15fXRKtJq7mzMi4iNVMhzjawpzdjpzu3tqH93gXzC+46HUOYswyirjf9bvRQSgl
 1Npg==
X-Gm-Message-State: AOAM531m4hcjVihhYqbGNtrZ3Q12bm/0INuMHw5iLqd6vQ+muq4G153H
 lZF6KypyROJPKlh0+G5oPq29Yg==
X-Google-Smtp-Source: ABdhPJwAqlhQ+M8LJ/D0uZ2NHWKyM5wHjkcm77rNWV9mpzJTUF3GxO479YvpJuKm9CKFZugdM+iMVA==
X-Received: by 2002:aa7:8b54:: with SMTP id i20mr6294503pfd.230.1591306324223; 
 Thu, 04 Jun 2020 14:32:04 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 140sm5314248pfv.38.2020.06.04.14.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 14:32:03 -0700 (PDT)
Subject: Re: [PATCH v8 58/62] target/riscv: floating-point scalar move
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com
References: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
 <20200521094413.10425-59-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <be24e64c-4f3b-c507-7ed8-f7697bea5957@linaro.org>
Date: Thu, 4 Jun 2020 14:32:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521094413.10425-59-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 04 Jun 2020 21:32:08 -0000

On 5/21/20 2:44 AM, LIU Zhiwei wrote:
> +static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
> +{
> +    if (!s->vill && has_ext(s, RVF) &&
> +        (s->mstatus_fs != 0) && (s->sew != 0)) {
> +        unsigned int ofs = (8 << s->sew);
> +        unsigned int len = 64 - ofs;
> +        TCGv_i64 t_nan;
> +
> +        vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0);
> +        /* NaN-box f[rd] as necessary for SEW */
> +        if (len) {
> +            t_nan = tcg_const_i64(UINT64_MAX);
> +            tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
> +                                t_nan, ofs, len);
> +            tcg_temp_free_i64(t_nan);
> +        }

I guess this is correct, but it looks odd.

I would have done

    unsigned int len = 8 << s->sew;

    if (len < 64) {
        tcg_gen_ori_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
                        MAKE_64BIT_MASK(len, 64 - len));
    }

and to match, I might use

    MAKE_64BIT_MASK(32, 32)

in trans_vfmv_s_f.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

