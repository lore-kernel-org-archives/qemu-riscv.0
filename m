Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf8WN-0007T9-3V
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 18:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mf8WL-0007SC-JO; Mon, 25 Oct 2021 18:32:45 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:41603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mf8WJ-0006GH-Pk; Mon, 25 Oct 2021 18:32:45 -0400
Received: by mail-io1-xd36.google.com with SMTP id b188so17615103iof.8;
 Mon, 25 Oct 2021 15:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YC3XmkPtw2QimqM3pDJSA26FE03RLjuyvl2BiJu6icc=;
 b=SQ4lidCFyB+5Aq/f7QaJcrKkfEsj1uUHV4LwVIC1G9TZc3ai1XBzLjzYiWOUGH3OIY
 Ntp7+9uM0X/z5Vrj6CvJlA54PmM4KonqvoGx4SA/hYMrIl2QZEzzZA7a36Tv3yRySH8u
 1Ifb8zg0/3NyAL7cm3jDMxO0HsfFJQDOMahraI1150eMVg5HyZ8Fdv7KGQVaH+yyJl22
 QNNdBaj0qjdK5/Cwemby6cgxxFmQi5rIq1CpvKrq0ob423feKr3vnawXSfRcXczgbHu4
 cDVmrAG8wvfB1Sya81GDd8HLCrDxt9ts/92VInmL3OjCZNXh7KMQZ4Z8RgNvNrO3k8s8
 Rxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YC3XmkPtw2QimqM3pDJSA26FE03RLjuyvl2BiJu6icc=;
 b=by8kvR+x8SZ9VdQ5dLAQen5IZ3Og1EfiSMqmcv8BWg7RHh5vluCJdStpD5V1qHLJhj
 8mxECwGQn4srnGEheytFd/kOHOQHrh5UtOjznqnXRnXKCFXQ/IzA2mI8fZjDSqLWQbIY
 X5t8kGz1EKAXO5WOj0BJmAFal2NvO/zc3vwpBVa4FhoeY8cvexipOWlAvR9sHba9dCGD
 rxSg1hFoKW+h9Jzb42hwZCLBUV+YRZCh6UbBd6k6/pPHBWIZw1pbJ4lEGCF4Fg56xcnq
 4zpl51qSoUqtBjI5VD+oekspE0aaiYtPElxwxhyoZ6cUVq7mTRivYiIyM38XVgaMZFuY
 esPA==
X-Gm-Message-State: AOAM532kpKKvGqqnA9LrTn7ewDeaL0BDO6aSDBQ/NSoIamScCOypm8f9
 DgdxwG1z7+oCQxLRYIrHd5Qn2Qc51hkk4/SFD8A=
X-Google-Smtp-Source: ABdhPJwwuIYiEkHOpwolY4GPEiEPBPpUJlez/HFdeOFosW3pB849cArKVGM5cbupKi6vTmDFmwye1vk1aJPz8KTtuXA=
X-Received: by 2002:a05:6638:32a6:: with SMTP id
 f38mr12285788jav.63.1635201162230; 
 Mon, 25 Oct 2021 15:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211025173609.2724490-1-space.monkey.delivers@gmail.com>
 <20211025173609.2724490-6-space.monkey.delivers@gmail.com>
In-Reply-To: <20211025173609.2724490-6-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 Oct 2021 08:32:16 +1000
Message-ID: <CAKmqyKN5r7_U7WuNCQTVxPNjsjhZMmkrx0VLdo320fFpp+zQoQ@mail.gmail.com>
Subject: Re: [PATCH v17 5/8] target/riscv: Print new PM CSRs in QEMU logs
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Mon, 25 Oct 2021 22:32:45 -0000

On Tue, Oct 26, 2021 at 3:36 AM Alexey Baturo <baturo.alexey@gmail.com> wrote:
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

