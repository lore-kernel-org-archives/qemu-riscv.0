Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrdZl-0008LB-6H
	for mharc-qemu-riscv@gnu.org; Mon, 29 Nov 2021 05:07:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrdZj-0008L0-Av
 for qemu-riscv@nongnu.org; Mon, 29 Nov 2021 05:07:55 -0500
Received: from [2a00:1450:4864:20::42c] (port=36763
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrdZh-000838-GJ
 for qemu-riscv@nongnu.org; Mon, 29 Nov 2021 05:07:54 -0500
Received: by mail-wr1-x42c.google.com with SMTP id s13so35561524wrb.3
 for <qemu-riscv@nongnu.org>; Mon, 29 Nov 2021 02:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EXfVJfqK3e3pqraXoVewEdOYrWyulMFLMp70dCoJZNs=;
 b=nLSxsceTCvosd9bo85tU2/xJeJt3iMdsKim65cylSgnWasR04kAWbYTnstWCAuRqSZ
 4vwgHhEDvoj7atBMrjulqx+1FNEs2oZNd9Ym4IisPdipzi0Aua4KmUV0N/O+ajI5a4oU
 ssVzDZfTgUqjUrkZR4uKGgBHkelCStbXwo74lkDaG+AK3qKT1NwaSj4qNI08vxQqr75o
 RRQpW39pVlR/zcHiwtFZSW0ks6kTmevUH+EdeMzq5a5yesKX56gDHb1QsiFYey0jadWa
 veFFfQoqYyglRG5PrJGqQc1E/wzLaQsTvnlpPbIvQDzxAuyB6bNrT5BCIwykoUc+tC8v
 zKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EXfVJfqK3e3pqraXoVewEdOYrWyulMFLMp70dCoJZNs=;
 b=FgK9PVebZxwyMA3lmEDgu2NDblnAMBoY7gjz7l5GQVYfK2hlpqXjndlxEZI3U8O1dB
 aUTy09Zd5ylcn4rvRYroWWFYWjE+zNFa56a84waKEk8k2+wk/2YJ13cRFA11TdBGDGKs
 GabezepcCCGJwT2Yb7kRKpQTVplkNHBl83GpHQKFmMiqhe9c4hOFRvV+x5JRmIKoEe5G
 v+7Qc/WF0+0b3dYidfrzmwZnqaZ/9Wq31RNKp8sG+/9LRW1ZbclU6C1jkOSU0cwNzeqF
 c94oTKhCRfYKbz/kAor/Le3JhcfGzeLg74g3ShLjgEXx3Ns9+n0JqJNpbb8GHkHuVw/K
 lR9g==
X-Gm-Message-State: AOAM531A/rrz/w1j37BESzTo7sFom9eAs6eDqKjAJj3ZOqZqrGCRmdTX
 nv1q18it9BuhbrFS4qusoInGAA==
X-Google-Smtp-Source: ABdhPJxUaWkKJZmZJ8H1LjG4D5Jp2GGIJlwoPAOuoMsLQQXmnuDx01TrDqLhnCiYDtt3Ie+LnGLUiw==
X-Received: by 2002:a5d:4d51:: with SMTP id a17mr30903499wru.384.1638180471641; 
 Mon, 29 Nov 2021 02:07:51 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id j18sm1585507wmq.44.2021.11.29.02.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 02:07:50 -0800 (PST)
Subject: Re: [PATCH v6 03/18] qemu/int128: addition of div/rem 128-bit
 operations
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211128135719.50444-4-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a37bf796-567e-2331-be42-38f756b105cd@linaro.org>
Date: Mon, 29 Nov 2021 11:07:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211128135719.50444-4-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 29 Nov 2021 10:07:55 -0000

On 11/28/21 2:57 PM, Frédéric Pétrot wrote:
> --- /dev/null
> +++ b/util/int128.c
> @@ -0,0 +1,145 @@
> +#include "qemu/osdep.h"
> +#include "qemu/host-utils.h"
> +#include "qemu/int128.h"

Missing file header and copyright boilerplate.

> +#ifdef CONFIG_INT128
> +
> +Int128 int128_divu(Int128 a, Int128 b)
> +{
> +    return (__uint128_t)a / (__uint128_t)b;
> +}
> +
> +Int128 int128_remu(Int128 a, Int128 b)
> +{
> +    return (__uint128_t)a % (__uint128_t)b;
> +}
> +
> +Int128 int128_divs(Int128 a, Int128 b)
> +{
> +    return a / b;
> +}
> +
> +Int128 int128_rems(Int128 a, Int128 b)
> +{
> +    return a % b;
> +}

I think we should simply expose these inline, and let the compiler call its runtime 
function directly.


r~

