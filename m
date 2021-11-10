Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mklpg-0003ut-16
	for mharc-qemu-riscv@gnu.org; Wed, 10 Nov 2021 06:32:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mklpc-0003r0-PC
 for qemu-riscv@nongnu.org; Wed, 10 Nov 2021 06:31:56 -0500
Received: from [2a00:1450:4864:20::336] (port=40647
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mklpb-0007V6-8V
 for qemu-riscv@nongnu.org; Wed, 10 Nov 2021 06:31:56 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so3594496wmb.5
 for <qemu-riscv@nongnu.org>; Wed, 10 Nov 2021 03:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GpT5Vgn46qco/QbqL3TPeFY6gev9zMkidHKtnQBQiqE=;
 b=eTVF20Xxl0s+XKKee9OxOOf9I/3V/JPlbrAClRXuzp4ApZivT/IauRDcyU33dksP+h
 +8e7udyXUEgGL7K6jxkUEwUtCb3lsMTJ3Sz4AUtI7ZMZGq25aznkEOfOlfFtpMJ0LPTe
 iqf469qZ59EJckZLUVzsgG+DwUwkGXY1dio0BLpn/O5OnHLyZXJU28ZRSSpSLB1n3KVW
 k4HQlcdQStY3wlfPs4x/7ggboBpkjCwZceUI9jCcxEL6GLTOhUCKVgWkMkJGJ+vkA1gH
 RHeI9Y0BawMik29TKOqOuea9YoOjzbKGI6zGPsKzPqfz6S7Noxm7CG3AkXjbn92Pv19a
 SeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GpT5Vgn46qco/QbqL3TPeFY6gev9zMkidHKtnQBQiqE=;
 b=rEDgGHTlMCwYUf1y1OEL1XmD5+GqhXYsDxAcxs1x6t6aQXAC1H4mo3m5lem2hOmVLj
 MeTPYFZaPrYZNkMFHE8bgcrv7Ehh4lgRXhc/gyngI/Fd6wvHKzwWAD7kKTFYnok8wSEj
 21/UGWLbn8YOiNU3PhRIqL0ksUMc2GB67truvvO5RvXuldBWSLNvVt1FvRQdqrYukgIx
 5N202Gmg4C+WIksnaTCRbPe0AuOYDVhj5CPijlPfxly5jaTIifT7QcycQ3btyE03m3ey
 eT55CuTLmA8UpKkhEIzMQg0NhyNz2Qt3h/BKHmihab5t0lSxfXINhy4+dQ4UPwNHAxkH
 qSbg==
X-Gm-Message-State: AOAM5339J34rnNnTJAxn1O9EDSKmaQ40XDHymR1UpmI1Wshvg62rV8N9
 Rg1vlZoicjBWOCA4mbWuTDWA0g==
X-Google-Smtp-Source: ABdhPJxKSUSDA2nkwGFAGOT/qyDLeF+CuS1Tujewfi7SPkkb/mqtckau4QzakRXstuET+zAECNfRJw==
X-Received: by 2002:a05:600c:4108:: with SMTP id
 j8mr15437677wmi.139.1636543913761; 
 Wed, 10 Nov 2021 03:31:53 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id u23sm16402438wru.21.2021.11.10.03.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 03:31:53 -0800 (PST)
Subject: Re: [PATCH v2 09/14] target/riscv: Relax debug check for pm write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alexey Baturo <baturo.alexey@gmail.com>
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-10-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3dcee028-4020-b8ca-e98c-92af22a5ed9a@linaro.org>
Date: Wed, 10 Nov 2021 12:31:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110070452.48539-10-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
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
X-List-Received-Date: Wed, 10 Nov 2021 11:31:57 -0000

On 11/10/21 8:04 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/csr.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9f41954894..74c0b788fd 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1445,6 +1445,9 @@ static bool check_pm_current_disabled(CPURISCVState *env, int csrno)
>       int csr_priv = get_field(csrno, 0x300);
>       int pm_current;
>   
> +    if (env->debugger) {
> +        return false;
> +    }
>       /*
>        * If priv lvls differ that means we're accessing csr from higher priv lvl,
>        * so allow the access

Seems reasonable.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

