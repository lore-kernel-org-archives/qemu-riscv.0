Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715C1C5DF9D
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 05:39:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzSpM-0007i3-71; Thu, 27 Aug 2026 01:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSpH-0007hO-Q2
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:38:59 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSpF-00038v-6n
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:38:59 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-c9aea40d799so1087367a12.0
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 22:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787809135; cv=none;
 d=google.com; s=arc-20260327;
 b=NMOMRWp6N4Z/1++UVAKMbOnZIFErjshdL1ymvjC4HKq0YW1o/235+PTRpFXNUWNYzZ
 WCCIIj6ChON1v/cps1rwUjhgU1e+XpVgb7MqI2Q6ajQePicknSbuDsFHfpSQxjQecm6z
 KBkrLTR+Sf7QbhrblRW9XuiZq4Cr/d2ne1O1guYVhRj3jEJWmyFDymxnXWv7Dt5RuNoz
 CU5VR/1utgaZKvr5Oei/jr120E/6jtP/+G6JrJ8LT1XZUXDTyYd/cRjbtnDv0IFTuxrY
 9W+TVT/AIRMTs2Nws7GHbgh/HUeOtTtpORRy+A6Psg3HpUFPrhCBIZ1EETNsFyGBZp7G
 b8nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Fqfk17EE1472AtmCgZwEsOGiu/PP2wil1KXmodVTx6c=;
 fh=crUw7x4HFFmlGZBejE+dLzg0FxR+ygj9hKw/rx8VW9I=;
 b=Fs5yLY1era3ICtW4ZKxbJOfybyEe0D9al+zIU7R6RjnR0kObo3gnMPFYFV3nILictF
 Xbyejn2scoCyCVn4VOZQE02YGi28kun1fcE9GsFyI2WXLJNSQXVNzrIEl3t2NDbXxfYB
 kTmwOVWSxflRKiimRs5jbTJFGYLvDCFYL+xJ6QCM5czJgGvHDKKJf6URJ93mBXf3BqWs
 1jR75w/OhhLrOqsoNqwWk4Fe8W16Oi+iUkFaFt/hRTbLSssuEdmfI+ilLRWsm2q7blTc
 jCI9IwlFbtOuG8SwdAcbeuRi5ysrMjh8qVgsDOZ++VBbf4EMV0ReME3o+L5iUh3Kg0Eg
 iG4w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1787809135; x=1788413935; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Fqfk17EE1472AtmCgZwEsOGiu/PP2wil1KXmodVTx6c=;
 b=TE67rOZdDI2bqvfOvqAGaCdmpAFpiIyL6n2TOP5uWmzQKvDZcjYqF0Ot1HIcGhlAwA
 d3cr0PspbhiQXce6wviry6rm571rpSPOr/c+EPlB2BgZTtTOFwdh5RjrQUlX+6yNg1qb
 1c6ZmvwmIXECYXItd+noajfnOnUZ9QlOg1kb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787809135; x=1788413935;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Fqfk17EE1472AtmCgZwEsOGiu/PP2wil1KXmodVTx6c=;
 b=buLRaFhc8A42bg8Rq3Yi0dfQ0EXnYufMBHS34uAGMVnk8AOLJ6DLJuZR3u9DsTRhXq
 wrXfYhK8ttCue7MwNx6/IfxLp/V19xcFCCrreJAhVnXb6dlP0lb254VQlIhGHixyqGRd
 +EQmvMbnzdJEXnE6wsUO8NAgFNJ2+LsrQ/Sv/GhuIZtakM+Z/T7NxqH3vfmWFBmlMg7s
 bpPDKneQn7LfJW62I6Sa6wpxI00kADBHCJuqwaFRplx6UfcfIX/QxqboADSl9qW3Dv2n
 TPqOtYklxQfq1mJTe1IFIC4vOcIOEdWy78ftTvsChysYGb9g04lXZGvHiztf6YgHoijG
 +5zA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp7cvIf4cBFjTREsx3SytCPksE9GM2wZsgzu5OzSQBXlsy34gGo4UwuQI2YSXDUOt3GRJJxoYifHadA@nongnu.org
X-Gm-Message-State: AFuF++meYimUqd4OYpMyE8kBqNKOVUd0h3a9UPmk+l+vEiHDCcXo3yL3
 RUvq1/ZFzZvQ82jhXxC1yi4xQyk2IIeQmJc+Vv4Vvq2y4X2Ifsd/eVk6kbPTX5NgN1++O/GF2mR
 yUR+vNRVV0Q3897I4qln54QlPFiumvLY=
X-Gm-Gg: AR+sD10Txjn/AAq4oGBmJpsUoIM8zJRoEquQj+Msw4nXRCNh6fytShkNZ1Jafat+67z
 Hv+XRr5ncLotgFg/O1uSdfJ3rJVoVkCVJ0px5hxAYhWceBORZZuqCAHY+JbNUek3QODfeSwTq1R
 daO74fRH+a4oBmbuNGkVjlpy6O5Re+53uY958VuU+pQKVbcAHSLSPWpJQ8SWIOcNXlS3RU7yqpO
 p3g/rXdwhslTtMPX8Is77X+DiJbWlHiHsZfA5RYDwhZOZ8rYD0/8tML1D/fd9oS9PuTJjao593z
 dIo8U0nipspvj6pwc3Maz5rEJZWxlFUXMD2qSgOIGZ98Ahxpplp3I6+OUVd0svGwVn+pNxcZr0o
 axFGX44uzwod62LdEhv5hgAbYLP2yWfHVdsCEqMI3uyw/bVPAOUIK7iSXH4No9mr2Jl8HhgTWys
 7il4CCO96VxyYcW9KXMxQ7LqDdZe0=
