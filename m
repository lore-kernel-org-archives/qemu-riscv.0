Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kFezM-0007Ul-R8
	for mharc-qemu-riscv@gnu.org; Tue, 08 Sep 2020 10:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kFezK-0007S9-UW
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2020 10:52:50 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:45106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kFezJ-0002DP-DQ
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2020 10:52:50 -0400
Received: by mail-ej1-x641.google.com with SMTP id i26so22940602ejb.12
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2020 07:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GezjhMinrKGuK08uJoVyOZMTK6mhnTZ5YhOgEQjyS+E=;
 b=q2bFdz0m07SmMBBIl98ZaJqtC0JFuf9J7jTLs+LyhZl7vU/VmzREG7vYE8hShsuykA
 32EaZiKW9I9tM6yA8r9o69f5elWuXwwsxo/9LUVQvz6T7HjLE4Gk4WJCHZt5OP6a0Q4n
 2P5LkxcgWxKkzsKPtcwggh2xhbjlMQVmiI9Ie6Br2FxWMSR5h/4x4JUlgp5OzHAEEUt/
 2muvNpCSWrgK/xvVr+SW8FkQ6jrfY/ows/0mZWhdAfvX02on2pE7dlFzKv4m7BhomGA7
 2RcMKKyPE69REuOHN/tzVb/fJX8wlWUbIgDIDu4PwZbQzQMJ3nD+dAq4LKMlPOY6Vgt6
 yRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GezjhMinrKGuK08uJoVyOZMTK6mhnTZ5YhOgEQjyS+E=;
 b=PWXW9PqsCBTX3zuVfHKpH+1nGxl3B3mfc6f9aPZPWUCW/q//Y5XrDVi85QceemP+F8
 RzTmSla9x81xC04sHYjL16BjDj2ZeszDPKlzGUlkRIDEl28X2R91+TmUIYdHawYkNuYO
 uTAsc3WnATEDtrIElNwD2GtiiFCT4YtygqJnO1vVIiytAfHWUKKuFggmGfOinueZaYq8
 C/pmo8cjUs1NLvNZzwJbOR+tSuBwEw6cEPLKnOcycNFQeyeE84DvbAQmb3/4SQws5h2B
 iv4J04/hd6UlxFwVXr8ku8eygWdWndQgyXCrtS4MdIcw4Pe78ywiwkkUyT/c4n3dxh2W
 Y/WA==
X-Gm-Message-State: AOAM531xzG1mcVqXwEvufFx8BXK4HFLQJF74WBrF0rO9XLGEq6c9lh3H
 A0AgCqMfoA0Vi/or/aktKjzW5PPETMQaYE3oogB8lQ==
X-Google-Smtp-Source: ABdhPJzLwI+21WMVHbKAEcinTkhjaDTOnsqNsMVsgHm2qkFNzwpY5ZANtRrJcsf2Yx/SBxTYgz6Cr6pxYWzfFZW7VKc=
X-Received: by 2002:a17:906:2cc2:: with SMTP id
 r2mr25815970ejr.482.1599576767432; 
 Tue, 08 Sep 2020 07:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590704015.git.alistair.francis@wdc.com>
 <0ab3cecbe801f9e14ad1a5447d02483b9008fdbb.1590704015.git.alistair.francis@wdc.com>
In-Reply-To: <0ab3cecbe801f9e14ad1a5447d02483b9008fdbb.1590704015.git.alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Sep 2020 15:52:36 +0100
Message-ID: <CAFEAcA83=4=EhtQLmGJn5Z_PVZaDyo7pMwdX-9fTVUkVKe7Acw@mail.gmail.com>
Subject: Re: [PATCH v5 06/11] riscv: Initial commit of OpenTitan machine
To: Alistair Francis <alistair.francis@wdc.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 08 Sep 2020 14:52:51 -0000

On Thu, 28 May 2020 at 23:31, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> This adds a barebone OpenTitan machine to QEMU.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bin.meng@windriver.com>
> ---
>  default-configs/riscv32-softmmu.mak |   1 +
>  default-configs/riscv64-softmmu.mak |  11 +-

Just noticed this, but:

> diff --git a/default-configs/riscv32-softmmu.mak b/default-configs/riscv32-softmmu.mak
> index 1ae077ed87..94a236c9c2 100644
> --- a/default-configs/riscv32-softmmu.mak
> +++ b/default-configs/riscv32-softmmu.mak
> @@ -10,3 +10,4 @@ CONFIG_SPIKE=y
>  CONFIG_SIFIVE_E=y
>  CONFIG_SIFIVE_U=y
>  CONFIG_RISCV_VIRT=y
> +CONFIG_OPENTITAN=y
> diff --git a/default-configs/riscv64-softmmu.mak b/default-configs/riscv64-softmmu.mak
> index 235c6f473f..aaf6d735bb 100644
> --- a/default-configs/riscv64-softmmu.mak
> +++ b/default-configs/riscv64-softmmu.mak
> @@ -1,3 +1,12 @@
>  # Default configuration for riscv64-softmmu
>
> -include riscv32-softmmu.mak
> +# Uncomment the following lines to disable these optional devices:
> +#
> +#CONFIG_PCI_DEVICES=n
> +
> +# Boards:
> +#
> +CONFIG_SPIKE=y
> +CONFIG_SIFIVE_E=y
> +CONFIG_SIFIVE_U=y
> +CONFIG_RISCV_VIRT=y

...shouldn't the riscv64-softmmu config have CONFIG_OPENTITAN too?
The usual principle is that the 64-bit executable can run the
32-bit boards too.

thanks
-- PMM

