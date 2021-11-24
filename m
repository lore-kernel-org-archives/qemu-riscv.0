Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mplfE-0002ul-Ov
	for mharc-qemu-riscv@gnu.org; Wed, 24 Nov 2021 01:21:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mplfD-0002uZ-NP; Wed, 24 Nov 2021 01:21:51 -0500
Received: from [2607:f8b0:4864:20::12e] (port=45812
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mplfB-0001ms-Cl; Wed, 24 Nov 2021 01:21:51 -0500
Received: by mail-il1-x12e.google.com with SMTP id w4so1406591ilv.12;
 Tue, 23 Nov 2021 22:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aE/EsLMsrhA0ojqKnM0GeJTT4jwtRqW742fRpFZ0d7E=;
 b=gZVefNSr/YbeeEIEcN2yDiU9ybkmVezeg6svl/519D1/TYF8A8NVZw1qWT1Zqi/VnO
 +OPFlfblIug3Mx4MIBwCVCLomFXzSrXKzAyPtR9nI5aL7uLBCt6LVTpNZxkyMWt6KsWB
 mrYzBUz15n+TR+BLB0Tu3Zq5LFy/0hWfo8980DAVY3vA9rBoaA9zB93BSvskcIhHwS+Y
 iXGmI3getnoGO3gw6sTuVY/mTR5HBZU8onWgYhkEriaXZhxpCX3GRz7fVB4SYHIUzv5J
 mGTET4HK3HS/a3WwR2+ullAysUAa/NlnloO6JX4NJE1D9XEuffWstj7kJnrBWkmDErAI
 840g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aE/EsLMsrhA0ojqKnM0GeJTT4jwtRqW742fRpFZ0d7E=;
 b=vmgXJetOIJJ9hJDX0A5hEkPVcx8wECGV+Sr7IKdnNUUUuuvVXR8k+HSU22pJ1jDS9l
 sdj5rg+EuV7++vDQpgUf7PzxnigUXVrRx/FgGjGt8V3hwu0ClTJQZX6qL/TipNIWlyV4
 I6hg0g/LlJP17kBbbPE3jrF4gh1UQxoEA5M/vFh0hjEK1MdTS/fNEGnQtanX+JxRrT88
 WhwT+wwyXrGJrAShlJAKYkS1Bbsf/8rZ6Ku1Jul7mhCvd4F62UOxumLZrOOso9xKzUSu
 TA2bp9qJqkmoZXCokiR+I2kbs0qyh5gw3J1ypUz36j7G4mb3OkLLT2kr/IsV6XmnfmlD
 zS1g==
X-Gm-Message-State: AOAM530njnsfTyCv2eP9RyFfeYO8EVqGkQKmDmZaCeEkdp18K7aqq46A
 E3gHwZdSuNPbDwCBeRE/devn4Dh9kducJ9TN04E=
X-Google-Smtp-Source: ABdhPJwAF4pIZEc2IkVQMiATT4gSlw65ofn+bn2UMcpzhLMJ0YvjPdFuCPJdL77tHt1kk1IrtSVWeE+XUgkheRONBTQ=
X-Received: by 2002:a92:cda2:: with SMTP id g2mr10922654ild.46.1637734907617; 
 Tue, 23 Nov 2021 22:21:47 -0800 (PST)
MIME-Version: 1.0
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-12-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20211112145902.205131-12-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 24 Nov 2021 16:21:21 +1000
Message-ID: <CAKmqyKP8eC3g1FYM_D8GoOqtDV2CNeBWhd=OSF0t8GrsRw2PAA@mail.gmail.com>
Subject: Re: [PATCH v5 11/18] target/riscv: support for 128-bit U-type
 instructions
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Wed, 24 Nov 2021 06:21:52 -0000

On Sat, Nov 13, 2021 at 1:12 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> Adding the 128-bit version of lui and auipc, and introducing to that end
> a "set register with immediate" function to handle extension on 128 bits.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c                | 21 +++++++++++++++++++++
>  target/riscv/insn_trans/trans_rvi.c.inc |  8 ++++----
>  2 files changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 508ae87985..d2a2f1021d 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -289,6 +289,27 @@ static void gen_set_gpr(DisasContext *ctx, int reg_n=
um, TCGv t)
>      }
>  }
>
> +static void gen_set_gpri(DisasContext *ctx, int reg_num, target_long imm=
)
> +{
> +    if (reg_num !=3D 0) {
> +        switch (get_ol(ctx)) {
> +        case MXL_RV32:
> +            tcg_gen_movi_tl(cpu_gpr[reg_num], (int32_t)imm);
> +            break;
> +        case MXL_RV64:
> +        case MXL_RV128:
> +            tcg_gen_movi_tl(cpu_gpr[reg_num], imm);
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +
> +        if (get_xl_max(ctx) =3D=3D MXL_RV128) {
> +            tcg_gen_movi_tl(cpu_gprh[reg_num], -(imm < 0));
> +        }
> +    }
> +}
> +
>  static void gen_set_gpr128(DisasContext *ctx, int reg_num, TCGv rl, TCGv=
 rh)
>  {
>      assert(get_ol(ctx) =3D=3D MXL_RV128);
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
> index fc73735b9e..0070fe606a 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -26,14 +26,14 @@ static bool trans_illegal(DisasContext *ctx, arg_empt=
y *a)
>
>  static bool trans_c64_illegal(DisasContext *ctx, arg_empty *a)
>  {
> -     REQUIRE_64BIT(ctx);
> -     return trans_illegal(ctx, a);
> +    REQUIRE_64_OR_128BIT(ctx);
> +    return trans_illegal(ctx, a);
>  }
>
>  static bool trans_lui(DisasContext *ctx, arg_lui *a)
>  {
>      if (a->rd !=3D 0) {
> -        tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm);
> +        gen_set_gpri(ctx, a->rd, a->imm);
>      }
>      return true;
>  }
> @@ -41,7 +41,7 @@ static bool trans_lui(DisasContext *ctx, arg_lui *a)
>  static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
>  {
>      if (a->rd !=3D 0) {
> -        tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm + ctx->base.pc_next);
> +        gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
>      }
>      return true;
>  }
> --
> 2.33.1
>
>

