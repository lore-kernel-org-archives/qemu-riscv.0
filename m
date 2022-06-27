Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o5pKr-0004qj-8L
	for mharc-qemu-riscv@gnu.org; Mon, 27 Jun 2022 10:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o5pKp-0004p2-Ux; Mon, 27 Jun 2022 10:03:27 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:34579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o5pKl-00070R-Vz; Mon, 27 Jun 2022 10:03:26 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id t16so14883039qvh.1;
 Mon, 27 Jun 2022 07:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hEKzFTDXl73R/avhdjm1AghHuuMtVzKGAZrRfKUqK/s=;
 b=mpepH2sxWEdtCGVMU07b37EG0MfMYj+hclhDCM++QoWVd+hV7qzU9Wv9WUFzn8StF/
 YW8p70msJQRNucGrWtxU8QxIRZ080FPbIY4RSNobaG77E2eHSixbR54Pr7oak4PNvlGT
 ci+QNLTLqelwO5T9vIcmUbeZVd7FT0j2uxQjC2xwxGdCMPzUqGXs2vb6B1DyrueCuZH/
 SGJ0ZZ+TS+O3TMfqSLlTGsckSXDbz5DNnK3KoXhGcyyhrN5jz4cdWAxHiyinU6LrjvwJ
 6y2gD4oyZBJr7QWwov+MBg8PMEoh02pRDwds6TUY+f+X09hfy3LzjOjy1FSOWxNBR0+/
 Uarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hEKzFTDXl73R/avhdjm1AghHuuMtVzKGAZrRfKUqK/s=;
 b=U2LASUUw2x0ls2N5EOuY3YL70dgbGHHmBAiDgHgKVrTIpp/2XuCnTaYuCFqq3YeUeV
 qkcJs6N5l/9MGMlsSrcc0yUqApWRZdmI0JCrqbEX/lW6jsACOWMRz1YdhvzzwWLOOOEI
 m2j5lHJU8IjY4ybtASvlCq98KEZKY1WJhuo0SGpdWWKItLS/J2RCyE0kIxerI9z0k3p6
 eoPHuKieTJ9uI3F0wZ6ycrV2JZemsHMZCAZ1x5Z7BzsqhTE9EN3kXfHBTF1kSbMt3IBP
 W2nKmqBQ+RL6R7UHqCAEyzCfYIxvTjLvpy4gNvgvXzO1wFjg79oas8JLF0k8dsRPRaxe
 HGOg==
X-Gm-Message-State: AJIora+tTAQRbXXECupqiRTaR3de1RXZMJNN/TyBcsceve2D5NGg4qKm
 7yqqzuCh0QtOHzabHVhQ2D5l55zram2OqqYmV6A=
X-Google-Smtp-Source: AGRyM1tMxOEJJ5bc4Ss5uxpIUn5NVB1eJmgVEHzOSOdZmr+l2JGaS+VoNKEYxkVYMJDQsc8/Ja5aYrMw8GOmtAnu9zw=
X-Received: by 2002:a05:622a:14f:b0:31b:a118:8833 with SMTP id
 v15-20020a05622a014f00b0031ba1188833mr1080448qtw.543.1656338600550; Mon, 27
 Jun 2022 07:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220608062015.317894-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220608062015.317894-1-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 27 Jun 2022 22:03:08 +0800
Message-ID: <CAEUhbmW+4r75w0rL1=ho_28HyFWX-ZnnsXpC9-ZsOzrGZ9MDzg@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: boot: Reduce FDT address alignment constraints
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 27 Jun 2022 14:03:28 -0000

On Wed, Jun 8, 2022 at 2:20 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> We previously stored the device tree at a 16MB alignment from the end of
> memory (or 3GB). This means we need at least 16MB of memory to be able
> to do this. We don't actually need the FDT to be 16MB aligned, so let's
> drop it down to 2MB so that we can support systems with less memory,
> while also allowing FDT size expansion.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/992
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/boot.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>

Tested booting Linux 64-bit/32-bit v5.18 kernel, VxWorks 7
64-bit/32-bit 22.06 release kernel
Tested-by: Bin Meng <bin.meng@windriver.com>

