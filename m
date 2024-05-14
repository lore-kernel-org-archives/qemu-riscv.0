Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F6EC25B75
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 May 2024 16:53:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s6vOu-0007a8-Gp; Tue, 14 May 2024 12:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1s6vOl-0007ZN-42
 for qemu-riscv@nongnu.org; Tue, 14 May 2024 12:53:07 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1s6vOj-0002UI-45
 for qemu-riscv@nongnu.org; Tue, 14 May 2024 12:53:06 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-51f174e316eso7089845e87.0
 for <qemu-riscv@nongnu.org>; Tue, 14 May 2024 09:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google; t=1715705582; x=1716310382; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Gv2b3TU8zPjY3OZoVr5HBCcC6uCtFh6xvKQvXxm6Nc=;
 b=Bzrp9lUAqmGehWiaWdDxoE0/kX+ra8ficHrRcSuy3U98sgo84BtV/6gNw9V9Cu8Mp2
 p/YaHOJ+jhxs1efjiqlZHnF5FXxZ9NJSMGVaIWSoWWIc+udB6gm7Axgyrc72sMjc8LB5
 TMYizZkW1KHH48FLCkKQh0LKMedXmokwWxIvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715705582; x=1716310382;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Gv2b3TU8zPjY3OZoVr5HBCcC6uCtFh6xvKQvXxm6Nc=;
 b=ZqCbUKtPLrduefsT3G4yt6LKXitCN2tFr5yeVMHzi2O7ZICIXH3eDPxJ48ARgbFsz2
 xsOOgbkwKH6cHfG3v0+OGKMI6hrvnJA6M+2MJBls+mY4Zv4fxox/CvYhtx0W4vJ8Hock
 orkoLqZDjqzodkujiTzPd20R08ifdp+UBUEV9Bf3leNPPamXUWvpp2QaNYC5LTKUqJ4K
 ZL+K/87jH11QH4dOFD3DIK7gw+iMiP4dA34iqWU3tqyM8B494SarKh2zudNZuRO7dA4/
 Bdqd7gCQQYQ+XN2GxbwtNM5VH+AKh1R4Aq6ZeUnh/jTx3APrfE+CaDDTNyaK8XvKR2A5
 sx7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzu6sxGl76m772h8m48Ob93WvsQmsydqB4w+0TK8zXMoTuDEA+6t9pqerSZzYmCf99XMa/CEVX1PnwZ3Ge1qkEj/u3nsg=
X-Gm-Message-State: AOJu0Yw2hFZiqDPFuqWOF/iDH/Knf/CZxFXL59EE4NsQW1m4GbKqqIXJ
 P+VLkpvi9PhsOutxX6DO2ew2m/hxvBQG6iQsuubQy4Mnnw0rUn0XYdZDNsFqSVoZB/F4Z2VnNdW
 m95uYjpCBK+vkdrEGjdwnklb6JcSxAFNOs3HZ
X-Google-Smtp-Source: AGHT+IF9agKfrfJtbLfEbyyGBnkzwOzSfCc9XuvnaQqgU4uaq0jSrb0qCpA58gl17M5eZdY0K/wRolgwjlTwoULRnus=
X-Received: by 2002:a05:6512:3d1e:b0:51e:b5b6:29fb with SMTP id
 2adb3069b0e04-5220fb6b0f8mr12866683e87.21.1715705582622; Tue, 14 May 2024
 09:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240429-countinhibit_fix-v1-0-802ec1e99133@rivosinc.com>
 <CAFEAcA_33s35DmdEQ=+O_kSodgEUg=R49n+iXOqEcmgY4Ng_8w@mail.gmail.com>
In-Reply-To: <CAFEAcA_33s35DmdEQ=+O_kSodgEUg=R49n+iXOqEcmgY4Ng_8w@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 14 May 2024 09:52:51 -0700
Message-ID: <CAOnJCULyZTWV=v9P_BvL0z5HYFB4aK2npaUJrtGsfV0Jc=6rWA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Assorted fixes for PMU
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Atish Patra <atishp@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, 
 palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=atishp@atishpatra.org; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, May 14, 2024 at 2:16=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Mon, 29 Apr 2024 at 20:29, Atish Patra <atishp@rivosinc.com> wrote:
> >
> > This series contains few miscallenous fixes related to hpmcounters
> > and related code. The first patch fixes an issue with cycle/instret
> > counters overcouting while the remaining two are more for specification
> > compliance.
>
> I've noticed a number of riscv patchsets from various people
> recently where the subject line for the cover letter doesn't
> include any indication that it's a riscv related patchset.
> For instance this one is just "Assorted fixes for PMU", which
> could easily be an Arm PMU series. Could you all try to make sure
> that cover letter subject lines indicate the architecture or
> other subcomponent they affect, please? This helps people who
> are skimming over the mailing list looking for patches relevant
> to them.
>

Makes sense. I will include RISC-V in the series cover letter as well.
Thanks for the feedback.

> thanks
> -- PMM
>


--=20
Regards,
Atish

