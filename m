Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3ijb-00077y-VZ
	for mharc-qemu-riscv@gnu.org; Sun, 24 Jan 2021 11:59:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ijW-00077b-UF; Sun, 24 Jan 2021 11:59:27 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ijU-0002Jm-Eb; Sun, 24 Jan 2021 11:59:25 -0500
Received: by mail-wm1-x332.google.com with SMTP id e15so8709867wme.0;
 Sun, 24 Jan 2021 08:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SCAq6CAjdh/kM64lLJ1dLKCXFmD06g9cO4Vtg8iHNZ4=;
 b=RTxjAQrDKYnOPKhnO2RTmhcOoL9YC3X6GKhgVEwcN3bBWorUDse8aCtXKxaOVYko/u
 HoOOiCRf96JWY7J+GG7bgqiwP9NxGExxmOcul5P7VeXrDFee2HXwZPQyG48iLhcpWYcj
 4+rl0PLLLvkDsSoyXyLedxAbAphMcKByCo9P/VOVgMdDl1KZdc6umtvLh8aIlPYrqwLG
 Um45Ra8hsfskaTeKzM5CuJ4ev2JhRjrWpuaSMzc0al0KF5ME5Q0artk8Es4SmDPzYMfg
 AmjOx9gYUVrPQeRysdbqWm4dgyOUwlFT2T43e2zb1I5jB6ApSQNNbpYdt6PZp7S8SHyw
 r5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SCAq6CAjdh/kM64lLJ1dLKCXFmD06g9cO4Vtg8iHNZ4=;
 b=cNH4yOkmFrnIUYLuBmOuE0TvMxb4qOs5ekAxmuxtY2hbPxr5IVrDgxki5LRyJjrdcc
 C87tR2Fpbn0+Y4Ittg+InSdYpkOrf2Wvso0zQk0QHxMLT6um8NrfcajvFWfQD3e09GG/
 HApysTcXlIuiLcDqr1QCx7YJJ3ccRS7FED/xqQRTloWMpaaGE//p2QWXqnkv3Y4ObeRj
 EYLyS7T9DZx6BCc1LstOXArvugy1R9XhnsOok5FNAAWCECjUudg8XjWYBQTABKo40hua
 j4VE/gUZDyneT0EIR1GKzqnghgJjr4jIa7B00WDI1sjQVP6GIHt3CSI89LOVFrMD1XhA
 6mrw==
X-Gm-Message-State: AOAM532HuYiwrTNTMH3+NOV7ta0MUtKo6eJUTEvaZJM3p7y+TBJBraPC
 UbrzbXLVxoLU+Gy+sIWabTI=
X-Google-Smtp-Source: ABdhPJzSgW8R9dB1FMyk+YrU4aAFqJEwZjEsRtZubd91j+J0XUlp4pFtSF1iQ9y9MXP3Thx/LEGNhw==
X-Received: by 2002:a05:600c:1911:: with SMTP id
 j17mr49512wmq.63.1611507562254; 
 Sun, 24 Jan 2021 08:59:22 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id h9sm18154008wme.11.2021.01.24.08.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 08:59:21 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 18/25] hw/sd: ssi-sd: Bump up version ids of
 VMStateDescription
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-19-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <634d629a-999d-b1e2-28dc-f9b49f9918a7@amsat.org>
Date: Sun, 24 Jan 2021 17:59:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210123104016.17485-19-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 24 Jan 2021 16:59:29 -0000

On 1/23/21 11:40 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> With all these fixes and improvements, there is no way for the
> VMStateDescription to keep backward compatibility. We will have
> to bump up version ids.

Unfortunately this breaks bisectability (think about downstream
distributions cherry-picking patches individually).

I don't think there is a problem increasing 2 -> 3 -> 4 -> 5
(Cc'ed David in case). Could you respin increasing the version
on each VMState change?

> 
> The s->mode check in the post_load() hook is also updated.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v2:
> - new patch: bump up version ids of VMStateDescription
> 
>  hw/sd/ssi-sd.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> index ee4fbc3dfe..0c507f3ec5 100644
> --- a/hw/sd/ssi-sd.c
> +++ b/hw/sd/ssi-sd.c
> @@ -4,6 +4,11 @@
>   * Copyright (c) 2007-2009 CodeSourcery.
>   * Written by Paul Brook
>   *
> + * Copyright (c) 2021 Wind River Systems, Inc.
> + * Improved by Bin Meng <bin.meng@windriver.com>
> + *
> + * Validated with U-Boot v2021.01 and Linux v5.10 mmc_spi driver
> + *
>   * This code is licensed under the GNU GPL v2.
>   *
>   * Contributions after 2012-01-13 are licensed under the terms of the
> @@ -319,7 +324,7 @@ static int ssi_sd_post_load(void *opaque, int version_id)
>  {
>      ssi_sd_state *s = (ssi_sd_state *)opaque;
>  
> -    if (s->mode > SSI_SD_DATA_READ) {
> +    if (s->mode > SSI_SD_SKIP_CRC16) {
>          return -EINVAL;
>      }
>      if (s->mode == SSI_SD_CMDARG &&
> @@ -337,8 +342,8 @@ static int ssi_sd_post_load(void *opaque, int version_id)
>  
>  static const VMStateDescription vmstate_ssi_sd = {
>      .name = "ssi_sd",
> -    .version_id = 2,
> -    .minimum_version_id = 2,
> +    .version_id = 3,
> +    .minimum_version_id = 3,
>      .post_load = ssi_sd_post_load,
>      .fields = (VMStateField []) {
>          VMSTATE_UINT32(mode, ssi_sd_state),
> 

