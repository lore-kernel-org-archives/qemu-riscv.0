Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqk5H-0001jx-6W
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 19:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqk5F-0001jU-94; Mon, 16 May 2022 19:25:01 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:44860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqk5D-0006xx-Px; Mon, 16 May 2022 19:25:00 -0400
Received: by mail-io1-xd2f.google.com with SMTP id e194so17633966iof.11;
 Mon, 16 May 2022 16:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wrFOZmnQxNRr75IOKtZIymKLep/buslz55oJFhc+6JQ=;
 b=UCxSmTPR8OHtI/nLkE1dl695vQ2/0C+kseGBPcPM7Fq2cRjhqE4uzzdqzolwI2/st0
 GorVUC807PJyPqaLGoXZbuFY88U8Iw+Jk0uOYuXJrN7eALOKL6ulgGvlDYCwxP30aOa1
 X9QyoSReS86gb8XVHASbJIb1VayPZb8gWAKD3zPq8CQvR38rEtQPqOzYGiWjUo0jTSkm
 47mbDRIsI4qbOlfGyGJIxmV8dMOZAfqGLdgngc2kfD4x5dmw7TY4VHoeZ2x8e8pPZLXI
 viqW/4xGki+9Bha1M+Lqvh4HAArSSIedGelSUyzMvDgNnfgqKK3E8uIC63bBeEJiE5Gr
 MoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wrFOZmnQxNRr75IOKtZIymKLep/buslz55oJFhc+6JQ=;
 b=np7A47Jx8VFCZqzf953K3dkg22XU+zeUF+B+wblrqzjJXfRCPULacW4438AQVIEJm7
 G56shsEtPdSvSImy9f55tCSojqQmUyIEJolTG/XSmCTIPs8cwr49xWMlc+Ma0FgJjqSh
 mlLNrGNOj5Q6VFtiFjl6+i0hPCoIqdHM707C5lVKlttCoRxCOGH3vV/444VYwSHLYSxX
 X3WioW5ztVBLWhizfvl8Es1eVHVpxheCMg/AxYp7xJWJnbIv5r0v4/9BR6hM5fiFnUq+
 9r2pKKe+5JOETKlHMO2TCBqB7Pl/ufDPVSiHSEfN6Z6X7LujcyoleXmn0Pu5fPyI3BMH
 ejCg==
X-Gm-Message-State: AOAM533Ayh0un/OhouVm/zroJ2YYyMVY9p7TpID6RPw30upR3raMXAAV
 mUDdvx2ocq019FdUj44UT9DpFnMSi/iVSXtvIyEphRnpP/M=
X-Google-Smtp-Source: ABdhPJx4htkSEYaBEzZE9YoGvSLxoZtQKXr6Soz4ahPMjhF4b3ASyVu1FKyE6zQ8WpM4eG3uWjQnNm5x4OspQPIICw8=
X-Received: by 2002:a05:6602:2c07:b0:657:8347:d7c0 with SMTP id
 w7-20020a0566022c0700b006578347d7c0mr9303471iov.93.1652743498431; Mon, 16 May
 2022 16:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220511144528.393530-1-apatel@ventanamicro.com>
 <20220511144528.393530-3-apatel@ventanamicro.com>
In-Reply-To: <20220511144528.393530-3-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 09:24:32 +1000
Message-ID: <CAKmqyKNcLwMzQ11aECavB1XrN2vrvmXjWxm1uKghoH+YR0eTsg@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] target/riscv: Fix hstatus.GVA bit setting for
 traps taken from HS-mode
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 16 May 2022 23:25:01 -0000

On Thu, May 12, 2022 at 12:49 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Currently, QEMU does not set hstatus.GVA bit for traps taken from
> HS-mode into HS-mode which breaks the Xvisor nested MMU test suite
> on QEMU. This was working previously.
>
> This patch updates riscv_cpu_do_interrupt() to fix the above issue.
>
> Fixes: 86d0c457396b ("target/riscv: Fixup setting GVA")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index e1aa4f2097..b16bfe0182 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1367,7 +1367,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          case RISCV_EXCP_INST_PAGE_FAULT:
>          case RISCV_EXCP_LOAD_PAGE_FAULT:
>          case RISCV_EXCP_STORE_PAGE_FAULT:
> -            write_gva = true;
> +            write_gva = env->two_stage_lookup;
>              tval = env->badaddr;
>              break;
>          case RISCV_EXCP_ILLEGAL_INST:
> @@ -1434,7 +1434,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                  /* Trap into HS mode */
>                  env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
>                  htval = env->guest_phys_fault_addr;
> -                write_gva = false;
>              }
>              env->hstatus = set_field(env->hstatus, HSTATUS_GVA, write_gva);
>          }
> --
> 2.34.1
>
>

