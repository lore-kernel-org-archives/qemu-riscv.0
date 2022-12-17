Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6LCk-00057h-Pp
	for mharc-qemu-riscv@gnu.org; Fri, 16 Dec 2022 19:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LCf-000566-M5
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 19:37:26 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LCd-00057z-Ag
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 19:37:25 -0500
Received: by mail-pj1-x1035.google.com with SMTP id gt4so4026719pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 16 Dec 2022 16:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fe1IgIwZ3K+ylBSmpis6a0TzukTCeLn9389iiEaj1eE=;
 b=G1xrHZDGCUWksfOGoC6x8UUu/07fvszRAX4hyx3Y8/Ow+VOQievwrhE6xd8ZQO+GX+
 yW11hZIMfFVmoWP5r1P7PB9hi5IAOaWPvXkWBm4P0cTGCkGWAJqrwVFIq8I4MO+S+9HQ
 2iORlYPlcPXcpuZpLByVcMnaD5iHi2BYcnpnhBTiYdo4pszycQdfA5qifBbhUlioGDM3
 PUnpMYDlSSGU0MRaNyYRK6dYS/RIxXr8y6k91LVp83WegXkxURMju5BC+vHyMpGskyHD
 w3YUQGULuJkVezbPi5wDRvxZEcwE8boQwnjjZ0As4di0HigjZ9gtFsW/3vJc+ZeZAEuP
 9y5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fe1IgIwZ3K+ylBSmpis6a0TzukTCeLn9389iiEaj1eE=;
 b=Zx1wCj7MMQnwifQxZzlXKS8Jd/rHnv54e0iPljTXa0LJKGQC8rCvAeK4+vQTZjn+jI
 4eD2hMrfcKIPwze1MCFuVG3MvUYVJHmY19ikSDR0+bcFxFcOvYTPGgfXOOzDWhx9LcDT
 V9c+TcHhkhkKfGpAGNRlSzgURneqZ/a0frSSUs2NTimedWS3y+zuLatEeqzYZxtbKkvX
 WhDDqWPdigyu5XUL+0VMgbujsJ28JbGnshNJgIQFAddGH02R74aDwr0m0Umf7Abv8v2g
 PNa9EaNUkUSYDhrEMXyDBXXDOX8qy/ssmWl0EDpeC2B25TU5SQ6J++bzg3YAe5zkQbhC
 4nOQ==
X-Gm-Message-State: ANoB5pkNdjJ9xNIBEDD5jJWMw+BH3RwutNlkRj6AUcjrGYLDyOwMCdnR
 GImVOHTtsH2ASJP9Cdpt/yLaPw==
X-Google-Smtp-Source: AA0mqf5TmOVwquP0YRNsJxCvWHpG6y2yiwzhTEKP0pLKsK15JRPYQpaEkLdBKpQvRYcxtc2q3KuxRw==
X-Received: by 2002:a17:902:a986:b0:188:bfa7:f8f5 with SMTP id
 bh6-20020a170902a98600b00188bfa7f8f5mr31116307plb.42.1671237441861; 
 Fri, 16 Dec 2022 16:37:21 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a1709029a4c00b00186a2dd3ffdsm2222223plv.15.2022.12.16.16.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:37:21 -0800 (PST)
Message-ID: <eb363663-d968-262f-f985-92329406cb2b@linaro.org>
Date: Fri, 16 Dec 2022 16:37:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 05/10] target/m68k/helper: Include missing "cpu.h" header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Greg Kurz <groug@kaod.org>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20221216220539.7065-1-philmd@linaro.org>
 <20221216220539.7065-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220539.7065-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 17 Dec 2022 00:37:27 -0000

On 12/16/22 14:05, Philippe Mathieu-Daudé wrote:
> 'dh_ctype_fp' is defined as 'FPReg *', itself declared in "cpu.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/m68k/helper.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/m68k/helper.h b/target/m68k/helper.h
> index c9bed2b884..aaf0e1668e 100644
> --- a/target/m68k/helper.h
> +++ b/target/m68k/helper.h
> @@ -1,3 +1,5 @@
> +#include "cpu.h"
> +
>   DEF_HELPER_1(bitrev, i32, i32)
>   DEF_HELPER_1(ff1, i32, i32)
>   DEF_HELPER_FLAGS_2(sats, TCG_CALL_NO_RWG_SE, i32, i32, i32)

No, see patch 1.

r~

