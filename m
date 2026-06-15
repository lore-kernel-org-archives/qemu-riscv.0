Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EACCD98C7
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 11:47:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZ5ml-000529-Ks; Mon, 15 Jun 2026 07:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZ5mh-00051Z-PO
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 07:47:19 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZ5mg-000608-4I
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 07:47:19 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-68d234218bcso5710530a12.2
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 04:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781524036; cv=none;
 d=google.com; s=arc-20240605;
 b=Vr9Xm6QNz6GCOxkWk+5VaTpypG3CPndiIKiC80VE++e5uPBLEiu1sgGcfJpKixRfmb
 mPo1QqSmYTnbJejzap2foDZYq/5YbE+EWPFJcIQoFUAU9NraYV5z+l5wfQ2cqha/wMTD
 5TN2RNe7KeN+38NBuV9HmXO+yq44dP401ESuL/YrjJo6kbNbNSyGC/RMSmHIqroWT5xn
 D815Y081T7kKoUZmSp9+w5X/dPjOe9l7iikx3CzI6HX2rO33j2ADX0Ra3gayBHqvWO8O
 aZaBDQ09qVQNy0UTHnX7jbID0bGSrl5vXUI1FEg9/bQv9r0Sr4HUxTvFoegMotf9uY6n
 5vSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=26eSbiFwouxMDBokhhVOiZHj5ZeI/02XK83mokRODi8=;
 fh=ElOjwlGObUsZGtoS+Qp3shMY/BB/PN+lpSt2yKbTLPY=;
 b=IkrcWX3as0isIjzX2Mtn2cKoHmPR97BuAm7e99dxNfXJcBg1UVoieDWd5Ge1zUbwcW
 sVNfh6JnYfJ1D82XOq9o44T8eTCir+i2yViJ+HmLdeGQ2rRsSW8fCF7c5oBYON+CW3HP
 zqYyo4ILzNMkvafM8tm0LkDMboAFh4U/ML1CeiShmWFqCIW08Lap79Qy1dKcA/g3yCWG
 7SmPtFLuv2/fTY5CbKEYfyzkw0X0EbefPdETTnZvL+LwnVAT6HWrYotZl4ndYSWGGPTM
 aMN+KEXNji/nlbfTwjJhBoiJeYvQhpV1BEtnbNtv12g0mdij9SzY6J63MNOdq2TRj69q
 iPBg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781524036; x=1782128836; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=26eSbiFwouxMDBokhhVOiZHj5ZeI/02XK83mokRODi8=;
 b=bAT7V48bdBYEn+U7VsbWUq0IWSgSXi6h/lubH56vRg3zx69anVF+H1EB9KcXoz4HFN
 GZeoy9oaoqF/PT1iJuNDrxj29J8MJHI6L3kORgBbUKST9LR0x9XoYbGIX1lQhMw1uCC1
 wiGcQyXja3TnpMJGlmDxj1FDhbX3LsLmTarohwD4AB9YFWDAfyWWdR2I/tDqIs+usHKs
 64pUbZwsEHoS6poZR/7B57Out/p6Dgm8ZM8JWP0Eo52cF4u440cfla6cT+hLQWS+U9IE
 xZulnKPh+cIjhZeUkhxKfuu3wcimKptTqG9NZjcZmj41k8sQT2QlwdKw4VAj3W7D7AYV
 rfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781524036; x=1782128836;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=26eSbiFwouxMDBokhhVOiZHj5ZeI/02XK83mokRODi8=;
 b=gY6+Yav9lmjX0EF1ofKkuWggRUG4GNz3FcQ8tsg1ZOf2pN6ruW/CvauVrWcFHx2aXY
 GV/JwAUauwV4dtJPi4kURmjxAIREP+8eSjsw4/cU0iX+8WUKlXo/+dBL0MAbsWMZaBKb
 4unN9yJo6xGX6JTNk28Pt8pZiN250HOe5s3AWXC5Cqka0deYzyIYZTWrnrYJQvnsml3d
 +hHBLp7TDC0FJqeY67m9/nVztrWCWKJsGn3YMPBDP95FP31CU+nEY3zvwwrHbAH/mM/s
 hArO8Z0KMXDOVwYOIxfoyjd3BDcaI+ghcJGFSMaleVUl6+jeUnk4SDKcggoFP7k89VeK
 7twg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Pk+MqZGmR0XZuT6zPVHuAW2QCrZY9vwbLxA+zVw/ZqJvUubsMLqIMZpoQMtkRFS61H090Z8zFiQIx@nongnu.org
X-Gm-Message-State: AOJu0YzN8SNyqzTQKPCbwjbKMzEitDjvIaR7NRj9LPu1xuemmL9kWIax
 dmNICeTCb3tb2a6Lt7oV8tvSOaifA+2JMKPo+gL9Wo95FFoXY0C0exNkCmanfFRFdSVkMfsris4
 dAcK3M3GNYEmSHZ5qSlAFOySHPk7SGd8=
