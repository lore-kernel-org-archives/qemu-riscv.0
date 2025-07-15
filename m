Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3FEC83F17
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 10:07:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ubcZ7-0000y2-Cc; Tue, 15 Jul 2025 06:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubcZ5-0000wT-Ph
 for qemu-riscv@nongnu.org; Tue, 15 Jul 2025 06:07:11 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubcZ3-00029M-J2
 for qemu-riscv@nongnu.org; Tue, 15 Jul 2025 06:07:11 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45610582d07so17415315e9.0
 for <qemu-riscv@nongnu.org>; Tue, 15 Jul 2025 03:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752574026; x=1753178826; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ptqoZ55tBMoXVh25fn85EYsaDzQkgTXiiNRuyERDgz8=;
 b=AIgy6UManHrCULZC/+NRaTXrX+cN9J+4d4uyOUmvFB8YkwEatGohG612uoX4UQAUlq
 CGO3SgdlaKZ9lC0DmWQP4f4ukLAsY6bZxulRNXpdfbLBB3RhQ2fAiFTOdkoVjDymrb6w
 oeP8mvVpp3CIvmg8tYsuurg/dZrMIp2hH1uCiqnVi1FmArQSRpEcrzri0bpe3uONllSB
 GfKfYFr1zleVS+SXdOyzv/GZOJ+m0EVAEwQqrO5S/W2+Wfmzq9tvhVoPzA7Zovmco7Dq
 HUQKYpyd08FW2GZovnMnyiFAXLEWQ+07aG4o4wUG0qwpDfIjIOFqQpqvKaCMhN5jkTeB
 cQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752574026; x=1753178826;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ptqoZ55tBMoXVh25fn85EYsaDzQkgTXiiNRuyERDgz8=;
 b=wBBaANRlJFNr/4buKOovAhsUmP6m+MWl2L1s3lqEG0fHr7qKbvDskcvXf5UwJXIYHW
 NHPiNkW09hsxb44ZaUqKlLCXN3y+KdLeanUterikt8z/aUMNutKweQ3fFHXyeOkIppSc
 csMv2DK9V6aNj0krGcObEryg1ikySpXEVQRiDUnkd6lJ8wZlA1UmyoO0hLqNYZtSsRpQ
 q/mT3ZOK5hLwk5GiST6iM3iMgwkSFj1yagj2Im1MT1ZHLy+I+KOpgEi1N21VVCSaKWsN
 vnJEUaeSN6En/Z78thpVJOuOC86k6Kty4HhKZgpXNbA8XPgqJ6pA2+A+FFhliUVA55js
 pBEw==
X-Gm-Message-State: AOJu0Yw/CvCT5Ukyi5DUWAKD1Dd40Qqd7voZ2IgX3i+scQ3sdj5npgdJ
 S3IIGuLbOquUQu5DOZGDpDssVfEo8nFh760Z06JlUPyyikWpF2+Cftt/gRAAtN/5lDo=
X-Gm-Gg: ASbGnctp9gI/bVVV4Tu7oiCZu63+Yg0atPmv3ilxYahH+bU/yInNBsoP+uXGHrJyD0P
 XsTdkGu7hJ8opx0rMJp9KdgUWTAsXA6t5yJqPzzTAiJCi8EK+dJm4G4/tN3t+EKNlW1VqEI1Dcu
 zrE8tMqW7SsLqv4HvW8mBFGtot4dZctaS7rxKG1TsXdtzJeuXv47jDZLWkLfa/729uGkk0TF5nb
 DEivkt+5nCFCj0UqDfsKahIU6iLd2qMsmNzGDItPhwgFWI1jIHSJlFdrhCBiuWvXUFM4GJx3sx/
 EIECjmjuy/KPaqbrpXCPznlEBGl7oS3Ta4F1/omzNtCsvMFShU3mFdx88m+RAyLU8hfjgIz/hRr
 LsYontGBqeXYM5RCwTFzAyS1fDD5MkRxjZquaUUzSIhp97kYZNi/5e7vjnMwQF8MCRLHdXkw=
X-Google-Smtp-Source: AGHT+IGqlyJq9r+9hdMszPNZErV7UUPsxvoJwXbZnrbRMDALKSxJrgeIzroJ/hNrv7olEEb2cwvz/Q==
X-Received: by 2002:a05:600c:1913:b0:442:c993:6f94 with SMTP id
 5b1f17b1804b1-4561a16064fmr78933425e9.12.1752574026151; 
 Tue, 15 Jul 2025 03:07:06 -0700 (PDT)
Received: from [192.168.69.239] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e14e82sm14792905f8f.71.2025.07.15.03.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 03:07:05 -0700 (PDT)
Message-ID: <97a9b456-9983-4c1f-8fb2-5bba94c95655@linaro.org>
Date: Tue, 15 Jul 2025 12:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/11] hw/riscv: Add support for MIPS Boston-aia board
 model
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>
References: <20250703104925.112688-1-djordje.todorovic@htecgroup.com>
 <20250703104925.112688-10-djordje.todorovic@htecgroup.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250703104925.112688-10-djordje.todorovic@htecgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 3/7/25 12:49, Djordje Todorovic wrote:
> The board model supports up to 64 harts with MIPS CPS, MIPS GCR,
> MIPS CPC, AIA plic, and AIA clint devices. The model can create
> boot code, if there is no -bios parameter. We can specify -smp x,
> cores=y,thread=z.
> 
> Ex: Use 4 cores and 2 threads with each core to
> have 8 smp cpus as follows.
>    qemu-system-riscv64 -cpu mips-p8700 \
>    -m 2G -M boston-aia \
>    -smp 8,cores=4,threads=2 -kernel fw_payload.bin \
>    -drive file=rootfs.ext2,format=raw -serial stdio
> 
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> ---
>   configs/devices/riscv64-softmmu/default.mak |   1 +
>   docs/system/riscv/mips.rst                  |  25 +
>   docs/system/target-riscv.rst                |   1 +
>   hw/riscv/Kconfig                            |   6 +
>   hw/riscv/boston-aia.c                       | 484 ++++++++++++++++++++
>   hw/riscv/cps.c                              | 187 ++++++++
>   hw/riscv/meson.build                        |   1 +
>   include/hw/riscv/cps.h                      |  75 +++
>   8 files changed, 780 insertions(+)

Patch is too big. Please provide the CPS as a preliminary patch,
then the Boston AIA board, then add tests for this new board. You
can find various examples in the tests/functional/ directory.

Regards,

Phil.

