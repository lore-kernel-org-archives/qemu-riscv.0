Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kz2j3-0004aJ-M8
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 14:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kyzS1-00008C-Gu
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 10:49:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kyzRx-00083c-T0
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 10:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610380184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q6BqBBz/LmyyAaTw3+NjQTsglvnsrykSxnC/U1btFcA=;
 b=JnH1Rz9D1MclnnzsafYZxrOeydZSZZk0AN6KjGgBxUg8r35KAMCaLUCVR36crJhnbuQRb2
 nYsC+yChagMfPfFOeq3tZq4fyO0nuc//MHP0HFZJvypZyjlcJgk8JCO1QHhvbxkqMtx4yD
 VPqt2+a2dhKrcT3p37Hi4dfc0RDN+EU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-Gp_AoUSgMXucHrpaH7Rzsw-1; Mon, 11 Jan 2021 10:49:41 -0500
X-MC-Unique: Gp_AoUSgMXucHrpaH7Rzsw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A75A803628;
 Mon, 11 Jan 2021 15:49:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1175017C5F;
 Mon, 11 Jan 2021 15:49:39 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E86F18095C7;
 Mon, 11 Jan 2021 15:49:38 +0000 (UTC)
Date: Mon, 11 Jan 2021 10:49:37 -0500 (EST)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Huacai Chen <chenhuacai@kernel.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>, 
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-s390x@nongnu.org, 
 Cornelia Huck <cohuck@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Andrzej Zaborowski <balrogg@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Message-ID: <245930420.32442484.1610380177977.JavaMail.zimbra@redhat.com>
In-Reply-To: <20210111150114.1415930-5-f4bug@amsat.org>
References: <20210111150114.1415930-1-f4bug@amsat.org>
 <20210111150114.1415930-5-f4bug@amsat.org>
Subject: Re: [RFC PATCH 4/5] tcg: Restrict tcg_out_op() to arrays of
 TCG_MAX_OP_ARGS elements
MIME-Version: 1.0
X-Originating-IP: [10.40.192.93, 10.4.195.1]
Thread-Topic: Restrict tcg_out_op() to arrays of TCG_MAX_OP_ARGS elements
Thread-Index: NYNXgELFV+TcZBY9QJ2v3tKDyrLcCQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 11 Jan 2021 14:19:32 -0500
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
X-List-Received-Date: Mon, 11 Jan 2021 15:49:49 -0000

----- Original Message -----
> From: "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>
> To: qemu-devel@nongnu.org
> Cc: "Huacai Chen" <chenhuacai@kernel.org>, "Aurelien Jarno" <aurelien@aur=
el32.net>, "Aleksandar Rikalo"
> <aleksandar.rikalo@syrmia.com>, "Thomas Huth" <thuth@redhat.com>, "Stefan=
 Weil" <sw@weilnetz.de>,
> qemu-riscv@nongnu.org, qemu-arm@nongnu.org, "Jiaxun Yang" <jiaxun.yang@fl=
ygoat.com>, qemu-s390x@nongnu.org,
> "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>, "Cornelia Huck" <cohuck@=
redhat.com>, "Richard Henderson"
> <richard.henderson@linaro.org>, "Andrzej Zaborowski" <balrogg@gmail.com>,=
 "Alistair Francis"
