Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ny77g-0003wm-33
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jun 2022 03:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ny77e-0003tf-7N; Mon, 06 Jun 2022 03:25:58 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:39735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ny77c-0002CC-Hr; Mon, 06 Jun 2022 03:25:57 -0400
Received: by mail-oi1-x229.google.com with SMTP id s8so13352588oib.6;
 Mon, 06 Jun 2022 00:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hY/auDmxsbfSA+Ub2dBoocJSS+jXlXrI1/qvdyp/pxw=;
 b=EjUotn1CF1rKaEwFiPmJ5Mf+shqKJIthijAObB9H0dqCy3ul9015K9J0ldDRt3MS/3
 HESAYih8jxmgPQfGouveKLVsOK67R4Voh/HILo/EU+7fSmf7PtsKmx4P4PDxwEDUE9VW
 8tSaCq6qwoCgHTP5bToWcERDv+1uRh3+OcA8RZNsrTvF2KczLhkBEEidtQ3SN1XzHxf5
 d9S5gxphSm85+oupjUce+gRcBr3vjw3B3Z8tbTblegWfv/IyeDs/QApYHTvFimhLoyTd
 q3Zc5BdRUkx5dneKCURaSwJwqMo6lA9lCSdks11rVLdNHrxsBHm/WpKDiCrX5i1mIH3s
 rKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hY/auDmxsbfSA+Ub2dBoocJSS+jXlXrI1/qvdyp/pxw=;
 b=OaQQBzuB+lA9bPkziqHJiY+fcRLVWljHLGUZq9GrMWIsnuV2+yTyss1T9p32XVWcD7
 HZ2Ie12Ir88lfPwmzJm1T6KvaSopltpP2+GqVRsPseeldSyuHtGyoZZF109/Jgg+Iv4y
 uSgBMRgCRcyP5ndECrNDD9YCXuuF0KePRewZPD605AyL6vnPqR58JIt6Gq75fdP4VNtP
 nakQgRMxcvgHG/1oZf2dMWkanD1BqUb1CGQnncvpSMdt27rwoWMKbHXv02RdVeNYgtYP
 b/itoA6dQZsEo16vrwXRZE2xOp2ewBYocsx7AP6+S5AQOJPmSq4z1JNuZJG3/JPUakNT
 FWBA==
X-Gm-Message-State: AOAM530m5CAIFOVCz5IsAUtU6kD4st/kmalG51OavgXg0zuSdjRCr9rG
 xEfbnPe9zdWnAaq1+1rO7Wm/Lcb4ObiNED4KWKI=
X-Google-Smtp-Source: ABdhPJzfdnNSJ7prKNwf/bDPSF9Ayy5Wle20vbT63k3hSldZzJok5YbiR9MmQhCW6kQYl5GsXJTu2WLCoN49M2PPFrg=
X-Received: by 2002:a05:6808:2126:b0:32e:a750:f8b4 with SMTP id
 r38-20020a056808212600b0032ea750f8b4mr114567oiw.278.1654500354872; Mon, 06
 Jun 2022 00:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220602155246.38837-1-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20220602155246.38837-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jun 2022 17:25:28 +1000
Message-ID: <CAKmqyKP428vBu+4zRRV2RbpYyRT3fevrBMGxeSCuAQK9m1OdXg@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=alistair23@gmail.com; helo=mail-oi1-x229.google.com
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
X-List-Received-Date: Mon, 06 Jun 2022 07:25:58 -0000

On Fri, Jun 3, 2022 at 1:55 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> Add an MXL_RV128 case in two switches so that no error is triggered when
> using the -cpu x-rv128 option.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>

Thanks!

Applied to riscv-to-apply.next

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

