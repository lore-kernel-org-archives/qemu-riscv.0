Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jaf62-000144-5I
	for mharc-qemu-riscv@gnu.org; Mon, 18 May 2020 08:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jaf60-00011Z-NZ
 for qemu-riscv@nongnu.org; Mon, 18 May 2020 08:42:16 -0400
Received: from mail-oo1-xc43.google.com ([2607:f8b0:4864:20::c43]:38932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jaf5y-0004dS-JI
 for qemu-riscv@nongnu.org; Mon, 18 May 2020 08:42:16 -0400
Received: by mail-oo1-xc43.google.com with SMTP id c83so1993590oob.6
 for <qemu-riscv@nongnu.org>; Mon, 18 May 2020 05:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JtBtE3nw27El8VWoeJ7zSYWKXQECO0bpQV+zh5rOwjY=;
 b=yILxsa7bQrRoII2s2M94XNarz+RsQN8KAYDiK04dWhOlZwqUT63SlnpSz4yyP1cuv6
 qSMKgupJVmuZ+M+N73m1fzPheqmJox512ecMu0bP4X3FWVvuiun2eiJSGgQAIf727+vl
 wl9FrzLd8ShXNe+u5TrCeWtynsgnomEOJDipgB/+g/5yER8QxPGvoSBDBO2T+/mfWHG0
 cvONHEhz2f4ksbdjncr8psNOJni7yCft7KVuQb8K/lMS1ojoMcpPvY1dI2wLeyqXfq1I
 Mi7AHEzSK0+HjQDHAdqujtWZZjcDCY05IFDDJfOytYe+rxltJ79eIHW7+qtZAgyNgO87
 50eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JtBtE3nw27El8VWoeJ7zSYWKXQECO0bpQV+zh5rOwjY=;
 b=eXXbjZgBSiWjdDNkiNmIdGaY4d9Km2a6EHu2rNIriUmEHvuIuG4M7GVDfMv0kYJkvC
 gDVGj30/eUgMWTL87sjrlqKYhsOu/XjJCHWprQaITsuvGb2WO2NXXDRjk6hCPRS5gBKx
 aJrOyNnSyYLNhnx0SRSmobwqR8Piz+enLcOYbuWx5zg7ZRxWMcSzmRRZ5voh59zpAan8
 aVTJxy9hFtj3E32rWB47rMzpVluQXi/Z6tIc494atTB0SafyAnWRLCByxCv7m9nudxU4
 mJKv55proZUxHN0Eft+2X34nNiRUgnu6tkNlkxBUBXSAsDMHlgAGd37JMq98DQlZL8Pd
 Djgg==
X-Gm-Message-State: AOAM531cQBHU05pZ8KhCWZ9dt3BwWSE41PgEVYHyF5Q9xk86iJ2kbPnt
 GjHZePRIGzODtAJBlwQsGLLnJdOSK2kexW8Gwrptjg==
X-Google-Smtp-Source: ABdhPJyn086ODLNF0KvCWf0mNSpyFFh1s0YRKG58JrKufOXvh2yYRIr+4NG9MmT/4Z65bGS47Iki1FCtT25NmkhixXM=
X-Received: by 2002:a4a:d136:: with SMTP id n22mr12769091oor.85.1589805733154; 
 Mon, 18 May 2020 05:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200511205246.24621-1-philmd@redhat.com>
In-Reply-To: <20200511205246.24621-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 May 2020 13:42:02 +0100
Message-ID: <CAFEAcA9yKxqYW0fEC87sLPwVACBzbQ2+XS-gNG8-x-VfCeAH=w@mail.gmail.com>
Subject: Re: [PATCH] hw: Use QEMU_IS_ALIGNED() on parallel flash block size
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Leif Lindholm <leif@nuviainc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <rth@twiddle.net>,
 Max Reitz <mreitz@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c43;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 18 May 2020 12:42:17 -0000

On Mon, 11 May 2020 at 21:52, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Use the QEMU_IS_ALIGNED() macro to verify the flash block size
> is properly aligned. It is quicker to process when reviewing.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/arm/sbsa-ref.c       | 2 +-
>  hw/arm/virt.c           | 2 +-
>  hw/block/pflash_cfi01.c | 2 +-
>  hw/block/pflash_cfi02.c | 2 +-
>  hw/i386/pc_sysfw.c      | 2 +-
>  hw/riscv/virt.c         | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

