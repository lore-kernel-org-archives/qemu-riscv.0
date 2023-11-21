Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646F6C54FB9
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 04:02:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5Hy7-0005ES-NV; Mon, 20 Nov 2023 23:02:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5Hy5-0005E4-VT; Mon, 20 Nov 2023 23:02:33 -0500
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5Hy3-0002cG-Kc; Mon, 20 Nov 2023 23:02:32 -0500
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-462a1a2717aso637430137.1; 
 Mon, 20 Nov 2023 20:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700539350; x=1701144150; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6bPsWICPaCWfLqzjk2/caBtMdMcOM9AyhHrdzcrzirs=;
 b=lGFitA/uBplhJ5PGd9mCKBm2QDCBJkhUb8LX/gcqpbXz9JuPgsm2g3tzfRxAWMipng
 bwkk8SKakGFxaYdqDH7VXLxszAz7wo1GhNUPmRRwHdzy9dvSOreCBDW9bg/XHjyKuagx
 EMVyi6QXQqiU8ZFJGpNHoyzz9phXfq8L7zCW8gewAEB8HK5mYaj+2kLZqSYhCxPhZeXw
 eOuLIPLvr10cX7P+k3DI5F10ptpcFJm3TXZrIZkmggxEkrwDDxwmIYLMS0B6VEdnwGQR
 JPefXKK7flCbuAwcwjlxRzDwWrsbBCTDDMXBCCpzaiyLHPniBrI7Q4GqNF2avY9IQ6xu
 HLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700539350; x=1701144150;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6bPsWICPaCWfLqzjk2/caBtMdMcOM9AyhHrdzcrzirs=;
 b=VctjMP9c/+aTvvlLCiIJENh6c2ugraCArmjPw5W8/T4d814Lua51vCsaH5l8yrVc5Y
 3fiKrCSY6DTQVJ6wknwbbdjKJ7sexMyUbVLA9rr1bIzNyDzjQnNgjyMvnjnQoE8M+wtP
 L7O/DSgTqJpVUf/zUJtxodJBfIEs4zPqW0UIim2veqtwxXPjuPWSw0jCnWBEC0zcPEL5
 LcDF+zvn6rA9x2Ce7Azo14cPQxfGcMFOoiiX7Cheu7x0Utf6NHIk3Tw9k1FdLVFVzCG+
 aj81aSutc4Go1L9QulFuPwtpTZeX0Ul0S+OhV+pWKuBBf8nXFV7HBT6XyajJb8hW0YgG
 Ndpw==
X-Gm-Message-State: AOJu0Yz9Yn9WMMB7FwVY4QrhLKDLNSEwQvgQWdBwexgeP4snK2WGc9qZ
 1g0V/FaxPUDUvYDz2fi8lQ5U2Jn8tjX8UKb6Vks=
X-Google-Smtp-Source: AGHT+IFAF7tHsr4hZShBUachnW4OIBjX7JCXQtaODUvBsrUk1wvsaiPnDBrF95jU7Bkwk7VxH3Fm+rxY8n6exSOIWjo=
X-Received: by 2002:a05:6102:4743:b0:45f:3a78:ca20 with SMTP id
 ej3-20020a056102474300b0045f3a78ca20mr9221269vsb.0.1700539349857; Mon, 20 Nov
 2023 20:02:29 -0800 (PST)
MIME-Version: 1.0
References: <20231117082840.55705-1-rcardenas.rod@gmail.com>
In-Reply-To: <20231117082840.55705-1-rcardenas.rod@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Nov 2023 14:02:03 +1000
Message-ID: <CAKmqyKPeE=ZHdH2w8-DT1k0jX4gSmBAOY7tMt014y6Zft6Zt7Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix SiFive E CLINT clock frequency
To: =?UTF-8?B?Um9tw6FuIEPDoXJkZW5hcw==?= <rcardenas.rod@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Alistair.Francis@wdc.com, 
 bin.meng@windriver.com, palmer@dabbelt.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Nov 17, 2023 at 6:31=E2=80=AFPM Rom=C3=A1n C=C3=A1rdenas <rcardenas=
.rod@gmail.com> wrote:
>
> If you check the manual of SiFive E310 (https://cdn.sparkfun.com/assets/7=
/f/0/2/7/fe310-g002-manual-v19p05.pdf),
> you can see in Figure 1 that the CLINT is connected to the real time cloc=
k, which also feeds the AON peripheral (they share the same clock).
> In page 43, the docs also say that the timer registers of the CLINT count=
 ticks from the rtcclk.
>
> I am currently playing with bare metal applications both in QEMU and a ph=
ysical SiFive E310 board and
> I confirm that the CLINT clock in the physical board runs at 32.768 kHz.
> In QEMU, the same app produces a completely different outcome, as sometim=
es a new CLINT interrupt is triggered before finishing other tasks.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1978
>
> Signed-off-by: Rom=C3=A1n C=C3=A1rdenas <rcardenas.rod@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/sifive_e.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 0d37adc542..87d9602383 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -225,7 +225,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Er=
ror **errp)
>              RISCV_ACLINT_SWI_SIZE,
>          RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
>          RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
> -        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
> +        SIFIVE_E_LFCLK_DEFAULT_FREQ, false);
>      sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
>
>      /* AON */
> --
> 2.39.3 (Apple Git-145)
>
>

