Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1my40c-0007oU-4H
	for mharc-qemu-riscv@gnu.org; Thu, 16 Dec 2021 22:34:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1my40Y-0007iw-UI; Thu, 16 Dec 2021 22:34:10 -0500
Received: from [2607:f8b0:4864:20::d35] (port=45750
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1my40U-0004WD-BM; Thu, 16 Dec 2021 22:34:08 -0500
Received: by mail-io1-xd35.google.com with SMTP id q72so1142325iod.12;
 Thu, 16 Dec 2021 19:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RnIo9Uhua4UCEl7q2nD44MO4B7TN8ti8zAuQe2ag0/g=;
 b=N/tH+L5w4iFozdrGCSUyhmDjWic/0fRjo7D7Egl7LTL2SEczLFcI2EUi0XP4i/kU9D
 PKIN2AUAQ3XyAK9dm3t+75PuDGG3IilZM7ZzyFgcooVc+romYMc07LBMqQDYpN+88cpf
 NgvCq+GElFZ4cpBmzYRen+c4mzGSKJI0LuWJolRTJGPu0jZY9YELco8MIhVAxVMeYtxO
 UOyTPZtauE4Rf3XnZ49QkBi1E5gynkJdLOLJOQ8qnL8zu95IqzkK3WgJ3ShgzAghgTNI
 qrHvbjDUqWjL9zb6/dfs4A60cZk6J1uxjIyvxhWs03ww65CtEgB4bVVIogQMYgl9Rfr3
 PRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RnIo9Uhua4UCEl7q2nD44MO4B7TN8ti8zAuQe2ag0/g=;
 b=Dn7zqZUmHHIUkZjhTl6rSO5rzaow9t276MuojsEVyfJaxUG+SQef51l7Y+1aUh7hS8
 TjKsMqefGeLwHFXgvRgeGtL04ENL6l0GsVbNQVBhmnM+YWsLIkCk6Ka5n1VBmS47X4PR
 KZDi/evrsf5zXDM1fOiemjuvZF5nnXO77RAXV/qsYIsxlEWiJd/W6GilGJpwrFVdZ7e9
 A9DH0cjJdcLaW7lqcDsVXKT/vk5EgxPiU8ziiqwBKbpTeUlZYJbpJcyhTqtMBERKX5Zz
 u3mHd57oFRyc33rzfPRfUnvElqNgYaqSzkUzjX2O3skqbN0sBMACzCYQ/2/MLlh3Plo/
 MQhQ==
X-Gm-Message-State: AOAM5331AgwKFqVP2op8hv7vpsf9sfQZ/caeaF+fq+vIGX5WUVTrxdUE
 yj9A8EbOyYh0JF2hjPRTWK8KUAqiWiJHDxD00i4=
X-Google-Smtp-Source: ABdhPJyc3TkKxfQbYGHmiQZUNLgDVkW9cp/M+9aWcDIUA+MepzeZs99xwpp2xc+7mMqHBZaFryiY9HVsl4qWmOv0V5k=
X-Received: by 2002:a05:6638:1395:: with SMTP id
 w21mr653133jad.125.1639712044924; 
 Thu, 16 Dec 2021 19:34:04 -0800 (PST)
MIME-Version: 1.0
References: <20211216051844.3921088-1-vineetg@rivosinc.com>
In-Reply-To: <20211216051844.3921088-1-vineetg@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 Dec 2021 13:33:38 +1000
Message-ID: <CAKmqyKPVU0RNhAq43KTAkBq+0PtZNQVYf1nqVMXXh7Kwpb8fow@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Enable bitmanip Zb[abcs] instructions
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 17 Dec 2021 03:34:11 -0000

On Thu, Dec 16, 2021 at 3:21 PM Vineet Gupta <vineetg@rivosinc.com> wrote:
>
> The bitmanip extension has now been ratified [1] and upstream tooling
> (gcc/binutils) support it too, so move them out of experimental and also
> enable by default (for better test exposure/coverage)
>
> [1] https://wiki.riscv.org/display/TECH/Recently+Ratified+Extensions
>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f81299812350..c00d59cd04b5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -635,10 +635,10 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>
>      /* These are experimental so mark with 'x-' */
> -    DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
> -    DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
> -    DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
> -    DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
> +    DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
> +    DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
> +    DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
> +    DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
>      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>      DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
> --
> 2.30.2
>
>

