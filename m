Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lghy4-0001oZ-Md
	for mharc-qemu-riscv@gnu.org; Wed, 12 May 2021 02:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lghy2-0001nD-LE; Wed, 12 May 2021 02:03:34 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:41672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lghy1-0006Ww-0q; Wed, 12 May 2021 02:03:34 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 v11-20020a17090a6b0bb029015cba7c6bdeso2458781pjj.0; 
 Tue, 11 May 2021 23:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8eBGvE7XKN/qOZsUylfHO2n3PvkzLwy4LznA/gd6TGM=;
 b=mJvon3jcHS4EI1gTpMsm3ICUT+7FUl+9eI61ci+N0e8lYT3+ira08SVW/P1sb3AeAt
 HRXlPeRFkxBKf3Rq3nfWxMmnY2xm+57MJL75jrCLG7xVZzFfSolkQH6afQ1WOPFa9RMS
 dudcnbzI7CIfn7c3yL9k+rWHXycyb3hq7ycSklVJqAb0IRJqznppxbPYBuUrGCPdwklw
 7ch9x989bNqx4MjanS3814ftqpzw3Zjs3r7GNaiZjipGM6PsMVoQEFHTWeEdAhkT9wqU
 7IsXbYx+rNYT1F5Eduk0IHSbDZ1wRXU3Rfr3S8nCCgwzFJO1RZoUiqo/3qnerxFjEfv6
 2c0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8eBGvE7XKN/qOZsUylfHO2n3PvkzLwy4LznA/gd6TGM=;
 b=ICxaRtE0D9KLPiC+6EwAA1ePU27uDLz+fGGBHtV/OOqypISuiJJ6YXtflHmQHKt5Lj
 QH7tSV/8RuduihbQC31LZpA+1EHTucratO6dExijwm+EAGLJ0i+9ZQn2LkpHWj8+uyT8
 gZ3bHWF4tF5zW/iPYRgk6VRfcRgadnvqiduCEmzxneaHDlW1DfxmVoVdDwmiwXv/ho0t
 79l9HpKSz2SLssErdjdCoYxg+HPfVVaEqo2ugzLjSUY1yTKYpti/+9X6H0hovwGdPGQ0
 CNdg8G+ubDIh0o2K8j/M4ygFI3jqbXtB5rIDXXDtTeQvZVLwlvkGNehF6QSujBqQEXK5
 nqqw==
X-Gm-Message-State: AOAM533sDNIkDYZ2mUn0CO8tPJjm16hDciaGnp0Sx55T6OkNtN3EERgS
 CUdZ99G7sUiwi5H6GeMNTWnpCF7f1lFgZdbKv1g=
X-Google-Smtp-Source: ABdhPJxGivwGCe9I/1+BlOl976g/TgGrxegTjFc5UbRR9MBkrAiElcT4OKsf51DT29dA41VF7WLokrCeaQIv4iEtKa4=
X-Received: by 2002:a17:902:e9d1:b029:ed:1bde:8e4 with SMTP id
 17-20020a170902e9d1b02900ed1bde08e4mr34105938plk.6.1620799409936; Tue, 11 May
 2021 23:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210511100722.18065-1-ruinland@andestech.com>
In-Reply-To: <20210511100722.18065-1-ruinland@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 May 2021 16:03:04 +1000
Message-ID: <CAKmqyKO35O+bichwKQVeZ2tPT+2G-hweds1VY6oJc_bqkuG8Zw@mail.gmail.com>
Subject: Re: [PATCH V2 0/2] Proposing custom CSR handling logic
To: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Dylan Jhong <dylan@andestech.com>, 
 "Alan Quey-Liang Kao(((((((((()" <alankao@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Wed, 12 May 2021 06:03:35 -0000

On Tue, May 11, 2021 at 8:07 PM Ruinland Chuan-Tzu Tsai
<ruinland@andestech.com> wrote:
>
> Hi all,
>
> My sincere apology that I missed the patch to include our own CSR table
> into the patch series and there were plenty of typos.
> Thus I'm sending out V2 of these tiny patches.
>
> I agree with Alistair's comment on not introducing intrusive code which
> will interfere the generic code structure. Yet since there are
> possibilities that some custom CSRs/instructions could be once drafted/
> proposed by vendors at first, and made themselves into the standard
> as the implementation become widely adopted.
>
> So in this patch set, we humbly utilzed a glib hash table for inserting
> the `struct riscv_custom_csr_operations`, check if the CSR is a non
> standard one, and then proceed the desired behavior.
>
> Once the non-standard CSRs make themselves into the specification,
> people could easily plug-and-use the code into CSR operation table
> inside `csr.c`.
>
> Ones may have concerns regarding the check code would introduce
> further overhead. For those considerations, I guess it could be solved
> by introducing a build option such as '--enable-riscv-vendor-features'
> to toggle the code.
>
> Cordially yours,
> Ruinland ChuanTzu Tsai
>
> Ruinland Chuan-Tzu Tsai (2):
>   Adding premliminary support for custom CSR handling mechanism
>   Adding custom Andes CSR table.

Thanks for the patches.

Can you please include:
 wangjunqiang@iscas.ac.cn
 qemu-devel@nongnu.org
 bin.meng@windriver.com

on future patches so everyone is included.

Alistair

>
>  target/riscv/cpu.c           |  28 ++++++++
>  target/riscv/cpu.h           |  12 +++-
>  target/riscv/cpu_bits.h      | 115 ++++++++++++++++++++++++++++++++
>  target/riscv/csr.c           | 107 ++++++++++++++++++++++++++++--
>  target/riscv/csr_andes.inc.c | 125 +++++++++++++++++++++++++++++++++++
>  5 files changed, 381 insertions(+), 6 deletions(-)
>  create mode 100644 target/riscv/csr_andes.inc.c
>
> --
> 2.17.1
>

