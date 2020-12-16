Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpbKU-0000Oh-2w
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 13:15:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpbKT-0000Nb-5c
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 13:15:13 -0500
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e]:38921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpbKP-0007oM-WD
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 13:15:12 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id k9so5962426oop.6
 for <qemu-riscv@nongnu.org>; Wed, 16 Dec 2020 10:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IYGqEzGvLPinqxet7fLCq07VlJlFvaKQthIt0Lqwapg=;
 b=e8+3OaV7gH11dAp8J9Dtx9GzL5BxAKvASRJXUJZAqpPa8BO2zhgJN6+w32951bnGO4
 ZDO7T4UyKjvRjvPCh0GVoyliHgtPMmooiWOo++6DF0RLnHeBPPEF5uLE1rMYeMEeLMCd
 ZqJBfOjW9fMmV8HgiwdJaGNti6ciCAzJDzSH6+ytQJ1rEExB9sOVzDsgy6vLSah+IGju
 BRaMZO1q+Hq9xk+hp58pab6Gz0l6Xi8ksTqWN7CrUJlXmRZlgEeKBMnjO7opiztrqQ25
 WNCjyTaRmqeX7pQJVIjXvlTqb2SxFnCRnuBP/kvCZggpRe/hkOZkWQeieVUOVwt1uiX7
 dmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IYGqEzGvLPinqxet7fLCq07VlJlFvaKQthIt0Lqwapg=;
 b=oBkQNE83obRjFHE6c3mIrcXA6AJ1oFY7AwTkd6vb07vT0GXmKVgPaxxendH3Fdu+/3
 NVhX4HEkhSEMvpDpehUudQgBm/5a78ZBYFAlB3CRs2N2oV28HHrlEP70gIldPZVQbxNq
 p0KPXYccP2mEEQ9he8SJbxeydasouxWTX6cHV8+sfhz/M2OTv/GrXc+nFb+UayaxyUpL
 ChnCRFNanko1WYN1D/Pm05bZhkYLgtY94okPJDtO9cnn9QR8ssHjzCKmv6g0OfnqROQR
 GcoKhIKhfftgCzbeZAPraYiW3mTc3W1KtU2t7Vw5Hhyj5TeiX47449XIPg4reEbLpEj9
 2kIQ==
X-Gm-Message-State: AOAM533dAt/UFC3WsMLJboZs4hRs6HZhEBts0SQwzzW6cCiBnRIcCMqF
 MjGYqLcnR4NkLWBetL2nvP3TBA==
X-Google-Smtp-Source: ABdhPJxg8rEEWvYmNKj2NWXBrEpP+7roH5K0OO3dxatjrda7JFgYun2yC8IOqbUEpygJeQ0ILmWZ5A==
X-Received: by 2002:a4a:c4c7:: with SMTP id g7mr25901087ooq.50.1608142508689; 
 Wed, 16 Dec 2020 10:15:08 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 11sm596393oty.65.2020.12.16.10.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 10:15:07 -0800 (PST)
Subject: Re: [RFC v2 12/15] target/riscv: rvb: generalized or-combine
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-13-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1b81661c-58f5-0ead-8e9f-4fefbf538e46@linaro.org>
Date: Wed, 16 Dec 2020 12:15:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-13-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 16 Dec 2020 18:15:13 -0000

On 12/15/20 8:01 PM, frank.chang@sifive.com wrote:
> +static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +
> +    if (a->shamt >= TARGET_LONG_BITS) {
> +        return false;
> +    }

Check should be in gen_shifti.

> +static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +
> +    if (a->shamt >= 32) {
> +        return false;
> +    }

Check is unnecessary due to @sh5.

> +static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    tcg_gen_ext32u_tl(arg1, arg1);
> +    gen_helper_gorc(ret, arg1, arg2);
> +}

Calling the wrong helper.  The zero-extension should be unnecessary -- the high
bits will be overridden by the sign-extension at the end of gen_shiftw.


r~

