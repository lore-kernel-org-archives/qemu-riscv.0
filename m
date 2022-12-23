Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8evJ-0003mz-TV
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 05:05:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8ev2-0003ho-2t; Fri, 23 Dec 2022 05:04:50 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8euy-0003DF-HU; Fri, 23 Dec 2022 05:04:45 -0500
Received: by mail-ej1-x630.google.com with SMTP id x22so10945346ejs.11;
 Fri, 23 Dec 2022 02:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i1LJ/VTQXoiL6dak8tUDfJfgzTnYpLMX1F80eadLzaA=;
 b=DGVjjRTDrL89J7+M54RfP4m2cQmrLX/hH39Tq6xj6PadjV7xm+vcCxc40tYC01BDjn
 Mp8PXMDxCYkkRKKzxHToUjIphQKPQs+EM67OwAHiY54LaEFZfn3NttGBR8dtqvaisoqq
 ootOIO/nIsmNezi2dAXQZUJ/aoz9CkYzJnqxfWXiDZ9MJG2Pp++wNXxz9TiGZ7uZ7+/A
 BgJLvicp71KnfjFQYbcDr1B70NkdCsxjnk5hy7QruUkb6DVtU9bUofA2f8w9bz1O3kXM
 zVDNgtBk9AuAcDtuwWzYv2TUp0JiZUNxj6Vh2WOX88ni0yIrWfgkIwAxSXz8TrRLMOt7
 jh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i1LJ/VTQXoiL6dak8tUDfJfgzTnYpLMX1F80eadLzaA=;
 b=Rtoe3AMuObN0o1XH5Y8n/X47IUSwCHWW32YT8qzWKE1CLJ/GeAR0ZNPAhy8LaYrCO6
 zIIZiyAmTJIu6ZwxXw5U00R2Gjs/fGb3MrbsVHbxEHmiR3cioVrFAKmlvDzf1DXwXlIm
 suWIaTiCoHPgwfHnmoGGoqoTlwwcvnWI3D331YOrNL1P9qtyMmR3ds8zOd+aTWXK4Ed9
 CGVMdn2Mue174CTWzoIW4DdS0+NR/EKVIufZM5tzDaI6VemVzcaD0l4M7kWqmhU7HaEC
 yA/HvPfmMN4pSdUIjovQUOzb6mOwRlTXlBBZjQMYG7qVvEnFE4YReBJIo8rdOAJ4S2uI
 mFrA==
X-Gm-Message-State: AFqh2koKDbS3hRzpzdCgr5SZ8v4/tVAXqFIid/exRVfRTxWI4upYfjOF
 mxDX8HT59v3oEj5raeCg8zs+rE/KiaUbWdcYdJg=
X-Google-Smtp-Source: AMrXdXusn33ubpeT3BBbiumPcSyOtrQB0fZub5S+0BIGqQ3xhssfwU97fZ32BTCGC9L/sqgRGoc7sw+MbFfoxFPgP4w=
X-Received: by 2002:a17:907:7782:b0:7c0:e380:3d44 with SMTP id
 ky2-20020a170907778200b007c0e3803d44mr839052ejc.498.1671789881798; Fri, 23
 Dec 2022 02:04:41 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-7-dbarboza@ventanamicro.com>
In-Reply-To: <20221221182300.307900-7-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 23 Dec 2022 18:04:30 +0800
Message-ID: <CAEUhbmWxGAb_AtjW74nW7sYjT7-j8NwqQxQpmShuaurSMOerzQ@mail.gmail.com>
Subject: Re: [PATCH 06/15] hw/riscv/spike.c: load initrd right after
 riscv_load_kernel()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x630.google.com
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
X-List-Received-Date: Fri, 23 Dec 2022 10:05:03 -0000

On Thu, Dec 22, 2022 at 2:28 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> This will make the code more in line with what the other boards are
> doing. We'll also avoid an extra check to machine->kernel_filename since
> we already checked that before executing riscv_load_kernel().
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/spike.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

