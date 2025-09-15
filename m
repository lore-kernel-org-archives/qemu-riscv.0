Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B42CA0EE8
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 02:13:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uxyiC-00046W-HC; Sun, 14 Sep 2025 22:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uxyi8-00045k-U2
 for qemu-riscv@nongnu.org; Sun, 14 Sep 2025 22:12:56 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uxyhz-0005kd-US
 for qemu-riscv@nongnu.org; Sun, 14 Sep 2025 22:12:56 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-62f0bf564e4so1894095a12.3
 for <qemu-riscv@nongnu.org>; Sun, 14 Sep 2025 19:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757902357; x=1758507157; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cgs/gwT/Li3NjQ9nXCI/LXVX5CL9/PfvDPoWbLk/92c=;
 b=nK6Fm9dXORLmFIF4gi9VWWydvhz1YDpBPHwrCpBAe7yUVSY/wyj7rtRDvHSs1774NW
 25eehGBgYveXRrnsr2p85lfx6PkuE2tAFBE20PhF0Bytn6maNDuuhNrrUkHaYvRsiB+s
 CymWDxy8LB6STUCgWknrsspdu4J2h3p81SdSMQC6iwCAoyiipY6sU3QIJO13AuX7xfLN
 BVGatS6JT5VH/yRFEZQte05eLz47r9ul+Yn1/xngdV146xeua0Do9OyU4asFL6wUcZgL
 2XcS1lXjKh3IvZIFREkfqXhG091RsRz97DneASGM7NgQK0YqJ/UtEKbNkPwl5BdnfbbB
 hjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757902357; x=1758507157;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cgs/gwT/Li3NjQ9nXCI/LXVX5CL9/PfvDPoWbLk/92c=;
 b=f65immbP2wQA05bkD8UwyMXJ1GQ1UXctIAcCJ5nj++uT0A+IxUiT/WK8YQJsYUEoPn
 DJSWOxA5SliVlOqvh6p3jAGbkjuKwqvSzjL8pVM6AHZntpuwR2htBH9i+AKECzBywWRz
 roYyVtyoHv5CfsAPkevqYixQr55x7RioXZp/o0a//iLezo6jJ2VtPNUQq2skf70QhVD6
 ON2pqz4P+y7TIIz1tWxesTl46gKXRurxr8upxQz0/tULJqqbNjik2+pcCf9kBk7cS9Ql
 gUBHe8KYrIlWeKYbXLIepWFdPNtIfgQCl7CGpEoF5MleGZIS41CXfQKf4CaOLhplA6iU
 r+LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/Sa3rMI38uq6FlZfcg/gIGrwanu2bwqVq5OYpGY390GnVpR+CKAdFLRKJk+cXDfVi3HW20lyE4K+h@nongnu.org
X-Gm-Message-State: AOJu0Yye4rWs9T9CrVHz0D8JniwvRHJowY9wLvl5Gqf/eCQnmgqDxyoO
 CzEiMghK35S9s6vQxUBOzAH3V/3pA6+26gPMLXYuZwNarPhvWeyTq/rdRWLuM26kqG71P5oH0ac
 gGtvVTFhRBnMjDgljZ/661eK3lExmdHc=
X-Gm-Gg: ASbGncto9JPq+eykTsSlsAeRN4bXnJrh5D1VIaegIc7vcS4IXHr7glJHxWzGfNNRioJ
 Qxo8anyaduQu6FV2nfH5xdwPFG1WChtsYUZzn7zigolxBBDcvddIc8Oi45jHKRSJOuPTCn8x8df
 jCvMnkNLG3GjWE+oZdiIQoUhZVMSRrsJ/Rm1xRLm2NHVTqvQ8sfpuDLuOnDT75c6iWwgPYA6AMY
 wsNTDIQczjO8AqieaOJWxeEj7jNq1vgqW47HxvMrtX5weDG
X-Google-Smtp-Source: AGHT+IHYWuc/3WbMsIsCneNPQ0WKClxu3JFlbtvzOypfXPdaIPRigKSEOXtd+gUvXuHjz6ihj9o5lAtDXRdg55KXwpM=
X-Received: by 2002:a17:907:2d2c:b0:b07:9c13:153e with SMTP id
 a640c23a62f3a-b07c353e3f8mr1100157866b.2.1757902356716; Sun, 14 Sep 2025
 19:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250904060022.2828441-1-z_bajeer@yeah.net>
In-Reply-To: <20250904060022.2828441-1-z_bajeer@yeah.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Sep 2025 12:12:10 +1000
X-Gm-Features: Ac12FXymf6svEVRdwz-_1pLRMEMKOawNIfQaD47n5TeIRoChNp_KkOG5zawGKNA
Message-ID: <CAKmqyKNN_+zgALV_5aa7mW7Fs+XnwLwG2298xAuH5o-7BH9Obg@mail.gmail.com>
Subject: Re: [PATCH] intc/aia: fix the read of in_clrip register
To: Yang Jialong <z_bajeer@yeah.net>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, yangjialong@rvcore.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Sep 4, 2025 at 4:02=E2=80=AFPM Yang Jialong <z_bajeer@yeah.net> wro=
te:
>
> 4.5.7. Rectified inputs, clear interrupt-pending bits
> A read of an in_clrip register returns the rectified input values of the
> corresponding interrupt sources.
> A read of an in_clrip register doesn't should be an active interrupt
> source.
> A write of an in_clrip register should be an active interrupt source.

Can you please explain in the commit message what is wrong with the
current code and why your patch fixes it

Alistair

>
> Signed-off-by: Yang Jialong <z_bajeer@yeah.net>
> ---
>  hw/intc/riscv_aplic.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index a1d9fa5085..2583d6d305 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -204,9 +204,6 @@ static bool riscv_aplic_irq_rectified_val(RISCVAPLICS=
tate *aplic,
>      }
>
>      sm =3D sourcecfg & APLIC_SOURCECFG_SM_MASK;
> -    if (sm =3D=3D APLIC_SOURCECFG_SM_INACTIVE) {
> -        return false;
> -    }
>
>      raw_input =3D (aplic->state[irq] & APLIC_ISTATE_INPUT) ? 1 : 0;
>      irq_inverted =3D (sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_LOW ||
> --
> 2.34.1
>
>

