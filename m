Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQIkl-0004pE-QB
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 20:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQIkj-0004mN-SY; Tue, 14 Sep 2021 20:26:17 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:36359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQIkh-0003w9-6w; Tue, 14 Sep 2021 20:26:17 -0400
Received: by mail-il1-x12c.google.com with SMTP id v16so1054607ilg.3;
 Tue, 14 Sep 2021 17:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uOsyZOYsM2jCZWNnkw08ZGrX8WZp5nzngJU9VTk7U3A=;
 b=bCvChh+Qh0royvmQ1BA4yOYxrOUKm3/f7nQQEPdmsL8AqEa+GPClco4bgDSi4wpUrg
 9WdCGmvzHY+CCjf1E9dGQ7prKhGVYGqwmVjC3XMBs5uhuyOMy3juUzNKSLT27E48rPuS
 hMzVrGcq/D/5zXq8zBPprCR2lWWBm92Z4ZgLCTQ5es0YPn3ISS3qcQQYTAOdS8RiBk4O
 qtp1Ss/1vfF2G5oAN6ic+YgqSMUGExTr12U6uRpyvzQ/v+x1kV13dI1Sz2hD23oRIgNA
 JKyRI7Z301h0l792NWJFKeez8q/0o0ExtE2LYvXwjihF5Xz/x/MY79agkWYIbBBGflaa
 ufPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uOsyZOYsM2jCZWNnkw08ZGrX8WZp5nzngJU9VTk7U3A=;
 b=F3TPI4ZiOatqQoObch4YQc4BSTXeDkinkgirnDsTaZui0JVWJQvFQ5yD+iHeQlkZgS
 zFTpY7oYsFWQStykjPY9G+v/5VS3PLFE5tFwE4da6d3PEs0J21wEjI25kkptLaMo1cTS
 wDgMhlD5Srs6AFuvfIrfxzuURWJzLoQRlvYdkMFt321txXdK9OBgFqRZZJVw+cXYG7H3
 pawB8gkiypeoE0g/7yktgH9wZf2NefjnXABRKw4faQXXoVdNmBNMpqSsqqwbNjvRE+UB
 OKNlrcs++8CazQAc9XJuF058gxdQGDlqUobysOa0u4DeqvCSnfdcU13UfknpzmdmJZCx
 QrZQ==
X-Gm-Message-State: AOAM533gVf2eUpghvz1R0Roe9R/09rY1YkDVxmcqKa5FEB8aqTlWaV0N
 zul11WxPgCaQIHBB2uNLUbTCybSMq5pn1diEX48lQI7Z4RfGOg==
X-Google-Smtp-Source: ABdhPJwW7na7RzDuTG/nOasCyGv3NPUORt+QxEb8WulxMWpv3KOVeeiDelwgF0W5hSEq4rNlK8E0AvD3vKYGEflfnlc=
X-Received: by 2002:a92:2a04:: with SMTP id r4mr13935850ile.221.1631665573608; 
 Tue, 14 Sep 2021 17:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210914013717.881430-1-frank.chang@sifive.com>
In-Reply-To: <20210914013717.881430-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Sep 2021 10:25:47 +1000
Message-ID: <CAKmqyKNQWM9HKDL1qhOTLZVhBxDx5N0BvbFEwuXOHO83OomFBQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Backup/restore mstatus.SD bit when virtual
 register swapped
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Vincent Chen <vincent.chen@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Wed, 15 Sep 2021 00:26:18 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

