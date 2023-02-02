Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNNX3-0000vN-JB
	for mharc-qemu-riscv@gnu.org; Wed, 01 Feb 2023 19:32:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pNNX2-0000vA-2b; Wed, 01 Feb 2023 19:32:52 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pNNX0-0001Fu-HR; Wed, 01 Feb 2023 19:32:51 -0500
Received: by mail-vs1-xe34.google.com with SMTP id k6so200931vsk.1;
 Wed, 01 Feb 2023 16:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dCpQufSHmIHMK5uwR6en970xfDqaDvPlEQN87ihFHkU=;
 b=Wmt55+kj1fVl1UbrRfRav3hGEyDLC0XpWduzFJxXnsYxj8WhDNZTKwGO+/yhPjOPMH
 0qq9Neo3dXwU05BCWG65ybvTKehzVH+9BQiru2+qqh4PnI+ozyC3HDy76TPbnG0j6Cgy
 AOf+9CnigHyPVIOFuWiJOZ6mYtRLPwevaH8OCP+O3F5c/DAdlXmdmVKaKyNZi4CWSK+H
 +vU9ncDW2gOD+p/xfNhKGedFxDSmuqOR38vQl/uYU1sBWlTH34L/kEoB3r1BsIWD+Zur
 SxQXgNspKllRE+lXPrGcBbyWF6fjtHJZcR+afY897sxeUe1AzEJtIpu9rt3s8tg/IgX8
 mN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dCpQufSHmIHMK5uwR6en970xfDqaDvPlEQN87ihFHkU=;
 b=OFCoT2A1rHfInk5jQ7wTRZLZyQSwKoV37dl5YcEafXRaiRwlWbb7/6ZkypRHVExiTU
 xMq2Yg/ooxxzAjZ2BlzuSMstY/xoOZYjA1EmFOxn+sCJVtLTKvndYa/eophHixg+NtQb
 IcnD/M864wON1fCyMzpFgDW8CkfDr3avUlfEqfsReB6d1iL+HX59VRKCo0+8KN6PBGp2
 rUegHZ4sIC/IkbDw2D6cNTal0zrl4CzivwdO+WDXlFG4VlgoCyv12g7RzqxX+fjn0JkJ
 hWw8sTgHq26/2cW8Fc7G+FC4CWDAsqjiwfSc+K/SoOJlYYVb1F1gh+mvy33/XmxU2C/Z
 JCrg==
X-Gm-Message-State: AO0yUKVPuLeoGQIPEtUfSihn1M3qEXEyudtn+B1a59r4DfeIgGCjzlRE
 8akFJdqYykI69DuTlole4I5jbOeMSQ230q+tMr4=
X-Google-Smtp-Source: AK7set9pGHdipoMRXNdkUUy+Q8e8TYahY/fjHPGpsjwTtNbC5hrlIKbKsboTu8ZUC5LmyPMMup/+a1a0e8ga8OfxV6s=
X-Received: by 2002:a05:6102:1276:b0:3ee:4ef8:45d3 with SMTP id
 q22-20020a056102127600b003ee4ef845d3mr644310vsg.64.1675297969088; Wed, 01 Feb
 2023 16:32:49 -0800 (PST)
MIME-Version: 1.0
References: <20230131170955.752743-1-geomatsi@gmail.com>
In-Reply-To: <20230131170955.752743-1-geomatsi@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Feb 2023 10:32:23 +1000
Message-ID: <CAKmqyKNyKwJ7DgetXVt1qVpzKSbNvzXpaip8EAKhK8XBD2coqQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: set tval for triggered watchpoints
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, 
 Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
X-List-Received-Date: Thu, 02 Feb 2023 00:32:52 -0000

On Wed, Feb 1, 2023 at 3:35 AM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
>
> According to priviledged spec, if [sm]tval is written with a nonzero
> value when a breakpoint exception occurs, then [sm]tval will contain
> the faulting virtual address. Set tval to hit address when breakpoint
> exception is triggered by hardware watchpoint.
>
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> v1 -> v2
> - do not set tval blindly for every breakpoint exception,
>   handle current specific case under consideration
>
>  target/riscv/cpu_helper.c | 6 ++++++
>  target/riscv/debug.c      | 1 -
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9a28816521..f1a0c65ad3 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1641,6 +1641,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
>              tval = env->bins;
>              break;
> +        case RISCV_EXCP_BREAKPOINT:
> +            if (cs->watchpoint_hit) {
> +                tval = cs->watchpoint_hit->hitaddr;
> +                cs->watchpoint_hit = NULL;
> +            }
> +            break;
>          default:
>              break;
>          }
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index bf4840a6a3..b091293069 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -761,7 +761,6 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
>
>      if (cs->watchpoint_hit) {
>          if (cs->watchpoint_hit->flags & BP_CPU) {
> -            cs->watchpoint_hit = NULL;
>              do_trigger_action(env, DBG_ACTION_BP);
>          }
>      } else {
> --
> 2.39.0
>
>

