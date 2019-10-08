Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHw4J-0002qL-JH
	for mharc-qemu-riscv@gnu.org; Tue, 08 Oct 2019 16:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39269)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iHw4H-0002q3-Pj
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 16:26:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iHw4G-00049J-DA
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 16:26:49 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42053)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iHw4G-00048x-6c
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 16:26:48 -0400
Received: by mail-pf1-f195.google.com with SMTP id q12so39966pff.9
 for <qemu-riscv@nongnu.org>; Tue, 08 Oct 2019 13:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=kQc89uftmwa+HzRPnyPSuM5Jq7S/nmCRSuOBGRsogm4=;
 b=ZhgTBN8186KpoGLpeZO0XJfqKqBa647ETa81cAtjJV/cKj1/1U99TuNGYwJ/eHDmIM
 ordpKDNpNe1jYcSq8yytN89+kXLdnNFAyoPHGYfbU5bcV91UAnumvmA+eTV+VBeuP/3q
 wYYwK6yoFgZP8/6b0iqu0nNLnzKZAl2GIuTMjmc6xmZ4bxJDsmdx3CG4qnojHZVeV8KQ
 ld7fseC39S4HpmfmwB3oBO7TKZgj6Mf26Oebs+u7Nn4OAV3cPM3kVRDkM/OFk5RUFwfr
 twTjcDrptbyK6/wxoRbWf+ZjvZrGdasbnV6VZIHOvLzmCoPfaEBkW3yyEv+jD8ZbGxXX
 zxDA==
X-Gm-Message-State: APjAAAUcDXzViFfyMkZhnfo2abAFIoROe5ce7Zo9wvQYViW/N4spW23+
 gyrhpe173qEdCd8zAAaxA11Yng==
X-Google-Smtp-Source: APXvYqygQrQrxipwBSmo7JicVOTCEPcsUJpDbD6xpeoTB4ZVcqDiZOojaFV3pQ39zQYDvyOdmYTfNg==
X-Received: by 2002:a62:cb:: with SMTP id 194mr42573892pfa.130.1570566406794; 
 Tue, 08 Oct 2019 13:26:46 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id u194sm57947pgc.30.2019.10.08.13.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 13:26:46 -0700 (PDT)
Date: Tue, 08 Oct 2019 13:26:46 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Oct 2019 13:26:42 PDT (-0700)
Subject: Re: [PATCH 2/2] riscv: sifive_u: Add ethernet0 to the aliases node
In-Reply-To: <1568971142-27979-2-git-send-email-bmeng.cn@gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-be9f6302-4920-4a48-bf8a-0fe7a560545b@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.195
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
X-List-Received-Date: Tue, 08 Oct 2019 20:26:51 -0000

On Fri, 20 Sep 2019 02:19:02 PDT (-0700), bmeng.cn@gmail.com wrote:
> U-Boot expects this alias to be in place in order to fix up the mac
> address of the ethernet node.
>
> This is to keep in sync with Linux kernel commit below:
> https://patchwork.kernel.org/patch/11133033/
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
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

Thanks.  These two are in the patch queue.

