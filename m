Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ostzK-0002DD-Ae
	for mharc-qemu-riscv@gnu.org; Wed, 09 Nov 2022 17:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ostzJ-0002CD-C0; Wed, 09 Nov 2022 17:56:05 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ostzH-0000d5-Gb; Wed, 09 Nov 2022 17:56:05 -0500
Received: by mail-pf1-x42a.google.com with SMTP id k22so121189pfd.3;
 Wed, 09 Nov 2022 14:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DAIw1zJBUAfSKcJCCfMVB2NSpwewiTRj0PBDC6L64Z4=;
 b=hofquL0e2LK+yoje868RRDo86GAdUf/agv5BY3WIzo//OFpDFMbtvwtRMMtjc4QtlK
 l84GXBuWqWsUHgIKw1IOpmyyUzuZ5gnwvckQykIlnj6yChYcHIcCKE3L4rwqzQOi+ECP
 3LpRSZoaKwJ7hVH6DevImcCQcSUhewoSWXkAkpQJUAq4ea//nKhbBixEyoMG4pDDHJPy
 uVRkYV9gN9jj5sI6Eou6KwuXDNeMmQTvqGwVtGG3Vyjo4UZODgkT1MfSujLsta2T7NQr
 224A1SxXrz6aeQDbEoiDZFi3kFL6FkGSd8RuIYu/+0K48y5+ZIQfhgVgh96bNBH9MtJV
 DRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DAIw1zJBUAfSKcJCCfMVB2NSpwewiTRj0PBDC6L64Z4=;
 b=eUAWHDcdajNjUKdDb5Fy9S26V323R5vf6OByZPQ1rQOlOnHYhoipB0Yz/VSw0OFbkG
 pyhh4q6grUTsFxuF4oW74sikNSRdREkQ5EmfEAmOuKUuufSMwOpehbYty1RPkQGvwtKV
 9IumOjo45BWywGMx8WE7f7Nv90cFpz7scrRRqH2TZC4hZHZukCLbiK4VM4NPUsOj424X
 KYAItONPP8jqzQmUYdcD1jvRqOaGX6GuJB7X47iEHxjonZwob/5vj5qkltVi9yCdpQ6w
 yNS1UX+kdHY+kUvG2MTJ0tBTmAT7Y3aD129JYdnZq1HyGRsLzfOCDRbW4Eq7VW5rxW59
 ccWQ==
X-Gm-Message-State: ACrzQf2sl9RgENA+J9clyc8G8NtYSjSlDXd624twK2yLe/xslTIWrAw9
 l8Lis5Io+5cWeSSWOGI/+US614aN9am/QeIQZCs=
X-Google-Smtp-Source: AMsMyM6pgY1xnODk40IMNPpCKMvPfDTW41SVZDep1ZhsQAeqL4ntvnyhKfP4y0ehvoCSiauI/r9mFUXCs5MZGln1pBk=
X-Received: by 2002:a63:ce43:0:b0:45b:d6ed:6c2 with SMTP id
 r3-20020a63ce43000000b0045bd6ed06c2mr53256028pgi.406.1668034561653; Wed, 09
 Nov 2022 14:56:01 -0800 (PST)
MIME-Version: 1.0
References: <20221013062946.7530-1-zhiwei_liu@linux.alibaba.com>
 <20221013062946.7530-5-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20221013062946.7530-5-zhiwei_liu@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Nov 2022 08:55:35 +1000
Message-ID: <CAKmqyKO0EUKg7k95RGnk3_=4BXynECBPfV5-_2VPW4A7p45daw@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] target/riscv: Add itrigger_enabled field to
 CPURISCVState
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, sergey.matyukevich@syntacore.com, 
 vladimir.isaev@syntacore.com, anatoly.parshintsev@syntacore.com, 
 philipp.tomsich@vrull.eu, zhiwei_liu@c-sky.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42a.google.com
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
X-List-Received-Date: Wed, 09 Nov 2022 22:56:05 -0000

On Thu, Oct 13, 2022 at 4:51 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>
> Avoid calling riscv_itrigger_enabled() when calculate the tbflags.
> As the itrigger enable status can only be changed when write
> tdata1, migration load or itrigger fire, update env->itrigger_enabled
> at these places.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>  target/riscv/cpu.h        |  1 +
>  target/riscv/cpu_helper.c |  3 +--
>  target/riscv/debug.c      |  3 +++
>  target/riscv/machine.c    | 15 +++++++++++++++
>  4 files changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 13ca0f20ae..44499df9da 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -331,6 +331,7 @@ struct CPUArchState {
>      struct CPUWatchpoint *cpu_watchpoint[RV_MAX_TRIGGERS];
>      QEMUTimer *itrigger_timer[RV_MAX_TRIGGERS];
>      int64_t last_icount;
> +    bool itrigger_enabled;
>
>      /* machine specific rdtime callback */
>      uint64_t (*rdtime_fn)(void *);
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 7d8089b218..95c766aec0 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -106,8 +106,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>                             get_field(env->mstatus_hs, MSTATUS_VS));
>      }
>      if (riscv_feature(env, RISCV_FEATURE_DEBUG) && !icount_enabled()) {
> -        flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER,
> -                           riscv_itrigger_enabled(env));
> +        flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
>      }
>  #endif
>
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index db7745d4a3..2c0c8b18db 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -565,6 +565,7 @@ void helper_itrigger_match(CPURISCVState *env)
>          }
>          itrigger_set_count(env, i, count--);
>          if (!count) {
> +            env->itrigger_enabled = riscv_itrigger_enabled(env);
>              do_trigger_action(env, i);
>          }
>      }
> @@ -662,6 +663,8 @@ static void itrigger_reg_write(CPURISCVState *env, target_ulong index,
>                  /* set the count to timer */
>                  timer_mod(env->itrigger_timer[index],
>                            env->last_icount + itrigger_get_count(env, index));
> +            } else {
> +                env->itrigger_enabled = riscv_itrigger_enabled(env);
>              }
>          }
>          break;
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index c2a94a82b3..cd32a52e19 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -21,6 +21,8 @@
>  #include "qemu/error-report.h"
>  #include "sysemu/kvm.h"
>  #include "migration/cpu.h"
> +#include "sysemu/cpu-timers.h"
> +#include "debug.h"
>
>  static bool pmp_needed(void *opaque)
>  {
> @@ -229,11 +231,24 @@ static bool debug_needed(void *opaque)
>      return riscv_feature(env, RISCV_FEATURE_DEBUG);
>  }
>
> +static int debug_post_load(void *opaque, int version_id)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +
> +    if (icount_enabled()) {
> +        env->itrigger_enabled = riscv_itrigger_enabled(env);
> +    }
> +
> +    return 0;
> +}
> +
>  static const VMStateDescription vmstate_debug = {
>      .name = "cpu/debug",
>      .version_id = 2,
>      .minimum_version_id = 2,

The versions here should be bumped

Alistair

>      .needed = debug_needed,
> +    .post_load = debug_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
>          VMSTATE_UINTTL_ARRAY(env.tdata1, RISCVCPU, RV_MAX_TRIGGERS),
> --
> 2.17.1
>
>

