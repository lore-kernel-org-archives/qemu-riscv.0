Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzkxZ-0002Bm-O6
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 13:33:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzkxX-00028p-UF; Wed, 13 Jan 2021 13:33:31 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:34417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzkxU-0004mw-Oa; Wed, 13 Jan 2021 13:33:31 -0500
Received: by mail-io1-xd2b.google.com with SMTP id u17so6183878iow.1;
 Wed, 13 Jan 2021 10:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kGUvZMbKCg47TaNxD4bEwjAfCSEm1PQxJ8bFUvYwm/I=;
 b=hnVMhUBoymt/6ubFimDGCRh/kAlnxE9MIdOGr5ZPF390BuoCvgWfYrZ78VZ60Js1Jg
 aCOlwDTbLJhaSZqSNQj8UPvag5DZoU+U18eKr30tMa8x8MtP9tE4/GriDjdmKIMZpYQM
 EuihNLk5NKpxRE5ZiaNCnt3mwcS86nHTopWLCLNPSKjaBnPtdi/car6pVl0sjmOk/bP+
 DNzleogph58t4v592HbUVvrt/65ri5NMfTzX7LWLUa58JUWGG0AOR05/4JCdQfnlLTXg
 UmSa4/zIgC7dH4tZwtDbV6C7g5fXcLPwddrHfwFvKZ/XdZNw5kRrw6JYAmst0yhPsEXk
 fepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kGUvZMbKCg47TaNxD4bEwjAfCSEm1PQxJ8bFUvYwm/I=;
 b=tLriTwE6pzScJjfwHpGo9s4EQ8l7H2752C/JjS9IsJiWWAtpjmUWcLh4o1Dj5siABt
 f0wZF3E3K2tS8vE3B1GBA7JRWOpMxzmf3o1HTbwonKlJtivPRug4F2hB1yv2tnPc1yhz
 LZs/As/xuLsXQ/LyT9fYhNHgzCB2tu+WpZUz/kFdjirHXLYtSX88QKZqAcXLISwClyy3
 K/v7DEqufp7gPyyOXpOJV01bq524LtzgL8y/b1/PU0HamNCgY+IfYkNKjRC3XPwxvl5E
 jzTWyKdPcAExxL4GeFPEN0u9oACMKPPdTpUGRdJjcI5BysOezUhvhr29iBqDmsUoB3YI
 Jlfw==
X-Gm-Message-State: AOAM533adV3i5Zkk6Cv8OmuwXQWfa4TbdQ0f0eKlHn3lddJsUJgPjcUH
 CaKS9GCg3Q9NfB53wVzmvZze+Pl4Htrm6qfm9MtroXLUcwU=
X-Google-Smtp-Source: ABdhPJxdr2AVN+4U2L+qVhHSONZXi1LV4P/OeEYi5kz9tJ47iitkNd0w5MX5TkngYCTE2OwHGeX4WOwp2PXiz689Uto=
X-Received: by 2002:a92:cb44:: with SMTP id f4mr3420675ilq.131.1610562806949; 
 Wed, 13 Jan 2021 10:33:26 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-20-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-20-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Jan 2021 10:33:00 -0800
Message-ID: <CAKmqyKMO4SrAU8iSsO8NCuZxXuVz+h2qVpKkKn5dK3dZh7mGug@mail.gmail.com>
Subject: Re: [PATCH 19/22] hw/riscv: sifive_u: Change SIFIVE_U_GEM_IRQ to
 decimal value
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Wed, 13 Jan 2021 18:33:32 -0000

On Thu, Dec 31, 2020 at 3:38 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> All other peripherals' IRQs are in the format of decimal value.
> Change SIFIVE_U_GEM_IRQ to be consistent.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  include/hw/riscv/sifive_u.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index de1464a2ce..2656b39808 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -127,7 +127,7 @@ enum {
>      SIFIVE_U_PDMA_IRQ6 = 29,
>      SIFIVE_U_PDMA_IRQ7 = 30,
>      SIFIVE_U_QSPI0_IRQ = 51,
> -    SIFIVE_U_GEM_IRQ = 0x35
> +    SIFIVE_U_GEM_IRQ = 53
>  };
>
>  enum {
> --
> 2.25.1
>
>

