Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meogx-0003Fr-Bz
	for mharc-qemu-riscv@gnu.org; Sun, 24 Oct 2021 21:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1meogu-0003Fa-5s; Sun, 24 Oct 2021 21:22:20 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:36769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1meogs-0007Kv-F4; Sun, 24 Oct 2021 21:22:19 -0400
Received: by mail-il1-x134.google.com with SMTP id h10so11125446ilq.3;
 Sun, 24 Oct 2021 18:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jus5TxupKTo2nLmkwoprz8ysjpPWkrX/8/FXS4QImRU=;
 b=PIC0kGyyIh10aGbAdIizI8WluC9J+/P7z1Vgn4A8+mRx4yubtojBqULcVM00EP+52I
 8JDeaAQI3OST2OPWqZNqNb2/D4jp+M08QClWNferqC6Qc/36XVnV2tU3K8VhzGE+WM/J
 mOJi7tEJxgUBCqZt5WWJdhWg1w4WG8yYA9Cyx7vouf7DnDKisbcNvtO2Ku63ih4vF7iJ
 5kYxb876U5tewbgjnjfFMj6IfDb7iPIzdt7GGjvacM/lC2axBqqNO3H6HKKxNuL+Y+5E
 +5p+NJqcuD0UmD2RrWW87BNEN1qxUjRuhRH32aWWL5Zv3eAUbE1oCtUe0jb3itHTNDiL
 E5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jus5TxupKTo2nLmkwoprz8ysjpPWkrX/8/FXS4QImRU=;
 b=RatIV+Z1xoY6SdcDAvgzgyW9j4wYkSbmfML4I+SQ/sw1CCLd9xhQ+TLJNaY4JMYl6Z
 sHVNNN0YtP9rp/8gcNBVOrKh4Libt6oTi7xlXEwQ3misei7n9tld8LG264yqWPYs25o2
 bFHW47GUPCSFtyxtn1n5LDq19EZz8Q4Gi6XJ6OLwHQnEYc1SPbAzmL19S/cg53FCVtBw
 Wx1PcQSKRpePEn67lPPdd6ZtxS+TloQzXEkDG9rVjh7an29uL7vXyhuzv9dgUfxqw77e
 veA1oDcwntlszlThoZMPqK75kuiRDPMvYtaUUK21DngHTlJ6AykK3uHD2iIA4y5DKdz+
 ex8Q==
X-Gm-Message-State: AOAM53385wqw1lXmIs0628GhBsibzz5MaLQ6l9CYJ0f3oiv4iZxsLjE3
 5h2C7Q3nD1eW/RWRbs4FwW+NxJKI2ObscmJc9BM=
X-Google-Smtp-Source: ABdhPJyyHj1Cs0nkImrpjGIcAhWURd4nylD07UeU/2K4CrwVlAAqFkyFLmZX1tnT3JmmWY1mu73jxOn27KZPtBPMWOw=
X-Received: by 2002:a92:c88c:: with SMTP id w12mr8146628ilo.46.1635124936030; 
 Sun, 24 Oct 2021 18:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211022181910.1999197-1-space.monkey.delivers@gmail.com>
 <20211022181910.1999197-6-space.monkey.delivers@gmail.com>
In-Reply-To: <20211022181910.1999197-6-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Oct 2021 11:21:50 +1000
Message-ID: <CAKmqyKOpJABmUueWwH9HkXcnSgTX5RgD2KEBs8JWFFh=VM1Wyg@mail.gmail.com>
Subject: Re: [PATCH v16 5/8] [RISCV_PM] Print new PM CSRs in QEMU logs
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Dave Smith <kupokupokupopo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
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
X-List-Received-Date: Mon, 25 Oct 2021 01:22:20 -0000

On Sat, Oct 23, 2021 at 4:27 AM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6b767a4a0b..16fac64806 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -271,6 +271,13 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>              CSR_MSCRATCH,
>              CSR_SSCRATCH,
>              CSR_SATP,
> +            CSR_MMTE,
> +            CSR_UPMBASE,
> +            CSR_UPMMASK,
> +            CSR_SPMBASE,
> +            CSR_SPMMASK,
> +            CSR_MPMBASE,
> +            CSR_MPMMASK,
>          };
>
>          for (int i = 0; i < ARRAY_SIZE(dump_csrs); ++i) {
> --
> 2.30.2
>
>

