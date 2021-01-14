Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzqVb-0005Rm-Bf
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 19:29:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzqVa-0005RM-1x
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 19:29:02 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzqVY-0000KT-3H
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 19:29:01 -0500
Received: by mail-pl1-x62f.google.com with SMTP id q4so2018015plr.7
 for <qemu-riscv@nongnu.org>; Wed, 13 Jan 2021 16:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5nMYmMTdVYgu7E6Wqq3JcuqKHISmWZCZhp0OGnyFcyo=;
 b=HxR3kavm8p+Gx1nK94zFXnLNNG3rFoepgBl5PFPNVP0mu9+bUPJyMp6IZDytB8CVq4
 Kbh+n9PEN35PW8bDBUgj6/zSGsZ7BZqbNzWzzW7m77F7bH53exJC4vgjBOAB2UszAfZs
 4UTsodqy/exJZ3184PZ27sOxAoIJWONSAv5D8wJ6xiDXhei9xdErSexJtYKU49HFxaXh
 ygp7462j1+WPQXehY9tHL4O1c2xcsj3ya5sEgrHWaQ2TP0GQ/psWSNAZhFY6oOxABT6n
 U9W4yei/2zTEgfbtAv/jd49JEdi2yWxkeNV14y+ajq/8MpGJd2izDDV8GLIOFNFLXsdN
 u64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5nMYmMTdVYgu7E6Wqq3JcuqKHISmWZCZhp0OGnyFcyo=;
 b=Tytl2Sx02yNjn3+mOdwNCjvbn8aJ4Y4NpNfL62FSQ5YgAQtUT+MlIJn16w5DXq8A11
 ksvrHiPPvn31s+rfygSW1EQBLEfCWecN6n0HNatG4srfGSSAhuDzG1yEs1l9E7Vq62sc
 CUGMwKaS2CdmNd2uUAcDxX6JrWtcRoDSFxW39Bm+wGKJXk6Q+mU1FIwsaWZvJRZ7BdGV
 3QRjOhRYZhHLVyNjBaNIqDnZehH+ciLMxRVGJ8OFqrpJ6t7no7NiFKGDqOPAbCtJY3W6
 MvOZXBpXKPzy10GMhaNLKGGhuCfZ4og46ZYKfq0IvFPB+Ycb1HdfZvyknWxSdgyU3Rnf
 nYhw==
X-Gm-Message-State: AOAM533k7YcbTX7FInJ0emouSM1HqujyZdODfBB6FLHmf9Willrm43br
 djw4DYM8ZPiXI6XtN7so6QhfGg==
X-Google-Smtp-Source: ABdhPJx2FGpdG2pjT7DZMnjgfjwT3keDZBzf/+JnMxBxApbCQPB5I7ntLECVgdGWSUtRm3CeONDNMA==
X-Received: by 2002:a17:90b:23d6:: with SMTP id
 md22mr1986058pjb.206.1610584137786; 
 Wed, 13 Jan 2021 16:28:57 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id 8sm3427718pfz.93.2021.01.13.16.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 16:28:57 -0800 (PST)
Subject: Re: [PATCH v2 3/6] tcg/ppc: Hoist common argument loads in
 tcg_out_op()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, Cornelia Huck <cohuck@redhat.com>, 
 qemu-arm@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 Stefan Weil <sw@weilnetz.de>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210113172459.2481060-1-f4bug@amsat.org>
 <20210113172459.2481060-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc9f392a-5b4d-899e-f34f-392a3c2b3379@linaro.org>
Date: Wed, 13 Jan 2021 14:28:52 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210113172459.2481060-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Thu, 14 Jan 2021 00:29:02 -0000

On 1/13/21 7:24 AM, Philippe Mathieu-Daudé wrote:
>      case INDEX_op_ld8s_i32:
>      case INDEX_op_ld8s_i64:
> -        tcg_out_mem_long(s, LBZ, LBZX, args[0], args[1], args[2]);
> +        tcg_out_mem_long(s, LBZ, LBZX, a0, a1, a2);
>          tcg_out32(s, EXTSB | RS(args[0]) | RA(args[0]));

Missed replacements.

> -        a0 = args[0], a1 = args[1], a2 = args[2];
>          if (const_args[2]) {

Missed replacement.

>          do_addi_32:
>              tcg_out_mem_long(s, ADDI, ADD, a0, a1, (int32_t)a2);
> @@ -2475,7 +2481,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
>          }
>          break;
>      case INDEX_op_sub_i32:
> -        a0 = args[0], a1 = args[1], a2 = args[2];
>          if (const_args[1]) {
>              if (const_args[2]) {

And again.

Let's just drop the hoisting parts and only do the signature parts for now.
I'd rather think of a way to split up this large function than waste time
optimizing it.


r~

