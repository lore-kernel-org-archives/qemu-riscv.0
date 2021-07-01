Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lylXY-0008W4-3M
	for mharc-qemu-riscv@gnu.org; Wed, 30 Jun 2021 21:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lylXW-0008Vc-E4; Wed, 30 Jun 2021 21:30:50 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:37650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lylXU-0007fW-Dh; Wed, 30 Jun 2021 21:30:50 -0400
Received: by mail-il1-x132.google.com with SMTP id i13so4867969ilu.4;
 Wed, 30 Jun 2021 18:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kVEczltBvKdboLpIh/D87dPz2NT7/sXIHyPZqxVNB98=;
 b=HbQk/WQxdlw8asLvMTpqww4LU+aHcwlsEJac4fa9U/i7+S0EV9CfA1KowjjZqIh4wD
 6cUqzF5JXmunSTPWTIEFfrgEbxJUkaaKYj0X1toJOryUVbynOT9MQtkrez8zG9HXqVPu
 LHtRy5hsnV6QWCK3A/6vElX0/HL7lQyYQvV66J8+o6ZsStzoZcl4WtStLdCb9dSkubRU
 EeO0+uCNgJIAry9RUI8rgIpEDci4KzGKEyvlt6T2FSw7XozHbfwYgh4OOEpqhoF8NssL
 U0x4REMbCiWz1obFTyGCs4NgrafZ0QohX9MtOxPVzEs4xUuieacZmakJvPWSXVt3MyGp
 A8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kVEczltBvKdboLpIh/D87dPz2NT7/sXIHyPZqxVNB98=;
 b=OwzepgMJN2ioc0YbrVFJEMrCDR1JeRUa9yxCjyr8MSYo78+rjj/PtsXnELg3xbg7mL
 kQQMfR+Euviy458nCtiPHT0wqFQB01xLeEVyakbTiDoMvEoQhnKPICmo8mPzN8VYxZZu
 x70oRfNX4woXer35vhpDzgMTbyxq51lVA0uAhu8FctRhb7LXehYpRuZI1Of3+dzSPNxF
 hy68Bj6YCCtahQFjSwSKmgwlazw5h7Gq1cH9lgUgl7ylTROJxHw2ycA77VZAFtuxoGrr
 uGlJ4rb9vIfEL9E4CPvsjbna0DtzrC/01vOyRzY+ug4xDU6FxXNpew4ugYbcFEJ9ZOTk
 ilaA==
X-Gm-Message-State: AOAM530UpVP1qSoFII18stu+1WCGRwrwO91ZilVeAEEDqjK799r8TtJk
 k0D5Ca7TUUEIa6JqqnuZSzFSd6LaIA+CmTJXyTI=
X-Google-Smtp-Source: ABdhPJw8Sh4rrSrqV67OI6oQDR1Hw5owe5qAWu3hObRnfiR4Z+QFaxEZG+fGNXueG4HNM26Y1cpZtVubUT18braod1Q=
X-Received: by 2002:a92:c886:: with SMTP id w6mr27752241ilo.227.1625103046630; 
 Wed, 30 Jun 2021 18:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 1 Jul 2021 11:30:20 +1000
Message-ID: <CAKmqyKNw2Vr=fqGqnGBRF1mF6FAk-qn=ecNuSdrWAv1rGro7hw@mail.gmail.com>
Subject: Re: [PATCH v3 00/37] target/riscv: support packed extension v0.9.4
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Thu, 01 Jul 2021 01:30:50 -0000

