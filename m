Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73D6EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 04:01:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIi55-000493-6N; Mon, 10 Jul 2023 00:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qIi4o-00045p-9c
 for qemu-riscv@nongnu.org; Mon, 10 Jul 2023 00:00:44 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1qIi4h-0002Nm-Uo
 for qemu-riscv@nongnu.org; Mon, 10 Jul 2023 00:00:39 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-56352146799so3208072eaf.3
 for <qemu-riscv@nongnu.org>; Sun, 09 Jul 2023 21:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1688961630; x=1691553630;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6LI7rT/rT8eN97E6MItQ7yPzvCEm9TaqkGYRxdUlylw=;
 b=frN9XaMA4EUv6f/mYIkRne+LMtLbpPIw7zzFlTxo7RvKQzJNI2WxMM/yJchkR66msR
 KCwm0H0kc3B8ArQ/SQyh2Hp0X75QZKCEMXkAX8FVkJ+lgi4BWTSpA4MwjQBouCid9B+a
 gsgrffWLOlNupJh5FkhHN4QOxFezvEScn8tZnVuua+uu27Nf1d1HznwUKxLrSEXwo7cT
 YBsTZWArz++DrGKvEs+mE0Tk1Ii0ZS3gvL7rSSgyo8tlQK1YB3T3C66HKnODp3MbU2VG
 QE3wiw2kHQCWvU8oUPnxqLm0ujiY475u3SPKw+JKw0ttPUPwjRpLsiKx93jhjOAVTYbI
 k9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688961630; x=1691553630;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6LI7rT/rT8eN97E6MItQ7yPzvCEm9TaqkGYRxdUlylw=;
 b=kl0c8hsyKUI6Uyy2ZAKUjNrt3orFRGukW8/TLEVNGi4AwUaUN2/BIHYI/2fHr+W7px
 tcT207v0ukeatE6JS0847grLHwKNPNsgQpM4bPpylnQkzGWKlP0K41ovAp4vLjAMIZFx
 /1ga/YClxHcoZsaPE2Vidi+yCF8pjTmk8sD5M0RW5NaSrCXh+ClV9TBIIpz0XHZNBzdv
 z+wEl5DA2Hy91YcUpLVMS5Bywx6i51pGZkdnWLqt83VZote1dSU1mqVkmJ0NEspBRD6D
 6KXWYjwfOmMWvfbi/fGGcPoll7AjUmrGpKRwRnql2dA8jo1FWxsu0/OXHkIrEzfb4jXx
 aHSg==
X-Gm-Message-State: ABy/qLY2iwkFn/Us2JtMmRZ6jG8PSGP/c3X8NvZKuGaVbWbG9gUVF3H9
 UGVI9jGta7FU82QJNuTVwhh67AzFkYa+XUyyjcJ3vw==
X-Google-Smtp-Source: APBJJlHGq4pKy/OMDYHMI+E44mOJoa+1D4o0cgUvEY9gZBDfvqDapGDBXwTsyo24LrbPJLbtp67I2qknekopA/C8Wa0=
X-Received: by 2002:a4a:4f0a:0:b0:565:97f9:d2fb with SMTP id
 c10-20020a4a4f0a000000b0056597f9d2fbmr9665441oob.3.1688961629848; Sun, 09 Jul
 2023 21:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230621145500.25624-1-yongxuan.wang@sifive.com>
 <20230705-31abcb5d920f105c9a9ccaa8@orel>
In-Reply-To: <20230705-31abcb5d920f105c9a9ccaa8@orel>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 10 Jul 2023 12:00:19 +0800
Message-ID: <CAMWQL2g38vnr4p7ByyhGT0WRH-t6TMP3KXb-DFSKHzRrJLs8VA@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Add RISC-V KVM AIA Support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rkanwal@rivosinc.com, 
 anup@brainfault.org, dbarboza@ventanamicro.com, atishp@atishpatra.org, 
 vincent.chen@sifive.com, greentime.hu@sifive.com, frank.chang@sifive.com, 
 jim.shu@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-oo1-xc31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi Andrew,

I'll add it into patch v5. Thank you!

Regards,
Yong-Xuan

On Wed, Jul 5, 2023 at 4:14=E2=80=AFPM Andrew Jones <ajones@ventanamicro.co=
m> wrote:
>
> On Wed, Jun 21, 2023 at 02:54:50PM +0000, Yong-Xuan Wang wrote:
> > This series adds support for KVM AIA in RISC-V architecture.
> >
> > In order to test these patches, we require Linux with KVM AIA support w=
hich can
> > be found in the riscv_kvm_aia_hwaccel_v1 branch at
> > https://github.com/avpatel/linux.git
>
> Is it possible to add irqfd support? Maybe even as simply as the diff
> below? If not, can you explain what still needs to be done in order
> to do so?
>
> Thanks,
> drew
>
>
> diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
> index 00fdb60fc6ab..b38d9bb5506a 100644
> --- a/hw/intc/riscv_imsic.c
> +++ b/hw/intc/riscv_imsic.c
> @@ -371,6 +371,7 @@ static void riscv_imsic_realize(DeviceState *dev, Err=
or **errp)
>      }
>
>      msi_nonbroken =3D true;
> +    kvm_msi_via_irqfd_allowed =3D kvm_irqfds_enabled();
>  }
>
>  static Property riscv_imsic_properties[] =3D {
>

