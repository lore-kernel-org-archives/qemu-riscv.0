Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMeNW-000181-4D
	for mharc-qemu-riscv@gnu.org; Mon, 30 Jan 2023 19:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pMeNU-00017I-L5; Mon, 30 Jan 2023 19:20:00 -0500
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pMeNT-0001ek-1u; Mon, 30 Jan 2023 19:20:00 -0500
Received: by mail-vs1-xe2c.google.com with SMTP id d66so14396868vsd.9;
 Mon, 30 Jan 2023 16:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gsNWlwcqUIirUHUk6ifpNKXKGCVsWuVEQn/MlUp+p/E=;
 b=C5n8y5DVNr5IQJi4EQn1dBvrykuAIMAUD4l+Lu9XQaBF+MQ2eHgpyU7kzIzzeEaAuu
 4dyhIOPUxgyl0lfkfqMuF5coK1ef1qdN5PwVeVFqTV40b3r9/GnXwDqcOcKbcMUaIg0T
 vAWT9dMQ3fPAM4pSqWMLkB0gGearX+8AKAu+KlRedEdG4I2RIoOsid0EBM92PdzcQfgn
 /Q7rTFBjfkNrqQtOAmiQiuWOb+d1SCiE5LV1Z/K9xv8y18ZnTyXj9LQdP/qCI4Y32d93
 +ZgTcDHE2H/7wMvcrMhYCyDPSx31Dcs3Z9z0Yl5Q8IgZ+0Yj8ueP/OQzgEZ8aPoZCzJy
 +K0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gsNWlwcqUIirUHUk6ifpNKXKGCVsWuVEQn/MlUp+p/E=;
 b=nQ/F/QZUBjDDUHBKmN5ciNZe5JcXY+S/5lOoErQkAW+m0QHg89Bl0wCkLgFoHpXY4V
 TJbvaiigSc3WIJUpGhxR/jwt90GI7mEB531Kc8GimjmwbxuktL1DuP9a3iu5y8PjqvK/
 qS9pnn3xhLu2Xm7E8w/MOTkG6Hq/MECDBzw7capvkz49DUJ/XWOxiRC5LqHZan1fifFI
 Le0arZrdsjosQmrgvaY/4dl6Sx2vdTc23R8hyNmIwRcRO+fEXVy4fQYU2nybVKfcXcEk
 pVKtO8MM2d1JlytPrsOFitfrPLNWkRVAKD0u1C36nYZ/YVfjpxZNB5a9YaCUCYCk/iGO
 4OyA==
X-Gm-Message-State: AFqh2koyryBouLeeeXXNaBAY8KVTvkb9vnhCvuswNkWnuz6QSuXayJuH
 A/eorRbBg1WqksQyL5W9PSDRtClAvAAzvNlw7Pc=
X-Google-Smtp-Source: AMrXdXtKydD3LDx/YsLJyGI78jhlOPLmDXzffYTCvp0/0tIe11TENczWOtm5zQTd1utdxLf/BpzrsDqXWRpV+RDToRM=
X-Received: by 2002:a05:6102:cd4:b0:3d0:c2e9:cb77 with SMTP id
 g20-20020a0561020cd400b003d0c2e9cb77mr6945984vst.54.1675124396208; Mon, 30
 Jan 2023 16:19:56 -0800 (PST)
MIME-Version: 1.0
References: <20230130100757.721372-1-geomatsi@gmail.com>
In-Reply-To: <20230130100757.721372-1-geomatsi@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 Jan 2023 10:19:30 +1000
Message-ID: <CAKmqyKPDNH48_Fj0tRtqg8vKudn+tGsHaSVeRY1nJ-X5cHpM2Q@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: set tval for triggered watchpoints
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, 
 Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
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
X-List-Received-Date: Tue, 31 Jan 2023 00:20:00 -0000

On Mon, Jan 30, 2023 at 8:08 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
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

> ---
>  target/riscv/cpu_helper.c | 3 +++
>  target/riscv/debug.c      | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9a28816521..d3be8c0511 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1641,6 +1641,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>          case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
>              tval = env->bins;
>              break;
> +        case RISCV_EXCP_BREAKPOINT:
> +            tval = env->badaddr;
> +            break;
>          default:
>              break;
>          }
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index bf4840a6a3..48ef3c59ea 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -761,6 +761,7 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
>
>      if (cs->watchpoint_hit) {
>          if (cs->watchpoint_hit->flags & BP_CPU) {
> +            env->badaddr = cs->watchpoint_hit->hitaddr;
>              cs->watchpoint_hit = NULL;
>              do_trigger_action(env, DBG_ACTION_BP);
>          }
> --
> 2.39.0
>
>

