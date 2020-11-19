Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfpc0-0002xL-Jq
	for mharc-qemu-riscv@gnu.org; Thu, 19 Nov 2020 14:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpbu-0002tk-IE
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 14:28:54 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpbs-0008Te-GG
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 14:28:50 -0500
Received: by mail-pg1-x534.google.com with SMTP id i13so5127324pgm.9
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2020 11:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kHq5qHsmT8tpn6Xj2b0XE3/yFjg30rkFDcIDF853XIQ=;
 b=KSptWN8Z0rBKZacyAERjlik97QjwNowSvGlMbH8I9IWvHgkXreEk0d0owUFIJujZtC
 iXCyRxmMPjqS0Ukar7GOzcP/+jQL7nJNIHLwwQl7q2NvB426VsDo7RR9v8XhII/DQWwo
 OfvUs7WltlKIKEWBFL+JoexOyLpLdtZpeTw7IMrXf5/zuuyXtzCIXqogfgNCu2xYzhPA
 qspfyOL/57PH/GgMxr5jFCa3Qzxz5o+795qb4H6wNrx4BDlLwQuWEIiH7XeRI90e/H6B
 TF16fMU8xVTJdABFjfZ1yH/48bHXMonHD1nQGGiRjmnjP75AyvJffOGjQIR1Si62tMDQ
 hunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kHq5qHsmT8tpn6Xj2b0XE3/yFjg30rkFDcIDF853XIQ=;
 b=lGNhtzUzlVAcpIGG+7lSTH40doM9uE45OaHcQsKxTtsDttkTDIUriS5xniV6uh+ObQ
 SOVb+tHXRlFcXCJME4Le6AmeyYwUYmZ6hfLgOBwzBnb7XaIHZPFxIPh9zli4RbxyQTZW
 7KbaVD1kb5yQLWJfg9Z8iz6ht1CexpcXCzYJkE14NViKLwQYZ5O20QmHsDczi5lhpm8Y
 7BY0cL3EHYoQjI8Gij7mwOPhC3ezvxwKvjl3YZamooqtYyQL3tU8hQGpBsLBxmwUSUFr
 ZWM2xwy1pe74hrWemlWCabvyRdYZyK9sbJTaEMJ3b+dG2PNqVuIQ20IhH9b6F28yqKj4
 MuRg==
X-Gm-Message-State: AOAM533qUeZbx6UJkXgJzUeisIdZRLVEO53fP/zcG9YD92HSxrwFiBEC
 gv7N723rwpN3GKSjzfI3LV/On1hF95SvBw==
X-Google-Smtp-Source: ABdhPJwXv5ulA9THyieZrdFTLZuRKU8cNtf/cQESAvyXfCBHE1B0w20WEU2Wm/XhCtXv47hJ6w56cA==
X-Received: by 2002:aa7:84d0:0:b029:18b:fac7:29b with SMTP id
 x16-20020aa784d00000b029018bfac7029bmr10315413pfn.29.1605814124095; 
 Thu, 19 Nov 2020 11:28:44 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id ga18sm489619pjb.5.2020.11.19.11.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 11:28:43 -0800 (PST)
Subject: Re: [RFC 04/15] target/riscv: rvb: logic-with-negate
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-5-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <03a4ec9b-d609-65b7-ee69-a5cd63f3f6d1@linaro.org>
Date: Thu, 19 Nov 2020 11:28:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-5-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
X-List-Received-Date: Thu, 19 Nov 2020 19:28:54 -0000

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> +static void gen_andn(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t;
> +    t = tcg_temp_new();
> +
> +    tcg_gen_not_tl(t, arg2);
> +    tcg_gen_and_tl(ret, arg1, t);
> +
> +    tcg_temp_free(t);
> +}

This is tcg_gen_andc_tl.

> +static void gen_orn(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t;
> +    t = tcg_temp_new();
> +
> +    tcg_gen_not_tl(t, arg2);
> +    tcg_gen_or_tl(ret, arg1, t);
> +
> +    tcg_temp_free(t);
> +}

This is tcg_gen_orc_tl.

> +static void gen_xnor(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t;
> +    t = tcg_temp_new();
> +
> +    tcg_gen_not_tl(t, arg2);
> +    tcg_gen_xor_tl(ret, arg1, t);
> +
> +    tcg_temp_free(t);
> +}

This is tcg_gen_eqv_tl.


r~

