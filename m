Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C08BE95A8F
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 01:00:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpedG-0002Ny-9g; Sun, 08 Oct 2023 21:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpedE-0002NL-J1; Sun, 08 Oct 2023 21:00:24 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpedA-00078s-Dm; Sun, 08 Oct 2023 21:00:23 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-45765b55fb1so285083137.3; 
 Sun, 08 Oct 2023 18:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696813218; x=1697418018; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xLKviU7Gxmom2nVMH9NiF3rRbuErStTYPa+3+jw+nK0=;
 b=ed8v+tAxAhnK7uny7uhoLj518muALO/Lxh8jUIE+QXm5YGPRvSbbv34BsnjU9oyd6k
 CsxV/fzuGCn36C4jvx6xCw5z7jyoYsWf0epD73mHVREMntPRf9MR/HW2VlBMm+iCaXOL
 c8VelrH79SITcKB3/fbN/ZAtpmFeEaACVXvX+yCpxtm/lBxXu2CqvGlOp7wXiMluP478
 9t5UG5HhSQ1r7Wp7oRRCgg7mkc14VRxrXgR2lG4XJtSDlwhDgCF0HAC3Gwoh2nApbv1r
 zsQAg5ZcZpM221XcPBePYUmBQDdoyugqQ2olxi2kd7yuS4JUj3dPDPLIPvHShS9j3XUg
 pYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696813218; x=1697418018;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xLKviU7Gxmom2nVMH9NiF3rRbuErStTYPa+3+jw+nK0=;
 b=pMJ9A8LJ7xgQXRUq+fP8G3esu8BJqXn1iNDdsWNPehwZtlbnxy44nXtV6yeECvFQ5G
 3v0jzDQego1uRdaZJM4+Z9nqzeewZNmnZdpS6V0A8dh05yrjnRJG/fnNboiJHgZtgolE
 fHYCKvbOUl/BsU0x2oWuRlojthmwOj3z6GOgEO+lZ1IMIFQLDx8XZS7lcoofLAjYdVbc
 5ZUOu0YXCIf853SAhNaFtfoWoK1th/tgxFix1Oiqe2dtKRyorGgioxbsZp3pzqoFy4Z6
 mC8RRCe0ywnvO2S1BMUyqP2qrGeim3T/1HCVZwjoYxUY/IMs+cjT4PaTPAi/ujxmJvex
 AUSQ==
X-Gm-Message-State: AOJu0YzNoN6K7YYXbA1h/y+EdmZ1uE2szJ6O/54C7oGK20dmWtFY9hP4
 pu/x3/t1HldRMUnXwrSHw64ak1tfLkA/0hXjV4c=
X-Google-Smtp-Source: AGHT+IFDFGroqd3xAVQ0LpdExmOXCInola60dkVvH/iN5aMXLN7/ribwJBrxd9um9UFsC8+XEnsx/miim1kzVc0556k=
X-Received: by 2002:a05:6102:2b91:b0:457:6022:206a with SMTP id
 ib17-20020a0561022b9100b004576022206amr4391900vsb.1.1696813216347; Sun, 08
 Oct 2023 18:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231003132148.797921-1-dbarboza@ventanamicro.com>
 <20231003132148.797921-2-dbarboza@ventanamicro.com>
In-Reply-To: <20231003132148.797921-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 Oct 2023 10:59:49 +1000
Message-ID: <CAKmqyKMy7Dps6Hkme7TgA20emSHZy+CKYmvV_vXO6w5z9DG6zA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/riscv/kvm: improve 'init_multiext_cfg'
 error msg
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Oct 4, 2023 at 12:46=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Our error message is returning the value of 'ret', which will be always
> -1 in case of error, and will not be that useful:
>
> qemu-system-riscv64: Unable to read ISA_EXT KVM register ssaia, error -1
>
> Improve the error message by outputting 'errno' instead of 'ret'. Use
> strerrorname_np() to output the error name instead of the error code.
> This will give us what we need to know right away:
>
> qemu-system-riscv64: Unable to read ISA_EXT KVM register ssaia, error cod=
e: ENOENT
>
> Given that we're going to exit(1) in this condition instead of
> attempting to recover, remove the 'kvm_riscv_destroy_scratch_vcpu()'
> call.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm/kvm-cpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index c6615cb807..c3daf74fe9 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -792,8 +792,8 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu=
, KVMScratchCPU *kvmcpu)
>                  val =3D false;
>              } else {
>                  error_report("Unable to read ISA_EXT KVM register %s, "
> -                             "error %d", multi_ext_cfg->name, ret);
> -                kvm_riscv_destroy_scratch_vcpu(kvmcpu);
> +                             "error code: %s", multi_ext_cfg->name,
> +                             strerrorname_np(errno));
>                  exit(EXIT_FAILURE);
>              }
>          } else {
> --
> 2.41.0
>
>

