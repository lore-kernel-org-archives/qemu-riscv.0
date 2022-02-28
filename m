Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOlCx-0000PF-TY
	for mharc-qemu-riscv@gnu.org; Mon, 28 Feb 2022 13:57:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlCw-0000Ok-9X
 for qemu-riscv@nongnu.org; Mon, 28 Feb 2022 13:57:18 -0500
Received: from [2607:f8b0:4864:20::102a] (port=55033
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlCu-0004rV-Vy
 for qemu-riscv@nongnu.org; Mon, 28 Feb 2022 13:57:18 -0500
Received: by mail-pj1-x102a.google.com with SMTP id b8so11940204pjb.4
 for <qemu-riscv@nongnu.org>; Mon, 28 Feb 2022 10:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TyWSMpcvhDtgeem0JinnQJBidkXWX12ywBTQFruibz8=;
 b=A0VYOqtizwiGFx3sNK91IPfVgkRIf5HDkFEj5BmXqhkCwvRCJn9zhqpl7YcxiLJvuh
 OR9PG3DM7o5U/pLufVn7y/PyUoDpnsJZVdUEXVSo8wR+sszvx7qAhSt5DvCHiZUH6hss
 As3zBMrck7BFuWchwv47s58VL4EyVGl0LTq5rqsvrQAxVuogU7E3RlYokFbnz8GgmvMI
 zHSV3RvFrMDvZWnM1yVP5reb+OtL57tf1rRn62Fo2d6bR2zeobLKDg2ti+9Jn1pM5PoY
 5wHkL+JdDmckUnWEFCPsSec8rFJ8zQ/F2zDFgnIsRRASCQ+5h3aM+tEkN2udqz7Anujc
 SlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TyWSMpcvhDtgeem0JinnQJBidkXWX12ywBTQFruibz8=;
 b=PPU3p+hhMxeGW+52WRMZ1aiAV7S6xlIs9wrvRZaFjOWTqDm9zRaKyoQTVuGr5shL3L
 vxLntLgKoTKgqv+WfpMsb19rrbmBT9PFMGbpewICzJQKnaTRZl9ka8b29vOkL9eRkW6s
 ovUIRPgoJLdJ0NwWVuR4YTuDxSsXy26qRAtjtOzu98WwrYvI8sr9D8MbV4ZrHeJ6+SEc
 E/Qeb2Kuoif8mJP9jx95rcZerZfjYJeRGiXO+CkyiRKgRSszLbuGfl7kWBq4mhQ3qaEx
 N9tAlGsKa6/XEH1ElrsaXASnMtbfWnSoYwz2xnCYUYDsHq1sYxSHcCwe6oFNsJK3y+y6
 N2dQ==
X-Gm-Message-State: AOAM533YGvd/aWdiYwqwlN5ZGOSQORyrFFb8GuGHSMmv0wlpGKBVJHCa
 tJCiM+jm/VUG2amQ4obV72o/RQ==
X-Google-Smtp-Source: ABdhPJx+Cmd6p7w6AmFMiRftaTun7QfwrUY7va66mYyOSDAJvFU/kSKcTYf9xhjGoNkEg5H0WbcV0w==
X-Received: by 2002:a17:902:e289:b0:14f:ffd3:29bc with SMTP id
 o9-20020a170902e28900b0014fffd329bcmr22214568plc.35.1646074634228; 
 Mon, 28 Feb 2022 10:57:14 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:483f:d486:138f:7868?
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 np11-20020a17090b4c4b00b001bd4aa67bafsm502948pjb.3.2022.02.28.10.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 10:57:13 -0800 (PST)
Message-ID: <5ad38d4c-2f5a-49fb-f1a2-c4993e19e38d@linaro.org>
Date: Mon, 28 Feb 2022 08:57:10 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 06/14] target/riscv: rvk: add support for zknd/zkne
 extension in RV32
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
 <20220228144810.7284-7-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220228144810.7284-7-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Mon, 28 Feb 2022 18:57:18 -0000

On 2/28/22 04:48, Weiwei Li wrote:
> +static bool gen_aes32_sm4(DisasContext *ctx, arg_k_aes *a,
> +                          void (*func)(TCGv, TCGv, TCGv, TCGv))
> +{
> +    TCGv shamt = tcg_const_tl(a->shamt);

tcg_constant_tl

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

