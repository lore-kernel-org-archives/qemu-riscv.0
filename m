Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20320EEB56E
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 22:33:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qek2F-000285-N1; Fri, 08 Sep 2023 18:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1qek2E-00027q-5c
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 18:33:06 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1qek2B-0004IO-J4
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 18:33:05 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-500a398cda5so4224876e87.0
 for <qemu-riscv@nongnu.org>; Fri, 08 Sep 2023 15:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google; t=1694212381; x=1694817181; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5yqXm+za/42HYAElCu96LeV1rf/seSOt91QYGkjq4wA=;
 b=CjP+QcB66PrZBW4As9lrTFnfmMt+JpcyDQqyhlzPvj+fZsO/4MKRWDHXvzJCvGPev6
 2KdilqlW0dpfpfi1HsJX3DluXIePXGO1tz4fFU6RlRudNSNs4yc1gOT0Ik66QoiiJ6Nx
 SL1PkgjOCGg1Vj3ymBgZoIdoEngGcw075e6zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694212381; x=1694817181;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5yqXm+za/42HYAElCu96LeV1rf/seSOt91QYGkjq4wA=;
 b=aGD5frn3PTlI7iRYeX+BpCxRwOcQoFBXNf917bv/M4tGmNzSo99KJdMK9IrUSdieom
 6gL41ypqXpEFQk/qxP+PbOSfOpX/afZubwyERPW5KOtjf8K3FqSx0B0Ez115V/UQhXJp
 DtilA6Tzp5IZofJog8LacSaB/fnhC3/2tnSLfMzAEVtsOlZH4cDbVlE7A03jkQgHvLhe
 EQCsIrTKYTB9oLH7bWcb8MoQ+v7CZuK2aBdr0MCictiCuvvxK44H28vWHNeouxDlm8W6
 QSOzf9U7ccuK8U6cIWTu3rcQ9/pNKGHNHiHcQHrWtKWHZd45kyhbpjbdzB39SA+/MKGF
 tv/g==
X-Gm-Message-State: AOJu0Yx/zjB7QYNdssYkBnf8ZGNVain3UcMPXOXAk+7o0nLSRHAry0BG
 F4+znHluhV/gNlGHmDe9Rz3/raCNfaEQYI524M1G
X-Google-Smtp-Source: AGHT+IEoFG2B9Bx/oDzmu1l/+2nOO5YCAEAb012JoIKAVgJuMrmdWM0B+OITE8jdBWdMECYxDWlCKYOipVVdF7PADhU=
X-Received: by 2002:ac2:58e1:0:b0:4ff:7004:545e with SMTP id
 v1-20020ac258e1000000b004ff7004545emr2601982lfo.4.1694212381116; Fri, 08 Sep
 2023 15:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230908033129.694-1-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230908033129.694-1-zhiwei_liu@linux.alibaba.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 8 Sep 2023 15:32:50 -0700
Message-ID: <CAOnJCUJPA9nzJRUuxd13WJzhGjWPBbmnNFn4Fcw4Wcf7WOO2fw@mail.gmail.com>
Subject: Re: [RESEND] qemu/timer: Add host ticks function for RISC-V
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 LIU Zhiwei <lzw194868@alibaba-inc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=atishp@atishpatra.org; helo=mail-lf1-x129.google.com
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

On Thu, Sep 7, 2023 at 8:33=E2=80=AFPM LIU Zhiwei <zhiwei_liu@linux.alibaba=
.com> wrote:
>
> From: LIU Zhiwei <lzw194868@alibaba-inc.com>
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>  include/qemu/timer.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/include/qemu/timer.h b/include/qemu/timer.h
> index 9a91cb1248..105767c195 100644
> --- a/include/qemu/timer.h
> +++ b/include/qemu/timer.h
> @@ -979,6 +979,25 @@ static inline int64_t cpu_get_host_ticks(void)
>      return cur - ofs;
>  }
>
> +#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen =3D=3D 3=
2
> +static inline int64_t cpu_get_host_ticks(void)
> +{
> +    uint32_t lo, hi;
> +    asm volatile("RDCYCLE %0\n\t"
> +                 "RDCYCLEH %1"
> +                 : "=3Dr"(lo), "=3Dr"(hi));
> +    return lo | (uint64_t)hi << 32;
> +}
> +
> +#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen > 32
> +static inline int64_t cpu_get_host_ticks(void)
> +{
> +    int64_t val;
> +
> +    asm volatile("RDCYCLE %0" : "=3Dr"(val));
> +    return val;
> +}
> +

rdcycle won't be accessible from the user space directly in the
future. rdcycle will be accessible via perf similar to other
architectures from the next kernel release [1].

rdtime must be used to compute the host ticks if the host is a riscv.
This is the equivalent of rdtsc in x86.

[1] https://lore.kernel.org/lkml/CAP-5=3DfVcMg7TL6W_jH61PW6dYMobuTs13d4JDuT=
Ax=3DmxJ+PNtQ@mail.gmail.com/T/#md852c28f4070212973b796c232ecd37dc1c6cb2b

>  #else
>  /* The host CPU doesn't have an easily accessible cycle counter.
>     Just return a monotonically increasing value.  This will be
> --
> 2.17.1
>
>


--=20
Regards,
Atish

