Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvnq5-0004qX-Su
	for mharc-qemu-riscv@gnu.org; Sun, 07 May 2023 19:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pvnq3-0004pw-VV; Sun, 07 May 2023 19:30:48 -0400
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pvnq2-00011q-C6; Sun, 07 May 2023 19:30:47 -0400
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-44fc1a7d5d0so1383880e0c.2; 
 Sun, 07 May 2023 16:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683502245; x=1686094245;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9dZ+ShCHslo6aQuTL22+v6fkmYBce3NvehRTSvO/+hU=;
 b=WE7neqQI7hx7EckGMd96v4SMgueec4MlPxiYKZ7gUOGVZ0J4zxHuWdud4LpPw7Td6a
 yl6QnCodK/Xawpz87Ay6mdF3fym8S9AaOJg6+y3ZCwsdvdPSl1JTnTSJlBI4BKNT8394
 nEXtX5ubRe505X0taJz0fKSNQ9AaYlTBEytVQtb4cH2akRmsatarRy1JM8zuAeir8h9Q
 SlhVZsEeYXhBWrmhPcW8CTJIIiQNSnBx8oEtLxVw056HHSMkYQg9SSE7KOqM1f45LIqn
 gn9yI0/6mY77qI2zXCHmVdGgQrDqglWQZuOLF0LopmGb2GyRcoSe3i8zTIIQsjPo3f0n
 z9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683502245; x=1686094245;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9dZ+ShCHslo6aQuTL22+v6fkmYBce3NvehRTSvO/+hU=;
 b=QMMDZgtExImuvFFjBTb+j0HW3CUke8zBY7F6GADwbC3juR1zC2gcSBdSnxxGffh2zm
 L2uSlCnjNzNuz3/OX7NFEvpXYLktKKzYaaiQU1Kat+WE1Anq4wwqBusvoFolqwpL2Q1i
 C0hQ47Yvtyyyh9PvKIJR8GMYdnpULq4VQwnh9nOUc/YwWo/aiODergZNfd2LQfyjcjp3
 /hsjtvzzQuQ8HjN9KIz6bo/EjnHE1UIew9I6NquVIO4awOLnTZ7bwTVal1KV1YAM/NQf
 pDfVxtfxW+NUAgq1vNTkHk3d+N9BAQ4BfOYb2Z3W8Zp+9Cj6UzJ4pUIhltVsEGDUu84l
 reyw==
X-Gm-Message-State: AC+VfDymBAJG8udL1NC371vG0Tbq/vRiEIRreVeH6C2ngrN6hGa0m0oO
 dUUyJfq4iQW98jP+EqN4e856/hHmFuGXz4CgW+Q=
X-Google-Smtp-Source: ACHHUZ6XcXVjw5W6oCuSRY4xolK6LI2Foo7333zDVRpd86VVZRyjrDLOKmgmpv+GrqETcQtdMZHgOLY4acB3Dhg3lvA=
X-Received: by 2002:a05:6102:3a66:b0:42f:fef1:a2bb with SMTP id
 bf6-20020a0561023a6600b0042ffef1a2bbmr2367077vsb.24.1683502244918; Sun, 07
 May 2023 16:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230427205708.246679-1-dbarboza@ventanamicro.com>
 <20230427205708.246679-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230427205708.246679-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 May 2023 09:30:19 +1000
Message-ID: <CAKmqyKNH2M9vwOohNeurmdxvhuuz_5uDvvC13B=absDTiYQQUA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv/vector_helper.c: skip set tail when vta
 is zero
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa30.google.com
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
X-List-Received-Date: Sun, 07 May 2023 23:30:48 -0000

On Fri, Apr 28, 2023 at 6:58=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The function is a no-op if 'vta' is zero but we're still doing a lot of
> stuff in this function regardless. vext_set_elems_1s() will ignore every
> single time (since vta is zero) and we just wasted time.
>
> Skip it altogether in this case. Aside from the code simplification
> there's a noticeable emulation performance gain by doing it. For a
> regular C binary that does a vectors operation like this:
>
> =3D=3D=3D=3D=3D=3D=3D
>  #define SZ 10000000
>
> int main ()
> {
>   int *a =3D malloc (SZ * sizeof (int));
>   int *b =3D malloc (SZ * sizeof (int));
>   int *c =3D malloc (SZ * sizeof (int));
>
>   for (int i =3D 0; i < SZ; i++)
>     c[i] =3D a[i] + b[i];
>   return c[SZ - 1];
> }
> =3D=3D=3D=3D=3D=3D=3D
>
> Emulating it with qemu-riscv64 and RVV takes ~0.3 sec:
>
> $ time ~/work/qemu/build/qemu-riscv64 \
>     -cpu rv64,debug=3Dfalse,vext_spec=3Dv1.0,v=3Dtrue,vlen=3D128 ./foo.ou=
t
>
> real    0m0.303s
> user    0m0.281s
> sys     0m0.023s
>
> With this skip we take ~0.275 sec:
>
> $ time ~/work/qemu/build/qemu-riscv64 \
>     -cpu rv64,debug=3Dfalse,vext_spec=3Dv1.0,v=3Dtrue,vlen=3D128 ./foo.ou=
t
>
> real    0m0.274s
> user    0m0.252s
> sys     0m0.019s
>
> This performance gain adds up fast when executing heavy benchmarks like
> SPEC.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/vector_helper.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index f4d0438988..8e6c99e573 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -268,12 +268,17 @@ static void vext_set_tail_elems_1s(CPURISCVState *e=
nv, target_ulong vl,
>                                     void *vd, uint32_t desc, uint32_t nf,
>                                     uint32_t esz, uint32_t max_elems)
>  {
> -    uint32_t total_elems =3D vext_get_total_elems(env, desc, esz);
> -    uint32_t vlenb =3D riscv_cpu_cfg(env)->vlen >> 3;
> +    uint32_t total_elems, vlenb, registers_used;
>      uint32_t vta =3D vext_vta(desc);
> -    uint32_t registers_used;
>      int k;
>
> +    if (vta =3D=3D 0) {
> +        return;
> +    }
> +
> +    total_elems =3D vext_get_total_elems(env, desc, esz);
> +    vlenb =3D riscv_cpu_cfg(env)->vlen >> 3;
> +
>      for (k =3D 0; k < nf; ++k) {
>          vext_set_elems_1s(vd, vta, (k * max_elems + vl) * esz,
>                            (k * max_elems + max_elems) * esz);
> --
> 2.40.0
>
>

