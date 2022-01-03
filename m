Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4W6A-0002bT-M3
	for mharc-qemu-riscv@gnu.org; Mon, 03 Jan 2022 17:46:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n4W69-0002ZT-9X; Mon, 03 Jan 2022 17:46:37 -0500
Received: from [2607:f8b0:4864:20::102e] (port=55073
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n4W67-00019U-TI; Mon, 03 Jan 2022 17:46:36 -0500
Received: by mail-pj1-x102e.google.com with SMTP id jw3so29818580pjb.4;
 Mon, 03 Jan 2022 14:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=To+gRMj/GvKn5so04oUoT3AtIhtFbyQ+xZnnLOt1Mnc=;
 b=Rha5klZxNlvIMtLYlMfP9HZqmrS+Lz6UNlgFTe10J9FWwbCukkgSTfH1gv9tFA/Mi/
 6SduBmS/okzsNBTbYfdbTyRxD8dCafKTf0E+wdsToODPLXEeqfYrUjo1o7BDd9FwawmM
 BcLOKzP67BEBhVVO9qxOR6wgAYtybnUnb2xzaIDELjcJhVwJB4BAT9bcXvFwfVkwxEUJ
 eNYxCBOAbOnFM1zP3++2mOnY3Ac/O5oO2XfklSdUVeDg9IjUMpwIOnOZis65IOA5hqi6
 WLPYC3Tj0pZaohzvrpsKh+6NVuFaqhW0UtMwHEK+MwZt9Tal/lfSuUnUREC0CIZInhfJ
 Z9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=To+gRMj/GvKn5so04oUoT3AtIhtFbyQ+xZnnLOt1Mnc=;
 b=oXMcMbNs7T+mPsQ4DYgQpq9eanRduhQSuvsPzLTrw7ToU3nyzURmaR2AoqfrOXT8gM
 VtbkRZB0NyFNdTZMK/FTVW/KRUV1kgVpG+FqSLxQqe5hevJO5eHwzqAsmX2ShiuvAdo7
 YJ6PX1kmWS1W0JdImy9vxxNnOM8gcAqSnklqEMX2UfoLP0TKFJuasjrp9V6oSrB96nuR
 j3CUvVH2A8sK0yMfCK+5sIgFKhUJVHGsiILemvLb8Cb+dTzvADGRl1Lqml/fji4xW7Et
 YUWmB1HuZ1Y9TyDl/u85P7nWVPbiiZb0VhJ23J8vX04RmxU9Iy/kBE4c3RD+Xn2a/41b
 j9ow==
X-Gm-Message-State: AOAM531LSSoDjUZQV92eI/2k4HZ0qmw7jbFtBMYUvQks+wJ65w9t80zA
 QnhO9sUrvlhNT3L6AqN8EZOC5Bac9LmrgNmjlX5i/pRYw5R+UeQG
X-Google-Smtp-Source: ABdhPJzbT+YvJNvDU/oI9BJXbIO/j4Zjg/SieFcQyZ0ieIsw347ymdlg2Umu8XDPuUjF80XThsuZtGSo2Pnnv+OaxO4=
X-Received: by 2002:a17:903:234a:b0:148:a51b:d043 with SMTP id
 c10-20020a170903234a00b00148a51bd043mr46370717plh.105.1641249994320; Mon, 03
 Jan 2022 14:46:34 -0800 (PST)
MIME-Version: 1.0
References: <20211228005236.415583-1-jim.shu@sifive.com>
 <20211228005236.415583-3-jim.shu@sifive.com>
In-Reply-To: <20211228005236.415583-3-jim.shu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 4 Jan 2022 08:46:08 +1000
Message-ID: <CAKmqyKOT76VPd1TdXG-LVz-3nDRbM02AzRSu_n0qYDgVs4E1AA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/dma: sifive_pdma: permit 4/8-byte access size of
 PDMA registers
To: Jim Shu <jim.shu@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Frank Chang <frank.chang@sifive.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 03 Jan 2022 22:46:37 -0000

On Tue, Dec 28, 2021 at 10:54 AM Jim Shu <jim.shu@sifive.com> wrote:
>
> It's obvious that PDMA support 64-bit access of 64-bit registers, and
> in previous commit, we confirm that PDMA support 32-bit access of both
> 32/64-bit registers. Thus, we configure 32/64-bit memory access of
> PDMA registers as valid in general.
>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/dma/sifive_pdma.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
> index b8b198ab4e..731fcdcf89 100644
> --- a/hw/dma/sifive_pdma.c
> +++ b/hw/dma/sifive_pdma.c
> @@ -441,6 +441,10 @@ static const MemoryRegionOps sifive_pdma_ops = {
>      .impl = {
>          .min_access_size = 4,
>          .max_access_size = 8,
> +    },
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 8,
>      }
>  };
>
> --
> 2.25.1
>
>

