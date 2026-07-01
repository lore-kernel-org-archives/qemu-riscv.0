Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CFFC43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 00:44:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wej3q-0003o3-Iq; Tue, 30 Jun 2026 20:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wej3m-0003nL-BX
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 20:44:14 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wej3j-0005VO-4v
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 20:44:13 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6978f1eeb87so175516a12.0
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 17:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782866649; cv=none;
 d=google.com; s=arc-20260327;
 b=UjC+RnKE5Uv31qRfF7pv5x5aVSs2znRN19eEfI3h0Ik+cMrdxtbZaI+mka7B3VkFe+
 tSNWOJxw6ZQdeaMFis6qM7RsRXvJocrPG2wHuGF7PPnLK8EZvok4TVl1dXGTfG7t0Fsr
 7Pn1cgeWXIGDb0032wNUQSba/o2xGgT06KMk0e0V8aI/+ShCpq7h8HOR+ucbvOMzQhXt
 j62U1en5bIz2WiCJ7udwbSOtZXYUTs7j4iSkuJFlNBH+Jt4yVVMM9Dp5qf9D+EvD1Fqv
 YGhFLURx7A4d07ofnuqwfkVWkkeM+131uq3eOmyX4oHCS/kXrxlAud5j4fM18RJtGg8Y
 i5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=HAcuwiVLB70smj+H9Yjzxahy8QdYt7cyfakzqvYNrWo=;
 fh=jQWG0V866zdBkoHwSFLq7W30CCLYnz4UCQ6wIDPrkD8=;
 b=jTWqIUmrfnJfbSL+8b5zvIbUsx5D1VibHtoxLASmX6lpHZ6XhwvIJr+Pny2krMvzSH
 4e5zxxE4xJC4Ua05hKi2OavrgecHaHFurpXc2RWES9OIyhlJMVsudbuPDx8N0GSmlq6L
 0DX+SZusGWJf5wr2rleSM1DvQ6M+BPHDYGe7yPfjasyZ+MsB1z9Bv1WUZIKrmZoe5FWZ
 8mvW5b/nDtzWOQ5wVVTMn5dyKZX85Xzx7LjnWaJUJD+U6Ah18Tm3AE6T6uwk+zQA82GB
 +v0A2Y+BhJ39hU+8pU5a+ucKnNHqzbJvT/ExNgvIOlmvkwnwZRGfB7gRvWMHA+cqFd0T
 8Zew==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782866649; x=1783471449; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HAcuwiVLB70smj+H9Yjzxahy8QdYt7cyfakzqvYNrWo=;
 b=sc+2WmBTgicZPRBlzXdj+3BCmiUhMvSMF12DajH/vB+d3zM2DYc9a2Qdaw7TGK4CMa
 qvnzcHoWta/Vb8rSlT6Jw3V8lLKdWDtAitDfD9TjYsAs7g4MAIPsLFOuzyPxzkBv0Opb
 XAq063pvc/iQfebxrAQoNCTbo7V/Db2IIRbeNkItQOvXI6glW7obMOkclwDDiU23Ep7X
 Ku1n+jH9LDtGY4HQMUtQw38yEuBParnEb1H7HutTxzR6x6GjTb9/arCqdJDHz3618g47
 l+UN2KfnBmPlhvbNZwYy+dhD4oFWKUr8EBPDZTLdntOOEu0xbSYd6PDud2OkpHGiXkBH
 ggcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782866649; x=1783471449;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HAcuwiVLB70smj+H9Yjzxahy8QdYt7cyfakzqvYNrWo=;
 b=ejU/QzYB+0ETT4v/0agwN0bFu+rbvlQKfDK8qmetOzK7BLXv3dg8tQMlJKLyn2264X
 9sekuEADNcS6LsZ0Uu0LzMVG/ssjJ3TIZORWP4x2vE2vlcYt5tUMuemS3z6C8iLUZTZX
 6GNCAXG2Mv57exTmTxKKlKnljwrN85jVzVhdYGJEeDvtKU4BNT5cFTRf935e50BsywII
 H0e4F29W8vGMXBw02HQqeGLH6CmP6c09FphGJkXXccCQWchJ+tHFBDzG292oOpSjKJg3
 66ZcF4DfUsBnt7zvEDcUi7JGU1A6gk8lsiIYnikGcSQ1drTqYSGmg2LQIZ3/oJREh4sb
 z7JA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrx3ljlnyGkTCQfMCs29CzeB1Y4oE4ZjE0MFSqQsGcO0O3FhbWjNnQ6/O9/oT3VwuIBrZ0OimvFdpQB@nongnu.org
X-Gm-Message-State: AOJu0YzHuQXaGHXiJdV66+TuczXT6CtoUCLWGS2y8PEoSMo0O41sfjlv
 EpZ8sJa2qgsBqShmbmM0UwLsuGxSOd69h/Y1ezTbH+5u+UrqsdMLK5R+507crwN+KFqFkXIeMfl
 osSlMQlL3TcPMjJVz7V7KC/29QyTd3Ls=
