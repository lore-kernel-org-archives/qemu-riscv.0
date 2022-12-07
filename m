Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2m8W-0004MQ-Fs
	for mharc-qemu-riscv@gnu.org; Tue, 06 Dec 2022 23:34:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2m8U-0004M8-LR; Tue, 06 Dec 2022 23:34:22 -0500
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2m8T-0005hq-A6; Tue, 06 Dec 2022 23:34:22 -0500
Received: by mail-vs1-xe36.google.com with SMTP id k185so16193090vsc.2;
 Tue, 06 Dec 2022 20:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7ujKlZAmvEdF81wlyE62kYTq+WCfoP64C8ycrw2cZts=;
 b=moWirwEw/2D8dBudjTpFy2GKpiNq36ZhdESbI8qwclLJ0lfUMNaG/TpNuz6GqCUSXm
 PGnsGoWXSlfVupgOyJW+AND0kUWU6PTYiC/qMrK3k9v2K+RRATbYSBHgoOdB+8sRqct2
 YzisCq6XtedoVANldL1IwnDdShAtR3assk5bODp507y4OAdVjYpiDTpIO9mpJbDPvRIj
 fuRy9Pei1bgkxNIC/1syy5hNXEJwinAgLgoxIwDmSThGymjGBafJCszrxgFHPNU33Dtx
 BPQSnUiFC1DW9OI7YcmbnGfCkJUgeejQp4cDzz4jc7hFPGoAiHei1NpSRwJJSr2SMBvu
 ZEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ujKlZAmvEdF81wlyE62kYTq+WCfoP64C8ycrw2cZts=;
 b=OoNu3Tbt15w0a08OjkAbjz/M6K90G0xq11cia9nzXUQfmeV41Qjq4RbmRVB8hlPU0h
 nzV8qFic3vRATbJbwK/h9oas9W260sJiWL96lR6qdKrZGGLSkYNM0OkrlcFSA7gOPMKq
 3hC+9TwAzPEQOu4fKQfspBoD3CKuvfXByYO/pFB8weIqxjPdcqzjviKHVN8/KNNL0ZPP
 +aU0rb3zp7PTGj91YvEU3LZMbvAl/s98h2uqXQ8bcq0qK3+N9/gonFf4xK2KZ+ohfrUT
 Oz3JzRY1t1988IuDP/j22t/fUtSYO1Y9w63ewRAw/iiteXiVN9lYKGROK64xyR19/7n0
 dTIw==
X-Gm-Message-State: ANoB5pmCv+tQxh4LkwTzfY+f18mXBaODl2s+1HMuZoEWhbv7q7eDNRRX
 sHifpHHIl6w6540iaSSZBM2Mk8+1AFYZP7rUILriCZf+5YA=
X-Google-Smtp-Source: AA0mqf5gw5cKAMA9E0EskUQJmxj+dCs3tpEcaEQ8Qn3vd/4pR5gpbJRwAEJxvf+1H9rWh3GkSsqU3FNoryInbE4dW4s=
X-Received: by 2002:a05:6102:302b:b0:3b0:f936:788b with SMTP id
 v11-20020a056102302b00b003b0f936788bmr14070592vsa.54.1670387659822; Tue, 06
 Dec 2022 20:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-11-bmeng@tinylab.org>
In-Reply-To: <20221201140811.142123-11-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Dec 2022 14:33:53 +1000
Message-ID: <CAKmqyKMfw4d_n2wtWwvbSmApFBvW+FUV5Zp=JN=o7+=n8ndN5A@mail.gmail.com>
Subject: Re: [PATCH 11/15] hw/riscv: sifive_u: Avoid using magic number for
 "riscv, ndev"
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
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
X-List-Received-Date: Wed, 07 Dec 2022 04:34:23 -0000

On Fri, Dec 2, 2022 at 12:11 AM Bin Meng <bmeng@tinylab.org> wrote:
>
> At present magic number is used to create "riscv,ndev" property
> in the dtb. Let's use the macro SIFIVE_U_PLIC_NUM_SOURCES that
> is used to instantiate the PLIC model instead.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/sifive_u.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index b139824aab..b40a4767e2 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -287,7 +287,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      qemu_fdt_setprop_cells(fdt, nodename, "reg",
>          0x0, memmap[SIFIVE_U_DEV_PLIC].base,
>          0x0, memmap[SIFIVE_U_DEV_PLIC].size);
> -    qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", 0x35);
> +    qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev",
> +                          SIFIVE_U_PLIC_NUM_SOURCES - 1);
>      qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
>      plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
>      g_free(cells);
> --
> 2.34.1
>
>

