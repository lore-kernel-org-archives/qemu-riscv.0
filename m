Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1v0H-0000O2-9D
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 12:41:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1v00-0000GL-Ue; Tue, 19 Jan 2021 12:41:04 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:34869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1uzq-0001Nc-BA; Tue, 19 Jan 2021 12:41:00 -0500
Received: by mail-io1-xd36.google.com with SMTP id y19so41246078iov.2;
 Tue, 19 Jan 2021 09:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4kuzln3qN3AZuhGvGhEMtnjZui3maENHGH9HD8vqYI4=;
 b=h7vISe7b6Q7d+jKKQY6Zp0kYaQLp+22zZ2qb6z5GuCVKf+kLa47JRY3DxfKsL2jLg/
 tCTNZ1tql86V26uVL+tTmwsVRPDP1odOAEBc8YdsfoU67uP4yi0PKjtYy9xVxtxC1PvC
 oHDBicEPrh0XyH60FjeKGy3K+nkqzYjv/P/unooHcomDEcHlzk8eggJYFyiSyGvtnThe
 Grz6W0YTUB9LJrFQLue5RqQ0a5j2Q5DW9SQ036MvvZEg+cqMiKBjkTf2ddrOad8ribi8
 9u3YeCC7uwR6rhgbCGgzsXRkpOuzfjcq044Oh077mFrl2M0DQwmtrikXyVGfS359kaQa
 80NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4kuzln3qN3AZuhGvGhEMtnjZui3maENHGH9HD8vqYI4=;
 b=ndciDvUtk6CZsT8o/T75VNi8jC8JtpQiinzT1AszuUDH0l87GISycIiTfVzAwtBjHS
 gE5lgDF4Jsueeq5xW31g9okep25dQTIISyX+QQv+4Ys6j8xd+OjYdzKUnDg8G6A5q/To
 6Qpv5pv186A8BIzyfvFqgzB3YoQ8Hpbjb8jmL7APvFmdvKaVzNrme32ltNDuvGIC1z+9
 80UWMdTxKVLeL/xYMkTOo0aQ6EoTHszV7RZZtmMmXPYQfS8s2txd2luXRITnxl4S29wf
 Wgn82ELnu/fuB22igSLNjxvZ/oNBxaI9fTgh6ixFtgVWp1ZDsAGBdE4tYGrKHyOglFh7
 u9EA==
X-Gm-Message-State: AOAM533fKS7PWGuYudAX1SXdgVMm58rjD7OtRyY9R424a2TBKfqDlZdj
 gW4ExuN7Irkm/ku4YuZDTABos8dULzD/nyYq61o=
X-Google-Smtp-Source: ABdhPJzhZw6tXnFtcRmpzd0AaS8XocpIRainWP8n45zJio19ZJVPhVlsWzaPEsQ9rAfQFnO11DXDeM4ViwPXH1erMJg=
X-Received: by 2002:a02:5148:: with SMTP id s69mr4527208jaa.8.1611078048458;
 Tue, 19 Jan 2021 09:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-11-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-11-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 09:40:22 -0800
Message-ID: <CAKmqyKN2V2=R9Q7=G0zOEHnU11dHo47Kd0itSfRmC=CMUMjCQg@mail.gmail.com>
Subject: Re: [PATCH v6 10/72] target/riscv: rvv-1.0: check MSTATUS_VS when
 accessing vector csr registers
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
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
X-List-Received-Date: Tue, 19 Jan 2021 17:41:15 -0000

On Tue, Jan 12, 2021 at 2:03 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> If VS field is off, accessing vector csr registers should raise an
> illegal-instruction exception.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 7a6554447af..30f1593efb1 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -56,6 +56,11 @@ static int fs(CPURISCVState *env, int csrno)
>  static int vs(CPURISCVState *env, int csrno)
>  {
>      if (env->misa & RVV) {
> +#if !defined(CONFIG_USER_ONLY)
> +        if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
> +            return -1;
> +        }
> +#endif
>          return 0;
>      }
>      return -1;
> --
> 2.17.1
>
>

