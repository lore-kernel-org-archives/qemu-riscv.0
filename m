Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mpP0h-0007xZ-1K
	for mharc-qemu-riscv@gnu.org; Tue, 23 Nov 2021 01:10:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mpP0d-0007tl-HJ; Tue, 23 Nov 2021 01:10:28 -0500
Received: from [2607:f8b0:4864:20::132] (port=44732
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mpP0b-0005V7-Or; Tue, 23 Nov 2021 01:10:27 -0500
Received: by mail-il1-x132.google.com with SMTP id m5so12164960ilh.11;
 Mon, 22 Nov 2021 22:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jwBpYoRlq2k3xJaOoRtnrn0gJ0cbb1NjiAQdwKth5M0=;
 b=kdYSfnbAaKFnI4mwshT+yQuH76p83FHk0aP+l6aYCbW0ss+j1nvTNS9JOB144zekXN
 sz/BL4eL2fp8fNvCS5MzSBjdp8+2JRICV77hhDuHZCmMCR2SUAPs0ugR6RBZXWtkY3QK
 uT4ag7VskFexdDpB7u6hdsG3mxfp/GkWG4kLtHOHoqBM29gB3pvSV2jXA1q2oNyZPyCp
 R/tcvT8xarq0MzLAPNzEe3rc1ezviV+6nBEbO81YTm4+kEB/AMdoBlx6lwzOsBiwh52N
 jyGxkajLFxqrerb3ZaMoueCi3cPIB0D8RP47aQQYueqFpWA1ua7o8RCB9oBWf7YK44Ol
 wSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jwBpYoRlq2k3xJaOoRtnrn0gJ0cbb1NjiAQdwKth5M0=;
 b=GOREE3jtiuLx5GAsmgS9yy9jOkWHYmU9DG3l2UTQQIV8n+Oiaudx3U1elwwzSRYRTb
 Wheno3rTcJqFKsvkgOV6rLV2e0bJxDhel3onx3aL/m/nqgfmEE1uqtgdg44wsAI801MT
 3HxS7ufCg35sQuhDX0tHmfSbBQbiQWqrGEB+xbMa9PNA9HkQTlaY+Dht5BHo33Ag56N8
 Qq13KzOtfSMTyTyq6lYuA+5q+Z7jv3a2MimZqK/sB5EOBys/m5w1NNKiWSeDjnrla24h
 qyeXFa84dCRQx6fj2Q1mWLLilDYjPgo9Harpg8CisJrBSiw+QfXArawFlsBVznObWVu0
 1d9w==
X-Gm-Message-State: AOAM531D527/NUCi/EhnSDptuGQrYCDvODs9sMRY4ByDxygU+GxIA2m5
 y5cjqnj3g9nwuR4M9a77q2nzets8+pCagLKjIxQ=
X-Google-Smtp-Source: ABdhPJxl+shzqheRrwZl10Rxi/QapBmALYQfEJuTC2PiUfdJFyrFN2jJdcdMAl9Lj6V2EW2HWpRPAhPZyu4Kq1Z2otI=
X-Received: by 2002:a92:cda2:: with SMTP id g2mr3569853ild.46.1637647824269;
 Mon, 22 Nov 2021 22:10:24 -0800 (PST)
MIME-Version: 1.0
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-7-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20211112145902.205131-7-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Nov 2021 16:09:57 +1000
Message-ID: <CAKmqyKOFqe+0n--MkUyw1V_ncsktX_qSHQU6p6r+OqWf-t6g=w@mail.gmail.com>
Subject: Re: [PATCH v5 06/18] target/riscv: array for the 64 upper bits of
 128-bit registers
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Tue, 23 Nov 2021 06:10:28 -0000

On Sat, Nov 13, 2021 at 1:07 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> The upper 64-bit of the 128-bit registers have now a place inside
> the cpu state structure, and are created as globals for future use.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> ---
>  target/riscv/cpu.h       |  2 ++
>  target/riscv/cpu.c       |  9 +++++++++
>  target/riscv/machine.c   | 20 ++++++++++++++++++++
>  target/riscv/translate.c |  5 ++++-
>  4 files changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0760c0af93..53a295efb7 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -110,6 +110,7 @@ FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
>
>  struct CPURISCVState {
>      target_ulong gpr[32];
> +    target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */
>      uint64_t fpr[32]; /* assume both F and D extensions */
>
>      /* vector coprocessor state. */
> @@ -339,6 +340,7 @@ static inline bool riscv_feature(CPURISCVState *env, =
int feature)
>  #include "cpu_user.h"
>
>  extern const char * const riscv_int_regnames[];
> +extern const char * const riscv_int_regnamesh[];
>  extern const char * const riscv_fpr_regnames[];
>
>  const char *riscv_cpu_get_trap_name(target_ulong cause, bool async);
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f812998123..364140f5ff 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -42,6 +42,15 @@ const char * const riscv_int_regnames[] =3D {
>    "x28/t3",  "x29/t4", "x30/t5", "x31/t6"
>  };
>
> +const char * const riscv_int_regnamesh[] =3D {
> +  "x0h/zeroh", "x1h/rah",  "x2h/sph",   "x3h/gph",   "x4h/tph",  "x5h/t0=
h",
> +  "x6h/t1h",   "x7h/t2h",  "x8h/s0h",   "x9h/s1h",   "x10h/a0h", "x11h/a=
1h",
> +  "x12h/a2h",  "x13h/a3h", "x14h/a4h",  "x15h/a5h",  "x16h/a6h", "x17h/a=
7h",
> +  "x18h/s2h",  "x19h/s3h", "x20h/s4h",  "x21h/s5h",  "x22h/s6h", "x23h/s=
7h",
> +  "x24h/s8h",  "x25h/s9h", "x26h/s10h", "x27h/s11h", "x28h/t3h", "x29h/t=
4h",
> +  "x30h/t5h",  "x31h/t6h"
> +};
> +
>  const char * const riscv_fpr_regnames[] =3D {
>    "f0/ft0",   "f1/ft1",  "f2/ft2",   "f3/ft3",   "f4/ft4",  "f5/ft5",
>    "f6/ft6",   "f7/ft7",  "f8/fs0",   "f9/fs1",   "f10/fa0", "f11/fa1",
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 7b4c739564..7e2d02457e 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -92,6 +92,14 @@ static bool pointermasking_needed(void *opaque)
>      return riscv_has_ext(env, RVJ);
>  }
>
> +static bool rv128_needed(void *opaque)
> +{
> +    RISCVCPU *cpu =3D opaque;
> +    CPURISCVState *env =3D &cpu->env;
> +
> +    return env->misa_mxl_max =3D=3D MXL_RV128;
> +}

I think it would just be better to use riscv_cpu_mxl() directly
instead of adding a new function here.

Alistair

> +
>  static const VMStateDescription vmstate_vector =3D {
>      .name =3D "cpu/vector",
>      .version_id =3D 1,
> @@ -164,6 +172,17 @@ static const VMStateDescription vmstate_hyper =3D {
>      }
>  };
>
> +static const VMStateDescription vmstate_rv128 =3D {
> +    .name =3D "cpu/rv128",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .needed =3D rv128_needed,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINTTL_ARRAY(env.gprh, RISCVCPU, 32),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  const VMStateDescription vmstate_riscv_cpu =3D {
>      .name =3D "cpu",
>      .version_id =3D 3,
> @@ -218,6 +237,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
>          &vmstate_hyper,
>          &vmstate_vector,
>          &vmstate_pointermasking,
> +        &vmstate_rv128,
>          NULL
>      }
>  };
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index b4278a6a92..00a2cfa917 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -32,7 +32,7 @@
>  #include "instmap.h"
>
>  /* global register indices */
> -static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
> +static TCGv cpu_gpr[32], cpu_gprh[32], cpu_pc, cpu_vl;
>  static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
>  static TCGv load_res;
>  static TCGv load_val;
> @@ -777,10 +777,13 @@ void riscv_translate_init(void)
>       * unless you specifically block reads/writes to reg 0.
>       */
>      cpu_gpr[0] =3D NULL;
> +    cpu_gprh[0] =3D NULL;
>
>      for (i =3D 1; i < 32; i++) {
>          cpu_gpr[i] =3D tcg_global_mem_new(cpu_env,
>              offsetof(CPURISCVState, gpr[i]), riscv_int_regnames[i]);
> +        cpu_gprh[i] =3D tcg_global_mem_new(cpu_env,
> +            offsetof(CPURISCVState, gprh[i]), riscv_int_regnamesh[i]);
>      }
>
>      for (i =3D 0; i < 32; i++) {
> --
> 2.33.1
>
>

