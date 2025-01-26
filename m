Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08379C0218F
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jan 2025 21:38:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tcAJy-0002GA-11; Sun, 26 Jan 2025 16:37:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcAJv-0002E2-GJ
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 16:37:31 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcAJt-0002i9-1E
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 16:37:31 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2efd81c7ca4so4977222a91.2
 for <qemu-riscv@nongnu.org>; Sun, 26 Jan 2025 13:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737927447; x=1738532247; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MbN5ftkFW90qPVFMQN7kThRB1jW5R9e9lwVcXv22rrA=;
 b=IQpFeFTFjSfaZCKDJqPlm4zd3y7eBRWIhmJN2HWxd6v1OzqRenHejQi1u8+iQcEBQM
 bX+fNbt3ILrvLEuxIcVcVaCpcpl2FJortW/SeWgN85Ib5Gt1OgtGyF3+4ZoMrRbmzpb2
 u4LBC8W+jysUXc2TzG1RcDfCFfhzH+ek0PKQvq4Zi3l7akTG0S7NAi9fZU6LOFQ3rp4T
 MMUBOsJI90nMvXX+c06qO/CTUTQQpembD5IumGWPUi3bINrFI4D/Y8AXlX4Oye7aSnMg
 HrZzDusq8DBvywgkkkrniieh1XKAaflBRT/B7B4d8ldi0I25mduhC4Loy9wl6+vLOCVk
 MvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737927447; x=1738532247;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MbN5ftkFW90qPVFMQN7kThRB1jW5R9e9lwVcXv22rrA=;
 b=UbT2FiB0dj4zf/M/XPTFAtbb2d1rrCLwCxm+hGpxxwyUYHW1ViPaDRZXS6+26rhvXH
 Aq+wgy3nxaPvCEHNd3h3dWeIw6I03cscVIgjLJfnqubGKVwAftX0Z1ReH8q2EAbDAERa
 ZEcrKUqt5jDBnmOyQGXkyG2gAC6DD3u32Rbff/lC+AKoEgSmpDRbhrj+Sj/K8UOC49JQ
 xgRARPU4UlTnuDE9si+q0jtGX9XCPGIhI1F71Gg5MlPnugNwkt0L0+J3mj5N/YFXaKrO
 3JwLE+ZdqlJwS33XXLQ1ezj/CfQWihQT0GLhbdzzQLOvQhRip1rj7PmhSKenu9DGo96X
 /poQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfnrJPSiLkKdA03Y+n51z0LOf29QRiycNXXKg3z4iMkY7DNNCrniwPIDvXTEn1v1cS+t2dpHsxoC3W@nongnu.org
X-Gm-Message-State: AOJu0YxxE0p9J1Jw0Hh+TleIbz8SNzGzx4KKjhHvxLMr5SvfMeZyhHwA
 Y90IiwpwH4z4YAH2Oq5ioGfUhyITKd1+ZQ4PTZ7mZXBk6+mH89XexcIGUy9pFJo=
X-Gm-Gg: ASbGncszIXXDSJ1vUlDtz7aO5Y2yecn/+IOAygPh57nYmvKaGfQV7har9Fc9ejiBWTo
 N4EndJI3K+2/Qd/XKANtjhx2vfrE0g3ipBFh7QAirM66Jcm2Le/qju0pDhHhsLwKdKeiMliQ4yL
 Ul089z41sec3kfMGsdsIUj3sI9FDmJ6L/fEmAKDhi6Qa4feSg3x+8lgabiTkufzN0GciVKguQBh
 qcIZh7Oj0W6naB/4gPTJ/LBsBzZE+d9n5IHdZOGR6YPLuA1noylED3OTOslXY16mNdVXtZGliy3
 fBTLh37aSkoDYWE/Mbeir4Udhyd95FKSaHP2oIVzGylRUeQ=
X-Google-Smtp-Source: AGHT+IFiuSNxM6E2NLFZz0UKT8aL9HnJkIEUZ+PxBPmebPJCN8+PDu1ajnV9q5XziLSw+N+w1RiQzQ==
X-Received: by 2002:a17:90a:c888:b0:2ee:f687:6ad5 with SMTP id
 98e67ed59e1d1-2f782c5174emr59291165a91.2.1737927447421; 
 Sun, 26 Jan 2025 13:37:27 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffaf896csm5651556a91.34.2025.01.26.13.37.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 13:37:26 -0800 (PST)
Message-ID: <46ab28c5-d417-4b83-97d2-b2ba49f7abfa@linaro.org>
Date: Sun, 26 Jan 2025 13:37:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/20] cpus: Build cpu_exec_[un]realizefn() methods once
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-21-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-21-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> Now that cpu_exec_realizefn() and cpu_exec_unrealizefn()
> methods don't use any target specific definition anymore,
> we can move them to cpu-common.c to be able to build them
> once.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
> Eventually they'll be absorbed within cpu_common_[un]realizefn().
> ---
>   cpu-target.c         | 30 ------------------------------
>   hw/core/cpu-common.c | 26 ++++++++++++++++++++++++++
>   2 files changed, 26 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

