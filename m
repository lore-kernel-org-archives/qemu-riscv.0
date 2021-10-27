Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfYpq-0004pV-Sb
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 22:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfYpp-0004oU-7D; Tue, 26 Oct 2021 22:38:37 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:42712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfYpn-0000lI-Bg; Tue, 26 Oct 2021 22:38:36 -0400
Received: by mail-io1-xd2c.google.com with SMTP id n67so1815817iod.9;
 Tue, 26 Oct 2021 19:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3hqbw/mdcOgUDSVxVL8UzC6dJ91tb0zhr1++4d4NMpw=;
 b=dwSdqrMxZ4le+DdQNyhWKL9YirE5QFHpuSDXqT77jXujppLH6aTygy5dLXYjlkdekM
 HUxGdYsuVjsEigS8P3eyWjkOZnJCpgDASQQahKvlLKXC6bVG8x7g0IPgfsyovRbCiu+H
 ThAbxCXS39aCf8uN1pYZhzIvq2RwjpO2DqAWDoH3zbwY39hfHYvUQxJpPVNPBVFrh2ra
 bvgcIqnQevvk5qkcuuh6pOU6bhBDsdpi1nS5KpK1HNyEMImeOH5wNGmpWIWRxrSnbILb
 YLpcUm+5Scpb8OdSBf+ywnPqsigJMs1zENMcWTAtEiHfQgj4WylgFG4GqsUSuEw71VM9
 +s7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3hqbw/mdcOgUDSVxVL8UzC6dJ91tb0zhr1++4d4NMpw=;
 b=hOKcXC92YP3zbVgxrlFvbaCQ8qMPHt9Wx/atb74yEoDJA5VufGrKUvoHYSfTQk+zlA
 k12XPMSoCbGMv/dsiWtJWsG9p+W3euQsm1XFFqDA/m2XMb5C/zIE1zjva1/h9j82R4B7
 oagIPT4qZ+HBS8ZTPo2jklOZJQHOKvlPiAkb3AFm5nInxCUqicgp+hGkUNscA8V2/S5I
 CgOsNY9YZkQJO8/eiAtoZ9omslkiJ+YAUPCpf1skBAFW1lp6KrYOsbaG5dUveN/gj896
 IInddq9Jrl8ZDLZ3aPQqvHookqP65/NzDVfyFJJeKVvYexv76NszJYdM2xqFu658aNmP
 bEHA==
X-Gm-Message-State: AOAM532rCY7d3Ho0fav+/Gl3PwQi0ilyNFFhBoG6x75wO64UtfNf078z
 PFiKIG4LXl6N63Q/DAET19nHRxMEmFgjXHzRUFA=
X-Google-Smtp-Source: ABdhPJy4L2T60SOcIB4X879Nzj37EwA+jWMRb6/wb9xciiKqEzUDffq2WtDp6O6vbf9Wt8/JEisU6b4OjRTIxPIahz0=
X-Received: by 2002:a05:6602:2bf7:: with SMTP id
 d23mr17717779ioy.187.1635302313558; 
 Tue, 26 Oct 2021 19:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211025124319.195290-1-rpathak@ventanamicro.com>
 <20211025124319.195290-2-rpathak@ventanamicro.com>
In-Reply-To: <20211025124319.195290-2-rpathak@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 27 Oct 2021 12:38:07 +1000
Message-ID: <CAKmqyKORccGLiwCtFu=-M88bDXbKJiYPFh38tccB5=hBDdrCPg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/riscv: Add priv spec 1.12.0 version check
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Wed, 27 Oct 2021 02:38:37 -0000

On Mon, Oct 25, 2021 at 10:55 PM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 4 +++-
>  target/riscv/cpu.h | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 788fa0b11c..83c3814a5a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -405,7 +405,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      }
>
>      if (cpu->cfg.priv_spec) {
> -        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
> +        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
> +            priv_version = PRIV_VERSION_1_12_0;
> +        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {

This change, actually allowing the user to enable the spec, should be
in a separate patch at the end of the series.

The idea is to add the feature, then expose it.

Alistair


>              priv_version = PRIV_VERSION_1_11_0;
>          } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
>              priv_version = PRIV_VERSION_1_10_0;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index a33dc30be8..67c52e6f9e 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -79,6 +79,7 @@ enum {
>
>  #define PRIV_VERSION_1_10_0 0x00011000
>  #define PRIV_VERSION_1_11_0 0x00011100
> +#define PRIV_VERSION_1_12_0 0x00011200
>
>  #define VEXT_VERSION_0_07_1 0x00000701
>
> --
> 2.25.1
>
>

