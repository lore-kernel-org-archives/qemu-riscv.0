Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEA7CCFA13
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 19:10:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vIXH8-0001yP-HB; Mon, 10 Nov 2025 14:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@videogpu.com>)
 id 1vIWuO-0003ga-33
 for qemu-riscv@nongnu.org; Mon, 10 Nov 2025 13:46:32 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <michael@videogpu.com>)
 id 1vIWuL-0002DR-S3
 for qemu-riscv@nongnu.org; Mon, 10 Nov 2025 13:46:31 -0500
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-37a3340391cso32825181fa.3
 for <qemu-riscv@nongnu.org>; Mon, 10 Nov 2025 10:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=videogpu-com.20230601.gappssmtp.com; s=20230601; t=1762800387; x=1763405187;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+qxwc8BjTGv1PJbS/5O3QnvovBnKk7to9MfKbv4uVTg=;
 b=Udg5H/5NKhADPzGhmdSOMGD6lhxcb4Cc+xtRYSgYzpSfZqeUT7la+hUtnP6Tl9m+ts
 50jvuhe7qCPiU99E7cEp4jqfGelwJyhY0Vdtl2B3HGy1mKmXdikOxJVtlmlqCAmEl6/j
 s3lWgppeqWc5XeaYgzwCzEB81kqdYqkMQC5YQdsrXZZUqq9IhdyY9yFUlvYPKUBS27CH
 rPrQqDP4FOGDLKwOlYpwfkqNU4VrT/neX7C8l7pNL/YgXp+4URT3d8kwyfpGh5/+BMrw
 IBcBxWPXASliEeuCUXJwvtiygB7Ajrqfnl4Ng2ZtYx4EtB4s2ARXkCRIo44Yvq+5u91L
 aZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762800387; x=1763405187;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+qxwc8BjTGv1PJbS/5O3QnvovBnKk7to9MfKbv4uVTg=;
 b=ltalwFGIZExfQS8t4bgyWaq6Ncf9L1FrjFKxWngdQFnZe6sBwR4ECwv8s60HPfrvn8
 eW64TTNCixZ9GgRbnd7556Xs6Obnd5i/JlPXr2W3jN6Fbmy+V4onfWXTrrB1fY5fkY+U
 r9A0HWq+sY6eLm7H/iTyvwY/iO4/HKmQ05Zr/5p8rag1SKg/Uknc0MGJevnLrQB2KkJD
 3UOFiQnNb+B1iuJnfIS0414dxGC18nYmhOUFM1QXjUJdpgx+3aklAkwFWKqvDUAXpIlp
 u9DGdg1eGJ+/Sn2To4cWInAhpi0l2OhKh18giZL+/DVxrLyO9aOqOttbsDxEFeo8QOXs
 /mGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRzbc/8VYDWWyqzjq9X6GtaxrNm46cwp/bGN2GeCd8MmJaFUH8mNWDhVUWDbI6cRt+33nwFGhrxBgr@nongnu.org
X-Gm-Message-State: AOJu0Yww3hsQyxMoG5IaJLSV+QgPMK8kHoajXqhLykN80dTcW2x0ximI
 9w0wRtl2yfbkitZY7HJA2sp4+bjn/6QEFzNjchyZPdSiUSIQEljEiHdCQ5/MIvba9vFCXYK1Ymm
 hAEy6Pl9LNE0Uzqb+2H9khFLDXUbsWVh6HTGoXoE3qw==
X-Gm-Gg: ASbGncswZltL4+oAEOfCaFDr1qLl3QlopXNze5BuY5ydV61qTuc8wMb93C7sSfTmZk3
 n2lpnukC/rgAZsTXB9Iwle7XHxTobz4Tb/EOcpdf/iOsFRvuNOHz41ucQUYLrvvogdiPoenH4k9
 PydaeDarQwY8KOR0Sg2/QiFO4RJnCfISxsZrAWa7QSXWIDYDPuk2OdGJBOb+rxQHOe+NvkkkXqn
 H4heBBeqHO33JeDySLPkASvoiIV7FkA/hZsYfgm3v1+mKrRxp+5Ee5cJWRXYJgYn80vTzDvwHXb
 zDWwGgRR/eM=
X-Google-Smtp-Source: AGHT+IGyAABh40RoE19n2tBxVMnI5ZCMhHRjdBAUp5oTZzLmmJCkCdr0h8V9fN12f0BS2E03cFPb4KOfyjOnte6txfs=
X-Received: by 2002:a05:6512:3c8c:b0:591:edea:8dab with SMTP id
 2adb3069b0e04-5945f1dab85mr2770297e87.38.1762800386903; Mon, 10 Nov 2025
 10:46:26 -0800 (PST)
MIME-Version: 1.0
References: <20251109191532.32419-1-michael@videogpu.com>
 <d3f15618-3f1e-4e41-9e0b-228923c78e42@redhat.com>
In-Reply-To: <d3f15618-3f1e-4e41-9e0b-228923c78e42@redhat.com>
From: Michael Levit <michael@videogpu.com>
Date: Mon, 10 Nov 2025 20:46:15 +0200
X-Gm-Features: AWmQ_bnxYipt4rKavgZdMHdH2inwCBj5AG2wRVBI_Bi6XS1cvsuGL8QPiN9vEW4
Message-ID: <CA+KCYksKitF6YO390y9JhHWaE2bvKw1nPJ0Axq8FvJyCgEEfqg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] RISC-V: NEORV32 CPU, peripherials, and machine
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, philmd@linaro.org, 
 pbonzini@redhat.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 liwei1518@gmail.com, smishash@gmail.com
Content-Type: multipart/alternative; boundary="000000000000df1bb4064341f2f7"
Received-SPF: none client-ip=2a00:1450:4864:20::234;
 envelope-from=michael@videogpu.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

--000000000000df1bb4064341f2f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
>
> Are these binaries available publically somewhere on the internet?


Currently, as far as I know, there are no prebuilt binaries =E2=80=94 only =
source
files for the bootloader and firmware examples in the NEORV32 repository.
I compile the binaries and prepare the flash image locally.


> If so,
> could you please add a test in tests/functional/riscv32 that make sure
> that
> the machine is basically working, so we don't face any regressions in the
> future?
>

I can upload the generated image to my GitHub repository, or alternatively
to some QEMU-related storage if there=E2=80=99s a preferred location?
The test image is around 4 MB, plus a few kilobytes for the bootloader.
I will add the test of course.

Thanks for the review and feedback!

--000000000000df1bb4064341f2f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
Are these binaries available publically somewhere on the internet? </blockq=
uote><div><br></div><div>Currently, as far as I know, there are no prebuilt=
 binaries =E2=80=94 only source<br>files for the bootloader and firmware ex=
amples in the NEORV32 repository.<br>I compile the binaries and prepare the=
 flash image locally.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">If so, <br>
could you please add a test in tests/functional/riscv32 that make sure that=
 <br>
the machine is basically working, so we don&#39;t face any regressions in t=
he <br>
future?<br></blockquote><div><br></div><div>I can upload the generated imag=
e to my GitHub repository, or alternatively<br>to some QEMU-related storage=
 if there=E2=80=99s a preferred location?<br>The test image is around 4 MB,=
 plus a few kilobytes for the bootloader.<br></div><div>I will add the test=
 of course.<br></div><div><br>Thanks for the review and feedback! <br></div=
><br></div></div>

--000000000000df1bb4064341f2f7--

