Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A814BC7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 03:51:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8Ya4-0007NO-8T; Sun, 11 Jun 2023 23:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8Ya3-0007NA-Cw; Sun, 11 Jun 2023 23:50:59 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8Ya1-0003HZ-SM; Sun, 11 Jun 2023 23:50:59 -0400
Received: by mail-ua1-x929.google.com with SMTP id
 a1e0cc1a2514c-789de11638fso1657649241.1; 
 Sun, 11 Jun 2023 20:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686541856; x=1689133856;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AlDwBvdzwsajAPQvZwsTKGFA7ZoUhniiOIytSqhLpvA=;
 b=J09z7HmSUOTlKq104ItWvqfJCzJMvm+Ko8V2MBXqXJbkB8WpmFsz/JBm1gnxiiENJp
 7Jxu9pOtcJs/HgBs0oGc1DMM5Ygt1Y4bHEONhx2LiiPVad3K7POA1+Nb74uLdGQGPp1g
 +m0nmRZ0rUxGo7MZ3yiSvd9Dd4FhzGqNs68/H0MzwOJCjEWB5s+JEBp0nRipad5xOnAG
 aDbjWuhqnsPZB+WBXZkzGlu0o5588VX3jAEvAq02zyvM0iJN9ZVU4773fDokZVdqAl7K
 x8Mtsq+rsTel7KkOzWWpWIA4wW38JHJmFwjZWlnQjv57NF3bQrql6u+MN94k+kryjuNC
 1Ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686541856; x=1689133856;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AlDwBvdzwsajAPQvZwsTKGFA7ZoUhniiOIytSqhLpvA=;
 b=Bel2Y4k+CcMb7Eb1jKz3hPbdTPzmZ3pHHpODFYoQpinJLgoyqOnBPDH/cDpqlVwdOd
 VydtdaveGeMWsgA3kwKZFdhazs2iCeWJU/1zE2LIroykdZKlMkwY5S0KNigNrNWJdgjH
 N6lapv3IRccoGsx5mChepB9G6u32mVKz5nu+5DSGCMIuzOainFwAzn8VAdcxiGbwtRL8
 qbRAFQ5FQURwfJx9AyX++bGtFGG1Ih7sYMGlajBEfVmB60BIT4/zHCo06GFrEYH4LWk1
 A2hfkRaFZi+LkA0j3BPZet4Bgr/ckcdIOEB+Wa2RNm4h5FpQrMRTnqfCA9HT5hYTeafH
 0m5Q==
X-Gm-Message-State: AC+VfDz9VazX6/aEYdQX2jslw8wY8bDx43slmbh5wPzdFB8jNjk4LkmO
 sDStuQqJ9Intmoz5jyD/t3gFcezLLm+aYOsm0bGJaWPHt0I=
X-Google-Smtp-Source: ACHHUZ6PgolJ2HbMASEEkFWDHFNb4hU6/7Yftya0i+f/YJeH1yr+9bUzWy8o1ckaqA6HAFR56jQ6FFs4KH3tqLM5Clc=
X-Received: by 2002:a05:6102:94:b0:43b:1f8a:d581 with SMTP id
 t20-20020a056102009400b0043b1f8ad581mr3370487vsp.31.1686541856518; Sun, 11
 Jun 2023 20:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230605075150.367555-1-hchauhan@ventanamicro.com>
 <20230605164548.715336-1-hchauhan@ventanamicro.com>
In-Reply-To: <20230605164548.715336-1-hchauhan@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 13:50:30 +1000
Message-ID: <CAKmqyKM=zBcO1ndJHZbq9HByd1JtU8u3jiN2KcqtjUvo6PT=WA@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Smepmp: Return error when access
 permission not allowed in PMP
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x929.google.com
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

On Tue, Jun 6, 2023 at 2:47=E2=80=AFAM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> On an address match, skip checking for default permissions and return err=
or
> based on access defined in PMP configuration.
>
> v3 Changes:
> o Removed explicit return of boolean value from comparision
>   of priv/allowed_priv
>
> v2 Changes:
> o Removed goto to return in place when address matches
> o Call pmp_hart_has_privs_default at the end of the loop
>
> Fixes: 90b1fafce06 ("target/riscv: Smepmp: Skip applying default rules wh=
en address matches")
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/pmp.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 418738afd8..9d8db493e6 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -291,7 +291,6 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ul=
ong addr,
>                          pmp_priv_t *allowed_privs, target_ulong mode)
>  {
>      int i =3D 0;
> -    bool ret =3D false;
>      int pmp_size =3D 0;
>      target_ulong s =3D 0;
>      target_ulong e =3D 0;
> @@ -435,17 +434,12 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_=
ulong addr,
>               * defined with PMP must be used. We shouldn't fallback on
>               * finding default privileges.
>               */
> -            ret =3D true;
> -            break;
> +            return (privs & *allowed_privs) =3D=3D privs;
>          }
>      }
>
>      /* No rule matched */
> -    if (!ret) {
> -        ret =3D pmp_hart_has_privs_default(env, privs, allowed_privs, mo=
de);
> -    }
> -
> -    return ret;
> +    return pmp_hart_has_privs_default(env, privs, allowed_privs, mode);
>  }
>
>  /*
> --
> 2.34.1
>
>

