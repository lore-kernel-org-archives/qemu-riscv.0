Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iiK8D-0001jz-UD
	for mharc-qemu-riscv@gnu.org; Fri, 20 Dec 2019 10:23:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35032)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1iiK8B-0001iO-2l
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2019 10:23:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1iiK89-0003Wy-Op
 for qemu-riscv@nongnu.org; Fri, 20 Dec 2019 10:23:55 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:53978)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1iiK80-0003IO-BI; Fri, 20 Dec 2019 10:23:44 -0500
Received: from [172.16.11.102] (crumble.bar.greensocs.com [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPSA id CC19996EF0;
 Fri, 20 Dec 2019 15:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1576855422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v4F/97wPp1VqI7JzGMEVYBc5gcEooO+7EhMvJDjBxpY=;
 b=tp4vK3hTSz0UOzuyT7+m4m82B2dOFRNTKMGgkeYXk09X/ya9S05UxUgK3IqNR2oQLoiMzV
 vHSHs8FLjNzBS1uWOiRfjkh/0hA1aeThIfNcyeYHsPn86CPf6Xj4GekkxR7rDzKLARB59K
 8teXt1e3ohoha2EFqHmCqT2uqym05do=
Subject: Re: [PATCH v4 08/21] gdbstub: extend GByteArray to read register
 helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
References: <20191220120438.16114-1-alex.bennee@linaro.org>
 <20191220120438.16114-9-alex.bennee@linaro.org>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <2ea7692c-02a8-8267-de6d-529731958a8f@greensocs.com>
Date: Fri, 20 Dec 2019 16:23:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191220120438.16114-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1576855422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v4F/97wPp1VqI7JzGMEVYBc5gcEooO+7EhMvJDjBxpY=;
 b=LQ37Df4kzJ1p6Aek/NpUqOfH2I0cAHJblZ9fj1U7jfagEBqACto/8A6jALVy4cJCtW+xAA
 nFoR4IatTn6hP+LYwj7dV/tlRqh6GQq46oKRs48maP5+NBDNhu/POs//n0l1QLw0c/L7VQ
 VtmNckOBac9HoGXiS7gNGSrS4DFU9Q0=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1576855422; a=rsa-sha256; cv=none;
 b=aBgcSmy4GQ7c0C6bwBXvdFx9JiRCTgJCYKDOm2HnQ29tjrMWKVsxrs1i0ytlkiIz1nZ7iL
 2vu2VDds16sh+0fbNVbh17laRC4XLQoBuzVMcrF292WDpHa+PrM/28pQkAUQOpQxhnOAub
 eDRu/NcCJFkOaE0YfZ2K02nMuweXO0g=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
X-List-Received-Date: Fri, 20 Dec 2019 15:23:56 -0000



On 12/20/19 1:04 PM, Alex Benn=C3=A9e wrote:
> Instead of passing a pointer to memory now just extend the GByteArray
> to all the read register helpers. They can then safely append their
> data through the normal way. We don't bother with this abstraction for
> write registers as we have already ensured the buffer being copied
> from is the correct size.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>=20
> ---
> v4
>   - fix mem_buf calculation for ppc_maybe_bswap_register
> ---

Hi Alex,

You missed the ppc_maybe_bswap_register() calls in ppc/translate_init.inc=
.c

> diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_ini=
t.inc.c
> index d33d65dff70..ca241d7f5e6 100644
> --- a/target/ppc/translate_init.inc.c
> +++ b/target/ppc/translate_init.inc.c
> @@ -9845,7 +9845,7 @@ static int gdb_find_spr_idx(CPUPPCState *env, int=
 n)
>      return -1;
>  }
> =20
> -static int gdb_get_spr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +static int gdb_get_spr_reg(CPUPPCState *env, GByteArray *buf, int n)
>  {
>      int reg;
>      int len;
> @@ -9856,8 +9856,8 @@ static int gdb_get_spr_reg(CPUPPCState *env, uint=
8_t *mem_buf, int n)
>      }
> =20
>      len =3D TARGET_LONG_SIZE;
> -    stn_p(mem_buf, len, env->spr[reg]);
> -    ppc_maybe_bswap_register(env, mem_buf, len);
> +    gdb_get_regl(buf, env->spr[reg]);
> +    ppc_maybe_bswap_register(env, buf->data - len, len);

ppc_maybe_bswap_register(env, buf->data + buf->len - len, len);

>      return len;
>  }
> =20
> @@ -9879,15 +9879,18 @@ static int gdb_set_spr_reg(CPUPPCState *env, ui=
nt8_t *mem_buf, int n)
>  }
>  #endif
> =20
> -static int gdb_get_float_reg(CPUPPCState *env, uint8_t *mem_buf, int n=
)
> +static int gdb_get_float_reg(CPUPPCState *env, GByteArray *buf, int n)
>  {
> +    uint8_t *mem_buf;
>      if (n < 32) {
> -        stfq_p(mem_buf, *cpu_fpr_ptr(env, n));
> +        gdb_get_reg64(buf, *cpu_fpr_ptr(env, n));
> +        mem_buf =3D buf->data - 8;

mem_buf =3D buf->data + buf->len - 8;

>          ppc_maybe_bswap_register(env, mem_buf, 8);
>          return 8;
>      }
>      if (n =3D=3D 32) {
> -        stl_p(mem_buf, env->fpscr);
> +        gdb_get_reg32(buf, env->fpscr);
> +        mem_buf =3D buf->data - 4;

mem_buf =3D buf->data + buf->len - 4;

>          ppc_maybe_bswap_register(env, mem_buf, 4);>          return 4;
>      }
> @@ -9909,28 +9912,31 @@ static int gdb_set_float_reg(CPUPPCState *env, =
uint8_t *mem_buf, int n)
>      return 0;
>  }
> =20
> -static int gdb_get_avr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +static int gdb_get_avr_reg(CPUPPCState *env, GByteArray *buf, int n)
>  {
> +    uint8_t *mem_buf;
> +
>      if (n < 32) {
>          ppc_avr_t *avr =3D cpu_avr_ptr(env, n);
>          if (!avr_need_swap(env)) {
> -            stq_p(mem_buf, avr->u64[0]);
> -            stq_p(mem_buf + 8, avr->u64[1]);
> +            gdb_get_reg128(buf, avr->u64[0] , avr->u64[1]);
>          } else {
> -            stq_p(mem_buf, avr->u64[1]);
> -            stq_p(mem_buf + 8, avr->u64[0]);
> +            gdb_get_reg128(buf, avr->u64[1] , avr->u64[0]);
>          }
> +        mem_buf =3D buf->data - 16;

mem_buf =3D buf->data + buf->len - 16;

>          ppc_maybe_bswap_register(env, mem_buf, 8);
>          ppc_maybe_bswap_register(env, mem_buf + 8, 8);
>          return 16;
>      }
>      if (n =3D=3D 32) {
> -        stl_p(mem_buf, helper_mfvscr(env));
> +        gdb_get_reg32(buf, helper_mfvscr(env));
> +        mem_buf =3D buf->data - 4;

mem_buf =3D buf->data + buf->len - 4;

>          ppc_maybe_bswap_register(env, mem_buf, 4);
>          return 4;
>      }
>      if (n =3D=3D 33) {
> -        stl_p(mem_buf, (uint32_t)env->spr[SPR_VRSAVE]);
> +        gdb_get_reg32(buf, (uint32_t)env->spr[SPR_VRSAVE]);
> +        mem_buf =3D buf->data - 4;

mem_buf =3D buf->data + buf->len - 4;

>          ppc_maybe_bswap_register(env, mem_buf, 4);
>          return 4;
>      }
> @@ -9965,25 +9971,25 @@ static int gdb_set_avr_reg(CPUPPCState *env, ui=
nt8_t *mem_buf, int n)
>      return 0;
>  }
> =20
> -static int gdb_get_spe_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +static int gdb_get_spe_reg(CPUPPCState *env, GByteArray *buf, int n)
>  {
>      if (n < 32) {
>  #if defined(TARGET_PPC64)
> -        stl_p(mem_buf, env->gpr[n] >> 32);
> -        ppc_maybe_bswap_register(env, mem_buf, 4);
> +        gdb_get_reg32(buf, env->gpr[n] >> 32);
> +        ppc_maybe_bswap_register(env, buf->data - 4, 4);

ppc_maybe_bswap_register(env, buf->data + buf->len - 4, 4);

>  #else
> -        stl_p(mem_buf, env->gprh[n]);
> +        gdb_get_reg32(buf, env->gprh[n]);
>  #endif
>          return 4;
>      }
>      if (n =3D=3D 32) {
> -        stq_p(mem_buf, env->spe_acc);
> -        ppc_maybe_bswap_register(env, mem_buf, 8);
> +        gdb_get_reg64(buf, env->spe_acc);
> +        ppc_maybe_bswap_register(env, buf->data - 8, 8);

ppc_maybe_bswap_register(env, buf->data + buf->len - 8, 8);

>          return 8;
>      }
>      if (n =3D=3D 33) {
> -        stl_p(mem_buf, env->spe_fscr);
> -        ppc_maybe_bswap_register(env, mem_buf, 4);
> +        gdb_get_reg32(buf, env->spe_fscr);
> +        ppc_maybe_bswap_register(env, buf->data - 4, 4);

ppc_maybe_bswap_register(env, buf->data + buf->len - 4, 4);

>          return 4;
>      }
>      return 0;
> @@ -10018,11 +10024,11 @@ static int gdb_set_spe_reg(CPUPPCState *env, =
uint8_t *mem_buf, int n)
>      return 0;
>  }
> =20
> -static int gdb_get_vsx_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +static int gdb_get_vsx_reg(CPUPPCState *env, GByteArray *buf, int n)
>  {
>      if (n < 32) {
> -        stq_p(mem_buf, *cpu_vsrl_ptr(env, n));
> -        ppc_maybe_bswap_register(env, mem_buf, 8);
> +        gdb_get_reg64(buf, *cpu_vsrl_ptr(env, n));
> +        ppc_maybe_bswap_register(env, buf->data - 8, 8);

ppc_maybe_bswap_register(env, buf->data + buf->len - 8, 8);

>          return 8;
>      }
>      return 0;

With these fixes,
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

Damien

