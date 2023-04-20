Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppdEc-0000hK-FX
	for mharc-qemu-riscv@gnu.org; Thu, 20 Apr 2023 18:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ppdEa-0000gq-FQ; Thu, 20 Apr 2023 18:58:36 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ppdEY-0003h1-1Q; Thu, 20 Apr 2023 18:58:35 -0400
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-779701b7265so286090241.2; 
 Thu, 20 Apr 2023 15:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682031512; x=1684623512;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=islVdEdTUHtl0qJ3+cvAElwJgvP4WtfgPMXj6Z81SbI=;
 b=R6vj7EHJkADvyI1+oFrKqwjpB1TojdhMd5quFCyJzCaAMXw4rzC1DEKh91vvMjbmY4
 axAo2+U62hFZsPWs5Ini3Wg3hycNUw0MRaT2Ls7c+nHNMlEbchw3EBj1nUawnUMkmOzX
 bjapcxuwYiUGd5hwBgDSl+9CvHDFkoEqRgIY9YYKpwz8w93WEJvWh84zrXAxCSiUZugD
 yOZKDURvtV11i3Bjj0eV0yB1Ritusw8ZKGgte2bobtUgCZDW9dwgahvD7ubjj/zkrEPF
 7OSk5hdzQDQ8vtUJwbC70aljgXxZfWZ+dGE7Y7qSEUXla86sAIA2BUNHaw9xYwwLxJjK
 x+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682031512; x=1684623512;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=islVdEdTUHtl0qJ3+cvAElwJgvP4WtfgPMXj6Z81SbI=;
 b=bPhsGURqfsPlVfy9LUMhVO+y+DcJJ+3fqjcYCE6yGw79ASY10rkTn/0mqPRUQ6r5+3
 AJK+HIPONharJW3Izpa9GmgfKVSsuq7gkyjtT3e4ON/kpmmWm/sgwGVxyRAR7f9aNVPo
 jwRJwl2o/Fk1V5ir7kc5OXeQKHC4eMnMfD/zx53EcBMPgi41PqR8BRBj63V2Upg3CL7B
 GHisqnMl8n4/D71PvK3lqUAGYjIZwwvS2/1eYHRlXIo6h+6Q2dYRlz8fupP77sq37FTJ
 z+t1xR7iXk2vxTiNfehaM2a/Gk5NkHCEvRpPpYMBCJCGLz6HvdG0e2FihBezigTtXLem
 9VKw==
X-Gm-Message-State: AAQBX9dHyjgKDD4VOpxsOHTNqI7oa4+g6PYKF8TK2mL7L45Vl7d43ay3
 bewAJtoufDANLZ4jgRCkOAccgp/QUKXRriPopqWtvUAai0g=
X-Google-Smtp-Source: AKy350b0+UCRffZvUscJoJw4tpeiiPyPZEbl9oJzAKfuiI0zxB0m6UqNXavJ0kQDNBWkUr8u0ttzf0JhU7uHAClJuNY=
X-Received: by 2002:a1f:bf52:0:b0:436:1ead:e50e with SMTP id
 p79-20020a1fbf52000000b004361eade50emr178893vkf.1.1682031511501; Thu, 20 Apr
 2023 15:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230420150220.60919-1-alexghiti@rivosinc.com>
In-Reply-To: <20230420150220.60919-1-alexghiti@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 21 Apr 2023 08:58:05 +1000
Message-ID: <CAKmqyKOWy2ffcB72bJrF1U7ksa+eCsbencX1v-w96CN8+Hb-Yw@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: Make sure an exception is raised if a pte is
 malformed
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrea Parri <andrea@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92a.google.com
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
X-List-Received-Date: Thu, 20 Apr 2023 22:58:36 -0000

On Fri, Apr 21, 2023 at 1:07=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
>
> As per the specification, in 64-bit, if any of the pte reserved bits
> 60-54 is set an exception should be triggered (see 4.4.1, "Addressing and
> Memory Protection"). In addition, we must check the napot/pbmt bits are
> not set if those extensions are not active.
>
> Reported-by: Andrea Parri <andrea@rivosinc.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> Changes in v3:
> - Rebase on top of https://github.com/alistair23/qemu/tree/riscv-to-apply=
.next
>
> Changes in v2:
> - Handle napot and pbmt exception
>
>  target/riscv/cpu_bits.h   |  1 +
>  target/riscv/cpu_helper.c | 15 +++++++++++----
>  2 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index fb63b8e125..59f0ffd9e1 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -644,6 +644,7 @@ typedef enum {
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
> index b68dcfe7b6..57d04385f1 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -927,13 +927,20 @@ restart:
>
>          if (riscv_cpu_sxl(env) =3D=3D MXL_RV32) {
>              ppn =3D pte >> PTE_PPN_SHIFT;
> -        } else if (pbmte || riscv_cpu_cfg(env)->ext_svnapot) {
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
> +            if (!riscv_cpu_cfg(env)->ext_svnapot && (pte & PTE_N)) {
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

