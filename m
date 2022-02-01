Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nEjxU-0001tR-BV
	for mharc-qemu-riscv@gnu.org; Mon, 31 Jan 2022 22:35:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEjxL-0001sl-Nc; Mon, 31 Jan 2022 22:35:48 -0500
Received: from [2607:f8b0:4864:20::d33] (port=33632
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEjxF-0000JU-RM; Mon, 31 Jan 2022 22:35:43 -0500
Received: by mail-io1-xd33.google.com with SMTP id y84so19669346iof.0;
 Mon, 31 Jan 2022 19:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VyCJXUt5kErXQ7Tj+Ep0NH5zx/rOMcYMuBigxMw4740=;
 b=cOTBSvVqr2ER0lRwANeWucBiW6nYVUa+JB0Zepd3W/QoeJ3pc1J+LgiaJ3GG5uoHUT
 b2Kao9PMgF1SrNqtA2GS9g3ADeLPCzNuLYs5mhPl180ROD8Y1xGN2yJXMGcgtnSYP+S6
 Pp8/flE7uG0e0eb2dq+e7uhw9JqyNB07o07NhZ48qWbVuOkqWBQMa3qAcRXPSiJ6cZOC
 /Z5Sf9p9m2+wga9BhjzCcF2Ut++g+MiMFPRMqQgvMhCSeUmRgWcDCGnUBun7k0dzzm2i
 QjxspXNhpJwQCkTsFliSRcn3LIDnE39KcHR2R/zOrU0+AgDV1fhJqWIoEcVkYmfgSaii
 y5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VyCJXUt5kErXQ7Tj+Ep0NH5zx/rOMcYMuBigxMw4740=;
 b=UJ+ZabdC5gFp2OrWdJUxOvBklzta+cZZE0Kt7Uzj/6ju1S88ZpteTXwnP91wMPzSEA
 HH81OXy3O5Z/hSZW5nF/Mo0lk9qrPYbkGz33OeaPuUz9HtGRIxTBmoE9aAuW0nCQfGF7
 UqgCnRBNAK7fC1YYg3sHKXQ4PBrj1P/CKAwugEVYPhp1rsY6AUU4SqDuatITDHama9ej
 SCyck8N5AjMsBBwAzZFD0xMbFUoTrVlenI1pTcxyRkvc/vAJDNnvcPkDxX8/acyEK6di
 3yDwYqLzKLoZ659dmR7dSRv4kxw7XxxoPygPVRvCXD/2GDsGBRivrTdHMFm+LCxNkwby
 chow==
X-Gm-Message-State: AOAM532r+KBa+vfHQ5DHVxav25mxmivfBVzwrrS5sdAjetEJAXqlpQRb
 h/ulQHBCACjHdqY925hOGFW2/DyqBfvdV3Uu8b0=
X-Google-Smtp-Source: ABdhPJw1LBqD4Dqs3tP5SWB6Yp7A7ZHAsEUmXStE+aVC1rI4UkzsSoNiSgt+cu1r6UHmdiqtGaGhrpPq/ynCDIuqfQE=
X-Received: by 2002:a05:6602:1652:: with SMTP id
 y18mr12710348iow.187.1643686517166; 
 Mon, 31 Jan 2022 19:35:17 -0800 (PST)
MIME-Version: 1.0
References: <20220128085501.8014-1-liweiwei@iscas.ac.cn>
 <20220128085501.8014-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20220128085501.8014-3-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 1 Feb 2022 13:34:51 +1000
Message-ID: <CAKmqyKMqQm2ERKXUkER=L6z=U7UgnBxCvKJXSmhAAu6KJrWt_g@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] target/riscv: add PTE_A/PTE_D/PTE_U bits check for
 inner PTE
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 01 Feb 2022 03:35:50 -0000

On Fri, Jan 28, 2022 at 7:06 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> For non-leaf PTEs, the D, A, and U bits are reserved for future standard use.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 5a1c0e239e..b820166dc5 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -641,6 +641,9 @@ restart:
>              return TRANSLATE_FAIL;
>          } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
>              /* Inner PTE, continue walking */
> +            if (pte & (PTE_D | PTE_A | PTE_U)) {
> +                return TRANSLATE_FAIL;
> +            }
>              base = ppn << PGSHIFT;
>          } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
>              /* Reserved leaf PTE flags: PTE_W */
> --
> 2.17.1
>
>