X-Gm-Gg: AfdE7cmDFRhJ1LF60LJhc8oz8Lo7ojB7MqDxZ1soCTEg1Ai8hjME/8Rju4l+kC7FfuU
 71LO6dlKi6qoSAaCfhqJi5aYbSAfa/+Hp/eXF4dbR1lwJR5rtzfRgo9mIeNp5CRQG/KPwDk0Uqk
 mg+ZCRx9c91ibFAZgEpHDWd17jrSRgPa/Llh4lsus99V0r51psJrKn7WP12u/vWC1ftzzMR3eEZ
 gApoIhwUJveE5KWRBT92te7U3bG/6lh/n2qqJlsA3yT7uDlVsy3iW676TMxj44yrCfU8z4OU8i3
 DBx7raagsjlv0NGLU08vrjovWtbErCfPP2zYyg==
X-Received: by 2002:a05:6402:4401:b0:698:954:484e with SMTP id
 4fb4d7f45d1cf-69887724ea8mr1402097a12.14.1782866648797; Tue, 30 Jun 2026
 17:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260630024952.1520546-1-joel@jms.id.au>
 <20260630024952.1520546-9-joel@jms.id.au>
In-Reply-To: <20260630024952.1520546-9-joel@jms.id.au>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 1 Jul 2026 10:43:40 +1000
X-Gm-Features: AVVi8Cf4P-3w2A8s5Oc2Xr0h5y5xzAhx0UEpDB6kSZnxxO1001nhHiQry2bv0OE
Message-ID: <CAKmqyKNq-9z4jpZm1cDYx9tr-2fZBM7m27=7mFy=w+PUJA+xSw@mail.gmail.com>
Subject: Re: [PATCH v10 08/12] hw/riscv/atlantis: Ensure OpenSBI has a
 non-zero next_addr
To: Joel Stanley <joel@jms.id.au>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Nicholas Piggin <npiggin@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
 Joel Stanley <jms@oss.tenstorrent.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Jun 30, 2026 at 12:53=E2=80=AFPM Joel Stanley <joel@jms.id.au> wrot=
e:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> When using OpenSBI fw_dynamic on the Atlantis board OpenSBI fails
> to print any output, as it hits an error early on
> in the boot process and gets stuck in `sbi_hart_hang()`.
>
> The error occurs in the `sanitize_domain()` function inside OpenSBI.
> `sanitize_domain()` is called after a M-Mode OpenSBI Firmware and a gener=
ic
> coverall S-Mode RWX memory region are created. `sanitize_domain()` is
> checking that the next address is executable.
>
> If no next address is provided (which occurs on QEMU with an empty payloa=
d),
> then `dom->next_addr` will be 0. On most RISC-V boards address 0 will fal=
l
> inside the coverall S-Mode RWX memory region and pass this check. On
> Atlantis the OpenSBI firmware is running at address 0, so this address
> falls inside the M-Mode only OpenSBI firmware region and fails the check.
>
> Once the check has failed OpenSBI aborts and the user doesn't see any
> messages. This can be fixed by either supplying a payload, or just
> manually forcing a non-zero address (actually just any address that
> isn't the OpenSBI firmware) for next_addr.
>
> This patch ensures that if no kernel is loaded we still specify a
> default kernel_entry so that OpenSBI happily boots and jumps to
> the first address in memory.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/tt_atlantis.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
> index 1f0cd08ac959..d4fa9c251d3b 100644
> --- a/hw/riscv/tt_atlantis.c
> +++ b/hw/riscv/tt_atlantis.c
> @@ -377,8 +377,16 @@ static void tt_atlantis_machine_done(Notifier *notif=
ier, void *data)
>      if (machine->kernel_filename) {
>          riscv_load_kernel(machine, &boot_info, kernel_start_addr,
>                            true, NULL);
> +        kernel_entry =3D boot_info.image_low_addr;
> +    } else {
> +        /* If we aren't loading a payload, OpenSBI thinks we are trying =
to boot
> +         * address 0, which fails `sbi_domain_check_addr()` as that is w=
here
> +         * OpenSBI is running. Instead point OpenSBI to the end of the r=
egion
> +         * where it was loaded, which avoids the early hang, allowing th=
e
> +         * system to proceed with the OpenSBI boot output.
> +         */
> +        kernel_entry =3D kernel_start_addr;
>      }
> -    kernel_entry =3D boot_info.image_low_addr;
>
>      fdt_load_addr =3D riscv_compute_fdt_addr(s->memmap[TT_ATL_DDR_LO].ba=
se,
>                                             s->memmap[TT_ATL_DDR_LO].size=
,
> --
> 2.47.3
>
>