X-Gm-Gg: Acq92OF3qVZ+PVH9Z3T/ECw1xtYGiGe/9cQni0Kud0XONX7UHEfey0N88FyhKsjvqg9
 vBEs0oalVBldBl6yE0MvZ7xuXyUlkSafMRnn8AZCzNOZ+GpwYZWBxj9C0RMp76IKK9qnayUPSO+
 3D40mGVjs6DvURpffRDKTKzxjLBL+Jk154T43V7IpMOZd0laQC34uYHHskn2oUwlXwpc6vR85LO
 BCL3tbKaI3r0uN3/M+42KtQZcLZKaT4Tgvx+HQho45A2hl192e/3IBhprOFtbW/IsEKKaegjLWh
 643OHH0h
X-Received: by 2002:a05:6402:1ece:b0:689:92c0:22b0 with SMTP id
 4fb4d7f45d1cf-693c6a11cd5mr4438635a12.3.1781524036296; Mon, 15 Jun 2026
 04:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260603065859.592063-1-joel@jms.id.au>
 <20260603065859.592063-9-joel@jms.id.au>
In-Reply-To: <20260603065859.592063-9-joel@jms.id.au>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Jun 2026 21:46:50 +1000
X-Gm-Features: AVVi8Ce-aKIyl3kUWlGp9FFmZZ_aOL8VhdTS6HfBp3s-Ayx3pNE2wELa0WiT95Q
Message-ID: <CAKmqyKPZjt8-pj8Ou8P52cAM-G4iTVujgJ=OJrZMn9u2iy6qJA@mail.gmail.com>
Subject: Re: [PATCH v8 08/12] hw/riscv/atlantis: Provide a simple halting
 payload
To: Joel Stanley <joel@jms.id.au>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Nicholas Piggin <npiggin@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 Michael Ellerman <mpe@kernel.org>, Joel Stanley <jms@oss.tenstorrent.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52b.google.com
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

On Wed, Jun 3, 2026 at 5:03=E2=80=AFPM Joel Stanley <joel@jms.id.au> wrote:
>
> From: Nicholas Piggin <npiggin@gmail.com>
>
> OpenSBI hangs before any console output if the domain init code sees the
> next stage is not in an executable region.
>
> If no kernel payload is provided to QEMU, the next stage address is
> NULL, and the riscv virt machine memory map ends up covering the 0
> address with the catch all S-mode RWX region and so OpenSBI prints
> console messages and does not hang until the next stage boot.
>
> The Tenstorrent Atlantis machine address map has RAM starting at 0 and
> it loads OpenSBI there, so it is M-mode and not accessible by S-mode,
> tripping the early check and hang.
>
> Add a helper to set up a simple payload that gets OpenSBI messages to
> console, until OpenSBI can be fixed.

I still don't like this. What is the status of the OpenSBI fix? Can we
link to the upstream patch? I'm worried we are going to be stuck with
this hack forever.

Alistair

>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/riscv/tt_atlantis.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
> index 1ccd7d017c56..5de138578b48 100644
> --- a/hw/riscv/tt_atlantis.c
> +++ b/hw/riscv/tt_atlantis.c
> @@ -413,6 +413,30 @@ static void load_fdt(TTAtlantisState *s)
>      create_fdt_memory(s);
>  }
>
> +/*
> + * This works around a problem with OpenSBI hanging with no console outp=
ut if
> + * no payload is provided. By chance, machines with memory at 0x80000000=
 do get
> + * output, but Atlantis memory begins at 0x0 which takes a different Ope=
nSBI
> + * error path.
> + *
> + * This can be removed when OpenSBI is fixed in QEMU.
> + */
> +static void tt_atlantis_setup_halting_payload_opensbi_fixup(
> +                                        RISCVBootInfo *info, hwaddr addr=
)
> +{
> +    /* Store the payload vector in little_endian byte order */
> +    static const uint32_t payload_vec[] =3D {
> +        const_le32(0x10500073),         /* 1: wfi           */
> +        const_le32(0xffdff06f),         /* j       1b       */
> +    };
> +    rom_add_blob_fixed_as("mrom.payload", payload_vec, sizeof(payload_ve=
c),
> +                          addr, &address_space_memory);
> +
> +    info->kernel_size =3D sizeof(payload_vec);
> +    info->image_low_addr =3D addr;
> +    info->image_high_addr =3D info->image_low_addr + info->kernel_size;
> +}
> +
>  static void tt_atlantis_machine_done(Notifier *notifier, void *data)
>  {
>      TTAtlantisState *s =3D container_of(notifier, TTAtlantisState, machi=
ne_done);
> @@ -450,6 +474,9 @@ static void tt_atlantis_machine_done(Notifier *notifi=
er, void *data)
>      if (machine->kernel_filename) {
>          riscv_load_kernel(machine, &boot_info, kernel_start_addr,
>                            true, NULL);
> +    } else {
> +        tt_atlantis_setup_halting_payload_opensbi_fixup(&boot_info,
> +                                                        kernel_start_add=
r);
>      }
>      kernel_entry =3D boot_info.image_low_addr;
>
> --
> 2.47.3
>
>

