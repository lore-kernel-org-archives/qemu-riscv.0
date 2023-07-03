Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD67DEB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 01:30:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qG8Ny-00074l-BS; Sun, 02 Jul 2023 21:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG8Nq-000747-Sb; Sun, 02 Jul 2023 21:29:43 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG8Np-0005YB-C0; Sun, 02 Jul 2023 21:29:42 -0400
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-47179f18c76so1285406e0c.3; 
 Sun, 02 Jul 2023 18:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688347780; x=1690939780;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bl5+4bxQm8vaMUVxDHuN52f3qzIdub/uhCc8lry4NdQ=;
 b=AUc7x2N/5uUzMEYgs2q+ntSFD7qbr4o3pbpvkLlZcfJ0XjlV+fa4ddXHi0e8werLOs
 tFSOCqForLyAUgWUcfN5Va6ImfHsL/WrWqUzG2RxiCYo3EsKIk78eTizKDjCdc/G/AJN
 u5ZqYrA19bYnWQXq4BmNnyr4KxB5Wq3u07mQewxdidik3n9j9BuOxFo5K/ZMy4Ivem66
 2ccnYg2MdLY7jtTHQwqcosTXse5z8UVTkKyqIw6LB49l1a6radXJiRIALiZrtCG0xJzK
 kRr2Qz1DQoTS1bY7aFReepNH5m8JWJ8MOmQ9vq1YfDcXKJ0b7PgNyVD4Mb/B4R4ApKiV
 wpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688347780; x=1690939780;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bl5+4bxQm8vaMUVxDHuN52f3qzIdub/uhCc8lry4NdQ=;
 b=E4tfljEcnDI4zbyUe0X4sdS1Mjf8TrUtfm26WJ5xcunh/EVGdr455+cLwGACPUyigq
 I1kzqZrgnHllDGXyw3wT/k6Rx8jI9gx9W711Y9h+IfbJMOH9ZYN7IWwuUUJhJ7wtWiiW
 pC2a3mcF+Vag2Rome4SvN812h86OrdnlukHlIXP54CLuovAjkeOS6xV96Y22BZTGOeQ6
 HKeIMHouZbcHhqYO3gZ3FvG0R0FhwQEk/EHGQ0qzJvmqnB0diuS35shoMDW2Gdc8o2sC
 MWlwM4fK1mFSFvMGpoxta9Lg7tiaHe4APWIObesdm5VJqb/5p0gDANHCR2P0DyKnGH0J
 5aEg==
X-Gm-Message-State: ABy/qLZL5hkQb/7DQJ+Hf4KYDb1lg2K9ib4y3cvIungC6NRndPXcvWg7
 gICVwGxH1DJ7UN8Tv13T165NSj5GA+P7QX+hMWU=
X-Google-Smtp-Source: APBJJlFLTjxPWCXX0Fr+NW5KpRynRkL1XdqRYEss4FrbdY+HgYP9ZrHkbmH1NtLz1HUNZVdwjnGHpVWXQ2BurnZCdW8=
X-Received: by 2002:a1f:3dd1:0:b0:471:cd12:9c6a with SMTP id
 k200-20020a1f3dd1000000b00471cd129c6amr4234770vka.12.1688347780011; Sun, 02
 Jul 2023 18:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230628063234.32544-1-philmd@linaro.org>
In-Reply-To: <20230628063234.32544-1-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 Jul 2023 11:29:14 +1000
Message-ID: <CAKmqyKOkZjozb9t+D3kDjZmrFC30EtbpHY+aEKsLoRCj9ydh2A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] target/riscv: Misc header cleanups
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa34.google.com
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

On Wed, Jun 28, 2023 at 4:34=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> As requested by Daniel in [1], these patches are extracted from
> my "target/riscv: Allow building without TCG (KVM-only so far)"
> series and cleanly rebased onto Alistair's riscv-to-apply.next.
>
> [1] https://lore.kernel.org/qemu-devel/59b5b342-8940-5ac1-0cec-8c136c4916=
d8@ventanamicro.com/
> [2] https://lore.kernel.org/qemu-devel/20230626232007.8933-1-philmd@linar=
o.org/
>
> Philippe Mathieu-Daud=C3=A9 (4):
>   target/riscv: Remove unused 'instmap.h' header in translate.c
>   target/riscv: Restrict sysemu specific header to user emulation
>   target/riscv: Restrict 'rv128' machine to TCG accelerator
>   target/riscv: Restrict riscv_cpu_do_interrupt() to sysemu

Acked-by: Alistair Francis <alistair.francis@wdc.com>

But this doesn't apply on the latest riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.h        |  5 +++--
>  target/riscv/cpu.c        | 20 ++++++++++++++------
>  target/riscv/cpu_helper.c |  9 ++++-----
>  target/riscv/csr.c        |  2 ++
>  target/riscv/translate.c  |  1 -
>  5 files changed, 23 insertions(+), 14 deletions(-)
>
> --
> 2.38.1
>
>

