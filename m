Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfpY4-0000vY-FR
	for mharc-qemu-riscv@gnu.org; Thu, 19 Nov 2020 14:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpY1-0000sK-6S
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 14:24:50 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:36008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpXw-00073O-71
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 14:24:48 -0500
Received: by mail-pg1-x52f.google.com with SMTP id t21so5133339pgl.3
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2020 11:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3N1gmkuj4T2+5TXc5qtPIYIoE9z+RF7RlX+KbQreMcE=;
 b=OsgqhqTXHb0y2FVzcTKE1y3Mj14qkbhe9AHicoHdnfJP4K77GTEyUeMaCEB47ucC9a
 86N3+3xvETx9qtaHl1Q7nQ/Rx/jAopsyCzTgVK4TFw6TB3MsvdJGQdp+jxHUXAMUasp0
 rjbCQ1ckqbTxOB6nraI6yU9GjKPSI7nsPXOT+O7BC/M8WeYl92ibzNZhIBM9Uc9GApF8
 zOHG5XljzFYxUumaiItAr8hzVgUSaash5hKKicj+VcY+ezSe56NDvuOvjt38/CrLFA3o
 7W78uuX2SQgE3Tm6hxt87sPxjOWnPjc28a8YBScLA8SsMp4k1sPL1bmyq8l8Y72SXHIc
 2WCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3N1gmkuj4T2+5TXc5qtPIYIoE9z+RF7RlX+KbQreMcE=;
 b=XGv0iYPzbSPJ8LOvyUkqy+Iy78BwIB7UmMalTIAqClDNxRCVauC8kdK5AtSCF0nU+e
 ZFcFLYZOhlZQSvrShJBkY5YKuYV7ofdanxZFNz6zDvz9JuOPmnvaad6aQfvvEcsdcGQ2
 lIdWMc6H6pQIiic3CyDJFZXVKrtpl0fk1kPTQCxeFuFM+j/t3teyk8CbnKGq2M7TAwU8
 K5B45tK3CwvtZgQKyJk+0oL7heA49mmtaNxxxSymHbYn7fj8JpapLvaV1Gq2QONLa1wn
 gnIBjDaV7PZu2UNStUR+n3czIyuLaezTqz0xIneWG3QETbsJlNLwnv96tcr2d4ID4ALH
 f62A==
X-Gm-Message-State: AOAM532t1p39Y+W5ujv6bgPknXuAEsxTw/pVJmkxgZoCB6Al/QvQJjFy
 l3pdHAjLZILZDrHC6QvB4zQ+Og==
X-Google-Smtp-Source: ABdhPJzcxJ2+6E+kPvzKOaUjePf8FxI6rSWBUANa5U64aiHnFeLnWSm5h67gWSSr/gt2CdHRrFi6MQ==
X-Received: by 2002:aa7:868a:0:b029:197:60b6:ae1c with SMTP id
 d10-20020aa7868a0000b029019760b6ae1cmr10721763pfo.42.1605813881704; 
 Thu, 19 Nov 2020 11:24:41 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id go8sm448460pjb.56.2020.11.19.11.24.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 11:24:40 -0800 (PST)
Subject: Re: [RFC 02/15] target/riscv: rvb: count leading/trailing zeros
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-3-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <966e5e0c-273a-87f2-3f2e-f933e2b4f9b1@linaro.org>
Date: Thu, 19 Nov 2020 11:24:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-3-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
X-List-Received-Date: Thu, 19 Nov 2020 19:24:50 -0000

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> +static bool gen_cxzw(DisasContext *ctx, arg_r2 *a,
> +                     void(*func)(TCGv_i32, TCGv_i32, uint32_t))
...
> +static bool gen_cxz(DisasContext *ctx, arg_r2 *a,
> +                    void(*func)(TCGv, TCGv, target_ulong))

I think both of these are unnecessary and you should use the gen_unary that you
introduce in the next patch.  ctz/clz cannot produce a negative number and do
not need extension.

You should simply add wrappers like you do for gen_pcntw to truncate and operate:

static void gen_ctz(TCGv ret, TCGv arg1)
{
    tcg_gen_ctz_tl(ret, arg1, TARGET_LONG_BITS);
}

static void gen_clz(TCGv ret, TCGv arg1)
{
    tcg_gen_clz_tl(ret, arg1, TARGET_LONG_BITS);
}

static void gen_ctzw(TCGv ret, TCGv arg1)
{
    tcg_gen_ori_i64(ret, arg1, MAKE_64BIT_MASK(32, 32));
    tcg_gen_ctz_i64(ret, ret, 32);
}

static void gen_clzw(TCGv ret, TCGv arg1)
{
    tcg_gen_ext32u_i64(ret, arg1);
    tcg_gen_ctz_i64(ret, ret, 64);
    tcg_gen_subi_i64(ret, ret, 32);
}


r~

