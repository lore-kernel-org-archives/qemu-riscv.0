Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nALQx-0008MY-EF
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 19:36:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nALQs-0008Kc-AG; Wed, 19 Jan 2022 19:36:06 -0500
Received: from [2607:f8b0:4864:20::d29] (port=46929
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nALQq-0002Rn-NH; Wed, 19 Jan 2022 19:36:06 -0500
Received: by mail-io1-xd29.google.com with SMTP id e79so5014198iof.13;
 Wed, 19 Jan 2022 16:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vAP56vjMi3hKn6zaTDfAHZ6swk0V9J3pxlDUJEyCEYE=;
 b=CjvH/jMm1577trCwion31DfWl9nkfhhuMqaNwSD6jgfGZvbQ1k1oPuYvbPzQBfCIcN
 VlMlU/GkFcTf0eLHFOjAXl3s5J+RxX5ZgBPg7zlggK9+CvjDH6sGyHB6zHyth+hZmGaX
 ZB5Utzk3l1nBty15akkJF7Q7gaDfcWnhrfle6Kjbox+9iUdvpWdCu9LTqDc6WI4AwBT8
 zRkOMGGQPbZn8vaoz7w+cExhZ3VHHGZgF5qsTlNXKwAzs/awwM1hBgjt8uFI/r1FLm7W
 C2M9/nCJ/psjH7GHST/qZXobmxFM3Zma5uUFaeFBUipJccaKtZDbSQtSv3WPVsCWuF6O
 tjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vAP56vjMi3hKn6zaTDfAHZ6swk0V9J3pxlDUJEyCEYE=;
 b=VHbUQWDOV/wUdJJUzvwXSNzWL1XSXfr4+5WVU5ah7AtqhFtiuBvTcQrha1HqtILJdA
 YkZYfLbxR9UYH3bf2FGvcthws5gL8g+6Gq5N0K09FPstsZX88nQhsXmVLkdG+m0X+MAf
 PB7cJ7043zlUqo9SqYcIo8gX5opmYf9FQz1uyrmbN2OIlWTfO0mKSpdohpO73WhmuCyE
 pEsAPb3q8h+XZJegR+vwJdmBmYfwQTeIVlJtgrq4gJvPWetI5xQDD++wna9fpFaAouSX
 bOgPai0YScpzLtBrcaC+3nIOWj57eixTMECvwYvwyeXZwlLn3euo7HyfHDV1vJ/k0de1
 A85A==
X-Gm-Message-State: AOAM530hEmrkAXW6zgK4sRUghQSLZ5FhPMD08lKycgfdNCoFQYr7+9+i
 0JhG4VY7wM+wE3Rev2tmZ3ZILelV0BFs76aw6oA=
X-Google-Smtp-Source: ABdhPJwq2bDfTIIfKxo1iwIuBBmEGRc1qU5gNTMqEbMyiqoqqXUXw+OoA18+n6Lu+gyzElhQ3cKo2lpMvdNNfEP9NIk=
X-Received: by 2002:a05:6602:14cd:: with SMTP id
 b13mr11396482iow.57.1642638962145; 
 Wed, 19 Jan 2022 16:36:02 -0800 (PST)
MIME-Version: 1.0
References: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
 <20220119051824.17494-22-zhiwei_liu@c-sky.com>
In-Reply-To: <20220119051824.17494-22-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 20 Jan 2022 10:35:36 +1000
Message-ID: <CAKmqyKP=NNEVDDGrbSEeWLfLyX_+=Ao0yWJ9RtyazyycGHM3+w@mail.gmail.com>
Subject: Re: [PATCH v7 21/22] target/riscv: Enable uxl field write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 guoren@linux.alibaba.com, Bin Meng <bin.meng@windriver.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 20 Jan 2022 00:36:08 -0000

On Wed, Jan 19, 2022 at 3:34 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/csr.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index b11d92b51b..90f78eca65 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -572,6 +572,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>  {
>      uint64_t mstatus = env->mstatus;
>      uint64_t mask = 0;
> +    RISCVMXL xl = riscv_cpu_mxl(env);
>
>      /* flush tlb on mstatus fields that affect VM */
>      if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
> @@ -583,21 +584,22 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>          MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
>          MSTATUS_TW | MSTATUS_VS;
>
> -    if (riscv_cpu_mxl(env) != MXL_RV32) {
> +    if (xl != MXL_RV32) {
>          /*
>           * RV32: MPV and GVA are not in mstatus. The current plan is to
>           * add them to mstatush. For now, we just don't support it.
>           */
>          mask |= MSTATUS_MPV | MSTATUS_GVA;
> +        if ((val & MSTATUS64_UXL) != 0) {
> +            mask |= MSTATUS64_UXL;
> +        }
>      }
>
>      mstatus = (mstatus & ~mask) | (val & mask);
>
> -    RISCVMXL xl = riscv_cpu_mxl(env);
>      if (xl > MXL_RV32) {
> -        /* SXL and UXL fields are for now read only */
> +        /* SXL field is for now read only */
>          mstatus = set_field(mstatus, MSTATUS64_SXL, xl);
> -        mstatus = set_field(mstatus, MSTATUS64_UXL, xl);

This change causes:

ERROR:../target/riscv/translate.c:295:get_gpr: code should not be reached

to assert when running an Xvisor (Hypervisor extension) guest on the
64-bit virt machine.

Alistair

