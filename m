Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC6IA-0007QE-Hh
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 15:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC6I9-0007PW-5G
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 15:13:33 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:44312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC6I7-0000QY-L7
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 15:13:32 -0400
Received: by mail-pf1-x42b.google.com with SMTP id p11so2358523pfn.11
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 12:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7vfRGmvkycs9b3PuqV/xniTiuFAdsTo4TrtMviFYgBk=;
 b=IMO/lljBaMXOewAtRdX4VzIyawiG7t5MKSUYFZFKaHB63MgKSGbnHNvUvZ17YhmFkE
 aRrumI3ymWmvfjgTrF2ueVSln6000gS9+18NcCCopS9vGLzeHL9/7Zl8sDxNP/vXGPWF
 C0iyhKZlmhjwNPbHBswdGkZK/wmOrwy+uIAm5OLpEJZGAhZLPocUf9eH/2wiVBT/Ectp
 V1FjlbmfBWQw/syXmGpgH6HRlKgkybhedSPNEm6L3yNqN59uQE+eNwginLW98twfxOQ4
 yMOpbfySoT7srQi/Z84nXoExx0u9GGYhsV9EjslXdMcFVr2VM1Cw+41jq2PnFEhL+Fyl
 fwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7vfRGmvkycs9b3PuqV/xniTiuFAdsTo4TrtMviFYgBk=;
 b=NZUOm6X0TvHZpKhGzqF5qDn8iQexd8ZVVXZA68Bz+ei1DCXcQdUx3nvh9HS550z7Pl
 V+sEgPWAeaL0JwPFW0SEL6w5vg5HGRVXHvsj2iemO5pgZrEEkPUw0jBZSl781J0KjXbM
 OoD6Bx4w/CoqaRmsXPT9Rq/mIGDSyprrOprfvr30Vp7u4Lh8kpKJLI05/9UJWvtnXbwg
 Q/nIIIfTrA6lsnsStFHDw62qcEjx6aMpd3vS84T06f80jI5QNgXc/4DNkI7WdkgkqyV2
 TZO8B6ADpNOSp6ALPTFabjoQj/ryX3848XL51OeLHH7w7ZceeChtkSuL3JYc2p+clnuV
 Kbnw==
X-Gm-Message-State: AOAM533YHybVIAYLwoCaMOMNpsC1TPq1IGC33/IiQ61ZcETS3jcxt/Qi
 LNQL6c1q/Wrwtrnp1+TUh5mpnw==
X-Google-Smtp-Source: ABdhPJyg1xkldLFDozBvoG2w4pgeHaykLBNAEiv+rukkfj3tQguixGQUy5zffFIdgHm6hKikHhBaVQ==
X-Received: by 2002:aa7:850b:: with SMTP id v11mr3891961pfn.240.1598728409888; 
 Sat, 29 Aug 2020 12:13:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id r186sm3616310pfr.162.2020.08.29.12.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 12:13:29 -0700 (PDT)
Subject: Re: [RFC v4 23/70] target/riscv: rvv-1.0: load/store whole register
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-24-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2c43a438-e9ae-6e8f-0d52-066278756c14@linaro.org>
Date: Sat, 29 Aug 2020 12:13:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-24-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sat, 29 Aug 2020 19:13:33 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> +/*
> + * load and store whole register instructions ignore vtype and vl setting.
> + * Thus, we don't need to check vill bit. (Section 7.9)
> + */
> +#define GEN_LDST_WHOLE_TRANS(NAME, EEW, ARGTYPE, ARG_NF, IS_STORE)     \
> +static bool trans_##NAME(DisasContext *s, arg_##ARGTYPE * a)           \
> +{                                                                      \
> +    if (require_rvv(s) &&                                              \
> +        QEMU_IS_ALIGNED(a->rd, ARG_NF)) {                              \
> +        uint32_t data = 0;                                             \
> +        bool ret;                                                      \
> +        data = FIELD_DP32(data, VDATA, NF, ARG_NF);                    \
> +        ret = ldst_whole_trans(a->rd, a->rs1, data, gen_helper_##NAME, \
> +                               s, IS_STORE);                           \
> +        return ret;                                                    \
> +    }                                                                  \
> +    return false;                                                      \
> +}

Decodetree is intentionally organized such that ARGTYPE = NAME.  There's no
point in duplicating that.  Move everything besides the call to
ldst_whole_trans into ldst_whole_trans.


r~

