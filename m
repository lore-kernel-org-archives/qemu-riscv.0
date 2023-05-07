Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvnmQ-0003tA-0E
	for mharc-qemu-riscv@gnu.org; Sun, 07 May 2023 19:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pvnmO-0003sx-Rt; Sun, 07 May 2023 19:27:00 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pvnmM-0000Rr-Lx; Sun, 07 May 2023 19:27:00 -0400
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-77d05b9c4a6so1012978241.0; 
 Sun, 07 May 2023 16:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683502016; x=1686094016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w4sBkL+BrNYknh8R4malxqeSujRLqBSODs1zP5jpmZ0=;
 b=rkWE1BwP48TYazcp5/n5Upv4GUrIQ4jcELE8eNrMa7f3TSKhhx7GX76ta2S3tDKCf3
 F7mSmx0/Mhy3rUI5mp2NCtwMUHh3aKfUJwH/PLp4CvRiVI0+R+w3IEeLSOKDP0ux/3Mv
 rT7V6nYLryrY02EMy92BzoZIj8IbhGV5a/9UlyhkRYxVriIMMvV4oszbcediINeMF93u
 dkuIO7vrasIKCmxXEUb3z2Ixr+SJyp4mqmCjvMBWNM+f2B9ZKvbQkywt9doz/QzHOS1L
 yR/HqwuikKSCt5CKfIeo423lleyoHfnGHiN0d4LwBXce49ch4s2CjB64H9LO4/4sQnDs
 U4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683502016; x=1686094016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w4sBkL+BrNYknh8R4malxqeSujRLqBSODs1zP5jpmZ0=;
 b=PI+T3x8Iz7wWYHac40km9E5Rj9XH85r0OHC/zblbd1voDWrBGDX81kxEvoogV547tJ
 5vkc9S+9+eWsGHl6l7uukMJNArykfgO1Pjb5SVpcNiKrtTXrZ6mag+eR+pXTzFK9XpBb
 CGxDatJhqy+PFePyc8fnOqd6Xrd4iIwoVxIIn7cmlvGojX4LRl4FS9pUDoKyBUCktxbO
 mxUOcLGAioTLRgXujRw5nueEkc1Hf1exNdx5kPCsXJ7agoqLMzLKPwlTjg0M9L0WwujV
 czYgvcwm+coRFS9gAiHuhl1aco4CTnsOUb52XMQvC38Gfw0Qu3iU95pPbjljzLnQhx2V
 SHzQ==
X-Gm-Message-State: AC+VfDyPL4e7qL3EYzQhFsQOZ7x4vprwPlORn6mI7zSgZHeK/EHmx1SF
 NbLkT+d6nztRIRQjTYka667eybzT0HVWBZVSdXE=
X-Google-Smtp-Source: ACHHUZ5Gx0wDiEjbAavImuoGJ8IoCvovfVC80zaWqLkbTnvRmyDOqwnn6Y3RCFn+2MKzl+cICN+cXaO1xU8a5hY9vns=
X-Received: by 2002:a67:fc1a:0:b0:430:76df:b03b with SMTP id
 o26-20020a67fc1a000000b0043076dfb03bmr2598426vsq.30.1683502016224; Sun, 07
 May 2023 16:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230427205708.246679-1-dbarboza@ventanamicro.com>
 <20230427205708.246679-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230427205708.246679-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 May 2023 09:26:30 +1000
Message-ID: <CAKmqyKOT7akucn8TC2pwVysnqzvdi3-akczDxrGuD4xs2sPL9w@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv/vector_helper.c: skip set tail when vta
 is zero
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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
X-List-Received-Date: Sun, 07 May 2023 23:27:01 -0000

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

Acked-by: Alistair Francis <alistair.francis@wdc.com>

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

