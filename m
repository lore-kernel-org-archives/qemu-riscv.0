Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8E9CE7AA8
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 17:00:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkowA-00054z-Na; Mon, 25 Sep 2023 13:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkow3-00053r-Up
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 12:59:54 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qkovy-0008Dw-0T
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 12:59:48 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32008e339adso6481808f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 09:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695661184; x=1696265984; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jqSYDNSnY0nwFQ8ea2zEwJYdCQ/Mr4rxDQZrmwu1t7w=;
 b=wqReEPgdfY8RpEfLrRoJbR9Gb80YuscvDiY/MOnXNcAES8OVABaJJ7ujF9L8v8oxR0
 Vp11A8ay4h/FYewK8Ay2ahhoYjOA0LNH65ggaVJOt3REnGzEggeI9z1N1Pm+dB0aNEvK
 /gXI0m4s+HOI9JtPvbN8UgwO71WCMur6d77j2ML1MfxAjdlLpv1VIjQkaguhrhZzY7J4
 9QKh9tfKulzkNW5UF+zxFggjizGvGgs/96zdnBAvAW7KyLJjnGO0vxmjxaZIc7HjG3fL
 JX6UY4z6Px4PWSgN64EGmbng/v3IoMLAmHo2iDwDtANnA0hk2s8deZ1AOTt9XPv5LMmk
 zQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695661184; x=1696265984;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jqSYDNSnY0nwFQ8ea2zEwJYdCQ/Mr4rxDQZrmwu1t7w=;
 b=F1/F2goTatJzbtZq9/Dzwt1nk7xsFvYMUzRs88Z/gxJIbtyxmnkkQ77iU810A79JGP
 0VkzgKU41nquB215d8TQf6QOWcw6T7vYuijkMgslzrrTo9/6fmhwCr0rKRdpmeKlIWNw
 tOwiil0Io9ll+oaCKHmVSeiXqKgBXIOpBmkv9NcyCBXmwfGxuW1fE2BsYdFCnw4l+7/P
 lHWGeV4rBES/T0UzUAiBHM+e+EHA41A8sqfg5oxT4KBBBYImSWSDGck65VTDR1aUohzd
 HS6Z6RiTX2HxVaCB5MZ5R3JVefYwFJXr6Dxk0f2z7LaKiBaY93NirZOr2LLuA2cd6Pjo
 nwog==
X-Gm-Message-State: AOJu0YxXR3/TOn7xVx7Q1ojIku1ey3x+N2QlYmCume+QmfrWJvEs33s0
 ZfBo05AnhpYbjuQOzxOqxiAE/Q==
X-Google-Smtp-Source: AGHT+IH9GA9KAW7V6RTdPfPWmm0ieGHhT0nlwhyE1erZLl7CIQ3DNh/kh+xH1BH131U5wIFtJYFBMg==
X-Received: by 2002:a05:6000:1cd1:b0:31f:d32c:a38d with SMTP id
 bf17-20020a0560001cd100b0031fd32ca38dmr6872948wrb.8.1695661184124; 
 Mon, 25 Sep 2023 09:59:44 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a5d4d81000000b003215c6e30cbsm12215349wru.104.2023.09.25.09.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 09:59:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1651F1FFBB;
 Mon, 25 Sep 2023 17:59:43 +0100 (BST)
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
 <20230925144854.1872513-5-alex.bennee@linaro.org>
 <ZRG1g/2hWi8+AzNn@redhat.com>
User-agent: mu4e 1.11.20; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>, John Snow <jsnow@redhat.com>,
 libvir-list@redhat.com, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>, Daniel Henrique
 Barboza <danielhb413@gmail.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>, Nicholas
 Piggin <npiggin@gmail.com>, Radoslaw Biernacki <rad@semihalf.com>, Eduardo
 Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Bin Meng
 <bin.meng@windriver.com>, Alexandre Iooss <erdnaxe@crans.org>, Xiaojuan
 Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org, David Hildenbrand
 <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Beraldo Leal <bleal@redhat.com>, Rabin Vincent <rabinv@axis.com>, "Edgar E
 . Iglesias" <edgar.iglesias@xilinx.com>
Subject: Re: [PATCH 04/31] docs: mark CRIS support as deprecated
Date: Mon, 25 Sep 2023 17:50:22 +0100
In-reply-to: <ZRG1g/2hWi8+AzNn@redhat.com>
Message-ID: <878r8urxxc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Sep 25, 2023 at 03:48:27PM +0100, Alex Benn=C3=A9e wrote:
>> This might be premature but while streamling the avocado tests I
>> realised the only tests we have are "check-tcg" ones. The aging
>> fedora-criss-cross image works well enough for developers but can't be
>> used in CI as we need supported build platforms to build QEMU.
>>=20
>> Does this mean the writing is on the wall for this architecture?
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Rabin Vincent <rabinv@axis.com>
>> Cc: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>> ---
>>  docs/about/deprecated.rst | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>=20
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index dc4da95329..7cfe313aa6 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -399,6 +399,17 @@ Specifying the iSCSI password in plain text on the =
command line using the
>>  used instead, to refer to a ``--object secret...`` instance that provid=
es
>>  a password via a file, or encrypted.
>>=20=20
>> +TCG CPUs
>> +--------
>> +
>> +CRIS CPU architecture (since 8.1)
>> +'''''''''''''''''''''''''''''''''
>> +
>> +The CRIS architecture was pulled from Linux in 4.17 and the compiler
>> +is no longer packaged in any distro making it harder to run the
>> +``check-tcg`` tests. Unless we can improve the testing situation there
>> +is a chance the code will bitrot without anyone noticing.
>
> Deprecated is generally a warning that we intend to delete the
> feature.   If we're just going to relegate it to untested
> status (what I'd call "tier 3" quality), then we should document
> that elsewhere.  I don't mind which way we go.

We do have reasonably good coverage with tests/tcg/cris but of course
without a compiler we can't build them.

Both nios2 and microblaze have build-toolchain scripts which can be used
to re-create containers. However my preference is having pre-built
toolchains hosted by others like we do for loongarch, hexagon, xtensa
and tricore. Then the docker image can simply curl them into an image.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

