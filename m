Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUQs3-0003aT-CC
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 06:31:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUQrz-0003Zp-Hb
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 06:31:39 -0500
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUQrx-0005lo-UQ
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 06:31:39 -0500
Received: by mail-oo1-xc30.google.com with SMTP id
 26-20020a4ae1ba000000b005200f75cb0cso465648ooy.6
 for <qemu-riscv@nongnu.org>; Tue, 21 Feb 2023 03:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lb432FcfnU0yb2NpmU1uIwX8oPKNQ4sJspikV5whGSs=;
 b=EpTQIFWyCtIqW6c/du0a6qS/3ezacvJiwA8gBwuDPo2BI0umfr63FHzlqQw2Yal/0m
 zx2OhbbQKEhCNCFCFM3Pa2TtEJEWGKjBK62XrxXQylAHhwNjNOthGU9/wRjh/mo4I7Lg
 /ZMjtJ3SJme5/1VaN/xVdQM+QmF7cfl39WuKQXlo9FRtxF34ByOMEvRqe2h5cKn44t7y
 SgZPn9JGNlNJGC/LaGWiiovJsIxvilmCUT3Udc8xqSuGPUS4O5WY8fzdENBPwmc2gDlT
 QoGi6W3XTCYw9DLguNji3wvF/Z4y50O3MNizxa/4yUtCe8eISQAMM7M44t622rXTUOEy
 h4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lb432FcfnU0yb2NpmU1uIwX8oPKNQ4sJspikV5whGSs=;
 b=T3VyhxUNFss8TVWouOoNua9KzsF3qmmRn+U3hDpIFPKwx9cTnSUSJU0g6yfov6qM4C
 v8LEhnQvcRa08zTcCoozDt4Y/ct2h2QhhzgbnPJ6dZVclDR5Q2B2EuXlIx1ORIFVVXhC
 npRRaVK3co/tzeF0pRx8nqCjnn/4t1iX5lHcjS/6s5nYUkHLc2SGPd+RzwQHemoFT2ak
 M+C1+F14cmr6Fui0BALcIngAVq+I/wCOiKFpwJA+0UacEeHvo/mSMIb072jSdV48A1mI
 0wsvyIY39JmCj8cz+ScSPGxcwN3Q+JYCRIBOdCDSnL0mFTeqkmxVzLBOkDy4SIVuA7sD
 MZSg==
X-Gm-Message-State: AO0yUKVxpHlf7iToXCD3hmGGD/uMjV+b5p42vP/BFSVw1UzreFJSznt6
 p/dvMBzUxUABmcuY/TYAMO82pg==
X-Google-Smtp-Source: AK7set9n+pE1iCwuSl5c6R5MDW2Kl9MMvWodBoRl2hC7gtQ8cGrNG2IRNBEO1GB9GCdoeqtnmPVtVw==
X-Received: by 2002:a4a:d485:0:b0:4f2:8f8:d2ff with SMTP id
 o5-20020a4ad485000000b004f208f8d2ffmr1742386oos.6.1676979096219; 
 Tue, 21 Feb 2023 03:31:36 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a4ae9f0000000b00516d4eac864sm487059ooc.29.2023.02.21.03.31.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 03:31:35 -0800 (PST)
Message-ID: <3a5af4b2-21a1-ba64-df8f-349b91488206@ventanamicro.com>
Date: Tue, 21 Feb 2023 08:31:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] hw/riscv: Skip re-generating DT nodes for a given DTB
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org
References: <20230221061204.1658306-1-bmeng@tinylab.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230221061204.1658306-1-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 21 Feb 2023 11:31:39 -0000



On 2/21/23 03:12, Bin Meng wrote:
> Lanuch qemu-system-riscv64 with a given dtb for 'sifive_u' and 'virt'
> machines, QEMU complains:
> 
>    qemu_fdt_add_subnode: Failed to create subnode /soc: FDT_ERR_EXISTS
> 
> The whole DT generation logic should be skipped when a given DTB is
> present.
> 
> Fixes: b1f19f238cae ("hw/riscv: write bootargs 'chosen' FDT after riscv_load_kernel()")

Thanks for cleaning my mess :)

I was wondering whether we should move the ms->dtb verification/load bits outside of
create_fdt(), and put it explicitly in sifive_u_machine_init() and virt_machine_init().
Like this:

     /* load/create device tree*/
     if (ms->dtb) {
         ms->fdt = load_device_tree(ms->dtb, &s->fdt_size);
         if (!ms->fdt) {
             error_report("load_device_tree() failed");
             exit(1);
         }
     } else {
         create_fdt(s, memmap);
     }


This looks clearer to me because create_fdt() will actually create a fdt, not load or create
a fdt. create_fdt() from spike works this way.

I'll leave to your discretion. The patch is already good enough as is.


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
> 
>   hw/riscv/sifive_u.c | 1 +
>   hw/riscv/virt.c     | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index ad3bb35b34..76db5ed3dd 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -118,6 +118,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>               error_report("load_device_tree() failed");
>               exit(1);
>           }
> +        return;
>       } else {
>           fdt = ms->fdt = create_device_tree(&fdt_size);
>           if (!fdt) {
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 86c4adc0c9..0c7b4a1e46 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1014,6 +1014,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
>               error_report("load_device_tree() failed");
>               exit(1);
>           }
> +        return;
>       } else {
>           ms->fdt = create_device_tree(&s->fdt_size);
>           if (!ms->fdt) {

