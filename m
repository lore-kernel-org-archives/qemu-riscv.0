Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtOu8-0002tn-1v
	for mharc-qemu-riscv@gnu.org; Thu, 09 Jul 2020 01:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jtOu6-0002tB-R4; Thu, 09 Jul 2020 01:15:26 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jtOu5-0000VO-6P; Thu, 09 Jul 2020 01:15:26 -0400
Received: by mail-wm1-x342.google.com with SMTP id l17so509851wmj.0;
 Wed, 08 Jul 2020 22:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tlNwnVg07sRz4ZnF7Z9isIAxV3wtdVDYm4H+VWZDKRM=;
 b=FnCSO38FND6ACEKsTk/PRvH12i0V52ZDBNp37Vf+jFugc1xSlp1QQJeNYO1vEGGi7f
 YUnBj5cLTudnWnnSKML1dLPfG+ffQAPSmyuI+3n8jsT9CSndvvY36Qt7gpo4Yp2Nrxmv
 c6EuAsy6YJRmHZ1kNIpdjmYxXPff1HRRnxjFmIRyz4kbKXzkJi2i8WqdsbSw+5w5COz8
 G/ZcrfBB1vlz7UNmfvDlvEw4w29b3yX4t+xIreh/9thrmgilIn3hsnQ44TKfWe7VoMFI
 DvTNnsFPb46s7yUrZjE8fYXz3hyDltMS2tkFz/b6FUarokdhPZfwOEAq1h5R6KRYGb8Y
 VADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tlNwnVg07sRz4ZnF7Z9isIAxV3wtdVDYm4H+VWZDKRM=;
 b=PU39fv4kXAAxZ3PVi/uCIw6Jj3BStM1XjLufIY4H9PEzZiQdKFBnX8zjvhyj3k4yan
 Xq5iiZM2UFH6xRVSG+czDvpWd2Mw8PgsEiLbGMxTJwWti/ZIWKI0Iik7ZL6r3med5rIZ
 xtzmlCCRKMmdsxkAaenSJSNRFXalNIJtPo8XJ/d6MuCL2aaJ5XoekoCYMAo1Yy8GJ6RV
 GaJQNnldaq9l/xaFePMQa1qkwMRxlwXDCkKqrtvNhdXdEoPjub4rMrLYusJovXOk5I0F
 fHVv3zU8oFuuLi+EQ/1iiGSvoKFsUMX72GCQFKrO+bYA6WmNPBMB3D/AEbDATEGwKz5c
 6NsQ==
X-Gm-Message-State: AOAM5312SmXQbZneqYbYw2Pi4XFCHvLoJvAGePyH4YK08Khlv2HpMKb7
 gB4kzrMZDsghCP6qIZY+zwk=
X-Google-Smtp-Source: ABdhPJx4WbOyPRPj/bm/IUw+MFv5/Q8b8gGkDf+9l3MW4dN7VruA02HlwEY4GHSA8TB5dH+7ui4+yw==
X-Received: by 2002:a1c:2392:: with SMTP id j140mr12146867wmj.6.1594271722845; 
 Wed, 08 Jul 2020 22:15:22 -0700 (PDT)
Received: from [192.168.1.36] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id u15sm3753087wrm.64.2020.07.08.22.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2020 22:15:22 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 1/2] hw/riscv: Modify MROM size to end at 0x10000
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
References: <1594256945-21744-1-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0dbf53ec-da16-1188-900a-b416b92a057f@amsat.org>
Date: Thu, 9 Jul 2020 07:15:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1594256945-21744-1-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 09 Jul 2020 05:15:27 -0000

On 7/9/20 3:09 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present the size of Mask ROM for sifive_u / spike / virt machines
> is set to 0x11000, which ends at an unusual address. This changes the
> size to 0xf000 so that it ends at 0x10000.

Maybe the size is correct but the first 4K are shadowed by the DEBUG
region?

Anyway for QEMU this patch is an improvement, so:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/riscv/sifive_u.c | 2 +-
>  hw/riscv/spike.c    | 2 +-
>  hw/riscv/virt.c     | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index dc46f64..3413369 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -70,7 +70,7 @@ static const struct MemmapEntry {
>      hwaddr size;
>  } sifive_u_memmap[] = {
>      [SIFIVE_U_DEBUG] =    {        0x0,      0x100 },
> -    [SIFIVE_U_MROM] =     {     0x1000,    0x11000 },
> +    [SIFIVE_U_MROM] =     {     0x1000,     0xf000 },
>      [SIFIVE_U_CLINT] =    {  0x2000000,    0x10000 },
>      [SIFIVE_U_L2LIM] =    {  0x8000000,  0x2000000 },
>      [SIFIVE_U_PLIC] =     {  0xc000000,  0x4000000 },
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index a187aa3..ea4be98 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -57,7 +57,7 @@ static const struct MemmapEntry {
>      hwaddr base;
>      hwaddr size;
>  } spike_memmap[] = {
> -    [SPIKE_MROM] =     {     0x1000,    0x11000 },
> +    [SPIKE_MROM] =     {     0x1000,     0xf000 },
>      [SPIKE_CLINT] =    {  0x2000000,    0x10000 },
>      [SPIKE_DRAM] =     { 0x80000000,        0x0 },
>  };
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 5ca49c5..37b8c55 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -53,7 +53,7 @@ static const struct MemmapEntry {
>      hwaddr size;
>  } virt_memmap[] = {
>      [VIRT_DEBUG] =       {        0x0,         0x100 },
> -    [VIRT_MROM] =        {     0x1000,       0x11000 },
> +    [VIRT_MROM] =        {     0x1000,        0xf000 },
>      [VIRT_TEST] =        {   0x100000,        0x1000 },
>      [VIRT_RTC] =         {   0x101000,        0x1000 },
>      [VIRT_CLINT] =       {  0x2000000,       0x10000 },
> 


