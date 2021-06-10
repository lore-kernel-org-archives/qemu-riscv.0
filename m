Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrTuD-0003qm-Hb
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 19:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrTuC-0003mt-2w; Thu, 10 Jun 2021 19:16:08 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:46038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrTuA-0007ZS-At; Thu, 10 Jun 2021 19:16:07 -0400
Received: by mail-il1-x12d.google.com with SMTP id b5so3420167ilc.12;
 Thu, 10 Jun 2021 16:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SpNx9ERukGFWK5c3rJekIdaVj8yHxEm0ZMRi71AXfNM=;
 b=IGMNGAUzp50oVK4hjMP/eE6/A+G4bXU3vWmdT2JegtP1ovZISVptexoNMjvKxq/UfN
 D9BFBTxeVIQ6q4hCfN187vatDhJzfQPtwRWzTwnL3toUOSeXVuNWY6aGeUARVDwRTwqt
 fASoajOFa9Ei8usMScujUNy8Pjrqdsn4Mn/x6X/5/JlI3GN4pYD+t6nW/GhqTxCgsw7t
 ePnQJ2T2iqUdQUgm5KvQ+4Ofwpz6DcYdZjpN4i6MY1cmetaaApmXvsyoUlMMBYCIDQ7I
 vZBblKVWLYHP9g0bcmSdvjn5lDfkosS0olGyUYFj4EjF21NZ9c5V89VfQBuF7SGX92El
 TTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SpNx9ERukGFWK5c3rJekIdaVj8yHxEm0ZMRi71AXfNM=;
 b=VTf1eTnWokmOaiwEKmw7cYFaqES6E0z98XL822AVvS+8etVfInyy4AQSeszZVg/GCH
 cFf0yhvyN0FOyPffUeMgcijVNh+xgse/S6fMatWv/jCt9TqsODa0i/oaC0R49+YRcJSF
 jhChUBjPWOsYXC7BIRnKhISawKmmWo1PRwPqAL7dffBn6fEbqpbkZQ0/w95KojTlCBWx
 BR8HUoQD649ctLMSeB9BjrK5y7Si2jkXnkqSLz/Ps/TUFOidewrzB7Q+B0qpoPxixxuC
 HbhEfMgVrhuRZsTCag/hJ3HdJ95Y5lt+rA18hpTosMbDQyVF34bw96yStnxlQ/gcsW70
 wN4A==
X-Gm-Message-State: AOAM533OcO4JSiLtGD02ZHi4ksYlKsCzRz4UtVDwoXrdZAP1kXY+1Nbi
 0pYwf4b/K1AwcwsmWHxcBKTBzsuPrOL3qkdsnYk=
X-Google-Smtp-Source: ABdhPJzPAwg/lGKHXO5z9neSJHYjxVl7vXZZAWyfRik+NUqBin4ms4rIKtMA/07O8lXnmWC1blLYaaeUP14B02sZ0fU=
X-Received: by 2002:a92:c56d:: with SMTP id b13mr893610ilj.267.1623366964937; 
 Thu, 10 Jun 2021 16:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210514143242.377645-1-anup.patel@wdc.com>
 <20210514143242.377645-3-anup.patel@wdc.com>
In-Reply-To: <20210514143242.377645-3-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Jun 2021 09:15:38 +1000
Message-ID: <CAKmqyKNRJaOoWEPkxc1Xc7wJAiAZ8uokZ3UCQEnoShavxohWXA@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/riscv: Add CPU feature for AIA CSRs
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Thu, 10 Jun 2021 23:16:08 -0000

On Sat, May 15, 2021 at 12:35 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> We add experimental CPU feature to enable AIA CSRs. This experimental
> feature can be enabled by setting "x-aia=true" for CPU in the QEMU
> command-line parameters.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  target/riscv/cpu.c | 5 +++++
>  target/riscv/cpu.h | 4 +++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7d6ed80f6b..f3702111ae 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -414,6 +414,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          set_feature(env, RISCV_FEATURE_PMP);
>      }
>
> +    if (cpu->cfg.aia) {
> +        set_feature(env, RISCV_FEATURE_AIA);
> +    }
> +
>      set_resetvec(env, cpu->cfg.resetvec);
>
>      /* If only XLEN is set for misa, then set misa from properties */
> @@ -554,6 +558,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> +    DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),

This line should be a seperate patch at the end of the series.

The idea is that we don't allow users to enable the feature until it
has been fully implemented.

Alistair

>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0a33d387ba..f00c60c840 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -80,7 +80,8 @@
>  enum {
>      RISCV_FEATURE_MMU,
>      RISCV_FEATURE_PMP,
> -    RISCV_FEATURE_MISA
> +    RISCV_FEATURE_MISA,
> +    RISCV_FEATURE_AIA
>  };
>
>  #define PRIV_VERSION_1_10_0 0x00011000
> @@ -303,6 +304,7 @@ struct RISCVCPU {
>          uint16_t elen;
>          bool mmu;
>          bool pmp;
> +        bool aia;
>          uint64_t resetvec;
>      } cfg;
>  };
> --
> 2.25.1
>
>

