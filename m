Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA4tK-0001Xm-Tk
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 01:56:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nA4t8-0001Qu-ND; Wed, 19 Jan 2022 01:56:13 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=38717
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nA4t7-0001xI-9f; Wed, 19 Jan 2022 01:56:10 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id m1so4504682ybo.5;
 Tue, 18 Jan 2022 22:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W+8Bk6eWp9N0WLWXcdfGML+kKrAYIDuodD0WoAvF6TA=;
 b=fvblhBouBK5ckdfIGTbDjRG8JRYgS+x8Axu9aKHwb2mk1vx6kFJ28O6hJ3R/Pm8L7Y
 6A/qnF0XP2wCpe73zijFaZ3g6zdNKrI1HgstgtzXmozKBuPB43BeaqF57b8QsjgiDnqG
 /OsS9nPs9zze10nCeV16sum+eXUmOe63/eTnB3gl5til3dCsFBGwHIR4fl4TB2vzcmLb
 C5ozUAF19/pinPcirOlMgxgGT3hg3o7nsXw7GOuhp16fKAlrarK4iIIb5tvHM8cwEA7q
 HBkvcM3axWAADE6xu7wKFjYX4SlXa5JbPewsiv86rg8z5BYXF2zlk1Kp9lwZCmC/kqOm
 nqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W+8Bk6eWp9N0WLWXcdfGML+kKrAYIDuodD0WoAvF6TA=;
 b=uU5jcpMDRF+sYaCDY39GVH7cmhq2bebqZlqcaSJ9ZFKfRhNczrtVbRE1opgXW1d1uQ
 AMBF52aFp0VQRd2bnj1VvCsAXKDYDPBY0D1gfrGo3fVWbPyeF/Sp2V2qgRs/GFepgFc6
 hMi6TcLsG3jbPYGk//Pswn5w2ls5nyNwUGTU7KeDHUT/ok45Gw4teF1LNrZJn0CNV9bJ
 feSI5WAFQ6jSl7M/h2c1aBHDyd+OoRwQ+pm5BPZETPOhgSvThW9AjVmV/drjGjz+WmXi
 N8xYV9Kz2eapRcKv9QFprsb9oCX/j1+ptPsKe3ZwbBQ22bHU8zZVtIm1tg4oZ+LpMDon
 lrlw==
X-Gm-Message-State: AOAM5333TMDASHdPCPY48i87lwDi7nng5dBmAU8B5y+n8moTjzLgXyVo
 E0Rkd426NwY9asjBEs5tswt8h1cjwd/gfEVczKk=
X-Google-Smtp-Source: ABdhPJyAyvP9RHH8A/5ZLx/26KWOTrv84/jfwSzP5AuZYAeZ826C/JqU4qOsaIwCt89y01cL/BFx2W5hZ62PSnc2fSQ=
X-Received: by 2002:a05:6902:72b:: with SMTP id
 l11mr14105743ybt.378.1642575367612; 
 Tue, 18 Jan 2022 22:56:07 -0800 (PST)
MIME-Version: 1.0
References: <20220118111736.454150-1-apatel@ventanamicro.com>
 <20220118111736.454150-2-apatel@ventanamicro.com>
In-Reply-To: <20220118111736.454150-2-apatel@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 19 Jan 2022 14:55:54 +0800
Message-ID: <CAEUhbmUynbceuD93_vT8QLayfna0L4D2gxjgqAbCJ3atgEOSww@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/riscv: spike: Allow using binary firmware as
 bios
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 19 Jan 2022 06:56:17 -0000

On Tue, Jan 18, 2022 at 7:18 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Currently, we have to use OpenSBI firmware ELF as bios for the spike
> machine because the HTIF console requires ELF for parsing "fromhost"
> and "tohost" symbols.
>
> The latest OpenSBI can now optionally pick-up HTIF register address
> from HTIF DT node so using this feature spike machine can now use
> OpenSBI firmware BIN as bios.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  hw/char/riscv_htif.c         | 33 +++++++++++++++++++----------
>  hw/riscv/spike.c             | 41 ++++++++++++++++++++++--------------
>  include/hw/char/riscv_htif.h |  5 ++++-
>  include/hw/riscv/spike.h     |  1 +
>  4 files changed, 52 insertions(+), 28 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

