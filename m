Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyJAV-0006HI-NK
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 14:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyJAU-0006Gz-Ci
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 14:08:38 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:34224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyJAS-0003fe-US
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 14:08:38 -0400
Received: by mail-pg1-x536.google.com with SMTP id t6so1725353pgq.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 11:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Njuw91hrPNy4PbhKHvD8/7E47zPQs5c+jFpI52u0HD4=;
 b=QNVYAwI8OaB+R6YFFcurPNxmtf9xmgNXxGUmEo3edDb5WUWTTHih8GhoSFuvb+OHvp
 +vxFIqt1qqRCbXFj9iFdMEFDyMaTk11Ty3Jd32aMJh+9ZD4LM+UT2yc4Xn3bw8IhCoiG
 KjH48+Rr1EvVvRSmUxY2jL4MGsNdlpOeirGA4Jdv5Q+t24gA42wpNPwUH2Z8oRReyRfr
 Na0mo28P9roeDnWZb13TqOqlGJVddFZtOTbAXYizuWhDZGiFbJXopbcgVilkYGiTCkDC
 fv9U/B4uU0q9pLDWzZqbXh5Ftot753f1qPbzKpNpcHE366uii1XJgG1CUJlRABkazTEr
 3fLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Njuw91hrPNy4PbhKHvD8/7E47zPQs5c+jFpI52u0HD4=;
 b=hQbqKQV6pJReNfKcHkNCRN1oNIdxlCDOWfQ2i90hhwIW5Ycz7cZnS4UK2UfTOwEvZQ
 cvr7TlRLPGOf6djADIt9fpP1P/op7SrswcXXkH0At29iFRtCikQmyYqLwc1v28KssbS2
 Jtg8xZj2tdtDbhBSD0YW5Q85GfcUFBFdI+Y6Y4/u+RuMfnVI/hPuNZ1JgX2064HmN7Rb
 cB8TCc2bEKoG5F5mxC3I061k8G2UBynYI2pZfp36/Y+cYICDF+zqKAqFSuDQrb2dpPxl
 Vv+vc1iB81JClenru/GFi2ikigwbTx6Rx9GZrlZpVTxLavbixqBG+wQ826VkWpk9yqK7
 UxrQ==
X-Gm-Message-State: AOAM532n7bYucazYpweSui41MiMap4V3VIbXbme1AkUwl5RCLQWGxN0g
 S+4a3x4GQRR1BAe2H3s8P9pSOw==
X-Google-Smtp-Source: ABdhPJwq0SsRTGSN+TzNHuBYlhEHcRtVuAVwGepegAyedty2UdBVNF9BHLwjTNJbM02Es8A4373TaA==
X-Received: by 2002:a63:7542:: with SMTP id f2mr877769pgn.151.1595441315129;
 Wed, 22 Jul 2020 11:08:35 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 e195sm240530pfh.218.2020.07.22.11.08.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 11:08:34 -0700 (PDT)
Subject: Re: [RFC v2 18/76] target/riscv: introduce more imm value modes in
 translator functions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-19-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <271fbe17-4a2a-2c21-9885-215134aa1be6@linaro.org>
Date: Wed, 22 Jul 2020 11:08:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-19-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 22 Jul 2020 18:08:38 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> +#define IMM_ZX          0   /* Zero-extended */
> +#define IMM_SX          1   /* Sign-extended */
> +#define IMM_TRUNC_SEW   2   /* Truncate to log(SEW) bits */
> +#define IMM_TRUNC_2SEW  3   /* Truncate to log(2*SEW) bits */

Please use an enum.

> +    case IMM_TRUNC_SEW:
> +        src1 = tcg_const_tl(
> +            extract64(imm, 0, 5) & ((1 << (s->sew + 3)) - 1) & 0x1f);
> +        break;
> +    case IMM_TRUNC_2SEW:
> +        src1 = tcg_const_tl(
> +            extract64(imm, 0, 5) & ((2 << (s->sew + 3)) - 1) & 0x1f);
> +        break;

Either the extract or the "& 0x1f" is redundant.  Remove one.

It would be worth splitting the integer arithmetic out to a helper function so
that you don't have to replicate it again in do_opivi_gvec.


r~

