Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppHHN-0004E8-OF
	for mharc-qemu-riscv@gnu.org; Wed, 19 Apr 2023 19:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ppHHL-0004Dk-H5; Wed, 19 Apr 2023 19:31:59 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ppHHJ-00067x-JL; Wed, 19 Apr 2023 19:31:59 -0400
Received: by mail-ua1-x933.google.com with SMTP id ch24so1060939uab.3;
 Wed, 19 Apr 2023 16:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681947116; x=1684539116;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W3OvTHIQIz683Dc/0Zp2h7vQdvmrvGrRSlF76p6Q7L8=;
 b=mzhz884UFcFraut2/xS1qVKFyoPey3aiJNYTJ9G0Xge3XhA76J4doy6LCNB7tJ5Mh3
 fh4JiOJg6HDzzQfWiWKsWKztV9wuewYce1Vy22sShpL2wr4lP5G4XIJPa6anEkmSxn9R
 RQ5JJKz+foaPsPVv70cRCRvjT9ko8JMaq+AmWH2gvwSlRNbuB7WfcZ4aVOiZoz1Hvylt
 L8YG3VMHoPxX7SnglAH6ltpDJCjjdzEobaHBc70mHVaKp5I5vb++IArF9sfK1UEEohV2
 ENtc+VrnaysTLEEfwMXDkxB8VjPdA7iC7j0hwRaCYLqgmTSIdJ+ztunzdZSRLZvJOqhR
 SStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681947116; x=1684539116;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W3OvTHIQIz683Dc/0Zp2h7vQdvmrvGrRSlF76p6Q7L8=;
 b=ekR38/bq4jCqW7Bp2zDaPh4MMPhKWjN1+qAmwuSo/u181OpI9Izfe5NU0Sq+clw2AU
 VOU36WCtaQJlDhTr0XdjjNR4glRojqMtrkgcpQVxz4JvDAtWWuA+jnBkW7lbZgaq870S
 6pWlsRBa6nkZCFLuMIpNALrSR07acGo+T1qdk4TizIw4DUmSEjIfi2lxjYZWLRdCtoml
 AnuYHpAnIpUZzISP3ExODQiVc92HH+LrPwrRlqLyJBigz3C6yodUDyASC4dZVg9dhKML
 qzO21TV7663HRejhoNJpAPPaQTyaQsKF5QBaVCwNzrTx9Cn2fTpBh9iyCHffNCw4ZOzF
 XwZg==
X-Gm-Message-State: AAQBX9fQxB1TGeas9K3dx9cMZzqEeLia+LvtAsgEx9ha8pJx4BWDY1yN
 qzKDJDa4TAwA/U9ujPRzFnjclA7YJKtNz1+49ns=
X-Google-Smtp-Source: AKy350ZEw9dLonWe88lnQN4piIIgc1MpsgAzZjI/pz+PC+1H5vAXG4WGnZ4S1ZzyvDkuXvmJDXnIaRhViW/nOZGnEUM=
X-Received: by 2002:a1f:ea47:0:b0:443:675e:3096 with SMTP id
 i68-20020a1fea47000000b00443675e3096mr622039vkh.16.1681947116019; Wed, 19 Apr
 2023 16:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230419104756.71455-1-alexghiti@rivosinc.com>
In-Reply-To: <20230419104756.71455-1-alexghiti@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 20 Apr 2023 09:31:29 +1000
Message-ID: <CAKmqyKOXpbnBwwBa54U2XXhzYQTxJxYqFJgsDhH1LnV-MsUoTw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Make sure an exception is raised if a pte is
 malformed
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrea Parri <andrea@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x933.google.com
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
X-List-Received-Date: Wed, 19 Apr 2023 23:31:59 -0000

On Wed, Apr 19, 2023 at 8:48=E2=80=AFPM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
>
> As per the privileged specification, in 64-bit, if any of the pte reserve=
d
> bits 60-54 is set an exception should be triggered, and the same applies =
to
> napot/pbmt bits if those extensions are not enabled
> (see 4.4.1, "Addressing and Memory Protection").
>
> Reported-by: Andrea Parri <andrea@rivosinc.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks for the patch

Do you mind sending a v3 rebased on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next ?

Alistair

> ---
>  target/riscv/cpu_bits.h   |  1 +
>  target/riscv/cpu_helper.c | 15 +++++++++++----
>  2 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index fca7ef0cef..8d9ba2ce11 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -640,6 +640,7 @@ typedef enum {
>  #define PTE_SOFT            0x300 /* Reserved for Software */
>  #define PTE_PBMT            0x6000000000000000ULL /* Page-based memory t=
ypes */
>  #define PTE_N               0x8000000000000000ULL /* NAPOT translation *=
/
> +#define PTE_RESERVED        0x1FC0000000000000ULL /* Reserved bits */
>  #define PTE_ATTR            (PTE_N | PTE_PBMT) /* All attributes bits */
>
>  /* Page table PPN shift amount */
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..8dc832d1bb 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -946,13 +946,20 @@ restart:
>
>          if (riscv_cpu_sxl(env) =3D=3D MXL_RV32) {
>              ppn =3D pte >> PTE_PPN_SHIFT;
> -        } else if (pbmte || cpu->cfg.ext_svnapot) {
> -            ppn =3D (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>          } else {
> -            ppn =3D pte >> PTE_PPN_SHIFT;
> -            if ((pte & ~(target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT) {
> +            if (pte & PTE_RESERVED) {
> +                return TRANSLATE_FAIL;
> +            }
> +
> +            if (!pbmte && (pte & PTE_PBMT)) {
>                  return TRANSLATE_FAIL;
>              }
> +
> +            if (!cpu->cfg.ext_svnapot && (pte & PTE_N)) {
> +                return TRANSLATE_FAIL;
> +            }
> +
> +            ppn =3D (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>          }
>
>          if (!(pte & PTE_V)) {
> --
> 2.37.2
>
>