X-Received: by 2002:a05:6a21:7008:b0:3bf:7bf7:7913 with SMTP id
 adf61e73a8af0-3cf8445170emr26412026637.14.1787809135454; Wed, 26 Aug 2026
 22:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
 <20260826214643.122728-10-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260826214643.122728-10-daniel.barboza@oss.qualcomm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Aug 2026 15:08:42 +0930
X-Gm-Features: AcwNN1Ux8bGSQSWUPxivZDg24DasObYFYNV5DfavD42LwGZSsGTKggf2OyUeXiM
Message-ID: <CACPK8XfRS0KCNshf88Gc75=E8V7qKUn_ywFu=9qv-7Jgfu8k-w@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] hw/riscv/fdt-common, virt.c,
 tt_atlantis.c: add riscv_create_fdt_uart()
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, 27 Aug 2026 at 07:17, Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Add a common uart FDT helper to be used by 'virt' and 'tt-atlantis'.
>
> To accomodate both boards the helper is doing the following:
> - an 'uses_32_bit_spacing' flag controls whether we need to set a
>   different uart reg spacing for the 'tt-atlantis' board;

Once the designware uart is merged, Atlantis will switch to using that
as it matches the real hardware. As part of that we will switch the
compatible too, and at that point it might be best leaving it in the
board file?

> - an 'is_serial0' flag is added to control whether we need to set
>   additional properties related to the first serial.  This is required
>   because the 'virt' board adds two uarts in the FDT.
>
> No FDT changes intended.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---
>  hw/riscv/fdt-common.c         | 39 +++++++++++++++++++++++++++++++
>  hw/riscv/tt_atlantis.c        | 23 ++----------------
>  hw/riscv/virt.c               | 44 +++++++----------------------------
>  include/hw/riscv/fdt-common.h |  4 ++++
>  4 files changed, 53 insertions(+), 57 deletions(-)
>
> diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
> index e6bb107309..fb7098f213 100644
> --- a/hw/riscv/fdt-common.c
> +++ b/hw/riscv/fdt-common.c
> @@ -795,3 +795,42 @@ void riscv_create_fdt_socket_aclint(void *fdt, ACLIN=
TFdtProps *props,
>          g_free(name);
>      }
>  }
> +
> +void riscv_create_fdt_uart(void *fdt, const MemMapEntry *uart_mem,
> +                           int uart_irq, int aia_type,
> +                           bool uses_32_bit_spacing, bool is_serial0,
> +                           uint32_t irq_mmio_phandle)

What does 'mmio' mean here? Perhaps irq_phandle?

> +{
> +    g_autofree char *name =3D NULL;
> +
> +    name =3D g_strdup_printf("/soc/serial@%"HWADDR_PRIx, uart_mem->base)=
;
> +    qemu_fdt_add_subnode(fdt, name);
> +    qemu_fdt_setprop_string(fdt, name, "compatible", "ns16550a");
> +    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
> +                                 2, uart_mem->base,
> +                                 2, uart_mem->size);
> +
> +    /*
> +     * The tt-atlantis board uses an uart that has 32 bit
> +     * register spacing (0x0, 0x4, 0x8, 0xc....) rather than
> +     * 8 bit spacing like 'virt'.

From a survey of the linux source tree, most machines use reg-shift=3D2.
If we adopted this for the virt machine then you wouldn't need to
special case it, with the side effect that you'll match the layout
more likely to be in hardware.

> +     */
> +    if (uses_32_bit_spacing) {
> +        qemu_fdt_setprop_cell(fdt, name, "reg-shift", 2);
> +        qemu_fdt_setprop_cell(fdt, name, "reg-io-width", 4);
> +    }
> +
> +    qemu_fdt_setprop_cell(fdt, name, "clock-frequency", 3686400);

Hmmm.

> +    qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", irq_mmio_phandl=
e);
> +
> +    if (aia_type =3D=3D AIA_TYPE_NONE) {
> +        qemu_fdt_setprop_cell(fdt, name, "interrupts", uart_irq);
> +    } else {
> +        qemu_fdt_setprop_cells(fdt, name, "interrupts", uart_irq, 0x4);
> +    }
> +
> +    if (is_serial0) {
> +        qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", name);

This is related to but not really part of the UART. Should it stay in
the machine, or be present as a separate helper?

> +        qemu_fdt_setprop_string(fdt, "/aliases", "serial0", name);

How about passing a char* alias, which can be NULL:

if (alais) {
        qemu_fdt_setprop_string(fdt, "/aliases", alias, name);
}

...might pay to check that /aliases exists too? The ordering was
enforced when this is part of a board, but now that they are APIs
called from anywhere.

