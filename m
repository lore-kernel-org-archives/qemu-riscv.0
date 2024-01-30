Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD415C46CD2
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 10:01:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rUkus-0001F6-12; Tue, 30 Jan 2024 05:00:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rUkuq-0001Ei-0s
 for qemu-riscv@nongnu.org; Tue, 30 Jan 2024 05:00:28 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rUkuo-0002XH-Dq
 for qemu-riscv@nongnu.org; Tue, 30 Jan 2024 05:00:27 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6ddd1fc67d2so1627147b3a.2
 for <qemu-riscv@nongnu.org>; Tue, 30 Jan 2024 02:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706608825; x=1707213625; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N6rrp1PZTWCFekP68QS7wfkG/TDpiqFhA7xNmGuR1oM=;
 b=yFGJ59WgarB2ZtpV+mklR4A2IzT2zjGWkKqkz5QIgZP9BMCjvTQLLnUTPFiAJtXWv/
 0vdLR3ew26r+hosdAjwX64A5y2zKHPkGUTmEbEnbEG7nbtzR8Uou1ykkuEJivLNUzw61
 wbEbbuSIS/+ZZ7mWYFai3vg9hXY+pZltF3NvcQp3durcsYoqA2UlkOs+lZ2Xp5H+HJlG
 u3ZHy4oiL9mI20GPGHf9ar1KWfWPiTg21BN5OnnX3RDQyqc7HRiR2OzvjdYbaHzEF4iV
 C7L0EvgOhDV9XrdqHPtmNMV5CyNfnaeEg5bFAY+I0x4SU2/3v/GZNgWFWArtGW2zz/UC
 3KQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706608825; x=1707213625;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N6rrp1PZTWCFekP68QS7wfkG/TDpiqFhA7xNmGuR1oM=;
 b=OaIEkrmOyWYwQCgkV6QpKMNQ7f85ItPfzYImX/Q0scj8idAbb5Gn3LojKtSCE4zdeh
 2SwfYBUk70FUdRLpAqgpr8FUi8b0duhiAQGwUqRDvpBlWZYcrarTtaSF0m0GY0rZSqF+
 DBf8ZNnuFFnlJZppETvIYCQ4FuOnRFjc+OaoFNgslJTD5Q//O5mquiG/ETqE/+DRzE0x
 OZm6HS9uInwxfiX4QNUrDDyATdN1NbkBaPnXKH/gg9qyizW0vmDQo+CD4G7VozOTusvF
 0DDkUFyQ0rFOfQQUPORXsc7EEYloDXacRrEZ4Ki2dhEheFMSPzrB+3dPi9FusrKI3YRY
 F55A==
X-Gm-Message-State: AOJu0Yyjq7+G4+Qa0E07xp8/4FMIToFJFD5qSuHd2BnMn2+F8JZt3wR3
 jdWdbRYAaP3r8dGHZQpRY3HZDk2YRgAjoS3Y0BDf8kCwii94HMYf/3LgvR9F6TA=
X-Google-Smtp-Source: AGHT+IEWBMyhl5lfi+g5ZJxpiEt85fcuC07bbj6Fs0uTefrP5NszaFZgkNvm/scKOXmd+fbtEsBhJQ==
X-Received: by 2002:a05:6a00:4fcb:b0:6dd:8743:9e03 with SMTP id
 le11-20020a056a004fcb00b006dd87439e03mr4125687pfb.34.1706608824927; 
 Tue, 30 Jan 2024 02:00:24 -0800 (PST)
Received: from [192.168.0.103] ([103.210.27.218])
 by smtp.gmail.com with ESMTPSA id
 gu7-20020a056a004e4700b006db105027basm7382769pfb.50.2024.01.30.02.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 02:00:24 -0800 (PST)
Message-ID: <40b11cae-39cb-4254-95c9-27d4a2a13ff0@linaro.org>
Date: Tue, 30 Jan 2024 20:00:20 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/29] target/hexagon: Prefer fast cpu_env() over
 slower CPU QOM cast macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Brian Cain <bcain@quicinc.com>
References: <20240129164514.73104-1-philmd@linaro.org>
 <20240129164514.73104-12-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240129164514.73104-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

On 1/30/24 02:44, Philippe Mathieu-Daudé wrote:
> Mechanical patch produced running the command documented
> in scripts/coccinelle/cpu_env.cocci_template header.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/hexagon/cpu.c     | 25 ++++++-------------------
>   target/hexagon/gdbstub.c |  6 ++----
>   2 files changed, 8 insertions(+), 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

