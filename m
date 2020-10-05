Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPYs0-000579-Q9
	for mharc-qemu-riscv@gnu.org; Mon, 05 Oct 2020 18:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kPYry-00055Z-Vs; Mon, 05 Oct 2020 18:22:10 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:38795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kPYrw-0006dC-Sj; Mon, 05 Oct 2020 18:22:10 -0400
Received: by mail-io1-xd42.google.com with SMTP id y20so10865052iod.5;
 Mon, 05 Oct 2020 15:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tglCH8RgEdJDRiweRrrdMYIPM+WqqQQ5+MPTE43ZHJ0=;
 b=vGU50ibOPj8poQZsoQYRUIk0uS67zuRPNbwkNfM6RlGLrRimIAj7pvXBZRbHlgM0QZ
 y3vLBjN7y7GdsHWwoACyESlEzyF4Zja9zE+F7h/trJmQeGruQ6MVySCCLmeAgMIY0tnV
 SX7v2yJkAxf8L/QOpSnm4g3QZwn8jlo/6IETByy5vVyL4ijKPPNtj5zGC1m0vgX7MnJx
 jURzguz6lChBY3/w5fVnJCxuQ9dUrFzADR0b1BeACWva2LkuKY+NzXqHKvpSoiwAHQjy
 zqQ2qhjzKwGXCVz5eEFYdK1YcL/5L3cjtyvxgXJPpIBnhC9xxMgJ8YwDy8vC3eeLDkR4
 2eIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tglCH8RgEdJDRiweRrrdMYIPM+WqqQQ5+MPTE43ZHJ0=;
 b=ZWj7OtJPPwzE1HtTCX7YVCeY0AiuhGqIWaIKwjB0nr2MYia3J/HLkDeC6m6F4VkPuX
 9YZ9PBAtTSDmEqk9zG6j+xNjQmSed3+E28uZK4YDX9wr1LBf3GsAfU7kfimBHh+EO0h6
 AsEmQcAMvvt1vaTd2R2YugBHMcyZJ11ZauZRejQcoedo+FWB7cBlmR0+qoqeNKrL1XAa
 HZrFS47OlHI0VPjB1vA+oub7nXD6Ko4WYF5TY6TRm49uwBd0J1ieRnA2ORQm884ZFdMX
 tuQIAa3Msb10p3bJnaWAlVNcdygdWKhyJ2TSp0tG/AAiiYrvncqyRpDTmxEMMQA/JxLm
 fEbA==
X-Gm-Message-State: AOAM533/OjM5yyGhiRnw6RiCn835LCPYBYvrsDrJwLn1c4SZ8gQYAu9T
 VBO5a2TIe8m98g8aihtVXBCz7eW9Nmj5JLnqTOo=
X-Google-Smtp-Source: ABdhPJxofBpqaJ7ftKfQNvFcXJI2udnz9n/T3dOHw+fd3y7w80zMjOp+C09aL5vFTVmWCceeJ3IJzaEAwU7L5l5JNbI=
X-Received: by 2002:a5e:9b11:: with SMTP id j17mr731287iok.176.1601936527273; 
 Mon, 05 Oct 2020 15:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200929020337.1559-1-jiangyifei@huawei.com>
 <20200929020337.1559-3-jiangyifei@huawei.com>
In-Reply-To: <20200929020337.1559-3-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 5 Oct 2020 15:10:40 -0700
Message-ID: <CAKmqyKMXdiTJYoNbATTfGTO-FT1+Ke9bHk_kGwpT0mH26xsSVg@mail.gmail.com>
Subject: Re: [PATCH 2/5] target/riscv: Add PMP state description
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "Zhangxiaofeng (F)" <victor.zhangxiaofeng@huawei.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, yinyipeng <yinyipeng1@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "Wubin (H)" <wu.wubin@huawei.com>, 
 "dengkai (A)" <dengkai1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Mon, 05 Oct 2020 22:22:11 -0000

On Mon, Sep 28, 2020 at 7:05 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> In the case of supporting PMP feature, add PMP state description
> to vmstate_riscv_cpu.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
> ---
>  target/riscv/machine.c | 49 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 3451b888b1..b1fc839b43 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -4,6 +4,51 @@
>  #include "sysemu/kvm.h"
>  #include "migration/cpu.h"
>
> +static bool pmp_needed(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +
> +    return riscv_feature(env, RISCV_FEATURE_PMP);
> +}
> +
> +static const VMStateDescription vmstate_pmp_entry = {
> +    .name = "cpu/pmp/entry",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINTTL(addr_reg, pmp_entry_t),
> +        VMSTATE_UINT8(cfg_reg, pmp_entry_t),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const VMStateDescription vmstate_pmp_addr = {
> +    .name = "cpu/pmp/addr",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINTTL(sa, pmp_addr_t),
> +        VMSTATE_UINTTL(ea, pmp_addr_t),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const VMStateDescription vmstate_pmp = {
> +    .name = "cpu/pmp",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = pmp_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_STRUCT_ARRAY(env.pmp_state.pmp, RISCVCPU, MAX_RISCV_PMPS,
> +                             0, vmstate_pmp_entry, pmp_entry_t),
> +        VMSTATE_STRUCT_ARRAY(env.pmp_state.addr, RISCVCPU, MAX_RISCV_PMPS,
> +                             0, vmstate_pmp_addr, pmp_addr_t),
> +        VMSTATE_UINT32(env.pmp_state.num_rules, RISCVCPU),

I would prefer to re-generate these from the PMP CSRs post load.

Alistair

> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  const VMStateDescription vmstate_riscv_cpu = {
>      .name = "cpu",
>      .version_id = 1,
> @@ -55,5 +100,9 @@ const VMStateDescription vmstate_riscv_cpu = {
>          VMSTATE_UINTTL(env.mstatush, RISCVCPU),
>  #endif
>          VMSTATE_END_OF_LIST()
> +    },
> +    .subsections = (const VMStateDescription * []) {
> +        &vmstate_pmp,
> +        NULL
>      }
>  };
> --
> 2.19.1
>
>

