Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPAOG-0005Nu-K1
	for mharc-qemu-riscv@gnu.org; Mon, 06 Feb 2023 17:55:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pPAOE-0005NI-U2; Mon, 06 Feb 2023 17:55:10 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pPAOA-0007cH-0c; Mon, 06 Feb 2023 17:55:10 -0500
Received: by mail-vs1-xe34.google.com with SMTP id p10so14420449vsu.5;
 Mon, 06 Feb 2023 14:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PQc8Z/zxeTUriV10mm3ekb3FX6wcTxN4DAD0TX8s1Ro=;
 b=WNISBLD3xCIQMBXhSHiK25Hu+2MJl8U8LXhpJWoIkgh8g1tUjXnigVsN4P1OHz51CD
 eGToo++fl5+Zb9ZZ7crM3P595ILb9INYkWqDwEAkLbKxKfjawQ2CjZzlRXu5XboXG1YE
 To50ElAf+B+ZaVGIhbnxAi92gnJc6y0Fn345EtA/zh/Yz5ATnD6KXeA7h2J8ftID3Cac
 RvaTF3/GH9FY8npmr2KcNq9OnqZ1Vf7NtF3bB4+wnDqFvEveL86tFuykmSDHrzW+Says
 aNqbjkej+gpO5zQqQBbdjLUFtl1LhW45p/cHyGbGqiSxFdVH7s+MMv/35y6ha09rvVTX
 m4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PQc8Z/zxeTUriV10mm3ekb3FX6wcTxN4DAD0TX8s1Ro=;
 b=KBtmfx+DX1LWVe/B1LRSPZmw6ZWjcL7K1FH6Zj+0fxu06dltgqJmk+t3OMWRTaGcWw
 b8+XaJ95L3P0yv6J2LmsZgPETUUohwjzHgdpS1ZEgfWCL2NynYooN9PbkESeT/pp53u4
 k+D33HtJRrnUw3fNCcZiqs+6wLDAwkA2HGpi5RD8rkwRwzAokkT/bxNE0xBzFfAXfz/2
 cDca9W5+ZkxBJSGjET6020s0Cy6lAFCKch4QlsssUgLiOvCzyHdG/ljkGGvrm2yiJv9C
 ZFtx/X7vMbXsPhNVW6tz+teCTfa3F/lOw1QWOJgeXKj8zMXlK705sIk/br/lIrEZTtH7
 bUQA==
X-Gm-Message-State: AO0yUKUA0tLiBbo0GsYZXL59D1ICTjMfs8DQ61M54ZtgF3I5t/x+qGlq
 LB4hSZHnYHRl2m0T76pGF74jU74iftRfthCpYRE=
X-Google-Smtp-Source: AK7set9FT2U2v8grzYo/x65bBLL+D7GhP+sH9Zau7+UMObPjIVLWUT8k3uX+16vGq2r/sCeUWffKMW2C3QcTOBwqNAc=
X-Received: by 2002:a67:c297:0:b0:3fe:5a64:f8ea with SMTP id
 k23-20020a67c297000000b003fe5a64f8eamr262867vsj.54.1675724104404; Mon, 06 Feb
 2023 14:55:04 -0800 (PST)
MIME-Version: 1.0
References: <20230206140022.2748401-1-dbarboza@ventanamicro.com>
 <20230206140022.2748401-3-dbarboza@ventanamicro.com>
 <21b58cf5-af07-95e3-8253-29d5b12d12e1@linaro.org>
 <b3105db2-d36b-b12c-fd0b-863cf82f938f@ventanamicro.com>
In-Reply-To: <b3105db2-d36b-b12c-fd0b-863cf82f938f@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 7 Feb 2023 08:54:38 +1000
Message-ID: <CAKmqyKPbLr-oKfB=C0QsAsBDozHcBz006LCyMCuHPkzuiEyhWA@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng@tinylab.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 06 Feb 2023 22:55:11 -0000

On Tue, Feb 7, 2023 at 6:19 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 2/6/23 16:54, Richard Henderson wrote:
> > On 2/6/23 04:00, Daniel Henrique Barboza wrote:
> >> To not change the behavior of boards that aren't calling
> >> riscv_load_init(), add an 'load_initrd' flag to riscv_load_kernel() and
> >> allow these boards to opt out from initrd loading.
> >
> > Surely this is simply a bug for those boards.
> >
> > I cannot believe, for instance, that sifive_u should allow initrd and sifive_e must not.
> >
> > Backward compatible behaviour is had simply by not providing the command-line argument.
>
> That makes sense but the question here is whether the sifive_e board supports
> -initrd if the option is provided. I tend to believe that it does, and the current
> code state is mostly an oversight (we forgot to add load_initrd() support for the
> board) rather than an intentional design choice, but since I'm not sure about
> it I opted for playing it safe.
>
> If someone can guarantee that the sifive_e and the opentitan boards are capable of
> -initrd loading I can re-send this patch without the 'load_initrd' flag.

Those boards can only boot small scale RTOS-like OSes or baremetal
code. Which is why they don't support the -initrd option.

I guess there isn't much harm in allowing an initrd, although I'm not
really sure when it would be used.

Alistair

>
>
> Thanks,
>
> Daniel
>
> >
> >
> > r~
>

