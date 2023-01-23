Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK6TS-00010T-Lr
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 18:43:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK6TR-0000zW-5e; Mon, 23 Jan 2023 18:43:37 -0500
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK6TO-0007MR-Gk; Mon, 23 Jan 2023 18:43:36 -0500
Received: by mail-vs1-xe33.google.com with SMTP id n190so14797077vsc.11;
 Mon, 23 Jan 2023 15:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tgDeRWqSkbVPNnX6zRsTaGkdCGHGke7pz1l4aUWanAE=;
 b=fnXg83fA4pCKEMRWUANp9Pw37CTg6JUzPVz43njRvgSbUYSCmKJNk2NLnTGwO9U1yi
 Jj8q+n/L6gPUWE3qh6hvOc1PcGQw+VW5lTAc6KqCTOvljEnvMtY9BYotOqc+HRqPSIZ0
 qBQQOjAgrazHvuQwHBUWS54joFWCnhAR86jHB4JrKSwaAAqd2Z/GDfda/IoTaHgFQful
 LYvlfbexYUwaShWZmJUs+jIB4hVpXhfg45X3dit+UGxTsasta7gnaq+QnSi+ok3flRYs
 AENDML1g3FvbwCLTeDlRuy0E3CFYLPmV9xKf8ZPU683xrld7ilNud6zIEcWTvg4wjZSB
 u4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tgDeRWqSkbVPNnX6zRsTaGkdCGHGke7pz1l4aUWanAE=;
 b=WAMnd0iq6ijdTPNejyn7ATAP3pG8IGKyDYtv18PATxEgnw75e5FWVNpTt3zluDfnkF
 5MiJ0Z9m/vaWSpht9TS9oPHTEbN4RQsbaSTaAOVcUIUUgVo+IJMPZ2+eeGFKa8H26xAC
 H3p5TOQa79ACXhvtyhvdHdniYbyi2xY0HQdGiwPMu8wnEF/lFp2laPdZrl+3Qdi1jyL0
 z8ucHPJRQw+YJttHa7woRuq+Ve+c5KpFBvHUHLIUkn0AIg/25G99UGdU3NkPFPPE8Ozq
 wgpByM+NfFCQUjg/wfRRlzcxd4Ed86deavzCgIjx3r0/YqMlgYVaRTJ4AADfUzi1XrXr
 dfiw==
X-Gm-Message-State: AFqh2krtTq3VirxVD0d1Bbgn/aIVQg4AwORNC6sPnsLeZ+sjeVnLZw2K
 oCXOBz7/97qm54WkjSB5l7P+U1TxMq4xkMIB7xY=
X-Google-Smtp-Source: AMrXdXtcbsnhBeK+u/TRQGhNh9HVNatRywzGdDdv8rjNt2Nk18+87mLhfcjDk2H2iLT00BX3cMZbUqKAf3aXKhj++gM=
X-Received: by 2002:a67:eb10:0:b0:3c9:8cc2:dd04 with SMTP id
 a16-20020a67eb10000000b003c98cc2dd04mr3760809vso.73.1674517412790; Mon, 23
 Jan 2023 15:43:32 -0800 (PST)
MIME-Version: 1.0
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
 <20221223180016.2068508-14-christoph.muellner@vrull.eu>
In-Reply-To: <20221223180016.2068508-14-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 09:43:06 +1000
Message-ID: <CAKmqyKP_xwesnzrnZz1vwZmPqGDb3Ov9sXx1j+tOMOAdC_SrMg@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] RISC-V: Add initial support for T-Head C906
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>, 
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>, 
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 23 Jan 2023 23:43:37 -0000

On Sat, Dec 24, 2022 at 4:07 AM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> This patch adds the T-Head C906 to the list of known CPUs.
> Selecting this CPUs will automatically enable the available
> ISA extensions of the CPUs (incl. vendor extensions).
>
> Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> Changes in v2:
> - Drop C910 as it does not differ from C906
> - Set priv version to 1.11 (new fmin/fmax behaviour)

This should be below the line

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> ---
>  target/riscv/cpu.c          | 31 +++++++++++++++++++++++++++++++
>  target/riscv/cpu.h          |  2 ++
>  target/riscv/cpu_vendorid.h |  6 ++++++
>  3 files changed, 39 insertions(+)
>  create mode 100644 target/riscv/cpu_vendorid.h
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a38127365e..d3d8587710 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -279,6 +279,36 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>      cpu->cfg.mmu =3D false;
>  }
>
> +static void rv64_thead_c906_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +
> +    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RV=
U);
> +    set_priv_version(env, PRIV_VERSION_1_11_0);
> +
> +    cpu->cfg.ext_g =3D true;
> +    cpu->cfg.ext_c =3D true;
> +    cpu->cfg.ext_u =3D true;
> +    cpu->cfg.ext_s =3D true;
> +    cpu->cfg.ext_icsr =3D true;
> +    cpu->cfg.ext_zfh =3D true;
> +    cpu->cfg.mmu =3D true;
> +    cpu->cfg.ext_xtheadba =3D true;
> +    cpu->cfg.ext_xtheadbb =3D true;
> +    cpu->cfg.ext_xtheadbs =3D true;
> +    cpu->cfg.ext_xtheadcmo =3D true;
> +    cpu->cfg.ext_xtheadcondmov =3D true;
> +    cpu->cfg.ext_xtheadfmemidx =3D true;
> +    cpu->cfg.ext_xtheadmac =3D true;
> +    cpu->cfg.ext_xtheadmemidx =3D true;
> +    cpu->cfg.ext_xtheadmempair =3D true;
> +    cpu->cfg.ext_xtheadsync =3D true;
> +    cpu->cfg.ext_xtheadxmae =3D true;
> +
> +    cpu->cfg.mvendorid =3D THEAD_VENDOR_ID;
> +}
> +
>  static void rv128_base_cpu_init(Object *obj)
>  {
>      if (qemu_tcg_mttcg_enabled()) {
> @@ -1311,6 +1341,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init=
),
>      DEFINE_CPU(TYPE_RISCV_CPU_BASE128,          rv128_base_cpu_init),
>  #endif
>  };
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 897962f107..28184bbe40 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -27,6 +27,7 @@
>  #include "qom/object.h"
>  #include "qemu/int128.h"
>  #include "cpu_bits.h"
> +#include "cpu_vendorid.h"
>
>  #define TCG_GUEST_DEFAULT_MO 0
>
> @@ -53,6 +54,7 @@
>  #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51"=
)
>  #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34"=
)
>  #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54"=
)
> +#define TYPE_RISCV_CPU_THEAD_C906       RISCV_CPU_TYPE_NAME("thead-c906"=
)
>  #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
>
>  #if defined(TARGET_RISCV32)
> diff --git a/target/riscv/cpu_vendorid.h b/target/riscv/cpu_vendorid.h
> new file mode 100644
> index 0000000000..a5aa249bc9
> --- /dev/null
> +++ b/target/riscv/cpu_vendorid.h
> @@ -0,0 +1,6 @@
> +#ifndef TARGET_RISCV_CPU_VENDORID_H
> +#define TARGET_RISCV_CPU_VENDORID_H
> +
> +#define THEAD_VENDOR_ID         0x5b7
> +
> +#endif /*  TARGET_RISCV_CPU_VENDORID_H */
> --
> 2.38.1
>
>

