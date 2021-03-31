Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRcPw-0004ik-U0
	for mharc-qemu-riscv@gnu.org; Wed, 31 Mar 2021 11:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRcPw-0004hF-1w; Wed, 31 Mar 2021 11:06:00 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:45896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRcPu-00034E-JS; Wed, 31 Mar 2021 11:05:59 -0400
Received: by mail-il1-x134.google.com with SMTP id w2so16954128ilj.12;
 Wed, 31 Mar 2021 08:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xcCNOOVMPCKpF2NKvtdqHwq+wVEFhl5zFnoaD9/2hdo=;
 b=rLfrkoQgIYQzq/rYUP39JetcpAzr/Yc+Hx2vHEmoEkhOs5MI4wuDviEsonQ9RIszpw
 ATthpJ0J6GNlYjdQzQmQDvsc5AUNwKREIaEtkmyy05sKid6XEOfGMCdCGyp4hWJGw4Qe
 cCghDvfq00Ui2uJ+HBHvamzH2ok+o5GziGE7bFKsn3tIm4qo9Aanm3o/XpF/y4cLFEYO
 20AvxGkuzlgSAi3ExA7HnMD3972AbEaLC+73+o8IdYABeegZFHMp2Sga7bY6fngRv/ox
 aZfOavV+KoY7QkIyfhnJQMpXmtLEf6gjOCDLplpuexjEhhUu3d4ExEafcE3aZ6ZM+CaN
 MabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xcCNOOVMPCKpF2NKvtdqHwq+wVEFhl5zFnoaD9/2hdo=;
 b=hiokgBQK2PjaOGrWvgX9D5ymXAfAsZrYOdGqRC2z3XrmksK3nmvXwZkIWZhVDJEdBY
 NmErYrloMohJkvC341UosBtWlUR+fiCW3aC/+ZKxCuQqD28zaiksHMcGeyF0YHLpO/R/
 ieXqnzxsiwA7yOhkMQc7iUVI0AGiBFXgjLP7Tm0T/ezDOnrDLij7OZ3ACamgQGiUfjxC
 rZoQDDzCpDS4lQbfXW1WGXNeAprEBxkhtmMc+Ckra/nm3DrBUksYtHhLm2aqjkPS2RjW
 L2lG2HJqcqPPou8H6WgbpqXdcS94XzIcw4NwGcFFzPP53opZl4fy/E8OMZWzPDPhUJKI
 8Ypg==
X-Gm-Message-State: AOAM531zairUlI2s2YpioJwnAZKxZgs+rRHpS/xw+9Of3ZZqtjtaAOsJ
 gfXOnvVcEBWqHh1/uihhb4AT8CYtc19XJdRwxd0=
X-Google-Smtp-Source: ABdhPJzlJvqNcD9j0/852mYWqFRT+KI9k+RQRj0iHbGQPE1glqwgCHjkxsIkGPBCKu9mbTP3CFBnYCf9d4vAMOdthMk=
X-Received: by 2002:a92:cbc8:: with SMTP id s8mr2855163ilq.227.1617203157050; 
 Wed, 31 Mar 2021 08:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210331021825.537484-1-bmeng.cn@gmail.com>
In-Reply-To: <20210331021825.537484-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 31 Mar 2021 11:03:48 -0400
Message-ID: <CAKmqyKNo9UN-sm7y_ooMrm833NVJ6=5v2OwWebvL_ibGe00=3Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: csr: Fix hmode32() for RV64
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
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
X-List-Received-Date: Wed, 31 Mar 2021 15:06:00 -0000

On Tue, Mar 30, 2021 at 10:18 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> hmode32() should return -RISCV_EXCP_ILLEGAL_INST for RV64.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Thanks for the patch.

There is already a patch on list to fix this: "target/riscv: Fix
32-bit HS mode access permissions"

Alistair

> ---
>
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d2585395bf..2bad396f64 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -177,7 +177,7 @@ static int hmode(CPURISCVState *env, int csrno)
>  static int hmode32(CPURISCVState *env, int csrno)
>  {
>      if (!riscv_cpu_is_32bit(env)) {
> -        return 0;
> +        return -RISCV_EXCP_ILLEGAL_INST;
>      }
>
>      return hmode(env, csrno);
> --
> 2.25.1
>
>

