Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC29CD4F26
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 04:39:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbsub-0005cZ-Q3; Tue, 23 Jun 2026 00:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wbsua-0005cE-71
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 00:39:00 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wbsuX-00059d-P0
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 00:38:59 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-662c360aa73so5526096d50.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 21:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782189536; cv=none;
 d=google.com; s=arc-20240605;
 b=lfNXdvHMnPoSSwMJSNtMwTEbz4OIvOnbR8fjEUm+X+A8xzj9wT8I3SJkvEvuH4Cfus
 VEbonr7zVLFkGPD6r0hYbl5CiZFre2LOFUHl1bKAG6fI2oVwet/qJuVIFP0+pTvwOCig
 wQz/GvrF/K9flEZ6M9jz/yosfeaEl9rehHiKeCV/L/N+9Hj3XAG82UWljGMpE7I5hTJN
 GCEn8ZlWmvL3s5AvyuoqsTxhgrFm9UlM6EIM9FkF/QWNMlH/icXzY51OQK9mOeYRdGqJ
 TAsCv0poYrdv1A3JfJBldGPMmre01i7NQLGU2QZJcNkacxWjZQ69zFoHjyRX593Agh+0
 Ovtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=xlWKN2+eT6XlZj1EQLxlWrO6lNCSSe/KQqe2uTfyKx0=;
 fh=hrp+EqDTLCjueoLV/t/AT1/EYORRjtXJCsusuAzkyI4=;
 b=J0WDc3J2LDI/envcgbL7D1Ig5CpZSYR6GcIXbodlRISvdimHTK5FPlyQ6LfUbMSiit
 /HfJCJ/+4/xljQeJCmLWuI9pvJvJKhQx4YL4Y/jorBoNfgoCldtwTPVV/9I56JXprM4v
 FxWNsOqPJgmWU0Z9RhYzkVxcfRY+Fhl8ul5bhGSuTlQ4rki58RXJmjCRdR1mwcFxygaO
 SbAgDLnncakk3X7zHWCaeMa8T5t68NI52qsJOF6IzeKmShRAwLnLnx0bAqdX7AwI6gxc
 vt5mVXWkAUKazmj965CpN2Qg73gdj0loVXaC4oHesVpcvozo4eJVq8OMe8sGQt5zRMZr
 OHgw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1782189536; x=1782794336; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xlWKN2+eT6XlZj1EQLxlWrO6lNCSSe/KQqe2uTfyKx0=;
 b=FGOmzKHRnb3G1NIHQcEmk0ffabFJxNqpfmf1mPGyup9o4jk1IlQxdetDMGZyAtM8uY
 gPeVQc+bbdlpY5ooVuFOoB3kcTUaQsp+bV1pBpZWHHaPkpmd2IPw0CZvL+RS7GMukqkw
 cwiA6vPbXx7ujJBMu7sQfmep7SNLZQ/Hl1U38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782189536; x=1782794336;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xlWKN2+eT6XlZj1EQLxlWrO6lNCSSe/KQqe2uTfyKx0=;
 b=EnUsbi+Dgn3gMkawpUx4JgAqp2cDD0GEK40ZiKVotH3dxk0PsPEoWr+f5vn201azqb
 Hz1njSZPAmGjVYqvfOtyhmPwedRxpbsNq2l0D+vbWiBig7HC7ax626/4sa9Muatwb6P7
 rNU0kPo8xFHOGdHYRKhuGARqprkKKuZAShpf4yXve4qqcvVdVDfMiNb/FVfm/mSn0otA
 JJVAlqD4PgKYCGoP7OycHvuyKG4KA2Isk0rnX0gXxWOyNb361JeHbYwuE8WaCkrUgPIo
 CvG3ayhfP9RHA2HdLHd2A/sPSZd1vbGAM5uH8UXn7Ha7L7+va7GO79/hce4lcrykNe8m
 9qig==
X-Forwarded-Encrypted: i=1;
 AHgh+RqwC7eGrvHZjfqZ5sISGG9RnWGkQWl7u3SHgJFIgH+P0/2e6Ux1+m0EtDnfrSIzVz87tDty/1qWU29h@nongnu.org
X-Gm-Message-State: AOJu0Yw7vieXi6LM576cCJP1MCWGqaM1So3f/gj4qDbTsnS07x8pLG4R
 9ZFXO6O9jA63jyp2nqiyKrY6wBVXcRlrOHm2EnWKCf7+09nSRERMNv6HTCVVSnYN6U6zXRSx8BB
 NXSInj5jJN7p84LYM5j6XkV7GqWN3cIk=
X-Gm-Gg: AfdE7cm0vn0nKHWwBGGqooz33GU3kFo5MaFwXB1gELGLV4na2xUZTMlSDBniJjY+iIt
 +7d7VvIiMQby6dRUUPBBKmqTq6lWWpx+9A4pUPhhqnR4vZm5TZ9yZrE91L4zy7Ja5H41Ai/vJ4a
 nqvty4lGA5r6MiO1Ku+BxsXGXw6b3tVdXIEBxDqDsQG8f72YbnCRmzPFwxM+b0dO3c6aFO+JIDd
 G2AHKjQcsmOrawWPNJHp9XcTovJcZd7EGY2pbyFZR+NnYBp7x6vC01f45aAfuL36hGDZQLd7K2d
 md9IAgBzwg0J8BEMYh24gdNmuDOcg+6DoWCDxnHGi+Z8DPptq99BX202QRO0bv9JrAQopGsIkgb
 XlG4iAca9kBvamA==
