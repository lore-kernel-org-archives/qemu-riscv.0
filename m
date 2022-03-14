Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nTgxp-0003MJ-7y
	for mharc-qemu-riscv@gnu.org; Mon, 14 Mar 2022 05:26:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nTgxi-0003If-Rk; Mon, 14 Mar 2022 05:25:59 -0400
Received: from [2607:f8b0:4864:20::b29] (port=41484
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nTgxd-0007Gh-8m; Mon, 14 Mar 2022 05:25:54 -0400
Received: by mail-yb1-xb29.google.com with SMTP id l2so29429307ybe.8;
 Mon, 14 Mar 2022 02:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YF0JGdnxmsYwxS5Nzngg02RsY4AJGfw0wT8VGU9BJjk=;
 b=bKNhYKJC60FOhGOKcMc30SJMUtA6TjETf7YMjjZGnbuwpAcs37nv8zjIE6jukr4aUi
 1sQBSGRtL7waXfzvCweDgVEPlamsAVJ20UZazFRVf7mW2gWIK3EUbaJ0weigSqBKw3ko
 b6MQkoqmkjt/aK4vxST7LLq7JBgwCaEhseHlWo1waakGJYXzy7yn9ccTTqBqbzMcTM6N
 2r94O9n4p23krebA9RhplfFIpprUEZzacPX497L+gViHacOVQjGhFJ0uNRlPfoU4k2Pi
 ThTMrk8/46+rx2kPIm8PWG6/q5GUQGEhsWhljepOD8XLVV46NZVeY+Ur9HYAh+ICUkbc
 RsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YF0JGdnxmsYwxS5Nzngg02RsY4AJGfw0wT8VGU9BJjk=;
 b=Lt1RQoEmDs/BjmWhgABmOtlfaiszui6QzXUR/HGDqWs8h4a+FJTDvrGCJGALex7Hc/
 mmigMZ8B4XxLpvmJt5iR0uUjdaGcHA/u5Fg7KfnuIOuIvbDj1qbf9/2vMmNyN993G7UA
 x8uvgY7x2HqViqzeQgw1HM0C1M7PNgoHrCWn4RmM3OeZuJ8VIoU9tjzw98tUptCuoIRd
 3fNJfovkjgZ2xXnwKABr+CBLERHTr2n0/HsugfDPCHQrCmtuR11wGglOkJ4i6El2RZXO
 dB/PScOXA8z5fkiEt/Z/Kn5nQAESM62Ca8aQv84/9oCZDOgtRMYf+cJlkSh1q23Gf0Sq
 On+g==
X-Gm-Message-State: AOAM533FRzfw41zSURYaZKwreTxOTC5+m417e7EAmymzm/+hNq8/NzMx
 Du1vhES6guJSPGabvrTjSQEsJSwt9E6sVSc5nIs=
X-Google-Smtp-Source: ABdhPJwNRhpp0jAndb40/LXgnFc5HM+s+Ali3gEyzYyTQ1TCefbf8/eW0z293Xi1mxk0aVtCrri8tQK8+0cKQ/wHXqU=
X-Received: by 2002:a25:d2c9:0:b0:62c:1233:a5a5 with SMTP id
 j192-20020a25d2c9000000b0062c1233a5a5mr16795046ybg.643.1647249951365; Mon, 14
 Mar 2022 02:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220105030844.780642-1-bmeng.cn@gmail.com>
 <20220105030844.780642-2-bmeng.cn@gmail.com>
 <CAKmqyKNfdKkCk20ycZyayUuLd-FYvx-s-8zVgKs+qpQzhZXVeg@mail.gmail.com>
In-Reply-To: <CAKmqyKNfdKkCk20ycZyayUuLd-FYvx-s-8zVgKs+qpQzhZXVeg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 14 Mar 2022 17:25:39 +0800
Message-ID: <CAEUhbmXCr=BfEB-pqErAjUE4aHkLfWO-M7aibx67exN_zTSU-A@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 1/7] target/riscv: Add initial support for
 native debug
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 14 Mar 2022 09:26:01 -0000

On Wed, Jan 19, 2022 at 11:16 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Jan 5, 2022 at 1:09 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > This adds initial support for the native debug via the Trigger Module,
> > as defined in the RISC-V Debug Specification [1].
>
> Doesn't this mean we are just supporting the Sdtrig extension?

