Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97541CCD1BF
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 08:47:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDfLs-0004E4-II; Tue, 28 Oct 2025 04:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1vDfLn-0004BB-2j
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 04:46:43 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1vDfLj-0006TF-JT
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 04:46:42 -0400
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-4ed0d2a949dso1932011cf.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 01:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761641197; x=1762245997; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=74c4+HqxRJPus9bQybEz+YN4FB48AHHcS3sr1YkogJg=;
 b=IcvSbhL1ZGFLVcTUotjTFyI4ByQbVwWJLU+YVa1YRCGxMzU7LajnMviEMqyp5nu6Ch
 Ximv7tdccAfCIdoWo8XRryg1cGCAVTV//U9TxKoqLvFatfnJMuzHxt7/b3GHpwAxT5hk
 AgwiIb0M8onXgFTy4PEJv0smBfuVnHQOguC2W2SvQoZW5JsKGuyrXRieGLZoXSWUzC1j
 CwFzor9FDthC6HeZrOBP4EO+usP9yqXH6me2XnpG+aYx8n5OqUrWnPq+NIgqfiWajYSF
 QUx4gXZOQ4iPF5PbFUhzhyr/obQmaorAu9XMBf6lfBA90iDWR2PkeuhKMqQgFVgdMmNj
 RCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761641197; x=1762245997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=74c4+HqxRJPus9bQybEz+YN4FB48AHHcS3sr1YkogJg=;
 b=WNrGsIFeQ3h0fxN6NgIA+iJFK8PbX0Byc+lvIrsq0ZBHUeT7fbzG2IyXW8j34oDIOZ
 hUqe2etGTQsYf2jXNf/rK1wzrq4sCl3Aw+/hO3/X/eK72roZuU3MtLKJQ8o5ztvrxlRp
 ylyiZIqzki2I4mUndO/klM6E+RmmBrCd9h5xKunk7QOjwG7Qg4TxoX/qeVLGF3pHZ4bv
 XX0P6e3IKngBMpltCPwDdAP8JQoyrGNUsQHNPih8J30nosKW516fqn7y7xlX7HcpbYyi
 qlpnHRcw44PXhpr0krrjYBdjZT4ZJI8RM7d5KHTsjCfryvJyEKVAavkYTO5uEPZVO5Zy
 WmAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX92qa2bKQM30y6gXxYSQ4H/oKmudVdX5pMhSL/Z4Z2mnFikfwRHrcBd4RF8nnK6tXmKmdasIvFFEq7@nongnu.org
X-Gm-Message-State: AOJu0Ywn4l8JUmxEV/HDpP+So1SVknX2eKd4+oUcLrrh3bt1d/xb8rNl
 hs8QKruKBLbHYtS14NBnbgVUgAylLqW+WoF5oQPV4a/4ce3BlqFfTWG0LHZjyuaDzKJLILcKoSI
 sHShQZRUp2dIKbaazMxW+Eh6OHyXhkQ4=
X-Gm-Gg: ASbGncuWClrjqHal39Fs8mf3D/jaIkaHg2l+0S9dk+VgvS+omR+2s1R0KhDm0jtTDaP
 s3xXoclRr8B9m5kLZIZIHyMFQQ/Wm9SfLVIchFarowAOhVIOuW6P6bYXAjG0suczPP29HYiLNqr
 u2VZ9DfqBeBhe6YITuwC/4waprvLkVjaDFJVJ+fPjoCov6PQxSzEtj+aoY6W8ZhbFB75gPdrN7A
 qQwaV0Wnms33SvdnCXWi4apbBRT5aUuuLnHIJL6r2MgO871iVw+zGhoPgRNWZMfxWkJ3Fw6e6Ki
 kpBCTNF+Z2ExDxHO
X-Google-Smtp-Source: AGHT+IFzNNq0xtkG3HBZV+k9Q4Qh4wBkcSOloZPVyfaympGwhInn0h4RZJZpXf6Rit9f1sgCDBkCbzqmNa2FO97Oecs=
X-Received: by 2002:a05:622a:4244:b0:4ec:fa43:4d58 with SMTP id
 d75a77b69052e-4ed075cd25bmr42364871cf.50.1761641196777; Tue, 28 Oct 2025
 01:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251028080258.23309-1-philmd@linaro.org>
 <20251028080258.23309-2-philmd@linaro.org>
In-Reply-To: <20251028080258.23309-2-philmd@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 28 Oct 2025 12:46:25 +0400
X-Gm-Features: AWmQ_bkThyhwBWC8TUuZxvYfJI7M5STrRVP98r7pdXwiwEosZAsP-gMPAiyy5zo
Message-ID: <CAJ+F1CK=CcFS3xxWQtoEcYBmSoTFKwaAqZz=BsBcevp6ZXh=3w@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] hw/sysbus: Use memory_region_name()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org, 
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Tue, Oct 28, 2025 at 12:06=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> MemoryRegion::name is kind of internal. Use the proper
> memory_region_name() accessor, which might return a different
> name.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  hw/core/sysbus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> index ae447c1196a..d33be6b2b52 100644
> --- a/hw/core/sysbus.c
> +++ b/hw/core/sysbus.c
> @@ -154,7 +154,7 @@ void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr=
 addr)
>  int sysbus_mmio_map_name(SysBusDevice *dev, const char *name, hwaddr add=
r)
>  {
>      for (int i =3D 0; i < dev->num_mmio; i++) {
> -        if (!strcmp(dev->mmio[i].memory->name, name)) {
> +        if (!strcmp(memory_region_name(dev->mmio[i].memory), name)) {
>              sysbus_mmio_map(dev, i, addr);
>              return i;
>          }
> --
> 2.51.0
>
>


--
Marc-Andr=C3=A9 Lureau

