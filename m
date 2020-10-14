Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSlig-0008W7-RW
	for mharc-qemu-riscv@gnu.org; Wed, 14 Oct 2020 14:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSlif-0008V5-43
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2020 14:41:49 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSlid-0004kV-FV
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2020 14:41:48 -0400
Received: by mail-pj1-x1032.google.com with SMTP id gv6so246478pjb.4
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2020 11:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i0vAYObnpIFH4p12o6pJGrseH5Je/UJA9BTxb3ZRME8=;
 b=c8/OVvYakMGe4rmPIMuvQLaksWk1X4XPWEREM15eCaSyXATvd2zr45lm8Hb40xpcuB
 mQOJxye1FsCIrQ45OCXof25odPVF/CUCJGR3Cpl8dUW2GBLAoRycm0yLrXhnZoHhMs87
 +6M5cS02iFcdGHFW0uw9UajEb8p/42G1Svuf5/Iyq+OgQRQjLhxDlBBTAGsBIztWgj75
 n5Z1idodHsYyMCT0XKqPPE+whHRkeRjjtdTy3pk22RvgCG4zP/Rb/slLLHmuhBT0HTma
 Afi5FKS9m9oMpcW1O7bskYe8qj1h/78xre1AT4Ti4VoJLMozNZFOpHlNqcFGJTszGZuA
 0vNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i0vAYObnpIFH4p12o6pJGrseH5Je/UJA9BTxb3ZRME8=;
 b=rbTmZo9mthhZOKMhUQjLVviQ8w1ict8Lm4us+li7yXcKPfISEUHEPOvM6Ibcl2eY7q
 A5lNXMbQK4bNNdH/FwLomYO2j3BZQkMvqNm/8JcpyTkbSA/jPcjm8at+ND3N0kU4j3dr
 r2ydII4EuFibCZhjvviuGDAHqyieg+KINb3ivw5Splgl2Q0O6Je/0oP7xraXf6Mkg7JD
 dwQuOlv+s6Fzu6egdrLEkDLF3mgC9g1ofbIdyJS9R39RE6hTurF5rX5jEY0rUcUQ4noL
 29TIi//h402emu2kkI7WE1ynLIOhRXv3hhS5mE64aWK12oRXe2Bt4d+u/4boP5eJrAkv
 1e9g==
X-Gm-Message-State: AOAM531+wMicd/9K5zYP8vsnXDj0CcxKxXNWL7ACZ6A4NnVXraAuw56+
 8QidEiOlN+InQSQVj/7yvY2KaQ==
X-Google-Smtp-Source: ABdhPJwlzouQwkpgLuppffpK7HIb87c+D8BnClYecn6cJF3B3RVOAPVimvpu1nIuAr/dy8ne7meBrA==
X-Received: by 2002:a17:902:7c93:b029:d4:e1c3:bde0 with SMTP id
 y19-20020a1709027c93b02900d4e1c3bde0mr359548pll.85.1602700905283; 
 Wed, 14 Oct 2020 11:41:45 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id fy24sm227781pjb.35.2020.10.14.11.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2020 11:41:44 -0700 (PDT)
Subject: Re: [PATCH 3/5] [RISCV_PM] Print new PM CSRs in QEMU logs
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, Alistair Francis
 <Alistair.Francis@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20201014170159.26932-1-space.monkey.delivers@gmail.com>
 <20201014170159.26932-4-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3395cef5-79d4-078a-29ad-48639e4cd56d@linaro.org>
Date: Wed, 14 Oct 2020 11:41:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201014170159.26932-4-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 14 Oct 2020 18:41:49 -0000

On 10/14/20 10:01 AM, Alexey Baturo wrote:
> +    if (riscv_has_ext(env, RVH)) {

RVJ.

> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mmte    ", env->mmte);
> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "upmbase ", env->upmbase);
> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "spmbase ", env->spmbase);
> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mpmbase ", env->mpmbase);
> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "upmmask ", env->upmmask);
> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "spmmask ", env->spmmask);
> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mpmmask ", env->mpmmask);

Probably you only want to dump the set that's current.


r~

