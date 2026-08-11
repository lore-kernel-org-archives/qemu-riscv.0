Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96187C5AC67
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 23:34:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtvyz-0008Io-2v; Tue, 11 Aug 2026 19:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtvyv-0008GW-E7
 for qemu-riscv@nongnu.org; Tue, 11 Aug 2026 19:34:06 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtvys-00076n-I4
 for qemu-riscv@nongnu.org; Tue, 11 Aug 2026 19:34:05 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2d004f135b1so6788705ad.3
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2026 16:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786491241; x=1787096041; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0eStAZ6SsJfA6QA9D9uuJRZ4Drf8kSStCDfosExh3Hg=;
 b=yxnoAO/YTvclJvIUuTpii1iIr3q0JVP9HiKy1wxYZDwDqWlDSVh+CeaWwERiw047UT
 tJdRO9lWX1/Kf2R322SdLd4ozNlqLwo6Kl2GRbpdzDyCAAwplCnE4mOPGBkRvSdqYu4X
 aNmmVZ4fuSZdL1bT3fbTaSPk1du4Qy8RA2z44vCrahsQknD72BxGCq2ji0qtntj5oaT+
 QV7gawk5a7TMCzt9D3KnTcTDjk0H9G8epvfgRr+py0lrxBRZROsN9mHpzt7uFBTl9/ta
 Mgi/mH4xZH8WvZ1jOWWYxtkutzYdgWuL8/PJv5mmHPZkgkrZW7VVHsF5YJuN9mP8rOcY
 vLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786491241; x=1787096041;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0eStAZ6SsJfA6QA9D9uuJRZ4Drf8kSStCDfosExh3Hg=;
 b=bGZKsswMgVF7rGSZZGLQZZXuXWX8SfxtsnK9lcTsSoypMo0dNq7r4QAEz19F1G8Csh
 TlOCVyg3aYp/ktEKbfJ7egfTJ/sbFj+ESC52lYID3J/XycflY0gFdDROCmCKRslI0xH9
 4HwOiK4HDCVT4ACZCjmhi9Tn+hEaVstvDMm/3HPE3UcnyAi8cDInLG99gmNc0ZNPDDul
 vhSpvmu4t2aBOiSxA9VeBmF/tQy57cjZn1/H+qZ9b+gfU2gfbVLPvzevtzzJz1VQFOGT
 OCwFLh6/bN/VWNTvunYPdVSa1tbR/NqG03/V2V4dv9qn9dasxT0Koiaq0Ha4IklNwjJQ
 ACDg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp5LlC6bugusQy+VW2dsjVww2JWgpz08jR1MrsCrAtrdmb0L4daEoQraG5uhTkMO+Tq7833papM5WRy@nongnu.org
X-Gm-Message-State: AOJu0Yy51XSYstdqOKo8kpYdcAjf93x+2xMsjmBqLhMY17Fn21cuMF9v
 +kFAk0WbVpEtv7DHzPmUgqyLTfQ/newR9pIB4BQNWNukhGHy5Bw+bGV1gT3RRloM+nc=
X-Gm-Gg: AR+sD122x0EfGYvch+Cc1syQ/8i3CHuwrvsYsXhZe1KWiDYKq6Hdn7m+dKz1A5EBpO9
 tMn/BuNElDPzeptbofvo28Gl2sIo+/U/ZoD/UtcgX8habgfwLEoHTg4Uur0FTVHG2sXkIki/ItX
 qvz7hMRDs0F4WfSwJ2ZGck0QrRedJV+8LBeR8I4IuQcHJjzvJVjnOkHx4hK0Ak6AwyhFIhNzSeH
 AC0680ZHYLTCcB6Et/QVxcpLJGU5O4nvznDZvLq+58RpCjAXQcvJC0EPzuQOBvKPgjWIKecXyNg
 gK9oRplqM8VaH3NofN3Jf1RySZhl0M8X5VlOLeaNf0gj3TKNO9xnaj/GiuT1r3/VP1CR2oC7XdC
 WSktSsqp+VKihq5WlPEzuJYtMjTGCRRu3OS3IS751NzAOUqKBwX/NujHHGOOHEgKZqVd7dMQBEq
 sd116ZpxnortUOO6Ho9sRVc8tgA1EMwnn1+OF71EgNvOJ3XPyyGF3zfc+tfkuQykIQ/+kVT+KDG
 czkiJhka+N+ox0KhM4xNQQlhwy46JwfGsX7N+8=
X-Received: by 2002:a17:902:ea0b:b0:2cc:90aa:8787 with SMTP id
 d9443c01a7336-2d3452da5d8mr13405955ad.6.1786491240755; 
 Tue, 11 Aug 2026 16:34:00 -0700 (PDT)
Received: from [192.168.0.4] (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d315ef024esm12928355ad.10.2026.08.11.16.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Aug 2026 16:33:59 -0700 (PDT)
Message-ID: <eb53043c-0379-4fe7-953d-e311a2eff827@linaro.org>
Date: Tue, 11 Aug 2026 16:33:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] hw/cpu: Slightly sanitize CPU API
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20260811183410.22428-1-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260811183410.22428-1-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 8/11/26 11:34, Philippe Mathieu-Daudé wrote:
> API cleanups, mostly removing system-specific code out of
> cpu-common.c. Code churn renaming functions, in the hope
> to make things a bit simpler to understand.
> 
> Small patch set extracted from a series clarifying CPU /
> accel synchronization, itself a preliminary work to introduce
> split acceleration, eventually.
> 
> Philippe Mathieu-Daudé (8):
>    hw/cpu: Correct CPU_GET_CLASS() comment
>    hw/cpu: Include missing 'qemu/accel.h' header
>    hw/cpu: Move internal declarations to new 'cpu-internal.h' header
>    hw/cpu: Rename cpu_common_realizefn() -> cpu_exec_realize()
>    hw/cpu: Rename cpu_exec_realizefn() -> cpu_common_realize()
>    hw/cpu: Rename cpu_exec_unrealizefn() -> cpu_common_unrealize()
>    hw/cpu: Extract cpu_exec_realize() out of cpu_common_realizefn()
>    hw/cpu: Move system-specific cpu_exec_realize() to cpu-system.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

