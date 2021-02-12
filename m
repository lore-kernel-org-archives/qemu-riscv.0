Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAdi5-0004od-2r
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 14:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdhw-0004mi-VA
 for qemu-riscv@nongnu.org; Fri, 12 Feb 2021 14:02:26 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:36750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdhs-0004jh-G2
 for qemu-riscv@nongnu.org; Fri, 12 Feb 2021 14:02:23 -0500
Received: by mail-pj1-x102a.google.com with SMTP id gx20so177911pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 12 Feb 2021 11:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c0jW8f+uLR0EOQqwEQzfLGv/rCn+PF5svD+SH9wzQmc=;
 b=HKW5tAyHTnVkHKeWNL9whaHy1QwphsKUCzaMFy+OofIQ32wyVusldAJjYxCKj5kC67
 YOwC4GM2vlYOL5HIwwfPMlKebi5gDlyi/IDzJGEEIZUhrNzgZ4J1g/W2fIz+v49k5xk4
 w5UUIf+O+EzJJhUJhfedMiywPDkT9OPGsmPsn0XDcqGeFIRbjOPjTh9OpYE8/8BsOOXz
 sNq9lWH5a3De5CxrMOVCSvS0KF2AApvaBw5aHWTNWIH2fGkrdmSEas3fwh6Tpifmw/cU
 nyhdIStycPD6JSfTxe4Y7Oj3AwDF38AI5zMs5BB0HfKGwebxWerGDBhsx9YreaIzx10p
 3Uig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c0jW8f+uLR0EOQqwEQzfLGv/rCn+PF5svD+SH9wzQmc=;
 b=fzlALOhRnGHa22TezjO4EqEdQQNCuJ741Vy+O87odUoPR4YC8RL9IhGzgFG3UIQFZG
 ZnN38bt98TbVrucQJNAZ0NftcVq6xu+f4eRthCWmFgQTISkwUCimh5p5u8X7pgvJZkna
 QHT6xTBiKJamAQuTRARpucuvov9UEyTO34V93n7za0UXcEHP9UEL1hlEirInxn52+jm1
 uhtrLT41Qtr2gqhYEHCoLti9KowQ2c1MCyoOh7Wm/Cg8piY9M+ti2EJaMdplRezUh2AO
 W7HCHxoZM0uisGcbfkTQmL8QKaf6CxJdVMF/l+kxQsOIS2uAk2hio1dnnyffXRSO9eQW
 dLqg==
X-Gm-Message-State: AOAM532d3Iovtp/gGWENj65nBUy5xNMHfsJMzSHjR7U0uu5NeIb2H0PK
 pKnALebYfbEPbZuy34TmwEpyzA==
X-Google-Smtp-Source: ABdhPJzItrb7ZS5U1oz/h8OGIL5Q+rt0Z0cNuox7f49NezNBajLCSIr7D0Begkgxrjp3DYtyEJHcPg==
X-Received: by 2002:a17:902:e84e:b029:e2:dbb6:73f8 with SMTP id
 t14-20020a170902e84eb02900e2dbb673f8mr3912871plg.52.1613156538888; 
 Fri, 12 Feb 2021 11:02:18 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 w3sm8831321pjb.2.2021.02.12.11.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 11:02:18 -0800 (PST)
Subject: Re: [PATCH 04/38] target/riscv: 16-bit Addition & Subtraction
 Instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair23@gmail.com, palmer@dabbelt.com
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-5-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7e459e06-7405-e01c-02c7-79dabf4ceb70@linaro.org>
Date: Fri, 12 Feb 2021 11:02:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210212150256.885-5-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.119,
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
X-List-Received-Date: Fri, 12 Feb 2021 19:02:26 -0000

On 2/12/21 7:02 AM, LIU Zhiwei wrote:
> +static void tcg_gen_simd_add16(TCGv d, TCGv a, TCGv b)
> +{
> +    TCGv t1 = tcg_temp_new();
> +    TCGv t2 = tcg_temp_new();
> +
> +    tcg_gen_andi_tl(t1, a, ~0xffff);
> +    tcg_gen_add_tl(t2, a, b);
> +    tcg_gen_add_tl(t1, t1, b);
> +    tcg_gen_deposit_tl(d, t1, t2, 0, 16);
> +
> +    tcg_temp_free(t1);
> +    tcg_temp_free(t2);
> +}

I will note that there are some helper functions, e.g. tcg_gen_vec_add16_i64
(see the end of include/tcg/tcg-op-gvec.h), but those are explicitly i64, and
you'll still need these for rv32.


r~

