Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0014FC43602
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 00:45:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgXS8-0006PM-SI; Sun, 05 Jul 2026 20:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgXS7-0006P1-UF
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 20:44:51 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgXS6-0004vd-DI
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 20:44:51 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-698b6c87884so4219344a12.2
 for <qemu-riscv@nongnu.org>; Sun, 05 Jul 2026 17:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783298689; cv=none;
 d=google.com; s=arc-20260327;
 b=aOHwdVd5Cjm9s/jqqsbwlry3cKY6dCbPRuPz9R0wclIGdEjYfrONxLT4IptOfIsMaO
 /thZgbmOE8HrE/CzuAyQNzWmLnBSauwgLLP83YDCes9W6MXw3bCRhvHVGlHyYCM88THU
 yTxQ/0xzudHH1XTZLwXKygeKvfOOtHbewngOU/wpmkaVFWPAI5QE7W7cff3whYVMXULP
 IHgJ+09vOqBLyte9KYDOgMQ/IBWef8iVyWJIzangZEjzXlvxWox5hx6dlfSAAis1tgNH
 07p0kqZDZt5iXky11HHJzDACXVFeajQjNXymPGSdhRpsfJhXCe8KfcrBbAfrZPvHbQtk
 s+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=CcJvguEpjF2Le86U6ahpmHEv3eDT1qNTbQKc9DfMEfc=;
 fh=3UAdZ0uFf+9IdF+hf6nRuIcJ2JQ6UpaO5lfE2KHzxN0=;
 b=XskxhQpNxR8Ol+xFnDoRZwTg2Ts0QP9XOXXqLDbH3PbPtHy0OvG8jQYNTH/lGo2wn1
 fCjk7gh+Qv7QDAX+uF6fz/LqnTD+1Yqb39zRE1sPW7GevRelSfNAYWnf7NoZW452Fcpt
 eQp4OpTjvIPpSBTLhfbhZ6AyDR2uXReB443SXdqN2uhKXzUayS+L5W2nj2BnMUAluZVt
 QD+hs0GhxYDq6rLsdnYE2Y9ftaLIgKljFVg5xEgP6y78fI/7xVDAtnc+hGi5d63ze/fI
 SjaFhJvR6bik9FONJlH7aQQJKG677itLYEvwk0UjSYZ3RjLzsvSsxFgPL9wAnvC/sjQ9
 7M3g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783298689; x=1783903489; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CcJvguEpjF2Le86U6ahpmHEv3eDT1qNTbQKc9DfMEfc=;
 b=cT8vDGz9GUZRq9/fA353PopLVOWT5MMz6FHPHvF1DZNaJThPZVDPt0PhyTLYOtxwhj
 /mIjrTTlGdgPlBPEiBIa9T/ldEZknI08zlvImn30nyLLPFeCsLMf4nYFaU/iy+QizDGG
 MtpOZ5leRKWpzfI5paPSmCdCgxGHvfyd6WXhysO2jcuYdw+veNWN3ORYK0d67KG9k7+Z
 kaIJbnBK5Eh6XBAODaWQVlOvueegHw3kAWZ/mH+L90XTyOGPS80FFGqslPawTdamRKMw
 aSn5uBGnGjNzJDixd//FxPF8dvDC7d+BEKXzjowjiFlaE14k+NdS66fGVk4fg3rSgQbG
 mbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783298689; x=1783903489;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CcJvguEpjF2Le86U6ahpmHEv3eDT1qNTbQKc9DfMEfc=;
 b=TseYEzIt1JrAVrjShaEo940eaWzalDS+DsjP5A/COCW+R6hDWYFW3HdYLP+CE3oHcG
 FHq/bZpV8mCBytlYsGPOiSK4mCkwHQsr/qhVbWWQPO21rxoW/oUE4ZaKMpccxKBp5Ob0
 WqrRyF84Isoom2sgj/WWOsk9Z5yNM10WzcEbm9Fovw9nWdWDvduH+qN26ZEw9iSu0BfC
 RduSv+/66u7f8fr9qcvTccSHdwl7Qcw7kqe8mU7DggB1WV99qp3D2V0ZxyChAmPcdm46
 B2F4LKGpxxgrYRqIDKb/I4Pxe+bpb1ALGnFvAnzS+NDTLzdcyzsCGR9W/RgERVH7bWMH
 Wvjg==
X-Forwarded-Encrypted: i=1;
 AHgh+RombcQMEdrIOu6hsH9YYF4zj8Fo2HK2bFoIjbq8F/KJfu7gn0qoIX/gVI2QUZ8gOx0S4NdV/fU9AOuG@nongnu.org
