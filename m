Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8f6A-0007WQ-7a
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 05:16:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8f67-0007Vo-K6; Fri, 23 Dec 2022 05:16:15 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8f65-0001VA-NL; Fri, 23 Dec 2022 05:16:15 -0500
Received: by mail-ej1-x62b.google.com with SMTP id bj12so10971588ejb.13;
 Fri, 23 Dec 2022 02:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jNukg/4W4A+BB84b5h9dwHWkwu0FFGF1cB5dfNq5YaM=;
 b=itEWeTXQ5qSlP2oEV+waKa3/+W6onVWvU7CLr1i2JHh/ESkfTgo1Z5pji9eCj840/P
 IoSRUV2CyHOjW67SY4DpHyCS7YF8us1f25sHwqEan7PFLUWnPQrrqUGzkathZDnxr3ec
 7gffGDjrgXgLqrgTlpAzgY4nWARTNBGoYgD7BqWD74LczpmRs8wa26EeidqKwg2Xwvuu
 s09hOkxwftgnL8+cz2mJCW8xBELR7scVtQlqhk4BSKXv66UaMLuieUzH8Tuoytkpmkc/
 J7NpJh7jilV6S9Scgyu4mzt5qEsE6XtVU2sw1F09n4gI2Hy5B431JSdz2IXjsZpJ4nY8
 IkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jNukg/4W4A+BB84b5h9dwHWkwu0FFGF1cB5dfNq5YaM=;
 b=AjzjWm5yPW4eDdcFpp/vSS61nBiagS4n36wGtdv7WlxlOeoOPbiE9e4laihyUDPQhn
 SmGdBRy3LwMZBkkIW6QYB1lb16IQq89R2DbQaw6u4ISkRF4UulM0RZXP69FVuZp6ksJN
 /pBhZIYvPmP+HQap+AAPoKYeWQMcsEtg+7uEQDlnQnc/Hcu5RkAlhkdQFhoCOVRNzOUO
 mO/sor9CBzn8ODtuKoNTysJ4+Wh3GHDjElXH72SlqkjGA038WQGZxYOYq9xAv9fBlMPC
 dXxfKz9BY5QevIRzImRju9OHi/B2qNOjJtNgW3EIm2xDwmPnAyvQWxExHUWSTzEZ+8op
 AAwg==
X-Gm-Message-State: AFqh2ko2S9lbtSTK04jkrlRUlRKzHFemwFEzl41lmUeiuj1L8RpOycZE
 k+eyS0OlOmyMhA2Qoj2DxcNGeK1+juJrml51pYo=
X-Google-Smtp-Source: AMrXdXslU7RJDh5CdbijLBvD3grZX4olmyXZT5vlZK3rAtUxeydRoImpwgX4NdaSAHscyMR9x9LttniZ6bsE7xbXh6s=
X-Received: by 2002:a17:906:5798:b0:7c0:dcb3:718b with SMTP id
 k24-20020a170906579800b007c0dcb3718bmr558360ejq.711.1671790571534; Fri, 23
 Dec 2022 02:16:11 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-8-dbarboza@ventanamicro.com>
In-Reply-To: <20221221182300.307900-8-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 23 Dec 2022 18:15:59 +0800
Message-ID: <CAEUhbmUwvj5BV9CS3v-V+cLuLY-uOWSu9082tZv8q5DfM-i0OA@mail.gmail.com>
Subject: Re: [PATCH 07/15] hw/riscv: write initrd 'chosen' FDT inside
 riscv_load_initrd()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 23 Dec 2022 10:16:16 -0000

On Thu, Dec 22, 2022 at 2:24 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> riscv_load_initrd() returns the initrd end addr while also writing a
> 'start' var to mark the addr start. These informations are being used
> just to write the initrd FDT node. Every existing caller of
> riscv_load_initrd() is writing the FDT in the same manner.
>
> We can simplify things by writing the FDT inside riscv_load_initrd(),
> sparing callers from having to manage start/end addrs to write the FDT
> themselves.
>
> An 'if (fdt)' check is already inserted at the end of the function
> because we'll end up using it later on with other boards that doesn=C2=B4=
t

doesn't

> have a FDT.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/boot.c            | 18 ++++++++++++------
>  hw/riscv/microchip_pfsoc.c | 10 ++--------
>  hw/riscv/sifive_u.c        | 10 ++--------
>  hw/riscv/spike.c           | 10 ++--------
>  hw/riscv/virt.c            | 10 ++--------
>  include/hw/riscv/boot.h    |  4 ++--
>  6 files changed, 22 insertions(+), 40 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