> <Alistair.Francis@wdc.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Miros=
lav Rezanina" <mrezanin@redhat.com>
> Sent: Monday, January 11, 2021 4:01:13 PM
> Subject: [RFC PATCH 4/5] tcg: Restrict tcg_out_op() to arrays of TCG_MAX_=
OP_ARGS elements
>=20
> tcg_reg_alloc_op() allocates arrays of TCG_MAX_OP_ARGS elements.
>=20
> The Aarch64 target already does this since commit 8d8db193f25
> ("tcg-aarch64: Hoist common argument loads in tcg_out_op"),
> SPARC since commit b357f902bff ("tcg-sparc: Hoist common argument
> loads in tcg_out_op").
>=20
> RISCV missed it upon introduction in commit bdf503819ee
> ("tcg/riscv: Add the out op decoder"), MIPS since commit
> 22ee3a987d5 ("tcg-mips: Hoist args loads") and i386 since
> commit 42d5b514928 ("tcg/i386: Hoist common arguments in
> tcg_out_op").
>=20
> Provide this information as a hint to the compiler in the function
> prototype, and update the funtion definitions.
>=20
> This fixes this warning (using GCC 11):
>=20
>     tcg/aarch64/tcg-target.c.inc:1855:37: error: argument 3 of type 'cons=
t
>     TCGArg[16]' {aka 'const long unsigned int[16]'} with mismatched bound
>     [-Werror=3Darray-parameter=3D]
>     tcg/aarch64/tcg-target.c.inc:1856:34: error: argument 4 of type 'cons=
t
>     int[16]' with mismatched bound [-Werror=3Darray-parameter=3D]
>=20
> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> RFC because such compiler hint is somehow "new" to me.
>=20
> Also I expect this to be superseeded by Richard 'tcg constant'
> branch mentioned here:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg771401.html
> ---
>  tcg/tcg.c                  | 5 +++--
>  tcg/i386/tcg-target.c.inc  | 3 ++-
>  tcg/mips/tcg-target.c.inc  | 3 ++-
>  tcg/riscv/tcg-target.c.inc | 3 ++-
>  tcg/tci/tcg-target.c.inc   | 5 +++--
>  5 files changed, 12 insertions(+), 7 deletions(-)
>=20
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 472bf1755bf..97d074d8fab 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -110,8 +110,9 @@ static void tcg_out_ld(TCGContext *s, TCGType type,
> TCGReg ret, TCGReg arg1,
>  static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg
>  arg);
>  static void tcg_out_movi(TCGContext *s, TCGType type,
>                           TCGReg ret, tcg_target_long arg);
> -static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
> -                       const int *const_args);
> +static void tcg_out_op(TCGContext *s, TCGOpcode opc,
> +                       const TCGArg args[TCG_MAX_OP_ARGS],
> +                       const int const_args[TCG_MAX_OP_ARGS]);
>  #if TCG_TARGET_MAYBE_vec
>  static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
>                              TCGReg dst, TCGReg src);
> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index 46e856f4421..d121dca8789 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -2215,7 +2215,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TC=
GArg
> *args, bool is64)
>  }
> =20
>  static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
> -                              const TCGArg *args, const int *const_args)
> +                              const TCGArg args[TCG_MAX_OP_ARGS],
> +                              const int const_args[TCG_MAX_OP_ARGS])
>  {
>      TCGArg a0, a1, a2;
>      int c, const_a2, vexop, rexw =3D 0;
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index add157f6c32..b9bb54f0ecc 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -1691,7 +1691,8 @@ static void tcg_out_clz(TCGContext *s, MIPSInsn opc=
v2,
> MIPSInsn opcv6,
>  }
> =20
>  static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
> -                              const TCGArg *args, const int *const_args)
> +                              const TCGArg args[TCG_MAX_OP_ARGS],
> +                              const int const_args[TCG_MAX_OP_ARGS])
>  {
>      MIPSInsn i1, i2;
>      TCGArg a0, a1, a2;
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index c60b91ba58f..5bf0d069532 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -1238,7 +1238,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TC=
GArg
> *args, bool is_64)
>  static const tcg_insn_unit *tb_ret_addr;
> =20
>  static void tcg_out_op(TCGContext *s, TCGOpcode opc,
> -                       const TCGArg *args, const int *const_args)
> +                       const TCGArg args[TCG_MAX_OP_ARGS],
> +                       const int const_args[TCG_MAX_OP_ARGS])
>  {
>      TCGArg a0 =3D args[0];
>      TCGArg a1 =3D args[1];
> diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
> index d5a4d9d37cf..60464524f3d 100644
> --- a/tcg/tci/tcg-target.c.inc
> +++ b/tcg/tci/tcg-target.c.inc
> @@ -553,8 +553,9 @@ static inline void tcg_out_call(TCGContext *s, const
> tcg_insn_unit *arg)
>      old_code_ptr[1] =3D s->code_ptr - old_code_ptr;
>  }
> =20
> -static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
> -                       const int *const_args)
> +static void tcg_out_op(TCGContext *s, TCGOpcode opc,
> +                       const TCGArg args[TCG_MAX_OP_ARGS],
> +                       const int const_args[TCG_MAX_OP_ARGS])
>  {
>      uint8_t *old_code_ptr =3D s->code_ptr;
> =20
> --
> 2.26.2
>=20
>

Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>=20

--=20
Miroslav Rezanina
Software Engineer - Virtualization Team Maintainer


