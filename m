Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017A2CCD1BF
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 08:49:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDfO4-0005mw-N5; Tue, 28 Oct 2025 04:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vDfNu-0005mL-B6
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 04:48:54 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vDfNr-0006d3-22
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 04:48:53 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4710683a644so47310335e9.0
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 01:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761641325; x=1762246125; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WQv72y0FXMxHo4R1brH6PeUUPynEY6XFnnx0SFP9c3o=;
 b=QRmc8TFXd9poPGwvEsqBU+4mvh6YaikEDoQRHvIKfapfPi3E38TqLEa1jpBRrCYPbE
 sykBjfCuoESVxTtVSRNTqXwsl3XG4EYzCr+OaXnssC2sA6MihkIsh9RM7oTNMx/gLKld
 n8JNId29ysgRhgUEEa/kneZ/AGmBaIIfwQ+aCdWHTpCmHPSiy9h9tJvL05Gosr7QGwjl
 wc4oWHJFAnlhv1NIdy+dA154FfB12P29S1uxWIn7lyQuk/uVOr//tMDe5vHBPTjFEvw1
 CzuHPwo3Hg/0joLhJdD80ZJyVXZv/ZDN6MnESIS+ULDoI0tj3QEWfrP0FiF7iK+FJ3Y4
 S5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761641325; x=1762246125;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WQv72y0FXMxHo4R1brH6PeUUPynEY6XFnnx0SFP9c3o=;
 b=Ncn8ICgyfqx8gHt4ufAIzcckzzfAaHoog0H++cqf0vBplQ+2g09ugco2mXtBDf5Nr/
 yptInXwcJfYnEBhRYlThGx8tjoxt7s17j9RsbFV7oE5vnzIF2t5DfMyBjNR1oqpGB5KW
 5Ee1MKMYvldbtDhrwf+8Vu2x3G1S0T8bu4zoRSBPJt+5w2fxJnaT4bUagNeXmixohS0v
 ExOCJi8S2y1ASggNO7foZJVV7zA2H/KjrkGFOrbQUKz4ubr9Dv8GcFAj7BJnXaHB6tZ7
 CbMtxLsaE52le4y3hUy21KDrO7n5H+u9cny9JK21gXXpmO4H+AtBSe14m3B4t6UYq0KB
 gLBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIj3rOJmg9D0s2x5iEVL7kAKFLprwc48KZHKUbJYLFGXtSBR6/qn2vutpMJ7JbjLc4n18MzdW7aBZQ@nongnu.org
X-Gm-Message-State: AOJu0Yz9Hjf/KUWN5p9PJBeJa6NgDGQVaLNBd70C12VoxqcHmYp4e01j
 QCd+HNvzFnXTkUtVuNLbvw2bXFD/NvQgXNwIeBIkwszaxDqzY75FSpzr
X-Gm-Gg: ASbGncuxDLMih2KA7gEq6vZQ6FYpN+vV1YmYAX4vfh4l1wuMzf84NbdWJxjZjrblXg7
 BGfPJMzUkjmaE5ktTEnfhwC9xbnuasnf2Kca8i6Q0VH6ZGad+JZTd64zWrLifGwoRiMESzhWNcI
 lytIigXtC+Az22b9JAzRlzXK+12voKLsB1uqPYDbcNj71x65JIfBWKjdAG1KeBg4L4u88ID3HYH
 8uCrPthyTJJei01q3to+t7i/jEpP/MuL/4hu0PnAxpvlGpJIDuYsmgEylUfVV3LLcExXI+ZVo4j
 GnmmCOiC01+5L/C9c7RdN4QVtj9H/aj2A9nQ+4gDIVFp44S7EfARnhwvxscTolshn8D1XpmfDHs
 RYuzENJdsGvs2qJvCBmHsELuhQP1tSuo1+Wkei0xhCDE3cb8jK0X3z4UEcd63Yh8fFh8qA75GwH
 wYoVQoVWYkx6A3wqkvaBzJo7hTB5irCHM7XcjnqvhinBzyapI//SD+EVZmY9zmnHLNyN8JcFQbF
 usnpNWw0ts=
