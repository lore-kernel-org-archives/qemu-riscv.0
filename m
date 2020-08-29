Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC5JZ-00070D-19
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 14:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC5JX-0006zI-Uf
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 14:10:55 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:34435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC5JV-0001Z8-C1
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 14:10:55 -0400
Received: by mail-pl1-x632.google.com with SMTP id v16so1144876plo.1
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 11:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AGHnYE8KAa39c/PAM96Bal83tQmqCn57OrcCtmW9Kb8=;
 b=ihbDZjbjuea7qcW3JqipDGPB+X6C8mu/+wmyMJc5a2UFqtJ45z1hKBLRhPsgqoXdBY
 1067d0yms2Ltk2HmY3mz1lJq49uMX6enqospiT6q4ex9Pl4Qal6ijmk7fmyp2RNuDZbd
 XPnNVhhaeFcPIh5Z4b5UojJWfyWefeA/tT/s3nTq+bATO7USwvAlLmxqT+7VHzWSrvfC
 gNv/ROTdLGhDRoSTDwZZK5DAiP2xn1xBbuyuYLaaHWylaOQyBwwS5s7lqiHDkiTlr5DR
 pILvfNqZ61SX9+ncj0uLdwJjN/VshTy69XluNp1blRrWIQiZcXLXbLfcylCWidLKzxqB
 qiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AGHnYE8KAa39c/PAM96Bal83tQmqCn57OrcCtmW9Kb8=;
 b=uCRG2aTF0SS005iMxOCdKNrLSl0JqIsFJLoE48XYRu9UCdXrBkjtUqtZ8/FM++DVQ8
 uQJy1kWp8N2CJXG1pnul9mKbeV1UhvZmFcSaeF+Z64uDeHuHfB67yCcEB8kH+xnrzlvK
 zIej1zai7UEs9A5QNOnYBVuTQAvqbRwikz6Qe41iJzYCRInW4L2lq7s76MYIBDZEWahN
 ycQ1sjoSWRtsyFYovkEMIymZBA5kYJQeaGTFTIWRc/B4vUIX6cvG0yhei7nl9252FzlC
 maCY4+h8LiwExodwdwmINKjsKkXcux/7XXhuvvowXz1MTdfFO5XXA2mlFxc+/eCY7IFb
 ZxDA==
X-Gm-Message-State: AOAM532LL1NMpTYeBjNa7zt0NAaguU6VVNKJkOo8RGMlHTCTs2Si2IBL
 ayMkA9jfDbX1bEQVrYNnAFGf7A==
X-Google-Smtp-Source: ABdhPJynwdaoMap/n/lASBCOBResrUc6BllDP4wO3AUMdidH7OUFfWNQvzAiJNFBhMMbeP0MU6ccGw==
X-Received: by 2002:a17:902:b789:: with SMTP id
 e9mr1392252pls.146.1598724651689; 
 Sat, 29 Aug 2020 11:10:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id c2sm2945029pgb.52.2020.08.29.11.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 11:10:50 -0700 (PDT)
Subject: Re: [RFC v4 18/70] target/riscv: rvv-1.0: stride load and store
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-19-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc367efb-1b7b-4be8-4a1e-9e3515ed98d4@linaro.org>
Date: Sat, 29 Aug 2020 11:10:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-19-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sat, 29 Aug 2020 18:10:56 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
>  /*
> + * Vector unit-stride, strided, unit-stride segment, strided segment
> + * store check function.
> + *
> + * Rules to be checked here:
> + *   1. EMUL must within the range: 1/8 <= EMUL <= 8. (Section 7.3)
> + *   2. Destination vector register number is multiples of EMUL.
> + *      (Section 3.3.2, 7.3)
> + *   3. The EMUL setting must be such that EMUL * NFIELDS ≤ 8. (Section 7.8)
> + *   4. Vector register numbers accessed by the segment load or store
> + *      cannot increment past 31. (Section 7.8)
> + */
> +static bool vext_check_store(DisasContext *s, int vd, int nf, uint8_t eew)
> +{
> +    int8_t emul = ctzl(eew) - (s->sew + 3) + s->lmul;

I think eew should be passed as log, as MemOp and MO_{8,16,32,64} constants.
This is already the scale used by sew.

> +#define GEN_VEXT_TRANS(NAME, EEW, SEQ, ARGTYPE, OP, CHECK)   \
> +static bool trans_##NAME(DisasContext *s, arg_##ARGTYPE * a) \
> +{                                                            \
> +    if (CHECK(s, a, EEW)) {                                  \
> +        return OP(s, a, SEQ);                                \
> +    }                                                        \
> +    return false;                                            \

That also makes EEW and SEQ identical, so that...

> +GEN_VEXT_TRANS(vlse8_v,  8,  0, rnfvm, ld_stride_op, ld_stride_check)
> +GEN_VEXT_TRANS(vlse16_v, 16, 1, rnfvm, ld_stride_op, ld_stride_check)
> +GEN_VEXT_TRANS(vlse32_v, 32, 2, rnfvm, ld_stride_op, ld_stride_check)
> +GEN_VEXT_TRANS(vlse64_v, 64, 3, rnfvm, ld_stride_op, ld_stride_check)

... this does not need to replicate those constants.

> -#define GEN_VEXT_LD_ELEM(NAME, MTYPE, ETYPE, H, LDSUF)     \
> +#define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)            \
>  static void NAME(CPURISCVState *env, abi_ptr addr,         \
>                   uint32_t idx, void *vd, uintptr_t retaddr)\
>  {                                                          \
> -    MTYPE data;                                            \
> +    ETYPE data;                                            \
>      ETYPE *cur = ((ETYPE *)vd + H(idx));                   \
>      data = cpu_##LDSUF##_data_ra(env, addr, retaddr);      \
>      *cur = data;                                           \
>  }                                                          \

Since there's no extension to be done between MTYPE and ETYPE anymore, you can
also drop the "data" variable completely and store directly into *cur.


r~

