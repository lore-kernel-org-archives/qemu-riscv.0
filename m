Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C648BC7EE24
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 02:26:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pz6rX-0004JZ-LN; Tue, 16 May 2023 22:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6rW-0004JH-M5; Tue, 16 May 2023 22:25:58 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6rV-00006F-5c; Tue, 16 May 2023 22:25:58 -0400
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-783f17f0a00so112991241.2; 
 Tue, 16 May 2023 19:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684290355; x=1686882355;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0jQf6xshL1gS1VggTmJ1Z933Pnjvbb5Kco0U2vNU3VY=;
 b=ThA2isYeuZCC6K+CecjPwMrxiyERpp8OkVmg1xlJ1LFIXLSZmwKlT4GGMmIk/gehpo
 LY4mjV8q0tZekn2CnXEHOdhgExbI7pax/+IK884gE7rNJgYJWNsQR/jyycoLf09lQvkx
 KIHhi/xLw8NNGK3LmAxZXcQ8b0G0utDf7ypIy9dArtpQ48oJXZO1wKGHqi94RyYzGelO
 BxwE2OsdYQD0FSGZmCwnq4HLciP9gqNSTHw0MyaNyCz/uAQnyUz8gU3LWJ0YrdOTCUH5
 f/sUdxYsSSDlkAETlDBD5jV8EaQJ0fqq+vfcgAtLGAZbCiWqSbF4rOPmh3NHEnnUy+Qz
 Yqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684290355; x=1686882355;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0jQf6xshL1gS1VggTmJ1Z933Pnjvbb5Kco0U2vNU3VY=;
 b=bEzZHoRfcJYBS2/FfaXc0Cc62+lOW5rJ9+jkhZNe3wi5AUjY4HHucITOJwoUf9No4d
 R7moN64Vz92PPA/qdslPh4I0AD4ueM6uMWCq5w8rUVOB5w3K66fttfRgaUz39+BFSr4y
 4JPkZDCmLqkkPvVquJbAveqMNQdEOaldGt23JSPiNy+1z0dn3IA6VZWHf1ERKycLsdzC
 ifSeyMf0w9Q5OD6RmAli95gT1XEtDyWesbTy+nD0M2OvgdOq13BWcH1GNcfnHqw5Yfeu
 X9j6MiWK1je0VWM2Zs63lgMafwCzn9nkFOwzS+AkV6OpJkvvhAH8q9S1jBdEikUNawXW
 hcjw==
X-Gm-Message-State: AC+VfDzu0IUP+38DKBX4kw0yQPRheVfJspEspVNx5OLquXIHgiZUQpqz
 8b4BC7sx2VsOF0PGzankRy/3Ja1EnyQrA8yPaBQCHpMX36k=
X-Google-Smtp-Source: ACHHUZ6DvJbqKHos4lzwO2uGTgR0Kkg0/ubDeOfuHhARRJ91pyWtwOcDc7W0IFy8IbynX0bttvhNzbq6w++GeLQfMG8=
X-Received: by 2002:a67:f30d:0:b0:436:3238:bd1 with SMTP id
 p13-20020a67f30d000000b0043632380bd1mr8109574vsf.34.1684290355659; Tue, 16
 May 2023 19:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230510030040.20528-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230510030040.20528-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 May 2023 12:25:29 +1000
Message-ID: <CAKmqyKO+vyQtRWM1Ymvj1xOz98qg1bBhKtCW76m9nqmo5G7xtA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Move zc* out of the experimental properties
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, May 10, 2023 at 1:02=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Zc* extensions (version 1.0) are ratified.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index db0875fb43..99ed9cb80e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1571,6 +1571,14 @@ static Property riscv_cpu_extensions[] =3D {
>
>      DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
>
> +    DEFINE_PROP_BOOL("zca", RISCVCPU, cfg.ext_zca, false),
> +    DEFINE_PROP_BOOL("zcb", RISCVCPU, cfg.ext_zcb, false),
> +    DEFINE_PROP_BOOL("zcd", RISCVCPU, cfg.ext_zcd, false),
> +    DEFINE_PROP_BOOL("zce", RISCVCPU, cfg.ext_zce, false),
> +    DEFINE_PROP_BOOL("zcf", RISCVCPU, cfg.ext_zcf, false),
> +    DEFINE_PROP_BOOL("zcmp", RISCVCPU, cfg.ext_zcmp, false),
> +    DEFINE_PROP_BOOL("zcmt", RISCVCPU, cfg.ext_zcmt, false),
> +
>      /* Vendor-specific custom extensions */
>      DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
>      DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
> @@ -1588,14 +1596,6 @@ static Property riscv_cpu_extensions[] =3D {
>      /* These are experimental so mark with 'x-' */
>      DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
>
> -    DEFINE_PROP_BOOL("x-zca", RISCVCPU, cfg.ext_zca, false),
> -    DEFINE_PROP_BOOL("x-zcb", RISCVCPU, cfg.ext_zcb, false),
> -    DEFINE_PROP_BOOL("x-zcd", RISCVCPU, cfg.ext_zcd, false),
> -    DEFINE_PROP_BOOL("x-zce", RISCVCPU, cfg.ext_zce, false),
> -    DEFINE_PROP_BOOL("x-zcf", RISCVCPU, cfg.ext_zcf, false),
> -    DEFINE_PROP_BOOL("x-zcmp", RISCVCPU, cfg.ext_zcmp, false),
> -    DEFINE_PROP_BOOL("x-zcmt", RISCVCPU, cfg.ext_zcmt, false),
> -
>      /* ePMP 0.9.3 */
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>      DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
> --
> 2.25.1
>
>

