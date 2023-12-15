Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CC9C4332F
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 05:36:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rE0rM-0001a5-7d; Fri, 15 Dec 2023 00:35:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rE0r7-0001Xh-Md; Fri, 15 Dec 2023 00:35:27 -0500
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rE0r5-0003MI-8O; Fri, 15 Dec 2023 00:35:25 -0500
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-4b2c34bcc1eso107157e0c.3; 
 Thu, 14 Dec 2023 21:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702618522; x=1703223322; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zSsG9xJNygGbLfdWQL0zVatbAIrnp7H+NiOG3cwFmUg=;
 b=KyURcyZe34FBlv2W6kzoaFKHzQpiGuRj0yOpP8g9hsMxP9/DE02QciD3r8zUp52idE
 uGgULMFysbL/w+RA+hc9YxD8QlFDX9YQRAnFrhc/xSVs0xtR+3Ju6OQskt6XtONfQiLu
 NUyuyXng8TdKgXEX80t1BiWTa6hT8EitZyf73IGWDfusqQE7I+Z91W6UKYvbq2h22Gf2
 uBXbIPB8RK/CAvwX+SDHADaFMulHMYAbJQJls2QEu6DebOYcfFs0M/xS0OoYTCdobS0R
 AZF7SfcbClVUojSFHfqYRdkAfvOpMfp2o9dIZv0jzzUY5Tu2JqQYl2wLjTDtTyYXenOM
 T/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702618522; x=1703223322;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zSsG9xJNygGbLfdWQL0zVatbAIrnp7H+NiOG3cwFmUg=;
 b=L0UzPyG+/SL5gdFlN2uycflZVVc8meTU2R1Q180Z75LqtDxQ0PrGr0qo5am1D5DuSn
 hxY/COptm3JQ4Sp6Tr0S3GOeLwkUaA9nxfilSkHT8tbem1z4ucig8uyfYCEuHfAKsaEM
 qN9OH64R924m5xg6IMuwegKePToTJEyRG9VdG+duwASLoa7k+zbau4V9rjZU3svx+7fS
 IBAV/3iSM9u6AQEwVo/BNPflYMlCbJySAIibn/Qy0WLFdymrJeOalnt4+1TPrTb0D1ca
 wo9XqJewCW3MNQEz5sRooNr/N/I78p3p1+3cqD5ZqJ9AyhuXU7AyLVAy74PHjqg40KWl
 bfWw==
X-Gm-Message-State: AOJu0YwGaDYYI+y+0NmMft9f1TSZcWR9NuMGLX9egyiw+EHtovCtENra
 +/rQX+ahHVczWnHeTssTLuoCW5TGPBWyMkaMUnw=
X-Google-Smtp-Source: AGHT+IEWx4UN/IZP43q6F9D7nSMmI7JQePhHQ5sPKIzws6v2P8ikunEhkUlEo0EYkTDjCLKKrFdPpOEgcdsMl6ZzuJI=
X-Received: by 2002:a05:6122:201e:b0:4b2:c554:dfc2 with SMTP id
 l30-20020a056122201e00b004b2c554dfc2mr11455141vkd.17.1702618521718; Thu, 14
 Dec 2023 21:35:21 -0800 (PST)
MIME-Version: 1.0
References: <20231030054834.39145-1-akihiko.odaki@daynix.com>
 <20231030054834.39145-2-akihiko.odaki@daynix.com>
 <CAKmqyKMo41GMJ0vVN2_CsfOVrfsz8H9AtxTe6-JbtX+Pi6B3DA@mail.gmail.com>
 <fcf3a810-7492-4f60-9126-63713d6a30bd@daynix.com>
In-Reply-To: <fcf3a810-7492-4f60-9126-63713d6a30bd@daynix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Dec 2023 15:34:55 +1000
Message-ID: <CAKmqyKOvwZ71+pGz-HSvE29U9a2dbYVPLR0Li2ak5ji+_Ez4-A@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] hw/riscv: Use misa_mxl instead of misa_mxl_max
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov <a.anenkov@yadro.com>,
 qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
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

On Thu, Nov 23, 2023 at 5:24=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> On 2023/11/23 12:04, Alistair Francis wrote:
> > On Mon, Oct 30, 2023 at 3:50=E2=80=AFPM Akihiko Odaki <akihiko.odaki@da=
ynix.com> wrote:
> >>
> >> The effective MXL value matters when booting.
> >
> > This doesn't sound right. Surely the max is what matters here
> >
> > Also, this was specifically changed to misa_mxl_max in db23e5d981a
> > "target/riscv: Replace riscv_cpu_is_32bit with riscv_cpu_mxl".
> >
> > This needs a much better description of why this change should be made
>  >
>  > Alistair
>
> The kernel will be executed with the current MXL rather than the initial
> MXL value so the current MXL should be used here.
>
> For example, if you are going to emulate a system that has a RV64 CPU
> and a firmware that sets the MXL to RV32, then mxl_max should be
> MXL_RV64 and mxl should be MXL_RV32, and the kernel should be assumed as
> a RV32 binary. Loading a 64-bit kernel will not work in such a case.

But this is called before the firmware runs, so it won't be changed by firm=
ware.

Maybe it's worth putting what this fixes in the commit message?

Alistair

>
> You can find a similar example in x86_64: x86_64 systems typically
> starts in 16-bit mode, and the firmware switches to 64-bit mode. When
> emulating those systems, QEMU switches to 64-bit mode and loads a 64-bit
> kernel.
>
> Regards,
> Akihiko Odaki

