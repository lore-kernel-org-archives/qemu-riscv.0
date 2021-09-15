Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQJXe-0001Vz-VZ
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 21:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQJXd-0001Tg-Ip; Tue, 14 Sep 2021 21:16:49 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:45925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQJXc-0004UG-0Z; Tue, 14 Sep 2021 21:16:49 -0400
Received: by mail-il1-x131.google.com with SMTP id b8so1107963ilh.12;
 Tue, 14 Sep 2021 18:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NaVdBVNuL9MCMwUcbpCrWaGnom84DpzufvTagvMN6Bs=;
 b=S1DFHf6UijY7po7Toe3JPv8UiwrCRbW8Q4UDwUXHnEHo11jG4L6L7u9qfMXi96LujS
 lzJxwBqbgQLY1uPJlWJx/J6g9HY+MVnhEfclmJj7zZ7UfDdSKtXjAs71ZVylvxsWy2/q
 evJNAmN+prhZKQ27pXAHxAtiVy3Iot57QMwKV2VEXMRwkd/aZjqpfwDPrGGjtUlSRHLm
 6xep0qS9C78YrL5vYqz0+sJ0LmmHUFBZW0PD9YCr2g9fHJ5PVQiHSi+OkanG3ZleV/Hb
 PQYoZTAvgYDIwbMSsXqvKxBCKIk53+Ucj2g40n6D1fwJsBkekcknaWGL8GiYv/rdVn0E
 g8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NaVdBVNuL9MCMwUcbpCrWaGnom84DpzufvTagvMN6Bs=;
 b=4fUHsLyrt4vMSXLsKPoA7kVs/LqF5rIcT45wj3G2iLZ0pFa2Uxia8rNq6GfP9RAk82
 xdRIpVY5g/ZT4hZ9rG8dXIcmb/HqAJPbbs3vdiBP40p9exrbtIN7oDBvKJ6UPzsVeaNO
 Tz7RVO2Rxu6DItyYUjnfDhiJJczLV36I8zAaJTif95PWU2v2Y0mSHMM9AJFX21FzYKEJ
 +vxuyCgDOX81gvQG6f2SK2QYOE27pCV/AZtYmjTtlNph5OWxzYyZdA9j3vDCzU5T9Vl1
 J0xyNpkgvC57edYAAEmI69OiFcW9ii2s1KfhSPw6qNxeB2AZy+oEjtx+uxDE7oRNpjk2
 ZV7w==
X-Gm-Message-State: AOAM532CejbuwwE0drcADs5hKcu/7aQUnU9d0zt+6uWYxCz+vP/fp6qF
 irO75v4hEGisqGRwtFtxHxcCfKD0Rw7W15AJzl0=
X-Google-Smtp-Source: ABdhPJz6kSv98Q71GY/Sliq0xDmyRGQQuuVxo7ok8aao0MvcG9vEH1hrDaj1d7GzpmVr94AHhyey8JZsnFSKDhIV+qs=
X-Received: by 2002:a92:280f:: with SMTP id l15mr13392625ilf.74.1631668604922; 
 Tue, 14 Sep 2021 18:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
 <20210902112520.475901-18-anup.patel@wdc.com>
In-Reply-To: <20210902112520.475901-18-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Sep 2021 11:16:18 +1000
Message-ID: <CAKmqyKPkZmhBpRsu3eVjQ96NGK1kQWuQQOWOxKLtO-GGQq7PXQ@mail.gmail.com>
Subject: Re: [PATCH v2 17/22] target/riscv: Allow users to force enable AIA
 CSRs in HART
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Wed, 15 Sep 2021 01:16:49 -0000

On Thu, Sep 2, 2021 at 10:03 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We add "x-aia" command-line option for RISC-V HART using which
> allows users to force enable CPU AIA CSRs without changing the
> interrupt controller available in RISC-V machine.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 5 +++++
>  target/riscv/cpu.h | 1 +
>  2 files changed, 6 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e0f4ae4224..9723d54eaf 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -452,6 +452,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          }
>      }
>
> +    if (cpu->cfg.aia) {
> +        riscv_set_feature(env, RISCV_FEATURE_AIA);
> +    }
> +
>      set_resetvec(env, cpu->cfg.resetvec);
>
>      /* If only XLEN is set for misa, then set misa from properties */
> @@ -672,6 +676,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> +    DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
>
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
>      DEFINE_PROP_END_OF_LIST(),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 16a4596433..cab9e90153 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -337,6 +337,7 @@ struct RISCVCPU {
>          bool mmu;
>          bool pmp;
>          bool epmp;
> +        bool aia;
>          uint64_t resetvec;
>      } cfg;
>  };
> --
> 2.25.1
>
>