X-Google-Smtp-Source: AGHT+IF+bXKN0eXZjcdzIcJXWHAZ7wGiGx2tI03419aHzTho2s/tQpQ7tWzG4kowPpu3mN+qokjMJA==
X-Received: by 2002:a05:600d:830f:b0:475:d91d:28fb with SMTP id
 5b1f17b1804b1-477180f3b54mr13453825e9.4.1761641325284; 
 Tue, 28 Oct 2025 01:48:45 -0700 (PDT)
Received: from ehlo.thunderbird.net
 (p200300faaf271400c439911fd9f45c3c.dip0.t-ipconnect.de.
 [2003:fa:af27:1400:c439:911f:d9f4:5c3c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd478202sm182509315e9.14.2025.10.28.01.48.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 01:48:44 -0700 (PDT)
Date: Tue, 28 Oct 2025 08:48:42 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
CC: Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_docs/system/security=3A_Restrict_?=
 =?US-ASCII?Q?=22virtualization_use_case=22_to_specific_machines?=
In-Reply-To: <CAFEAcA8RaZOXpav64E5-0CDhB66zQXRuLaFuz22GiyPGwGVQJw@mail.gmail.com>
References: <20251016131159.750480-1-peter.maydell@linaro.org>
 <CAFEAcA8RaZOXpav64E5-0CDhB66zQXRuLaFuz22GiyPGwGVQJw@mail.gmail.com>
Message-ID: <000E4FA1-EE4A-476B-8CAE-680FC068BCAA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32b.google.com
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



Am 27=2E Oktober 2025 12:48:29 UTC schrieb Peter Maydell <peter=2Emaydell@=
linaro=2Eorg>:
>On Thu, 16 Oct 2025 at 14:12, Peter Maydell <peter=2Emaydell@linaro=2Eorg=
> wrote:
>>
>> Currently our security policy defines a "virtualization use case"
>> where we consider bugs to be security issues, and a
>> "non-virtualization use case" where we do not make any security
>> guarantees and don't consider bugs to be security issues=2E
>>
>> The rationale for this split is that much code in QEMU is older and
>> was not written with malicious guests in mind, and we don't have the
>> resources to audit, fix and defend it=2E  So instead we inform users
>> about what the can in practice rely on as a security barrier, and
>> what they can't=2E
>>
>> We don't currently restrict the "virtualization use case" to any
>> particular set of machine types=2E  This means that we have effectively
>> barred ourselves from adding KVM support to any machine type that we
>> don't want to put into the "bugs are security issues" category, even
>> if it would be useful for users to be able to get better performance
>> with a trusted guest by enabling KVM=2E This seems an unnecessary
>> restriction, and in practice the set of machine types it makes
>> sense to use for untrusted-guest virtualization is quite small=2E
>>
>> Specifically, we would like to be able to enable the use of
>> KVM with the imx8 development board machine types, but we don't
>> want to commit ourselves to having to support those SoC models
>> and device models as part of QEMU's security boundary:
>> https://lore=2Ekernel=2Eorg/qemu-devel/20250629204851=2E1778-3-shentey@=
gmail=2Ecom/
>>
>> This patch updates the security policy to explicitly list the
>> machine types we consider to be useful for the "virtualization
>> use case"=2E
>>
>> Signed-off-by: Peter Maydell <peter=2Emaydell@linaro=2Eorg>
>> ---
>> changes v1->v2: updated the list:
>>  * remove isapc
>>  * remove ppc, mips, mips64 (no machines supported)
>>  * list pseries as only supported ppc64 machine
>>  * list virt as only supported riscv32, riscv64 machine
>>
>> I believe the list to now be correct, and I think we generally
>> had some consensus about the idea on the v1 patch discussion, so
>> this one is a non-RFC patch=2E
>
>This has now had various reviews and acks, and no
>suggestions for further revision=2E I propose to take
>this via target-arm=2Enext, unless anybody has any
>objections=2E

Sounds good, I'm looking forward to it=2E

Maybe we could then also merge https://lore=2Ekernel=2Eorg/qemu-devel/2025=
0629204851=2E1778-3-shentey@gmail=2Ecom/ which had some technical comments =
and no follow-up=2E

Best regards,
Bernhard

>
>thanks
>-- PMM

