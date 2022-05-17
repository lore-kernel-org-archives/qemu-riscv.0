Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqlCW-0000gx-KC
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 20:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqlCV-0000gl-FQ; Mon, 16 May 2022 20:36:35 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:36602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqlCT-0001uF-UZ; Mon, 16 May 2022 20:36:35 -0400
Received: by mail-io1-xd29.google.com with SMTP id e15so17791759iob.3;
 Mon, 16 May 2022 17:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+Tjezw1r+4C36O7qGAqZbpkDcW240KLtZXPo4/62zW4=;
 b=oInIEpx1y51O/AadnyRjoirMOjqSjxNHAd8lcV+f/KP62XezL+JBZz45xoS7EqVglo
 0ifjQrxF9WaLoucbetmsQd8C7mFgvfXWvGlG6Ndnm07i4rbKq0jQOevHZS2rqS3YEgCk
 c3spIx1kZf1oNVwcfwSx8HQG42n6wM+eEviX9iGM74nzVV/EYV0md7ubUvlGIaGeudUW
 jNF9LmWaJ1JSjdVgCHvj/MNC8TbtB9w93vHbEdjbZtvNuDTpMTALtKXUHVx3gj7DmFid
 At704wGfOzddNFzDRAW9y6lxI1f2WuFw4WmRVyL0IJYLl29l4H9Ar9my1pXaUKptQmJk
 BYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Tjezw1r+4C36O7qGAqZbpkDcW240KLtZXPo4/62zW4=;
 b=DYNWSQecjHEhZ88S5AJkFhsYIH9whQVgSiCZll8z8sYzdpaED9Ip5MWDXU1GTIvaTW
 VFTty5LVkobFdJryvcqV9IKoXiy1ghXlxWPIe6he1Do2pywBE44FWoGhsaSjmqYws031
 V0WRqNQXcRRvQ/4VsdYARhj17KP5MCAAwdvkRPEXg1U4VOt2YidWbzCYyf0ObvkB3qc+
 K0QwKYkimwpWqKmwCqgcY6fLMNPrDh6AhtH4GuHoXf7StOQDPC45bASKksJh7pZDYLRz
 myerz5G5eTwweyiIKJtYWv3nvEDR+UXkoiH8FMnB4pZf+qwmebwZjt63k8eklBha0u6T
 4L2A==
X-Gm-Message-State: AOAM531tEdRlUxc72w5nmTfL6UJHNzPQ+IoHR2rtgk52UwltBZU/faUk
 6ZOGCsHxQR9tTWXI/QNAX7BDZT8vYJ/eEAVze1U=
X-Google-Smtp-Source: ABdhPJzh3rUBcW9w0crPCSxABThCYX7Khomy5jtaQKZbMyYjnso3RQXgOOIE7o2c5RmFjbzDfLx9fZ0Qr5bVEor7aXM=
X-Received: by 2002:a05:6638:1442:b0:32e:2253:8e76 with SMTP id
 l2-20020a056638144200b0032e22538e76mr5389360jad.21.1652747791974; Mon, 16 May
 2022 17:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652435235.git.research_trasio@irq.a4lg.com>
 <cover.1652509778.git.research_trasio@irq.a4lg.com>
 <d17381d3ea4992808cf1894f379ca67220f61b45.1652509778.git.research_trasio@irq.a4lg.com>
In-Reply-To: <d17381d3ea4992808cf1894f379ca67220f61b45.1652509778.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 10:36:06 +1000
Message-ID: <CAKmqyKMGUBZq2WwHPFrbUwGEjsc1Brj5nonhSgFWjXq7=F25cA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/riscv: Make CPU config error handling generous
 (virt/spike)
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 17 May 2022 00:36:35 -0000

On Sat, May 14, 2022 at 4:29 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> If specified CPU configuration is not valid, not just it prints error
> message, it aborts and generates core dumps (depends on the operating
> system).  This kind of error handling should be used only when a serious
> runtime error occurs.
>
> This commit makes error handling on CPU configuration more generous on
> virt/spike machines.  It now just prints error message and quits (without
> coredumps and aborts).
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/spike.c | 2 +-
>  hw/riscv/virt.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 068ba3493e..e41b6aa9f0 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -230,7 +230,7 @@ static void spike_board_init(MachineState *machine)
>                                  base_hartid, &error_abort);
>          object_property_set_int(OBJECT(&s->soc[i]), "num-harts",
>                                  hart_count, &error_abort);
> -        sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
> +        sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_fatal);
>
>          /* Core Local Interruptor (timer and IPI) for each socket */
>          riscv_aclint_swi_create(
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 3326f4db96..244d6408b5 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1351,7 +1351,7 @@ static void virt_machine_init(MachineState *machine)
>                                  base_hartid, &error_abort);
>          object_property_set_int(OBJECT(&s->soc[i]), "num-harts",
>                                  hart_count, &error_abort);
> -        sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
> +        sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_fatal);
>
>          if (!kvm_enabled()) {
>              if (s->have_aclint) {
> --
> 2.34.1
>

