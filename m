Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQIVx-0006jf-RT
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 20:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQIVu-0006hq-FD; Tue, 14 Sep 2021 20:10:59 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:34510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQIVg-0001iY-Dq; Tue, 14 Sep 2021 20:10:58 -0400
Received: by mail-io1-xd31.google.com with SMTP id y18so1178688ioc.1;
 Tue, 14 Sep 2021 17:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GZzRwviYyTXTglVCEjd/Y9M5GcY+fuopuv5XnK1ZXtY=;
 b=hknI9+6qi+zPJUk4YVZ0Y29Cf5lOzABP/Z5+UglalvfOMeHEN4Lhr/nMNIvnbZIZvv
 IZEybNJhL9DVGaGYBYl4cZvlkzDjVjoXiaO7j/qRs0sUb7GZIyuqcFGe940ap8RJHQ1/
 cS2OVBfLRlt5E50k38YrULB6KzeMIzo7N3YKRoZi/oLQUFl/q0fN8yy98VEym/Kc9HLU
 I8sVjcxs19fRtnoW9hBo5ol78qlgCCv0Vg/2+FLtbXhdgBzRJH2leToGjygNkALOo9Ol
 5sf/QtWqE/574qTM70kv4UIVU+9iGUS4/a2Mppwzwwmec3dVD/d4f/FKT0g318fcwiUp
 TNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GZzRwviYyTXTglVCEjd/Y9M5GcY+fuopuv5XnK1ZXtY=;
 b=rdl0mx0JWsJAyXKu6/45ONhcjHgogiHo/T5yCbIxa9gqzHrqerwMMGgrbgP9HYI1NY
 RvavIVxZ+8aXVMn0PXjxj5Z7pceMXN4EsKkx8MjcxqRcHXI8NXEYhpe9Ski2XFXei86R
 TBfwXvx/eJdNiNCzTnpLOb5oKkcvinFdl2bGlF2a/2sw6C4DbvB0WR5LxYonFUbDfjbz
 rWNEjnOgnCUdjtviA2UAHr/xndVVHR2NZuwgM2LiD+8oUmUkdXUBOq6iFTrAt5Zn2262
 EfMQqnrI901VLcFNQ+sQQ+is5cbxdMv4ZMREVsEcb44ox9JP8PhwQUV9xM6yeUA+1ZZW
 gEEw==
X-Gm-Message-State: AOAM530a2+uIi93TQbf65Qpq5LS+lxx64vORCz2hkve5ovEa0BsbugrM
 A6OMIB4oF5havXG42a9fpmJA12LdeUfJGKju6y8=
X-Google-Smtp-Source: ABdhPJyZeuCuRXsYp3xnycQklG24e5wKOhTzMsUjBXSkrdhmK/3kK/gV81yLvJhUyQKdAAnnbZo4eR5vGQHUGdp37RM=
X-Received: by 2002:a6b:ce17:: with SMTP id p23mr15961666iob.90.1631664642016; 
 Tue, 14 Sep 2021 17:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210914013717.881430-1-frank.chang@sifive.com>
In-Reply-To: <20210914013717.881430-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Sep 2021 10:10:15 +1000
Message-ID: <CAKmqyKOjp8m--pJri6DLNMWCMnv0vjNzXFXa3SvrH6R+oxg5AQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Backup/restore mstatus.SD bit when virtual
 register swapped
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Vincent Chen <vincent.chen@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 15 Sep 2021 00:10:59 -0000

On Tue, Sep 14, 2021 at 11:37 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> When virtual registers are swapped, mstatus.SD bit should also be
> backed up/restored. Otherwise, mstatus.SD bit will be incorrectly kept
> across the world switches.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Vincent Chen <vincent.chen@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 968cb8046f4..488867b59eb 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -111,9 +111,10 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
>
>  void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
>  {
> +    target_ulong sd = riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS64_SD;
>      uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
>                              MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
> -                            MSTATUS64_UXL;
> +                            MSTATUS64_UXL | sd;
>      bool current_virt = riscv_cpu_virt_enabled(env);
>
>      g_assert(riscv_has_ext(env, RVH));
> --
> 2.25.1
>
>

