Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poFsk-0005H9-8M
	for mharc-qemu-riscv@gnu.org; Sun, 16 Apr 2023 23:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poFsh-0005Gn-3b; Sun, 16 Apr 2023 23:50:19 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poFsf-0007Vt-GP; Sun, 16 Apr 2023 23:50:18 -0400
Received: by mail-vs1-xe34.google.com with SMTP id g187so6721042vsc.10;
 Sun, 16 Apr 2023 20:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681703416; x=1684295416;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fqiB1oBCwfQGhPpw7u5Cz2W3WDW5FRgMB4i+SRN761k=;
 b=XwXofIzFV+fEdow9igXGvAe5haWYWVSY/MUsVoHsevCHwNOyf/yNs8L/nW5lbIOk8r
 CHiJ0vSMWqm70IpNASs1nElPDwp1wXtpYZY/+WbBg1UDVQfUpjjWHM2wRgdFuGniNKtJ
 Thzin1H+x8Qz8YToVeRKM3m4F8ESyY0uWYMiAfjPzKo7TRAT1I+4exkaZgO2qZQ6H5oE
 +PwBVygCVnGUTr+d0oafeSyx6NM3QSnu1wHfdVgE1gHfAiI7RxhYttTTvmF/JmeVzMmQ
 FEmuHBFn05ra2edGeicewL3jDFpHJPzpMSbQeIpd67mKuxZuIyq4CohJnLoKTexh7h1o
 nJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681703416; x=1684295416;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fqiB1oBCwfQGhPpw7u5Cz2W3WDW5FRgMB4i+SRN761k=;
 b=CXTbIIbuSrpJz0Qb9YWReDMgA5dbF6ZYsXXCuheGJmO1EPm3xWsVc9BhIKLuZ+KKPg
 36eVgIUdtMvMpdzcxbpKkewKyqCCT25W2Tw6fm7ajQAbU46dvaPYmvWqHTy60tdcDIex
 hDPwYPC1kCXw1szYUmWQWJSF5SWmrUqAZfGViHgRf2UXWqHbSFNWF0mZX9gF3BY87nsR
 ZYIO1La/chUTy+peBD69kgtdRrxKJ0oTQQV+oikqQ9JNKhCfa49p/+OewywbGasB4FTN
 sUPLOGwIwwZoTEIGerAoQYzFXBAUKWTHa8NnutPtMy+soV4jbVxCrEIK2VL/PzPczTgW
 0jIg==
X-Gm-Message-State: AAQBX9flHNqdA6XEmY5neb35wKLbx9kTLR3ZstJzdbKhc4xJyslfIoyI
 4epsuVIFhfDKtJvjys05l85YsXilSyH8jGyGK7I=
X-Google-Smtp-Source: AKy350ZHUbitBjf6sZkE8BiJKFYuLhNzBga7faTv50eqkxjmoAy8d+2EPYUODoE0PNOTdAgMyQdFggMyr8LtNr32d60=
X-Received: by 2002:a67:c217:0:b0:42e:47e8:ec18 with SMTP id
 i23-20020a67c217000000b0042e47e8ec18mr5333296vsj.3.1681703416043; Sun, 16 Apr
 2023 20:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230407153225.156395-1-irina.ryapolova@syntacore.com>
In-Reply-To: <20230407153225.156395-1-irina.ryapolova@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Apr 2023 13:49:49 +1000
Message-ID: <CAKmqyKMcJYi92LwPFUonKrZcN4rxhqkhWkR+yjhju6sDUSRZAw@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Fix Guest Physical Address Translation
To: Irina Ryapolova <irina.ryapolova@syntacore.com>
Cc: qemu-devel@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
X-List-Received-Date: Mon, 17 Apr 2023 03:50:19 -0000

On Sat, Apr 8, 2023 at 1:34=E2=80=AFAM Irina Ryapolova
<irina.ryapolova@syntacore.com> wrote:
>
> Before changing the flow check for sv39/48/57.
>
> According to specification (for Supervisor mode):
> Sv39 implementations support a 39-bit virtual address space, divided into=
 4 KiB pages.
> Instruction fetch addresses and load and store effective addresses, which=
 are 64 bits,
> must have bits 63=E2=80=9339 all equal to bit 38, or else a page-fault ex=
ception will occur.
> Likewise for Sv48 and Sv57.
>
> So the high bits are equal to bit 38 for sv39.
>
> According to specification (for Hypervisor mode):
> For Sv39x4, address bits of the guest physical address 63:41 must all be =
zeros, or else a
> guest-page-fault exception occurs.
>
> Likewise for Sv48x4 and Sv57x4.
> For Sv48x4 address bits 63:50 must all be zeros, or else a guest-page-fau=
lt exception occurs.
> For Sv57x4 address bits 63:59 must all be zeros, or else a guest-page-fau=
lt exception occurs.
>
> For example we are trying to access address 0xffff_ffff_ff01_0000 with on=
ly G-translation enabled.
> So expected behavior is to generate exception. But qemu doesn't generate =
such exception.
>
> For the old check, we get
> va_bits =3D=3D 41, mask =3D=3D (1 << 24) - 1, masked_msbs =3D=3D (0xffff_=
ffff_ff01_0000 >> 40) & mask =3D=3D mask.
> Accordingly, the condition masked_msbs !=3D 0 && masked_msbs !=3D mask is=
 not fulfilled
> and the check passes.
>
> Signed-off-by: Irina Ryapolova <irina.ryapolova@syntacore.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes for v2:
>   -Add more detailed commit message
> ---
>  target/riscv/cpu_helper.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..27289f2305 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -863,17 +863,24 @@ static int get_physical_address(CPURISCVState *env,=
 hwaddr *physical,
>
>      CPUState *cs =3D env_cpu(env);
>      int va_bits =3D PGSHIFT + levels * ptidxbits + widened;
> -    target_ulong mask, masked_msbs;
>
> -    if (TARGET_LONG_BITS > (va_bits - 1)) {
> -        mask =3D (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
> -    } else {
> -        mask =3D 0;
> -    }
> -    masked_msbs =3D (addr >> (va_bits - 1)) & mask;
> +    if (first_stage =3D=3D true) {
> +        target_ulong mask, masked_msbs;
> +
> +        if (TARGET_LONG_BITS > (va_bits - 1)) {
> +            mask =3D (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
> +        } else {
> +            mask =3D 0;
> +        }
> +        masked_msbs =3D (addr >> (va_bits - 1)) & mask;
>
> -    if (masked_msbs !=3D 0 && masked_msbs !=3D mask) {
> -        return TRANSLATE_FAIL;
> +        if (masked_msbs !=3D 0 && masked_msbs !=3D mask) {
> +            return TRANSLATE_FAIL;
> +        }
> +    } else {
> +        if (vm !=3D VM_1_10_SV32 && addr >> va_bits !=3D 0) {
> +            return TRANSLATE_FAIL;
> +        }
>      }
>
>      int ptshift =3D (levels - 1) * ptidxbits;
> --
> 2.25.1
>
>

