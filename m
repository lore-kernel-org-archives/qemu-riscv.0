Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iBO0d-0003Ul-Iz
	for mharc-qemu-riscv@gnu.org; Fri, 20 Sep 2019 14:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54252)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iBO0a-0003EO-4N
 for qemu-riscv@nongnu.org; Fri, 20 Sep 2019 14:51:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iBO0Y-0005jT-Tr
 for qemu-riscv@nongnu.org; Fri, 20 Sep 2019 14:51:56 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:39705)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iBO0V-0005dD-VZ; Fri, 20 Sep 2019 14:51:52 -0400
Received: by mail-lj1-x241.google.com with SMTP id y3so6664651ljj.6;
 Fri, 20 Sep 2019 11:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YfY/MAu7KDMGu08UFK1jfhgN3b/WKiIdCyVpMt7B7Kk=;
 b=HvYqHk/PcdlqDEtCBu5YD3lzfkMGKCyWox0WHoleYnfEOw2Gl04WRdthBXcEejI2vd
 BPRVeSbZteBIJj88phIKXgA+nnWUA/cwgvg0kx9br3w21bFmnL2brqIHJLCx/4+vh9M2
 UgeXT2Y5hdQj8HNhYoS7JuZNUAZY0Ql9NVQasBpom1uNqn/0krVyEGnmKVvoW27SNXA9
 1YK8knOtqRLQf16e8PXuRifE2PR1V2ZgPz35MwOdg66mLBjz4tvbGLSopuMhinqPDTsZ
 e8B+obEODv5RJZZ8c4stmP87fYt28ssMfpFK2ZR6QZpeDzk2DiFHc8zSGEVUesEqKGqb
 k4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YfY/MAu7KDMGu08UFK1jfhgN3b/WKiIdCyVpMt7B7Kk=;
 b=SScrUYsN9NyuTvNsdMPvf/1dvCr6S0SYrPVx8VPYYNfOc5aaRKy2H0MgZUrOsq5Cgl
 rblB6CyTnVNhDrgM2Jlpv4as9F5aHpFvH3czicQkfvJMR2Ql9FX6UkbO6ymFniTYJIFT
 WaHG3c/IZGd8mFy1tj7ZszBOrE6V2KCBgZDX0y9KTeFQkDBmNWD0NRiStlGE51hWRinH
 8XtyPOtYoC4wSuWW2P3qjauDCf29zoSYViZAWFVbK83nOYX+RqtZM3BQB97rRDDDyGsL
 dfgY1pg/XBsvx0UTQCiE+MK864MlmauCBGRlxIiK3cB+JYzrWzZVRm7Y8nrAosJ6OJgD
 wQmA==
X-Gm-Message-State: APjAAAWPU7qGmJ5QtC1+BMvORa5gJpQscPdUJYReZDNQE3c9dQg6/pVM
 bq5cxTI/7E4BqM02ZZMKXsEVUFnKhiFhCER1btk=
X-Google-Smtp-Source: APXvYqyyP+S/UirJziZXPKIUaDiCqQTcYWyk9smUG90K6M8ySDBJxr0AjC1GKCzuMQfyUDIHWBFDIh/NqbjC9pUHQp4=
X-Received: by 2002:a2e:890c:: with SMTP id d12mr6732141lji.85.1569005510831; 
 Fri, 20 Sep 2019 11:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <1568971142-27979-1-git-send-email-bmeng.cn@gmail.com>
 <1568971142-27979-2-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1568971142-27979-2-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 20 Sep 2019 11:47:15 -0700
Message-ID: <CAKmqyKOz=5b6_7AOGDp=4VvmynUvWZB-N8KudkwwOGUtGgFhog@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: sifive_u: Add ethernet0 to the aliases node
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
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
X-List-Received-Date: Fri, 20 Sep 2019 18:51:57 -0000

On Fri, Sep 20, 2019 at 2:26 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> U-Boot expects this alias to be in place in order to fix up the mac
> address of the ethernet node.
>
> This is to keep in sync with Linux kernel commit below:
> https://patchwork.kernel.org/patch/11133033/
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/sifive_u.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 02dd761..1ac51e3 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -270,6 +270,10 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>          s->soc.gem.conf.macaddr.a, ETH_ALEN);
>      qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
>      qemu_fdt_setprop_cell(fdt, nodename, "#size-cells", 0);
> +
> +    qemu_fdt_add_subnode(fdt, "/aliases");
> +    qemu_fdt_setprop_string(fdt, "/aliases", "ethernet0", nodename);
> +
>      g_free(nodename);
>
>      nodename = g_strdup_printf("/soc/ethernet@%lx/ethernet-phy@0",
> @@ -297,7 +301,6 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>          qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
>      }
>
> -    qemu_fdt_add_subnode(fdt, "/aliases");
>      qemu_fdt_setprop_string(fdt, "/aliases", "serial0", nodename);
>
>      g_free(nodename);
> --
> 2.7.4
>
>

