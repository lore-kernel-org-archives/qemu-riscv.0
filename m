Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF85C982FA
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 18:45:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x95U5-0006f6-OA; Tue, 22 Sep 2026 14:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x95Ty-0006du-15
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 14:44:46 -0400
Received: from mail-pz2-x0c.google.com ([2607:f8b0:4864:3b::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x95Tw-0006b2-89
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 14:44:45 -0400
Received: by mail-pz2-x0c.google.com with SMTP id
 41be03b00d2f7-cc74520b20bso77612a12.1
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 11:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790102683; x=1790707483; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Qp3u3i0KCD/0y2GbFXqeUBFIy1oJGLlf739nf2oKQWk=;
 b=bEbR+h7YTz+rpg5GEiw1SSZYAi/mi6zoXXlSXDz3DnqIOj47lJ4bwGzq4626Lf62n1
 FevU1H0JGXgFX9AW5gha+0lXQMcWKmxFQpUmmbaPmACNQVEypsFfgbNZ47UgixKhJMZ2
 Fdu9MqBT+/Fnrc9TxjZ1+quxXspbOl2ZsErCf7o6djVCDlaUykRL8b2GOWgNvk5X0vTn
 PwlxuYeZfE76FA7JAQvduZM/mz8vpweoUBq3Fd4I4uGwvc8MhcqKbTkzc0RDkP0Eqra4
 j1G6fFE7562SJ9MWV0/2RIpbC6WtD4z4dTbJEhPAVTscMgUVEjQRMKw+lG15WTYa5UGA
 vEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790102683; x=1790707483;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Qp3u3i0KCD/0y2GbFXqeUBFIy1oJGLlf739nf2oKQWk=;
 b=peuK0Fj1L6ZxlJ+qPVQViKVQ24j59ycQQhhD5mt6T6v2wtvYwwqdpyU/JfdB+IvXwt
 ZrcVPUgUkBNCNiJfKiS5CGHOWL3SV2V+aAd2ObNAh24idupJ/mqu/HepcQfO5cMZZnHU
 DB/QItamyFi06kTK33Esu3zWiFyXjkFoiXW2chvz0IkZAO9Rjy2sOFE1ZzZFd+ej322r
 17XA+Ei59NqSBh/VtM1MkKNBUs4SU6UMzDabgahn8D8PsTZGJf8fftAAGqQ2PdgjWxD8
 QGIkt97QJijJ9P6PNUzCk0hTMvfZb1k5sMBNQZnWrBNHrvdHrtqP0sada5zQcFUxwDwq
 3CEQ==
X-Gm-Message-State: AFuF++lOxM2OFmtmv5OGE4tnmmK2kALncyjRl8COir1w/2OoHmZlXVDZ
 b+gmpMLabjHerPzjO7Q5Kesa4NUGMyfIRBK09dtrQpyvojx/6SX2k696m26TxRy2dNs=
X-Gm-Gg: AYBFou0MsP/4pBBOiRLgUuWdmpa57Tk8fr+F7cBlQC2wL9Xss3uNPa6vdKjfBPZOB95
 BJfPUA5ip+UNFlHQwY4DND1aX5OgTHRMJL7VYtGqfIT00UmHIJtA2z0bL3s8cHet1VHMCvOqFK0
 AzSYYDNJxsF+nHHjzNA3Wz3ZH02KGAQRuKQlqrLJThcWnY8CkITD0bm3KKfdPZUYmMiO3TmK415
 Ytm6PmbXMgMRzzD5ubdIWjAGVohuXzJrh6QTBtH4ut1Dv4jOubi+6545cLcbX0XVPjGZQ9b7am1
 40DQAzXocyrNwaWxwtxyhz3/93seALSFFztmoxrUIVMXQCd3gbXsOxSTxb/Ib+n7KdTTE+qMfQc
 II1fUYfovdzYUM3/LNTS1FDJe0bgDQJEcz8yswA3+0f14sa0kCL3QdWQ1J8SUqk4t1rTeKHzx8y
 7h5zKSX/I/KSdXkEa57N2TuTDUDU/ZNStLktDjF2ezXiB+1tpohKp5YlE2QZyaOfEWr6BGBG33X
 69v3wC8dHxp4bqrR0vHMy4sJTf3RTboqh7nziac
X-Received: by 2002:a05:6a20:a128:b0:3dd:a008:575c with SMTP id
 adf61e73a8af0-3ddf82fdbd3mr262772637.26.1790102682642; 
 Tue, 22 Sep 2026 11:44:42 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-87d1e5fb67fsm200221b3a.58.2026.09.22.11.44.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 11:44:42 -0700 (PDT)
Message-ID: <d566b802-c7ee-4a5a-b9cc-2ed416e9daf0@linaro.org>
Date: Tue, 22 Sep 2026 11:44:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/17] target/arm: Un-inline arm_set_cpu_power_state()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
 <20260922164936.15189-7-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260922164936.15189-7-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x0c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/22/26 09:49, Philippe Mathieu-Daudé wrote:
> Move arm_set_cpu_power_state() from the header to arm-powerctl.c,
> keeping the power-state helper with the other power-control code.
> Restrict the call in arm_cpu_reset_hold() to system emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   target/arm/internals.h    | 8 +-------
>   target/arm/arm-powerctl.c | 7 +++++++
>   target/arm/cpu.c          | 4 ++--
>   3 files changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

