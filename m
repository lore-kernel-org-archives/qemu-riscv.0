Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kwtUo-000887-VX
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jan 2021 16:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kwtUZ-00086M-Q1; Tue, 05 Jan 2021 16:03:52 -0500
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:43093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kwtUW-0002Wx-LA; Tue, 05 Jan 2021 16:03:46 -0500
Received: by mail-il1-x136.google.com with SMTP id q5so1008067ilc.10;
 Tue, 05 Jan 2021 13:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oZAQOGwJ8B4scWwwj1K7v8w6U0Q9XiKl2UAD6YikBQ8=;
 b=PRK6o1ho+OeFgZtjoegb743VKhof47vCHn6xzvtCK/Wqv1r2BS8iK6mKTP8226tC6Y
 Hw48LXSq5ikVih4UzzALBiopNfcbTI8gntO+d77ko02mJ7fy6AvDMcXfZK/OtTNUaQPo
 HR1OrpuLgaz6kFolZIOJaTuWbmMYOYJQmrypbFoUGGunek31kxelqYWwoHorEbN6/rX4
 a94vfGl3/YUFZLyVDcET1uMwDP2wJUA1lWcrK0ceQxERSgy+nGx0/lHSl7BS7bSW93gB
 CByH9gWwr/WpMW/5qiitr1XEXYv8H1XyRXe4IyNnxKOu0/isOgeegU9JAq5YmRoGS1oi
 xtgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oZAQOGwJ8B4scWwwj1K7v8w6U0Q9XiKl2UAD6YikBQ8=;
 b=U7HH+TrgPFlqVY//pklXoJ/t7aWcSPtrF3o0Rln+fEa9pmR1tfdGcnnqtGdM36HY4v
 Nc7AEDvhzydFRXNZs8jPO3uZ+fzxG//hzWHRkL/JsW8W1Dk6RO91IZVABa3dSqe+SCUa
 190T5I765kBmGVtvEgcgpewAuJZmQO07z/Hoe6pjV3L5CRXLQBgB7nKcS+4eWiI5k+uP
 304qvw8lOpuTWKLavI5e7jbXbmzXJMHu6QDnQOSNZE9oGgbB2BNOYgQKde3ZGa/YB8QS
 UMl6tiP0nBFU8vRVj/veFVCwsrM0tlnb80WwOWXeiVcRkhQRTO0Wv785ZxlypDaXcSvs
 39+A==
X-Gm-Message-State: AOAM532i1jrW8/zWivKRdMKuPtPKAtlGBbu6H5W7wN14ScZiWnxStsl3
 Fx1CKlNXw0NvnjrwZiqnA1U5M5O4Kfbc08TwVbc=
X-Google-Smtp-Source: ABdhPJw2TNZm+1EXP/QYrIMbTfSoQ3M4alVxJ4TLNA6lVlAHShwgaYuTj7AMakRNGyPCxn0yItC1JDAqg85ZmpWxdRs=
X-Received: by 2002:a92:c942:: with SMTP id i2mr1381203ilq.227.1609880621963; 
 Tue, 05 Jan 2021 13:03:41 -0800 (PST)
MIME-Version: 1.0
References: <CAOkUe-BGMmUTtY8bdTgi2Vrmq-pL2O36bY_kmE5rfbv0SQTJmA@mail.gmail.com>
In-Reply-To: <CAOkUe-BGMmUTtY8bdTgi2Vrmq-pL2O36bY_kmE5rfbv0SQTJmA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 5 Jan 2021 13:03:15 -0800
Message-ID: <CAKmqyKO-7x9Ea9xKuAAm5Z0b8zLr0Xqhrwya43iqByhxjeDCGw@mail.gmail.com>
Subject: Re: [PATCH v2] gdb: riscv: Add target description
To: Sylvain Pelissier <sylvain.pelissier@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 05 Jan 2021 21:03:59 -0000

On Wed, Dec 30, 2020 at 12:26 AM Sylvain Pelissier
<sylvain.pelissier@gmail.com> wrote:
>
> Target description is not currently implemented in RISC-V architecture. Thus GDB won't set it properly when attached. The patch implements the target description response.
>
> Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>

Hello,

This patch fails to apply. How did you send the email?

Alistair

> ---
>  target/riscv/cpu.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 254cd83f8b..ed4971978b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -556,6 +556,18 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +static gchar *riscv_gdb_arch_name(CPUState *cs)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +
> +    if (riscv_cpu_is_32bit(env)) {
> +        return g_strdup("riscv:rv32");
> +    } else {
> +        return g_strdup("riscv:rv64");
> +    }
> +}
> +
>  static void riscv_cpu_class_init(ObjectClass *c, void *data)
>  {
>      RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
> @@ -591,6 +603,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      /* For now, mark unmigratable: */
>      cc->vmsd = &vmstate_riscv_cpu;
>  #endif
> +    cc->gdb_arch_name = riscv_gdb_arch_name;
>  #ifdef CONFIG_TCG
>      cc->tcg_initialize = riscv_translate_init;
>      cc->tlb_fill = riscv_cpu_tlb_fill;
> --
> 2.25.1