On Thu, Jun 24, 2021 at 9:14 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> This patchset implements the packed extension for RISC-V on QEMU.
>
> You can also find this patch set on my
> repo(https://github.com/romanheros/qemu.git branch:packed-upstream-v3).
>
> Features:
> * support specification packed extension
>   v0.9.4(https://github.com/riscv/riscv-p-spec/)
> * support basic packed extension.
> * support Zpsoperand.

There is now a 0.9.5, do you have plans to support that?

Alistair

>
> v3:
> * split 32 bit vector operations.
>
> v2:
> * remove all the TARGET_RISCV64 macro.
> * use tcg_gen_vec_* to accelabrate.
> * update specficication to latest v0.9.4
> * fix kmsxda32, kmsda32,kslra32,smal
>
> LIU Zhiwei (37):
>   target/riscv: implementation-defined constant parameters
>   target/riscv: Make the vector helper functions public
>   target/riscv: 16-bit Addition & Subtraction Instructions
>   target/riscv: 8-bit Addition & Subtraction Instruction
>   target/riscv: SIMD 16-bit Shift Instructions
>   target/riscv: SIMD 8-bit Shift Instructions
>   target/riscv: SIMD 16-bit Compare Instructions
>   target/riscv: SIMD 8-bit Compare Instructions
>   target/riscv: SIMD 16-bit Multiply Instructions
>   target/riscv: SIMD 8-bit Multiply Instructions
>   target/riscv: SIMD 16-bit Miscellaneous Instructions
>   target/riscv: SIMD 8-bit Miscellaneous Instructions
>   target/riscv: 8-bit Unpacking Instructions
>   target/riscv: 16-bit Packing Instructions
>   target/riscv: Signed MSW 32x32 Multiply and Add Instructions
>   target/riscv: Signed MSW 32x16 Multiply and Add Instructions
>   target/riscv: Signed 16-bit Multiply 32-bit Add/Subtract Instructions
>   target/riscv: Signed 16-bit Multiply 64-bit Add/Subtract Instructions
>   target/riscv: Partial-SIMD Miscellaneous Instructions
>   target/riscv: 8-bit Multiply with 32-bit Add Instructions
>   target/riscv: 64-bit Add/Subtract Instructions
>   target/riscv: 32-bit Multiply 64-bit Add/Subtract Instructions
>   target/riscv: Signed 16-bit Multiply with 64-bit Add/Subtract
>     Instructions
>   target/riscv: Non-SIMD Q15 saturation ALU Instructions
>   target/riscv: Non-SIMD Q31 saturation ALU Instructions
>   target/riscv: 32-bit Computation Instructions
>   target/riscv: Non-SIMD Miscellaneous Instructions
>   target/riscv: RV64 Only SIMD 32-bit Add/Subtract Instructions
>   target/riscv: RV64 Only SIMD 32-bit Shift Instructions
>   target/riscv: RV64 Only SIMD 32-bit Miscellaneous Instructions
>   target/riscv: RV64 Only SIMD Q15 saturating Multiply Instructions
>   target/riscv: RV64 Only 32-bit Multiply Instructions
>   target/riscv: RV64 Only 32-bit Multiply & Add Instructions
>   target/riscv: RV64 Only 32-bit Parallel Multiply & Add Instructions
>   target/riscv: RV64 Only Non-SIMD 32-bit Shift Instructions
>   target/riscv: RV64 Only 32-bit Packing Instructions
>   target/riscv: configure and turn on packed extension from command line
>
>  target/riscv/cpu.c                      |   34 +
>  target/riscv/cpu.h                      |    6 +
>  target/riscv/helper.h                   |  330 ++
>  target/riscv/insn32.decode              |  370 +++
>  target/riscv/insn_trans/trans_rvp.c.inc | 1155 +++++++
>  target/riscv/internals.h                |   50 +
>  target/riscv/meson.build                |    1 +
>  target/riscv/packed_helper.c            | 3851 +++++++++++++++++++++++
>  target/riscv/translate.c                |    3 +
>  target/riscv/vector_helper.c            |   82 +-
>  10 files changed, 5824 insertions(+), 58 deletions(-)
>  create mode 100644 target/riscv/insn_trans/trans_rvp.c.inc
>  create mode 100644 target/riscv/packed_helper.c
>
> --
> 2.17.1
>
>

