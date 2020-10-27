Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXVjL-0005za-08
	for mharc-qemu-riscv@gnu.org; Tue, 27 Oct 2020 16:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kXVjI-0005uu-Dt; Tue, 27 Oct 2020 16:38:04 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:39461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kXVjG-00066L-Le; Tue, 27 Oct 2020 16:38:04 -0400
Received: by mail-il1-x142.google.com with SMTP id q1so2728642ilt.6;
 Tue, 27 Oct 2020 13:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UDJbHXkiDmfKXG5N7PxBPFhTE3mwZeImbNwXAbE1OYM=;
 b=c8YmZX9uMoA1FMwYu9DPt6ql33JVwHPCpyggmy1FD1zwKz2YG/fY5vsJTqOCS4DsHX
 kN6wgT/LkTMQcdmdHFcoEBAMzIYNDvZhn9buP739j7gjWZlAgpH4RQtLdQO+WeomM5yu
 ddq6gPEtLtg9q8dJl+PnwwHAXntdWPwGPDnNYrdYj2eIDTBmJxYxAxWI5Hekrr0O+uIB
 ZWfB/BRkKD4hA4Ac88GSp+ge3aX4x8mzREIRq1IcbS2+lYVFIb1aszIiiisWNF0XrJ1p
 PMtZ1KaFdOCijMmBf3hb0pAojQIhhbptizr3LqOu+V4WSw4rzzQNnSdN7AaaWYF+22xB
 swYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UDJbHXkiDmfKXG5N7PxBPFhTE3mwZeImbNwXAbE1OYM=;
 b=tQdhnUjNtcacs5WgknZnWin6mVljXbA0kN0Sjryr/W97PlJY4DnFn154cxn0aoo6tt
 rw9Rwdsx0fjiLpH6BUChuSyKeIYFGC4gkqGXob7FCEpbJ458CytAw1/bASS1hDtTmJ4W
 66lIgX2PScSthLptz6aZb0GcDObNSeG2Yvo5syvDZ1h+oVX3Hs/6m8wGg4zd5xspV7/e
 OBRSOc672PgLmGImZQhSLfvIcWjyrJrMXgHI2BbfA+ONHev3YHxZ1bpdYXgOlN5ANQc1
 jKLx8O9c1CO59Mo5jw3Ch1x9hr9253kjdA6rrwSDL7UJ39KN6nqc6f34FHf8DQjtHRjZ
 kjUw==
X-Gm-Message-State: AOAM532NPxlHa9NcvINkX+qSYwPNyYgDjQUiwvfxhYRRr/onkKSIn+Sv
 CJe6ZSvdGuxWVm03izITs3gkzY/bAyZYYXKDdwk=
X-Google-Smtp-Source: ABdhPJywwk5s2cewqIrf0st6pZqC9JfX+4iOaAWdhVX8M5UAcKT2ckqsi+r5nm+taKQyYoHVnZbtpILbCn1320/XpA4=
X-Received: by 2002:a05:6e02:f41:: with SMTP id
 y1mr3567885ilj.267.1603831081514; 
 Tue, 27 Oct 2020 13:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201026115530.304-1-jiangyifei@huawei.com>
In-Reply-To: <20201026115530.304-1-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Oct 2020 13:26:12 -0700
Message-ID: <CAKmqyKM-de168rpmH9Qk1R=FoaQht2VWckEMEq=0dnyO2PFOgg@mail.gmail.com>
Subject: Re: [PATCH V4 0/6] Support RISC-V migration
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "Zhangxiaofeng (F)" <victor.zhangxiaofeng@huawei.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 yinyipeng <yinyipeng1@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "Wubin (H)" <wu.wubin@huawei.com>, "dengkai (A)" <dengkai1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x142.google.com
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
X-List-Received-Date: Tue, 27 Oct 2020 20:38:04 -0000

On Mon, Oct 26, 2020 at 4:58 AM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> This patches supported RISC-V migration based on tcg accel. And we have
> verified related migration features such as snapshot and live migration.
>
> A few weeks ago, we submitted RFC patches about supporting RISC-V migration
> based on kvm accel: https://www.spinics.net/lists/kvm/msg223605.html.
> And we found that tcg accelerated migration can be supported with a few
> changes. Most of the devices have already implemented the migration
> interface, so, to achieve the tcg accelerated migration, we just need to
> add vmstate of both cpu and sifive_plic.
>
> changes since v3
> 1. Apply Alistair's patch to exend get/set_field():
>    https://www.mail-archive.com/qemu-devel@nongnu.org/msg753575.html
> 2. Remake the patch: Merge m/vsstatus and m/vsstatush into one uint64_t
>    unit.
>
> Changes since v2:
> 1. Move vmstate_riscv_cpu declaration to internals.h.
> 2. Merge m/vsstatus and m/vsstatush into one uint64_t unit.
>
> Changes since v1:
> 1. Add license head to target/riscv/machine.c.
> 2. Regenerate some state of PMP at post_load hook.
>
> Yifei Jiang (6):
>   target/riscv: Merge m/vsstatus and m/vsstatush into one uint64_t unit
>   target/riscv: Add basic vmstate description of CPU
>   target/riscv: Add PMP state description
>   target/riscv: Add H extension state description
>   target/riscv: Add V extension state description
>   target/riscv: Add sifive_plic vmstate

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/intc/sifive_plic.c     |  26 ++++-
>  hw/intc/sifive_plic.h     |   1 +
>  target/riscv/cpu.c        |  16 ++--
>  target/riscv/cpu.h        |  24 +++--
>  target/riscv/cpu_bits.h   |  19 +---
>  target/riscv/cpu_helper.c |  35 ++-----
>  target/riscv/csr.c        |  18 ++--
>  target/riscv/internals.h  |   4 +
>  target/riscv/machine.c    | 196 ++++++++++++++++++++++++++++++++++++++
>  target/riscv/meson.build  |   3 +-
>  target/riscv/op_helper.c  |  11 +--
>  target/riscv/pmp.c        |  29 +++---
>  target/riscv/pmp.h        |   2 +
>  13 files changed, 290 insertions(+), 94 deletions(-)
>  create mode 100644 target/riscv/machine.c
>
> --
> 2.19.1
>
>