X-Received: by 2002:a05:690e:b4c:b0:661:1307:3d40 with SMTP id
 956f58d0204a3-662ffdc4b2emr16102080d50.46.1782189536067; Mon, 22 Jun 2026
 21:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260619044838.1054677-1-joel@jms.id.au>
 <20260619044838.1054677-9-joel@jms.id.au>
 <CAKmqyKML0szhhJv_pb=+oNZJwZhurn9k1La+FgiAHmBCYYFW+w@mail.gmail.com>
In-Reply-To: <CAKmqyKML0szhhJv_pb=+oNZJwZhurn9k1La+FgiAHmBCYYFW+w@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 23 Jun 2026 14:08:44 +0930
X-Gm-Features: AVVi8CdwV6gbKdwIMPses6kh7NeNJvbKiUNl5yjtCQFAoVJAKow4DPe9DqM_9_k
Message-ID: <CACPK8XccZpBwwGQKs+CN_QGz19OMCiSnh1or8+aPewz8HRNK2g@mail.gmail.com>
Subject: Re: [PATCH v9 08/12] hw/riscv/atlantis: Provide a simple halting
 payload
To: Alistair Francis <alistair23@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Chris Rauer <crauer@google.com>, Alano Song <alanosong@163.com>,
 Michael Ellerman <mpe@kernel.org>, 
 Joel Stanley <jms@oss.tenstorrent.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb129.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

On Tue, 23 Jun 2026 at 12:11, Alistair Francis <alistair23@gmail.com> wrote=
:
>
> On Fri, Jun 19, 2026 at 2:52=E2=80=AFPM Joel Stanley <joel@jms.id.au> wro=
te:
> >
> > From: Nicholas Piggin <npiggin@gmail.com>
> >
> > OpenSBI hangs before any console output if the domain init code sees th=
e
> > next stage is not in an executable region.
> >
> > If no kernel payload is provided to QEMU, the next stage address is
> > NULL, and the riscv virt machine memory map ends up covering the 0
> > address with the catch all S-mode RWX region and so OpenSBI prints
> > console messages and does not hang until the next stage boot.
> >
> > The Tenstorrent Atlantis machine address map has RAM starting at 0 and
> > it loads OpenSBI there, so it is M-mode and not accessible by S-mode,
> > tripping the early check and hang.
>
> Ok, so I looked at this today and I think this commit message and
> approach aren't the way to go.
>
> I do think the commit message is a bit confusing and not entirely
> accurate. What about something like this (might need a tidy up, but
> you should get the point):
>
> commit aac25688634d1afe6735cb71d8dd1ea652fa90d4 (HEAD -> riscv-to-apply.n=
ext)
> Author: Alistair Francis <alistair.francis@wdc.com>
> Date:   Tue Jun 23 12:37:47 2026 +1000
>
>    hw/riscv/atlantis: Ensure OpenSBI has a non-zero next_addr
>
>    When using OpenSBI fw_dynamic on the Atlantis board OpenSBI fails
>    to print any output, as it hits an error early on
>    in the boot process and gets stuck in `sbi_hart_hang()`.
>
>    The error occurs in the `sanitize_domain()` function inside OpenSBI.
>    `sanitize_domain()` is called after a M-Mode OpenSBI Firmware and a ge=
neric
>    coverall S-Mode RWX memory region are created. `sanitize_domain()` is
>    checking that the next address is executable.
>
>    If no next address is provided (which occurs on QEMU with an empty pay=
load),
>    then `dom->next_addr` will be 0. On most RISC-V boards address 0 will =
fall
>    inside the coverall S-Mode RWX memory region and pass this check. On
>    Atlantis the OpenSBI firmware is running at address 0, so this address
>    falls inside the M-Mode only OpenSBI firmware region and fails the che=
ck.
>
>    Once the check has failed OpenSBI aborts and the user doesn't see any
>    messages. This can be fixed by either supplying a payload, or just
>    manually forcing a non-zero address (actually just any address that
>    isn't the OpenSBI firmware) for next_addr.
>
>    This patch ensures that if no kernel is loaded we still specify a
>    default kernel_entry so that OpenSBI happily boots and jumps to
>    the first address in memory.
>
>    Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

This reads fine by me. Nick?

>
> diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
> index b40a893a37..dba56ad6e1 100644
> --- a/hw/riscv/tt_atlantis.c
> +++ b/hw/riscv/tt_atlantis.c
> @@ -444,8 +444,15 @@ static void tt_atlantis_machine_done(Notifier
> *notifier, void *data)
>     if (machine->kernel_filename) {
>         riscv_load_kernel(machine, &boot_info, kernel_start_addr,
>                           true, NULL);
> +        kernel_entry =3D boot_info.image_low_addr;
> +    } else {
> +        /* If we aren't loading a payload, OpenSBI thinks we are trying =
to boot
> +         * address 0, which fails `sbi_domain_check_addr()` as that is w=
here
> +         * OpenSBI is running. Let's tell OpenSBI to start running at th=
e start
> +         * of memory so we at least let OpenSBI complete.

This isn't quite true, we're pointing to just after opensbi. The start
of the rest of memory.

Perhaps:

 Instead point OpenSBI to jump to the end of the region where it
 was loaded, which avoids the early hang in OpenSBI, allowing
 the system to proceed with the OpenSBI boot output.

Thanks for taking a look.

Cheers,

Joel

> +         */
> +        kernel_entry =3D kernel_start_addr;
>     }
> -    kernel_entry =3D boot_info.image_low_addr;
>
>     fdt_load_addr =3D riscv_compute_fdt_addr(s->memmap[TT_ATL_DDR_LO].bas=
e,
>                                            s->memmap[TT_ATL_DDR_LO].size,

