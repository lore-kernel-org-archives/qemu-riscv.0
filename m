Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jkrnr-00062P-73
	for mharc-qemu-riscv@gnu.org; Mon, 15 Jun 2020 12:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jkrno-0005zs-Fz; Mon, 15 Jun 2020 12:17:40 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:36651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jkrnm-00040h-N0; Mon, 15 Jun 2020 12:17:40 -0400
Received: by mail-il1-x143.google.com with SMTP id a13so15875246ilh.3;
 Mon, 15 Jun 2020 09:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hI9MX4ofyyUfruODIlPBhDAbqYvRiqrXJQq+F+BFs1M=;
 b=ia0/iCOsdFHjyruRBIleN6Pb1uw/SmEH79k5Z+N2SjBLEfKKjTGvwpY8/8DdhnRA2K
 Ekq6YE8mn+zk5UZX+PRB9Rb94ms6/+BKrWn0KpqoJYVXA7YqzCCdqLEnjJMOFEJvfve8
 bMd+7S61eZnwVCkxhv6PhR93od5EIKEJMa30MdT+BSR3QbCJW63lXnKTV7BNBUn7XWXy
 E071vNc1b1InZ5nVRtzFIuhD+UH7Hl5pdd8bNSjCiR+qkv0gfeubsQR9/0MKyuTs2o3X
 /ZKSP/MiiH7UNEW6wrT8BvEOHqBnIt93+5+H9otIN3kdjY61RFF3E95uaJTlAgaOiDs+
 Yfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hI9MX4ofyyUfruODIlPBhDAbqYvRiqrXJQq+F+BFs1M=;
 b=jrylOc7qc8A5+qo3ZdFawJbNWCzeM2gn+/1sGwA6eGFB7NIyst5RZUcDFEv/U6bVYj
 rNkGpK1iRoHOIQRiU/lmScccb0WJdIvt1xdprqyXLNLhsBbbU5I/mDrjPNZg7CJPaL3j
 lMogv5n9D8f/0c7s6Eel7CGsYJ21HqhVXPY09zQPc8nS+m64Ns1kd1cwhajNzMcxGB6T
 /+i+7dRscTtqWzlUbhNS2yw9Jz7V7qMYambwEEriVuNgnroq1Eiq00E02Mxs/YQB6CbP
 nYWdFeqIWa3mo3S8aPLyyZwboDBXzDso8lveB3Qu++ozO7VhG7T9xL56kYVB13hrWCSQ
 G86A==
X-Gm-Message-State: AOAM532/OLCt+urK8f0xTlI/KIAx2nMPR5BFtVZ+KAIkRi4xW7Qqgj/c
 hndkYPGvha6BFxovDI0awnULpkl9b46LlhQGNdo=
X-Google-Smtp-Source: ABdhPJzhbR/oe70IMDJ3kDyqkmKMxRxOBeKbR3GkGiU+3mkXeAfNm2WewAAzaWIIWW0MY9mMTyMyttYQBZ5IWq0SnKU=
X-Received: by 2002:a92:aa07:: with SMTP id j7mr27549997ili.40.1592237856632; 
 Mon, 15 Jun 2020 09:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <1591625864-31494-1-git-send-email-bmeng.cn@gmail.com>
 <1591625864-31494-5-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1591625864-31494-5-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Jun 2020 09:08:13 -0700
Message-ID: <CAKmqyKObYVrCuYHKWKLYYcJEQJMxoCvRbYVTBObXm_crtCJSzQ@mail.gmail.com>
Subject: Re: [PATCH 04/15] hw/riscv: sifive_u: Generate device tree node for
 OTP
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 15 Jun 2020 16:17:42 -0000

On Mon, Jun 8, 2020 at 7:21 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Upstream U-Boot v2020.07 codes switch to access SiFive FU540 OTP
> based on device tree information. Let's generate the device tree
> node for OTP.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/sifive_u.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index cf7f833..8dc6842 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -207,6 +207,17 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>      g_free(cells);
>      g_free(nodename);
>
> +    nodename = g_strdup_printf("/soc/otp@%lx",
> +        (long)memmap[SIFIVE_U_OTP].base);
> +    qemu_fdt_add_subnode(fdt, nodename);
> +    qemu_fdt_setprop_cell(fdt, nodename, "fuse-count", SIFIVE_U_OTP_REG_SIZE);
> +    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> +        0x0, memmap[SIFIVE_U_OTP].base,
> +        0x0, memmap[SIFIVE_U_OTP].size);
> +    qemu_fdt_setprop_string(fdt, nodename, "compatible",
> +        "sifive,fu540-c000-otp");
> +    g_free(nodename);
> +
>      prci_phandle = phandle++;
>      nodename = g_strdup_printf("/soc/clock-controller@%lx",
>          (long)memmap[SIFIVE_U_PRCI].base);
> --
> 2.7.4
>
>

