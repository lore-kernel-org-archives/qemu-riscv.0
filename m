Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHFxy-00060q-7T
	for mharc-qemu-riscv@gnu.org; Sun, 15 Jan 2023 22:15:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHFxw-0005yr-EY; Sun, 15 Jan 2023 22:15:20 -0500
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHFxv-0003zF-0h; Sun, 15 Jan 2023 22:15:20 -0500
Received: by mail-vs1-xe30.google.com with SMTP id l125so8460936vsc.2;
 Sun, 15 Jan 2023 19:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1eDUDW3Do32BbxoncT7Oy8ZChkgrOKCbEGNkcCpFceg=;
 b=Ii4nyuQPcHFYqg5af3RE1trVE7Vb6QCMpalMaRtJgQVe7pk4HoYvRhm4x1YNm/OV8c
 hiW0K0gB9OML7MPzFeN7PKI2snHPx86hlBfUey0H2Jfm3rgAlHHvRwFsd/spe8G0oeyt
 54ELgqMqU6wr5xbtfUBlTJtugce0INdJbP2E9H7dcc4UOZckoYiX6B2svLxYr4qT434f
 2oObkUtv7ycXQdchUBH0KVH4iHnfrW74xH+iuVb3HmaoK//11oQ5H8lsE+EhfALiJYhS
 zSrg0tOVA4btJrYSYwPnMo9tmaWMxpi9PrYn3V5npMjw0+O0lzCgKWDsWQrLfXJmF3t0
 f4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1eDUDW3Do32BbxoncT7Oy8ZChkgrOKCbEGNkcCpFceg=;
 b=aLmfhSZJoqWDU7cKSSUY+bW8b/kymbXFZG9oo3B1cBr4QbygDcSOB/d8DjmFGgu60H
 JVmjSQi/RwQ3LEZeblaojAyJlnTiYv/znMXP57rQyye2eaH9H2LGwugIFLNm8NJlhII/
 PgmF8pU8H8m/q2LK1hvynhUmRFgXREKRAbTfWVhSkAXE5Dv8LNQeQCzvKAWvty1tg77a
 FZuiYl51HLFYEqKxaNc5RXXb/TJqw29Rx2r2jW3ScIJyBVjtSbVuVCYycThgsyzDvyij
 Sn98Q2hNeO2AEyV9rEiTR02z03FWccydkHEiymUpxQtFyrxerRxeTIbscLHuI9p0lnZv
 HY9w==
X-Gm-Message-State: AFqh2koQWPi0LGeizvhXVQN/10rBLEg1ERlWHlB2bd/xPO0a2CEgOZ2A
 XAbdZdN2Uz8pniSlXMSRmh6TZRkE0XuhBtRO8apVoHSuCA1WeQ==
X-Google-Smtp-Source: AMrXdXt8obYTEIgAMVuX20EbSIvAgxHGAZj9VZknW6VoBvPjsfyACeUlDJr6eeGCaNQ+TgJ1rdSG9LAGDm9mAbH4g2s=
X-Received: by 2002:a05:6102:510e:b0:3b1:2b83:1861 with SMTP id
 bm14-20020a056102510e00b003b12b831861mr11644412vsb.10.1673838917653; Sun, 15
 Jan 2023 19:15:17 -0800 (PST)
MIME-Version: 1.0
References: <20230109152655.340114-1-bmeng@tinylab.org>
In-Reply-To: <20230109152655.340114-1-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jan 2023 13:14:51 +1000
Message-ID: <CAKmqyKPStHj2Kq=CCb9=+wxUzxxCSRAX8iwBdaBezSW--NuHng@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Use TARGET_FMT_lx for env->mhartid
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
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
X-List-Received-Date: Mon, 16 Jan 2023 03:15:20 -0000

On Tue, Jan 10, 2023 at 1:28 AM Bin Meng <bmeng@tinylab.org> wrote:
>
> env->mhartid is currently casted to long before printed, which drops
> the high 32-bit for rv64 on 32-bit host. Use TARGET_FMT_lx instead.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  target/riscv/cpu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index cc75ca7667..a5ed6d3f63 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -660,9 +660,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              (env->priv_ver < isa_edata_arr[i].min_version)) {
>              isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
>  #ifndef CONFIG_USER_ONLY
> -            warn_report("disabling %s extension for hart 0x%lx because "
> -                        "privilege spec version does not match",
> -                        isa_edata_arr[i].name, (unsigned long)env->mhartid);
> +            warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx
> +                        " because privilege spec version does not match",
> +                        isa_edata_arr[i].name, env->mhartid);
>  #else
>              warn_report("disabling %s extension because "
>                          "privilege spec version does not match",
> --
> 2.34.1
>
>

