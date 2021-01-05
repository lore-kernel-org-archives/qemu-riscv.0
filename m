Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kwcks-0006np-LC
	for mharc-qemu-riscv@gnu.org; Mon, 04 Jan 2021 22:11:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kwckr-0006nI-9y; Mon, 04 Jan 2021 22:11:29 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:45054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kwckp-0001OG-6W; Mon, 04 Jan 2021 22:11:28 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id x2so27934128ybt.11;
 Mon, 04 Jan 2021 19:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=egblhIiX4k2GzaEB1851HXaymylbzwHL5fGmRNhgG6w=;
 b=l8H3clxK87PyZBo7zk1AMajekr18wi5uID99F6sgU1ZjjPuhW349EBLj/fA+onuFRv
 33MXE9NBLTcXcbnLMvtKRKXkDruDtTNwLTNWvNq4onlr4/ggfcFVsig6Vie3+/tpnWjJ
 QcOs3D6saLFo2T+h1ZgxfMQKqNcXzhNTHYOmDnPKlYvU/Mqy4O3eEKhXAEb8IFa7lknB
 WSqZR2uuVnaNiExPpiHJFF1hCcM71IoZ7Mpw3JArxy7+95+nwBTyK8DVQYNFMGetQc87
 +CSkMRd9aEGw88YQ6Pz2ljIDNX+/i3OAW5Qq7s9dw+l9nMFVfBn/VmvAfZvDUyc2T4r+
 xGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=egblhIiX4k2GzaEB1851HXaymylbzwHL5fGmRNhgG6w=;
 b=FoOE7Yg0cM8ivqv/kLnjgLDocHGAVVOzGc3p3F7Ir6kuX5vH+aRiuRP7ebmg3n/v6F
 ppISZMvXx1RuZXZsBWxcDNtvQPhmAKwc/qNw6K5RawM/zFacXsxSiW8mHF2KldrxUIsG
 savEgZWVSpqfeqaqEXC01lqqrV6BLp60FOSM+mcZg7wQ1hyvp784UVXdGoI88Y+NM6zI
 dEz0DGZjoG+9vIfXIgQrWuPk0YZau+eelGxiRIW8NWsNPakwzUV4bWjrKO61QhokKzEF
 Ycen3sCqvi1QI/YPRyYJOc4dpr9BSco+5sO0IyGRGpVvODXY5zfV/p5SyXajVhYafmxi
 I2rA==
X-Gm-Message-State: AOAM533NLvVNZbjVdCTMWDDHx7nFzxhTyjWJSBZTxS9WOvVu9G1xIBIv
 +fX8ngUaiUso7mtesOUg9hQnaBatIlmeyD01Y+8=
X-Google-Smtp-Source: ABdhPJzGMOelxXtYJTduXdqpca1NeYADerCRE+PEWIr9b8D/jK1SZ/3hknM6YUVb4wJ2E5Ui1ufToSkS1z6YEs+l4NQ=
X-Received: by 2002:a25:5a43:: with SMTP id o64mr55779169ybb.387.1609816285017; 
 Mon, 04 Jan 2021 19:11:25 -0800 (PST)
MIME-Version: 1.0
References: <20201217214826.2094617-1-atish.patra@wdc.com>
In-Reply-To: <20201217214826.2094617-1-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 5 Jan 2021 11:11:13 +0800
Message-ID: <CAEUhbmVc_SABW_0PKgDMY8t3zTujo4xUnNW3fz1YuWhqXWnV2A@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 05 Jan 2021 03:11:29 -0000

On Fri, Dec 18, 2020 at 5:48 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Currently, we place the DTB at 2MB from 4GB or end of DRAM which ever is
> lesser. However, Linux kernel can address only 1GB of memory for RV32.
> Thus, it can not map anything beyond 3GB (assuming 2GB is the starting address).
> As a result, it can not process DT and panic if opensbi dynamic firmware
> is used.
>
> Fix this by placing the DTB at 2MB from 3GB or end of DRAM whichever is lower.
>

Fixes: 66b1205bc5ab ("RISC-V: Copy the fdt in dram instead of ROM")

> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  hw/riscv/boot.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>

