Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jI0rn-0007TH-9h
	for mharc-qemu-riscv@gnu.org; Fri, 27 Mar 2020 22:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49478)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jI0rl-0007Se-5T
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 22:06:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jI0rk-0001Yi-39
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 22:06:28 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:34801)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jI0rj-0001XM-Lz
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 22:06:28 -0400
Received: by mail-pg1-x542.google.com with SMTP id d37so5012598pgl.1
 for <qemu-riscv@nongnu.org>; Fri, 27 Mar 2020 19:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FmLAljmekYVZCwDl3aOlnyPdywDPCiVnaPAEy0My6YA=;
 b=Ey4UwKwku5tUBhXSdxgBymgtHPNaEEllmkSKxdTqGCvpQPQujaTSqGvOC9jLfem2fn
 YNWvG+dt1vWXXWl7pOdm0JLtP0Kmc6v6isQNlQOcJ+9TimjnuVIptKGlv1v5aq+t5DOA
 Mo+DKjed+E0xTkPqDEqZGCM1os1XTBkNykgLYKeU5+HF5OGoJBlXvpEfuCI46UzSSAz1
 gdXPMTUpAuUph6M1SCkLrlXQqEqKufVMAeT+S2rvfb/MluMtsWDHwzvPdDYKu15Ilhs7
 qEUNaZPxQ6j8704Gti6ti8CbXGDNd1gDO00ML8J0HCLi7CsIsh4kBuczVhnWbnZZ5xFu
 sw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FmLAljmekYVZCwDl3aOlnyPdywDPCiVnaPAEy0My6YA=;
 b=QwnyDRQw5g/jrUBXLgoeFCNwVAKYRu3Knp4Ia59lMm4KwAM4XxrFQILNj1rbuFFvu8
 iaMkcpjClsmwkiJLbC36CA9yZHWrPqk4QfsWOLGH/ZAD/jPUMkk5yMZniv3jr0GWdNHS
 giWAqCkVOswhzetMX3izHGCtjHWt3EXoY3gD4Zksi2zAr1tMOlezUVu5/GAA65kCLJtZ
 6Ceqs3Bo9ZjN1yJB8hS7c5GQEGLSCJVpLoWRMFhMNgulZ5tikT5JGIJ8T4xrXkWAlaKz
 Wf+xIEmLY8lX9iXWFViDLpj/HRsZhXdjgmI2SDdSwy5aSj82dYPrfuwPfKptl/+YFSUk
 dz1A==
X-Gm-Message-State: ANhLgQ0sdjoVoVsnyNlNLg7B1uoV3aas6LtaJknOSK/5ymo+uJKKp3Yv
 6CZXgdgQW/9HyB0qLWxWiGfkIJ8CyNM=
X-Google-Smtp-Source: ADFU+vuLtak0pQ0UE0lwDWTyv21r1tdUMPvb4Kg8Npu3zqtWG44V6FFYvn7fYG3pvwtE0fEq9c8RJA==
X-Received: by 2002:a65:49cf:: with SMTP id t15mr2191566pgs.375.1585361186269; 
 Fri, 27 Mar 2020 19:06:26 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id b198sm2664738pga.71.2020.03.27.19.06.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 19:06:25 -0700 (PDT)
Subject: Re: [PATCH v6 40/61] target/riscv: vector floating-point classify
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-41-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <73d2e780-6121-5180-836c-00542d8ca522@linaro.org>
Date: Fri, 27 Mar 2020 19:06:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317150653.9008-41-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Mar 2020 02:06:30 -0000

On 3/17/20 8:06 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/fpu_helper.c               | 33 +--------
>  target/riscv/helper.h                   |  4 ++
>  target/riscv/insn32.decode              |  1 +
>  target/riscv/insn_trans/trans_rvv.inc.c |  3 +
>  target/riscv/internals.h                |  5 ++
>  target/riscv/vector_helper.c            | 93 +++++++++++++++++++++++++
>  6 files changed, 109 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

