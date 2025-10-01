Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2030FCCA470
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 23:09:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v45wJ-0004Y9-HC; Wed, 01 Oct 2025 19:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v45wA-0004UF-CM
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 19:08:44 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v45vo-0004I3-Jf
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 19:08:39 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-7811a5ec5b6so1361715b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 16:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759360086; x=1759964886; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0NduVUyQ85gtrdIqd/hM2I8IkeDghN4HwH8u8BvlAcc=;
 b=pyDo2ci/ml2TOS59/60NEt2PtbvPQZQ66UlENVZzVnv+iMJ+losL5NvrgGls43rK0g
 DUz5zRuGgjPp3grvPwd/QncvOSnDOX8XXGIXhhfX+6wEVOdxXfBTICEWRwDCCn5SysUz
 04K4vyHkIpQI2JOt+FgDfqpGd1eYfKrB8bapHabKU1BzhBDdHWa09vihzYaFJzkk9RLd
 EEqZYey7oXbN4Bw4fD0+XNBh4AfHhtBpIh4yHdaagQBSGZA0yCJhIHnGVvrJkqMx+N2y
 TIuLuOTMCBaz3prve9JTpy/D9KG13a5KnkgsPsJYjsQAv133/31l7IZ2/sMN/y9Wlq2p
 nhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759360086; x=1759964886;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0NduVUyQ85gtrdIqd/hM2I8IkeDghN4HwH8u8BvlAcc=;
 b=O3kfPFcnJz8UV1BOwooQxFh4hutjj9Hsub02eGqUxJxZLJxfk9OzCZqPfDOkts7Io+
 RhTAigbtUrmE2cB0JSt8w4DLXAC0fX9eMudKpZtlQQIjAoPgBVJtxKHzw/WqCdYde8j7
 hO21Kd30cG2p8uzqr+dEaOprPVttPr6torEXTB8BgTuCdjI/VxmZZ9PDw4b/OxknqgN5
 8TihFDxfE/GXd6+qklhUbO3UiTwjCY2pFIEhpFxFk+87/9KM8aVVUBp1zRXYBONKTuRF
 hL1SB9XLVbC75GX6Ty7RACcy7zUR/TUm6bnrq5DQq8LKOEuq4v+dB7p7K7/S/iMS5wtH
 79xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVepVj98H6/u2dlObHmObg2MPQZCji6pKfjfoWkUe4jhhqR4y3V0S1sMy1QTiqNva5cqk2SmrageckY@nongnu.org
X-Gm-Message-State: AOJu0YzoIgd9TekKynLUva8eb9s8Kp1XX1wx29ifOkFRkknQqvctpE7I
 +SPRaR9UC9qzxVtSDU4rDwM7vdY1nn360ekXEd8brjnNpqCzU9Qqu1gyq9+SMosPas0=
X-Gm-Gg: ASbGnctvSckezUOitrD3yBtYI2+KWnTedK1eYhO+6Dnd/+VNHdx1qBc6Bq/3cbNrZtO
 EwM5ojZ3Uzd4FSIeIKdYG1JqG3Fg+n+toO4e2waGoSsH8ZHgJ0htcFWW6p0V4n6NI641ImDsu4/
 l6d38n9vj9me9g/WJeH9C+Y6mxk2GbuXmyLUAcyZ/rqvQSKdoFkdBBd+2pFSVE5hz7mRfkPoKVx
 JhwnqjdqBOP4HX47QOh3yjCDd3zkXX6AHFqaBo+3EWcSvM97bgGw+2g5oYBghqwXng8wjLUiBvV
 EeEsheNOMCOybVUwjs4emxD5HbpFQdTqj1nlXCkRyb6xOKDgsT31rgy+dIlmWcoEDtuweNwapjk
 Umi4mYEVSW/P2o9mc1nf97K9ssayZzPj+xZZ+ibaxTvhCcFewFYQOpWi59D0=
X-Google-Smtp-Source: AGHT+IGg3ZqhSK78RAKzfCQSnMuBzFTdqIP7QoDVXe2GuVM4amd0jtgHILbFhywgin+qBJ+H5PtZbw==
X-Received: by 2002:a17:90b:4d05:b0:32b:7d35:a7e6 with SMTP id
 98e67ed59e1d1-339b50d51e9mr1368341a91.18.1759360086087; 
 Wed, 01 Oct 2025 16:08:06 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-339a6ec12fdsm3364723a91.10.2025.10.01.16.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 16:08:05 -0700 (PDT)
Message-ID: <096db5eb-1915-453d-8fd1-fd6d23777a1a@linaro.org>
Date: Wed, 1 Oct 2025 16:08:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/35] wasm: Add Wasm TCG backend based on wasm64
Content-Language: en-US
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 WANG Xuerui <git@xen0n.name>, Aurelien Jarno <aurelien@aurel32.net>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <cover.1756724464.git.ktokunaga.mail@gmail.com>
 <ba60c570-fff0-4ab8-b3bc-d191663d2912@linaro.org>
 <CAEDrbUYAAbF5g4-HEvqDWZyycPzZQCJvqasJ355RkLOnfm0R3A@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAEDrbUYAAbF5g4-HEvqDWZyycPzZQCJvqasJ355RkLOnfm0R3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 9/30/25 1:26 AM, Kohei Tokunaga wrote:
> Hi Pierrick,
> 
> Thank you for testing this patch.
> 
>  > * /builddeps/target/include/ffi.h:430:6: error: 'FFI_NATIVE_RAW_API' is
>  > not defined, evaluates to 0 [-Werror,-Wundef]
>  > * various "format specifies type 'long long' but the argument has type
>  > 'long' [-Werror,-Wformat]"
> 
> On my side and also on the GitLab CI, these appear only as warnings and the
> build completes without errors[1]. I'm curious why -Werror is being
> triggered in your build. Have you applied additional configurations that
> enabled -Werror?
> 
> [1] https://gitlab.com/ktock/qemu/-/jobs/11544442966#L7016 <https:// 
> gitlab.com/ktock/qemu/-/jobs/11544442966#L7016>
> 
> Regards,
> Kohei

You're right, I indeed have a local patch forcing werror on my side that 
I forgot I had. Sorry for the noise.

I have been able to build successfully, thanks.