I was looking at where Sdtrig is defined. It turns out this new name
was assigned in a later debug spec and when this patch series was
worked on the Sdtrig extention was not invented yet ...

So the answer is yes, only Sdtrig is supported. Sdext does not make
sense in the QEMU context as it is for the on-chip-debugging.

>
> >
> > Only "Address / Data Match" trigger (type 2) is implemented as of now,
> > which is mainly used for hardware breakpoint and watchpoint. The number
> > of type 2 triggers implemented is 2, which is the number that we can
> > find in the SiFive U54/U74 cores.
> >
> > [1] https://github.com/riscv/riscv-debug-spec/raw/master/riscv-debug-stable.pdf
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> > Changes in v3:
> > - drop riscv_trigger_init(), which will be moved to patch #5
> >
> >  target/riscv/cpu.h       |   5 +
> >  target/riscv/debug.h     | 108 +++++++++++++
> >  target/riscv/debug.c     | 339 +++++++++++++++++++++++++++++++++++++++
> >  target/riscv/meson.build |   1 +
> >  4 files changed, 453 insertions(+)
> >  create mode 100644 target/riscv/debug.h
> >  create mode 100644 target/riscv/debug.c
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index dc10f27093..0f3b3a4219 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -98,6 +98,7 @@ typedef struct CPURISCVState CPURISCVState;
> >
> >  #if !defined(CONFIG_USER_ONLY)
> >  #include "pmp.h"
> > +#include "debug.h"
> >  #endif
> >
> >  #define RV_VLEN_MAX 1024
> > @@ -234,6 +235,10 @@ struct CPURISCVState {
> >      pmp_table_t pmp_state;
> >      target_ulong mseccfg;
> >
> > +    /* trigger module */
> > +    target_ulong trigger_cur;
> > +    trigger_type2_t trigger_type2[TRIGGER_TYPE2_NUM];
> > +
> >      /* machine specific rdtime callback */
> >      uint64_t (*rdtime_fn)(uint32_t);
> >      uint32_t rdtime_fn_arg;
> > diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> > new file mode 100644
> > index 0000000000..0a3fda6c72
> > --- /dev/null
> > +++ b/target/riscv/debug.h
> > @@ -0,0 +1,108 @@
> > +/*
> > + * QEMU RISC-V Native Debug Support
> > + *
> > + * Copyright (c) 2022 Wind River Systems, Inc.
> > + *
> > + * Author:
> > + *   Bin Meng <bin.meng@windriver.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License along with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#ifndef RISCV_DEBUG_H
> > +#define RISCV_DEBUG_H
> > +
> > +/* trigger indexes implemented */
> > +enum {
> > +    TRIGGER_TYPE2_IDX_0 = 0,
> > +    TRIGGER_TYPE2_IDX_1,
> > +    TRIGGER_TYPE2_NUM,
> > +    TRIGGER_NUM = TRIGGER_TYPE2_NUM
> > +};
> > +
> > +/* register index of tdata CSRs */
> > +enum {
> > +    TDATA1 = 0,
> > +    TDATA2,
> > +    TDATA3,
> > +    TDATA_NUM
> > +};
> > +
> > +typedef enum {
> > +    TRIGGER_TYPE_NO_EXIST = 0,      /* trigger does not exist */
> > +    TRIGGER_TYPE_AD_MATCH = 2,      /* address/data match trigger */
> > +    TRIGGER_TYPE_INST_CNT = 3,      /* instruction count trigger */
> > +    TRIGGER_TYPE_INT = 4,           /* interrupt trigger */
> > +    TRIGGER_TYPE_EXCP = 5,          /* exception trigger */
> > +    TRIGGER_TYPE_AD_MATCH6 = 6,     /* new address/data match trigger */
> > +    TRIGGER_TYPE_EXT_SRC = 7,       /* external source trigger */
> > +    TRIGGER_TYPE_UNAVAIL = 15       /* trigger exists, but unavailable */
> > +} trigger_type_t;
> > +
> > +typedef struct {
> > +    target_ulong mcontrol;
> > +    target_ulong maddress;
> > +    struct CPUBreakpoint *bp;
> > +    struct CPUWatchpoint *wp;
> > +} trigger_type2_t;
>
> This is a confusing name
>

I will change it to type2_tigger,

Regards,
Bin

