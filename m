Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppHJl-000582-8N
	for mharc-qemu-riscv@gnu.org; Wed, 19 Apr 2023 19:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ppHJj-00057n-HQ; Wed, 19 Apr 2023 19:34:27 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ppHJh-0007Lt-IH; Wed, 19 Apr 2023 19:34:27 -0400
Received: by mail-ua1-x92b.google.com with SMTP id r10so1035240uat.6;
 Wed, 19 Apr 2023 16:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681947264; x=1684539264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X1UjiDhztfDM4xau/b1dK+PxWshz2MwGL6jVl5YnA5w=;
 b=WDoOCbgT4EjLf4jACgo+lJvylkSgZ0tSVOzio5zEA8nG+uoYQLF2TmVGyEL4U9YEri
 qCHpK15fhWvbWHWeGjTSmT/lNR5OutezsxkXnw+QLc2UiMH8sMxM5oIXf64XirqjEsgF
 UsQGwdnREGAIgduIKANfDM4XZV+gQLphl+uWEppLAr6ZSKjWr7BzHktARkRebP4S3t/B
 qIQLiJ3nqhhg+ZAXeCkzh7lZfq8W/yF4LhyusP9bGRgrafkG0HX3eVstCGvUa7TfKAJa
 Q93JM8mFvCe2LERxAw6tyDWmpFq+ir+s80IkvhPLBlYyJSodtL7cWuZ+zHqD5/UvwRrs
 hPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681947264; x=1684539264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X1UjiDhztfDM4xau/b1dK+PxWshz2MwGL6jVl5YnA5w=;
 b=Z3xj/TOzFnelBdHVwT88vG7Rb2pUa75AMIEyxqvCx6PamiEuTIuxISX95q5It2GDNP
 p6EVCGwCGWbe6cHUssplCi92zsmnqH7ao8sTfFtSu8thkYQg2qsiyZbiRztfuwHgzB8T
 B8+2wwqIyb3GCG94kODegw2b8aKcQI25RwRcY/AuGtmAvH0YSPDyaNMVaBHuaQ/rc0Ij
 bTDNcLTFlnyYimOpEAvecOMIBi7xKgQr72rjBDgEwwlr7pybvpTOpBf8sHwjSYDlevEP
 XyOwmLOx/02mxGWlGo03VveexhfTgKFaQlMPN3VWQixl8pewaPB+8A0BT29Z74+uuNBo
 imAw==
X-Gm-Message-State: AAQBX9efc+uB/THo768X65UE79TOAv+qjTv9EZiknlhUgLopsaXoT2ZI
 RBUw31bPQLYc3AesloO6WozJSDTlL1bbmnNY46M=
X-Google-Smtp-Source: AKy350aYkWTCMJ65A19y7vk234YlJbg3p5QfV/ipkZcnUepIumYzaXjrQpYP4tc9jyjhopn9oASoPMjw4uvxHVHw8Ow=
X-Received: by 2002:a1f:d281:0:b0:43f:c24f:a55b with SMTP id
 j123-20020a1fd281000000b0043fc24fa55bmr595040vkg.16.1681947263851; Wed, 19
 Apr 2023 16:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230418075423.26217-1-irina.ryapolova@syntacore.com>
In-Reply-To: <20230418075423.26217-1-irina.ryapolova@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 20 Apr 2023 09:33:57 +1000
Message-ID: <CAKmqyKMm+J8NJg8SpCy6sjWpY4wTFUZbatR1-1PdGKKWk-y44g@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Fix Guest Physical Address Translation
To: Irina Ryapolova <irina.ryapolova@syntacore.com>
Cc: qemu-devel@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
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
X-List-Received-Date: Wed, 19 Apr 2023 23:34:27 -0000

On Tue, Apr 18, 2023 at 5:56=E2=80=AFPM Irina Ryapolova
<irina.ryapolova@syntacore.com> wrote:
>
> Before changing the flow check for sv39/48/57.
>
> According to specification (for Supervisor mode):
> Sv39 implementations support a 39-bit virtual address space, divided into=
 4 KiB
> pages.
> Instruction fetch addresses and load and store effective addresses, which=
 are
> 64 bits,
> must have bits 63=E2=80=9339 all equal to bit 38, or else a page-fault ex=
ception will
> occur.
> Likewise for Sv48 and Sv57.
>
> So the high bits are equal to bit 38 for sv39.
>
> According to specification (for Hypervisor mode):
> For Sv39x4, address bits of the guest physical address 63:41 must all be =
zeros,
> or else a
> guest-page-fault exception occurs.
>
> Likewise for Sv48x4 and Sv57x4.
> For Sv48x4 address bits 63:50 must all be zeros, or else a guest-page-fau=
lt
> exception occurs.
> For Sv57x4 address bits 63:59 must all be zeros, or else a guest-page-fau=
lt
> exception occurs.
>
> For example we are trying to access address 0xffff_ffff_ff01_0000 with on=
ly
> G-translation enabled.
> So expected behavior is to generate exception. But qemu doesn't generate =
such
> exception.
>
> For the old check, we get
> va_bits =3D=3D 41, mask =3D=3D (1 << 24) - 1, masked_msbs =3D=3D (0xffff_=
ffff_ff01_0000 >>
> 40) & mask =3D=3D mask.
> Accordingly, the condition masked_msbs !=3D 0 && masked_msbs !=3D mask is=
 not
> fulfilled
> and the check passes.
>
> Signed-off-by: Irina Ryapolova <irina.ryapolova@syntacore.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> Changes for v2:
>   -Add more detailed commit message
> Changes for v3:
>   -rebase the patch on
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next
> ---
>  target/riscv/cpu_helper.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 32a65f8007..b68dcfe7b6 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -837,17 +837,24 @@ static int get_physical_address(CPURISCVState *env,=
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
>
> -    if (masked_msbs !=3D 0 && masked_msbs !=3D mask) {
> -        return TRANSLATE_FAIL;
> +        if (TARGET_LONG_BITS > (va_bits - 1)) {
> +            mask =3D (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
> +        } else {
> +            mask =3D 0;
> +        }
> +        masked_msbs =3D (addr >> (va_bits - 1)) & mask;
> +
> +        if (masked_msbs !=3D 0 && masked_msbs !=3D mask) {
> +            return TRANSLATE_FAIL;
> +        }
> +    } else {
> +        if (vm !=3D VM_1_10_SV32 && addr >> va_bits !=3D 0) {
> +            return TRANSLATE_FAIL;
> +        }
>      }
>
>      bool pbmte =3D env->menvcfg & MENVCFG_PBMTE;
> --
> 2.25.1
>
>

