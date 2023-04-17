Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poFUD-00089C-CR
	for mharc-qemu-riscv@gnu.org; Sun, 16 Apr 2023 23:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poFUB-00088t-UG; Sun, 16 Apr 2023 23:24:59 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poFU9-0002hP-IW; Sun, 16 Apr 2023 23:24:59 -0400
Received: by mail-vs1-xe33.google.com with SMTP id g41so9818774vsv.8;
 Sun, 16 Apr 2023 20:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681701896; x=1684293896;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fslmJyUIP6hV6YS6lcpQxu/Yzh5E6G7ubp3rO6XA1PA=;
 b=KhvJL9CVVcl182WvdN82FGxuaFKH8Ao9EXXeq1KI1WzXpW/lDVGOJ2781FQ83bYCmp
 KI05oMhZDyB9BWvqeHW8hl/oa6Cx24yTKgm0nvAoRv2th7t0XfYnZGvOw9wZNyY8mmci
 vsxC+0Eq5n2TtBFdnbWzz0PID2A1wxX6SctAYDe3n29sFcXFOrXSCprNLea6Yo9fRWx1
 oolU//tqOiigrHbXyk74TZUPDx0nLtuQUmvpKupQ8HEs/lIfkHAnU4XpILM0sgBG6fv5
 rteXAKw8OlZxOdDGGth3NrEDUds8b2hdDVPCsjqSqrHKuQDheVLmC6F40/Z3NEPm4Qwm
 CeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681701896; x=1684293896;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fslmJyUIP6hV6YS6lcpQxu/Yzh5E6G7ubp3rO6XA1PA=;
 b=LQTscNWFJ3hdQOP9s6RO0eNErJR+Hzfy2bAFD2axKMiMw522e4gekyIBVjJXT+aAyM
 oUr3+UccmS+9kVWR0s3Tko4R7mhvX0h4XoFrsT3+hJMtwnnhlO06u51+2TJtG/f/pIeK
 OcknjUunulK87+UaqjHKd1YLzSDrrQJgjU6px2OamKYGTKa2Gw86wlCzDkAV+spFUMcJ
 c7Zx7TPfWN77afkg9IipvJqjnH01Cuf1VCZrXLL655PZBIqBwNYwYUggX4/feY4CVWPY
 QBij5EN4XYO8e/oUPyjxYVJf3EY9De0MpSAe6evmzR/svvynWkM5rx/9NqN7HqBg5eaA
 aHnA==
X-Gm-Message-State: AAQBX9eWAlTY8aMIyfKHfye1LTyiv3bLQSZ8WsY/z0dc/mOIX9kbtTys
 VU8kXR0r+nSK0eZu8TFb13He4A5JfsitUCb6BGg=
X-Google-Smtp-Source: AKy350bEm4Om8iTZtfElE3O3CVZFj8KjewohPZ5xAs8R5tDd/lp2wqgATsrcCnWmVN7XcsqvbN/6p2kYcgG1SUAJL04=
X-Received: by 2002:a67:e004:0:b0:425:8e57:7bfd with SMTP id
 c4-20020a67e004000000b004258e577bfdmr7841207vsl.3.1681701895944; Sun, 16 Apr
 2023 20:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230412091716.126601-1-alexghiti@rivosinc.com>
In-Reply-To: <20230412091716.126601-1-alexghiti@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Apr 2023 13:24:29 +1000
Message-ID: <CAKmqyKNkyakGCFG0DqX02GpqhAPEq=tkt-EVctas5m2XjRuXJg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Raise an exception if pte reserved bits are not
 cleared
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrea Parri <andrea@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
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
X-List-Received-Date: Mon, 17 Apr 2023 03:25:00 -0000

On Wed, Apr 12, 2023 at 7:18=E2=80=AFPM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
>
> As per the specification, in 64-bit, if any of the pte reserved bits 60-5=
4
> is set, an exception should be triggered (see 4.4.1, "Addressing and Memo=
ry
> Protection"), so implement this behaviour in the address translation proc=
ess.
>
> Reported-by: Andrea Parri <andrea@rivosinc.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  target/riscv/cpu_bits.h   | 1 +
>  target/riscv/cpu_helper.c | 5 +++++
>  2 files changed, 6 insertions(+)
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
> index f88c503cf4..39c323a865 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -936,6 +936,11 @@ restart:
>              return TRANSLATE_FAIL;
>          }
>
> +        /* PTE reserved bits must be cleared otherwise an exception is r=
aised */
> +        if (riscv_cpu_mxl(env) =3D=3D MXL_RV64 && (pte & PTE_RESERVED)) =
{
> +            return TRANSLATE_FAIL;
> +        }

Isn't this caught by our existing check?

            if ((pte & ~(target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT) {
                return TRANSLATE_FAIL;
            }

Alistair

> +
>          bool pbmte =3D env->menvcfg & MENVCFG_PBMTE;
>          bool hade =3D env->menvcfg & MENVCFG_HADE;
>
> --
> 2.37.2
>
>

