Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ny5r0-0003Md-DA
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jun 2022 02:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ny5qy-0003JE-Tc; Mon, 06 Jun 2022 02:04:40 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:36547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ny5qx-0007Lj-AF; Mon, 06 Jun 2022 02:04:40 -0400
Received: by mail-oi1-x235.google.com with SMTP id p129so13788105oig.3;
 Sun, 05 Jun 2022 23:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3EuBslwTBf4/qlUKiEXSoVqa8EmunJTHNyf2DAAw5A4=;
 b=D9V1dOIY9Ef+GbVhXfSpq0RBCz23OBVi1fuDPQ+djgVaNcl8uLtPYbfBeWVlXAWVCG
 0HpMwgoiZnVsBh1XsQcuMSPbNBZa2yuKuctyrTepCw/FRJ1fWWf8+Q0mDmqTu6kJbGuR
 jcKW80tVk3PT2g20cQ5TmHMfzUP83oWwVRjDYj+PdF7zCO/anvStaY9Hvtke7YlOSQow
 tZgezZTTT+N1vXZcKrlVm9cfzLOIiwPI7UQDZQ1jJdgL3eSOvtl7uJS3elqLelr+PjmK
 8Cm6mh/rpsBy0/wcFAI/k312oxy/lymlh/9tH4iFGPyMgAHsZQEpHSCobR09hBi/qNI8
 khcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3EuBslwTBf4/qlUKiEXSoVqa8EmunJTHNyf2DAAw5A4=;
 b=iegbEnTNJbWUK/l4KCMr8FayNjzCvLGBOUPXwhxIWO8FSY5fIdBYby44CPzaTP0n7q
 MIRwgTlYY2rC1IEbcot2PYGkpyHZYjLxAaXPgBcvPVweMrPTKylZ7JGUmFbGXM8fbYU6
 fONEJVya8/DNuWui3SvWzlw1BPBo4LtipVGGeOC0DFMfBIXC6SWSwwBcfaCsSvyMbm2c
 QXXlPBMzeovC9WAowZDs6Yccba5i8zIw/V3yMYRv8/y/s5bd2eLeiCh6wGeKYWU4Wfvm
 C+s0CyakzBtQ3vy3Lyy3kXvRdfnKQ6m+NpvEuZadHsiKOw3eaE4z/+GtAoxQQXKOAd2y
 3WgA==
X-Gm-Message-State: AOAM531LDsCDQrLLjMCwpiqtuEWLCvuue920lpMg8DvetI9izaYAA/dX
 G3L3zsMrGo6l0moBqeLU1fcvf2FeOU2Skw2Ibmw=
X-Google-Smtp-Source: ABdhPJxi4aEXmnA0Tj2HJS9Im0iFqbDSWEAMemGniHQwu2XIBHQ8zmELaFYfDppCPdM6EgOFOaVBw79jlID5RfbbSS4=
X-Received: by 2002:a05:6808:19a6:b0:32b:90c4:d1af with SMTP id
 bj38-20020a05680819a600b0032b90c4d1afmr29022835oib.64.1654495477981; Sun, 05
 Jun 2022 23:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220602155246.38837-1-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20220602155246.38837-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jun 2022 16:04:12 +1000
Message-ID: <CAKmqyKNA5-f4M7NcH6M771s0UFB0eQeVMgvH6fgSvOYNDQs5HQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/debug.c: keep experimental rv128 support
 working
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=alistair23@gmail.com; helo=mail-oi1-x235.google.com
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
X-List-Received-Date: Mon, 06 Jun 2022 06:04:41 -0000

On Fri, Jun 3, 2022 at 1:55 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> Add an MXL_RV128 case in two switches so that no error is triggered when
> using the -cpu x-rv128 option.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/debug.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 2f2a51c732..fc6e13222f 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -77,6 +77,7 @@ static inline target_ulong trigger_type(CPURISCVState *=
env,
>          tdata1 =3D RV32_TYPE(type);
>          break;
>      case MXL_RV64:
> +    case MXL_RV128:
>          tdata1 =3D RV64_TYPE(type);
>          break;
>      default:
> @@ -123,6 +124,7 @@ static target_ulong tdata1_validate(CPURISCVState *en=
v, target_ulong val,
>          tdata1 =3D RV32_TYPE(t);
>          break;
>      case MXL_RV64:
> +    case MXL_RV128:
>          type =3D extract64(val, 60, 4);
>          dmode =3D extract64(val, 59, 1);
>          tdata1 =3D RV64_TYPE(t);
> --
> 2.36.1
>
>

