Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppHEy-0002vg-7D
	for mharc-qemu-riscv@gnu.org; Wed, 19 Apr 2023 19:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ppHEv-0002vC-2K; Wed, 19 Apr 2023 19:29:29 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ppHEs-0005Z3-1g; Wed, 19 Apr 2023 19:29:27 -0400
Received: by mail-ua1-x930.google.com with SMTP id w19so1020830uad.7;
 Wed, 19 Apr 2023 16:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681946964; x=1684538964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oQiXGxViv+1rfgIZ8R1oCcPfb+qrE8FoCKN/hMXjztg=;
 b=Hz6lQoNs2hkMBGiGpNnyldCGwo5AI52mE2rPjWtkXlVl+ELkdtaRkWEdh95ZhTr9Lz
 Ctb1bSQbrgnIBOiFiFSBleBIIuR5inXBN0nDzeni12cZ6HgLecrFWxOm9IJtrXPidjwF
 h7PuapI1M1U2deJkQnt2rmTh7b721dR3xnx94Ha8WvJrPh1BohwSiIMpTQXUq+t6sako
 TE25+CgbuoEWPAyn1Zsn4MA7JOn4mLoT7nlojPr0MAmZg902FgviOLL8L3jGz2DyWr3Z
 8qMFYZVJM3uq0EizH26xWNOH2IRMBjGs6cqaqBUspD/UOgDXV9+ccvM3q3L7jmaKRbj9
 IOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681946964; x=1684538964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oQiXGxViv+1rfgIZ8R1oCcPfb+qrE8FoCKN/hMXjztg=;
 b=X4OFiLX1PMQTtelE8iOK7W26p7IMuRRSzt8eIvhV7uEzT8h1I/iVPoByRBjtlWJNEa
 LtcQh3Ed+tcowM2GTWQPbWH0KxI7ctKry7WbOMGRg2GoIUeRZQHA3NFvjNYhAyLeajGp
 3x0RD/+nLgcSVkUUAMmHRzGdWZ+SR22W1F90akpRS5PU8fSO8QJpENJOFAiVkPAxzu61
 uJfRzS5xGEze790N2So/0Zy0yWUVuc/t1uIGfT3wgeaWk3F7SAg7pbJpq6mGNvu3Km4a
 1WiCnf/6Hn4tlMxSwfriPcY2eQnf9jMXpORRwViZPGHXsYMtDgySx/CsKVN4KpDMtlOA
 l0uA==
X-Gm-Message-State: AAQBX9eEb/RsmB0nC54lCUn6+tgdiZVcVA08BeaEXfeGP/MkzWr8k4Lu
 rxD2hYKpzQHPmowjpovtU/USuTjH0Vjwj09CM8i2g4u6iVs=
X-Google-Smtp-Source: AKy350bWtejExaXW1TR/97QnOJeCmcxpfapIsgNzyeHKYp3/OTvv3ZWZ4lq2aLgPSmBHfZPx/k12ptuIJga54Quq7Io=
X-Received: by 2002:a1f:c1ca:0:b0:440:19fe:1790 with SMTP id
 r193-20020a1fc1ca000000b0044019fe1790mr763409vkf.1.1681946962494; Wed, 19 Apr
 2023 16:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230419104756.71455-1-alexghiti@rivosinc.com>
In-Reply-To: <20230419104756.71455-1-alexghiti@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 20 Apr 2023 09:28:56 +1000
Message-ID: <CAKmqyKMQ2Z3GXDiXcXEL-R2AAqxVZKL+8+yHdPk8SCZQz+AT1g@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Make sure an exception is raised if a pte is
 malformed
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrea Parri <andrea@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
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
X-List-Received-Date: Wed, 19 Apr 2023 23:29:31 -0000

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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

