Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mklk5-0006Vt-Ig
	for mharc-qemu-riscv@gnu.org; Wed, 10 Nov 2021 06:26:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mklk3-0006US-Oo
 for qemu-riscv@nongnu.org; Wed, 10 Nov 2021 06:26:11 -0500
Received: from [2a00:1450:4864:20::429] (port=36628
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkljr-0006P9-Nt
 for qemu-riscv@nongnu.org; Wed, 10 Nov 2021 06:26:11 -0500
Received: by mail-wr1-x429.google.com with SMTP id s13so3422429wrb.3
 for <qemu-riscv@nongnu.org>; Wed, 10 Nov 2021 03:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AzblpZQ+QAhh3gyQ2UG8jp68IS2t0zhiTvYwpe8eEt8=;
 b=V3T/apX3es3aCt4+i2W39nzW1Pow8MlNJzYK+EhGOgDizKdTTjCtGgJBVn6a77D593
 g/CPmTXzo8cqxYZbC5x1gsKbprkUVXAKW82d7t0mjNRz0NZ5i4w4vpcNAh5x5cVdQT6Y
 JbPNY3+uCZrnPZERFg1EJc+4FxwtlULiZjY1mY7pX6NLmDKl6LGIDU2h4jevLymb2gUe
 rluK7stHrURwfYCKlOoxGVzPcd1BmoY+l+b1/t8YGD3Rdmr1OEK+jPd5YpmLA3iE64CD
 W3YK4FMw3QNo8u5M3CiyTpjGoqT2Pz8u+g2U5PVYwtmYenNQR5dMBkllNaZKhxYhh3/q
 dTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AzblpZQ+QAhh3gyQ2UG8jp68IS2t0zhiTvYwpe8eEt8=;
 b=VODtnRMkYj+xVNGs/b9v07zCwH60qPWnso9i9WzEUKWacs+UYU0i01FozQEMgUxv6w
 IvDDzR8XAbsnpwzbfn10j6xxXzIcNQGzfDXKaGJWJSW1PHrMZkS83W4dYlcdIITKkIFo
 SGZW7ont8N37vYbHYoUqukgZyW/HF0AxzqariwBq/ID4CTqmV3QRwfBFHkVMAed/P+nT
 DF93Vnv6/hxcSwtdWTIFBUsOnZZJD3uHvaszQQdb+RAviHZWxv+Z086mTdPJ7luP6Iod
 fdxxxm7sFN/dwfmXaIYMb15Sc0YP2xSbUjSGfra2RRjCCn+lQgg/KaWHb94VxqJU0IiW
 xnrQ==
X-Gm-Message-State: AOAM533/cSD/9W/WUlBO7QDOwvO6OhjRNB9+zcAX+NYBWIkIVxFmxCwK
 pIeeSEvX8xN6N36gyyZcuh/jmA==
X-Google-Smtp-Source: ABdhPJxc/duGpwaMrqStbz1qA41qGmMTwsxWNzN7rtC8wQLn17dSjuXDDeJuduXbF16so+oxxrxbJA==
X-Received: by 2002:a5d:6843:: with SMTP id o3mr18327993wrw.174.1636543557305; 
 Wed, 10 Nov 2021 03:25:57 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id f8sm6083427wmf.2.2021.11.10.03.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 03:25:56 -0800 (PST)
Subject: Re: [PATCH v2 13/14] target/riscv: Don't save pc when exception return
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-14-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8df24dfc-83cc-39b9-5553-ab272cb7f369@linaro.org>
Date: Wed, 10 Nov 2021 12:25:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110070452.48539-14-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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
X-List-Received-Date: Wed, 10 Nov 2021 11:26:12 -0000

On 11/10/21 8:04 AM, LIU Zhiwei wrote:
> As pc will be written by the xepc in exception return, just ignore
> pc in translation.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/helper.h                          | 4 ++--
>   target/riscv/insn_trans/trans_privileged.c.inc | 7 ++-----
>   target/riscv/op_helper.c                       | 4 ++--
>   3 files changed, 6 insertions(+), 9 deletions(-)

This should be ordered before patch 1, so that it does not appear that you have missed 
places that should use gen_set_pc.


r~

