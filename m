Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B116C0032E
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 01:18:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qujaR-0002eQ-N5; Sun, 22 Oct 2023 21:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qujaN-0002dY-M5; Sun, 22 Oct 2023 21:18:27 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qujaM-0008Dz-8F; Sun, 22 Oct 2023 21:18:27 -0400
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-7b6fbfb9277so1103058241.0; 
 Sun, 22 Oct 2023 18:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698023905; x=1698628705; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sN7wlaQABgy2P2yovzSX3ltHBtSyWQh5vE0Ar18IpR4=;
 b=N1ZVWlsLfFRTnMV+0IkiFWJxRis1oo02+DzC4iVYAz/GgdvTxJ4mhPx8tBzm+2L/iF
 BOApQxM+Vn2raYjfepxUXkPDwOliNRYUd68ASfe3MZwnKJ7o6ffuLayyyUsoj3xrTEM2
 kUQlfu9RWp7rtDToTj6LN4ErJlu+tCdSfSQ2eSy4mj1lps6bRywFlVB+m+tJ6TCVCCjm
 Nm9G2RncGXWTQ2h6ev68/ZfO8eoO01ubczRbyypR2MYBczPWmx/60IT/A87YmqutjsOO
 n+H8Q7PFpRqPJyR3NbwP69Rk3ucqe0OX2CkN8W85PWE0EFhSCTPcDG9CU31XIKuv3a7U
 Aqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698023905; x=1698628705;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sN7wlaQABgy2P2yovzSX3ltHBtSyWQh5vE0Ar18IpR4=;
 b=snqhZ/8t5UMv8dQ8aBJkkQDMeEq6SZPcQrGhBHdsIWkcUKj/T4W29p7dfijYyiAEon
 MuzhQGr/ncOUNIYv1jgUerViEegprPRX4QcTEwgYWmMjEVzE2nRoUHH8u0pwBXLfo8Vn
 /L5eP4O3osyWDTRl3dfJTmqjf+FEMGF9s6Og/fo5W1ovDEsYcvYi7WMqXS8kQRVY7Qkv
 gZFC5h/WZu6HDdYYBNWfr0DkYReJtKcpr/BTzHXYjWNFtS2kTBYSeec9vIr2woDc2qG/
 dHsjurPbFJFn3vWncVqWlD/f3lERK8lKJeXErLGQMq7LZjl78NpU19QzQ6deUAmiznHj
 ydGQ==
X-Gm-Message-State: AOJu0YwNA/uU4yALrK5RRh3q3TRT7YE1SYLJmulWklJLPnP4clovXbz8
 7UD073/5TtUz9qyU+NudgtAA7ujThhKZ0eocZws=
X-Google-Smtp-Source: AGHT+IEe62f5XXa6Gs3xZXu+R6MrfqCWEubSAPPsG32lk3kD4IDGpfWmrWdktTCspbUPpe5mVyjG0UiJgSOi9RqTjNE=
X-Received: by 2002:a67:e19e:0:b0:457:bf8e:c53c with SMTP id
 e30-20020a67e19e000000b00457bf8ec53cmr5848249vsl.27.1698023904868; Sun, 22
 Oct 2023 18:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231020200247.334403-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231020200247.334403-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Oct 2023 11:17:57 +1000
Message-ID: <CAKmqyKMhrJBitrgsrx3yjgzyyPWgDDS5E+kqWXcm96QXWTfGbw@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] docs/system/riscv: update 'virt' machine core limit
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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

On Sat, Oct 21, 2023 at 6:04=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> Re-sending it with a more adequate commit title.
>
> Changes from v1:
> - change commit title from "remove core limit from virt machine" to
>   "update 'virt' machine core limit"
> - v1 link: https://lore.kernel.org/qemu-riscv/20231019134812.241044-1-dba=
rboza@ventanamicro.com/
>
> Daniel Henrique Barboza (1):
>   docs/system/riscv: update 'virt' machine core limit

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  docs/system/riscv/virt.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --
> 2.41.0
>
>