X-Gm-Message-State: AOJu0YyLQ4vUKBK8HDyUgelPzmkmYjQ2I6OHO2kO1e91ZfN00uL9UX+0
 lpBsGHmPrlaAB+H0hMBRT5zRg9sAcMtH7z0F80MthhH9Sx5ec+qCf4lCtsqGbe4ZAQFLloKE729
 7AL/gsxec8QgYEfCCahV3nDniBb5yjkU=
X-Gm-Gg: AfdE7cnCEjls7zu3haqUsUFXW/Nex0dzoBkm77QMspZIT+jqDchvFxVsE8lLozVhx5S
 zziUK7CiuGjFTBw+PNQv3RXUX4UPQwDoS05Pl9ILfj/Xz+TVjDVz1HBe7oN3qKTz5gAe4+3sRKM
 CqjGdST6phMmd3iO37iNaOa/OJHNDGriQQ2SLwpHhRSVJhKO98VRBIUxeKkXMhofVXR9kqt2rL5
 HBhy6PakMzlAsMXPBn3ACTx87VCWnQzXEE61nGUw7GvqTFRhYLmiucpLUH59Vaw3RNn1C9PdacP
 LLG81odsOcIu87NuGYM4y0P28wE=
X-Received: by 2002:a05:6402:11d3:b0:69a:bfa:cb1c with SMTP id
 4fb4d7f45d1cf-69a1a3ba170mr2759319a12.31.1783298688796; Sun, 05 Jul 2026
 17:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
 <20260702135128.1188021-24-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260702135128.1188021-24-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2026 10:44:22 +1000
X-Gm-Features: AVVi8CfAJMRW8UxjljTqn5elIHyJowFm2P_rHvhzIrlLITNTmYXcegOgQ1MwabU
Message-ID: <CAKmqyKNcXzr+bmUnkGidkEjyXBpuS=r2swOBmFbQNTwP19EFXA@mail.gmail.com>
Subject: Re: [PATCH v3 23/24] target/riscv: move
 riscv_cpu_set_aia_ireg_rmw_cb() to riscv_imsic
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Jul 2, 2026 at 11:58=E2=80=AFPM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> riscv_imsic.c is the only caller.  Having it sitting in the TCG only
> cpu_helper.c gets in the way of --disable-tcg for no good reason.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/riscv_imsic.c         | 11 +++++++++++
>  target/riscv/cpu.h            |  3 ---
>  target/riscv/tcg/cpu_helper.c | 10 ----------
>  3 files changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
> index ebb55191c7..d6b46cdca2 100644
> --- a/hw/intc/riscv_imsic.c
> +++ b/hw/intc/riscv_imsic.c
> @@ -376,6 +376,17 @@ static void riscv_imsic_reset_enter(Object *obj, Res=
etType type)
>      }
>  }
>
> +static void riscv_cpu_set_aia_ireg_rmw_cb(CPURISCVState *env,
> +                                          privilege_mode_t priv,
> +                                          aia_ireg_rmw_fn rmw_fn,
> +                                          void *rmw_fn_arg)
> +{
> +    if (priv <=3D PRV_M) {
> +        env->aia_ireg_rmw_cb[priv] =3D rmw_fn;
> +        env->aia_ireg_rmw_cb_arg[priv] =3D rmw_fn_arg;
> +    }
> +}
> +
>  static void riscv_imsic_realize(DeviceState *dev, Error **errp)
>  {
>      RISCVIMSICState *imsic =3D RISCV_IMSIC(dev);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7a4d8abe07..c9dfa7daff 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -680,9 +680,6 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uin=
t64_t mask,
>  void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level);
>  void riscv_cpu_interrupt(CPURISCVState *env);
>  #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip valu=
e */
> -void riscv_cpu_set_aia_ireg_rmw_cb(CPURISCVState *env, privilege_mode_t =
priv,
> -                                   aia_ireg_rmw_fn rmw_fn,
> -                                   void *rmw_fn_arg);
>
>  RISCVException smstateen_acc_ok(CPURISCVState *env, int index, uint64_t =
bit);
>  #endif /* !CONFIG_USER_ONLY */
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.=
c
> index 71a96a20ef..07d9222652 100644
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -590,16 +590,6 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, ui=
nt64_t mask, uint64_t value)
>      return old;
>  }
>
> -void riscv_cpu_set_aia_ireg_rmw_cb(CPURISCVState *env, privilege_mode_t =
priv,
> -                                   aia_ireg_rmw_fn rmw_fn,
> -                                   void *rmw_fn_arg)
> -{
> -    if (priv <=3D PRV_M) {
> -        env->aia_ireg_rmw_cb[priv] =3D rmw_fn;
> -        env->aia_ireg_rmw_cb_arg[priv] =3D rmw_fn_arg;
> -    }
> -}
> -
>  static void riscv_ctr_freeze(CPURISCVState *env, uint64_t freeze_mask,
>                               bool virt)
>  {
> --
> 2.43.0
>
>

