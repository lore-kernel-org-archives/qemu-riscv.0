Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5050CF9C72
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 17:21:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vM8L8-0005di-Ln; Thu, 20 Nov 2025 12:21:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vM8L6-0005d7-Qr
 for qemu-riscv@nongnu.org; Thu, 20 Nov 2025 12:21:00 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vM8L5-0006HY-0v
 for qemu-riscv@nongnu.org; Thu, 20 Nov 2025 12:21:00 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42b3377aaf2so670693f8f.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Nov 2025 09:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763659257; x=1764264057; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q6TvOqDM2qkI0tVpIlqonr3Ftv0tedG6CrCwpsmN5v0=;
 b=zkVEQdGG5y7PIW+k20gcoZaRe0oYBaZNp/BlgtcxHQgnLEw4tUAF+j/JFfiew0wdbL
 vuGH+5kYmlf4V8lP5Kqex/2JuyltRn2n0yyhbvBkhRg7gRQJKlLLnAK52js9RpNEpA29
 v7fkzl4CbZES9iN/RhQe3+G1oCXeSoi1STbTAmlpsX5uDotShaUHeRP+c4czrA2fh5/B
 hjEJr/nBla5PiDHfgGJer3K99niglDgmXsZ+kaVUuo2lVABanLc+T9pyLV/JDrlNgpDb
 Rogm4krkJ8AtpfXDbs3O9EgJBM/q+9f8pXM8bUM6lSOMtb5tq0+0SUNHf8q9cdJy3FBp
 st1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763659257; x=1764264057;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q6TvOqDM2qkI0tVpIlqonr3Ftv0tedG6CrCwpsmN5v0=;
 b=RKxI+xfVIpk1mPbGsPFYl0ufXWkDFX42195/Sqgj8tnK72cB/r/7G2fmGfJWyP4xR6
 DLwxMePfSEuFzAF9RAhlWjoldJasdlxal8QHRrm4HTKl1Ptg7/iALSjV2gKkL3OcxZTD
 sUip/qGFWE28APiSo9zPiOW9C4TRQ8Fgt+Tx3JoGrMhxMUJfyRRDZ8hw5hbj+2ZKVAgd
 Nym/Nj05V59jyPNv3yWMoT7DJ1eXxO949JQShkFGnSvwCiiKhzaE7R5MPbBgU3trsUEH
 7r+5m4FTxVVC+/Q2j+lu+NmCtM5RTn/hwKAiJVoSzJeYDiCtoA+W4eSBqVU6Z9mUfJni
 qssQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzGGP52FHYrvAGMKJoF1mYVUeiJPuWpGHeYWEBuFfC3C2/cUc7ky7nfbVrQZy8UXO4YUrHv81Q3SB+@nongnu.org
X-Gm-Message-State: AOJu0Yy2SIi7LLWb0UXRg+FUm6xXga0boIDF7fktA0iset1LAZq9Lanw
 ilS+8YgD0wrsJBmLhhmM4q4QDr/izcwIavIyM5P2aJ+Z6w3gVwvI7vw4CPvGD8MYY4Q=
X-Gm-Gg: ASbGnctJaybxdNEHg9VqkD4r8HG6J0Hq+5vQbqpKwhfcd+JAztfL7xV+Jm6mPZeiLUk
 jJ0CCB1fs/Xs9QRGZb3dhdb9yVcNWjRoEnusO0Dks/u7/qz1DPJSJ2NUpWdKSdqzQSeTrUEXpP+
 qAwF+O4nTExiUl2MYuBiU5uXWh/gsF8r46gCcujzFsPFvfgh3ySfQFs2vPkRsChB/yTp+T5Tnkr
 +rCHb3JAaOPmt6T2Bb+zKQdhouHE7Ac790q3EsP1Wv88PYN1PnTjfo1Z65uBmYd5anx+h9iXXjO
 1xT8z2h7oAHb0L41CclWm6hu3n99juVhusZC1in7TMTGxhfH8qXvR15HpLg2ggSVEsA1OlRTzma
 +vt6okiYBy+P6aAMejArrA2axlGoE773YrwtgtKExpKh9UbT8Fx2S9lEXiCe/dEcw8aAkprAxJ4
 g/AumQo3aSlFtjbRLRiEDiq32x6w1FV6czwQd27gxuplvQ4rgdd3axXw==
X-Google-Smtp-Source: AGHT+IGuoMSLfDsNNzAwItK/fbBTbVjtBwVNjNVJDcsw3iAKbMOUQriOtLUJIO0etHeu4ITn86dgbQ==
X-Received: by 2002:a5d:588d:0:b0:42b:2eb3:c90f with SMTP id
 ffacd0b85a97d-42cb9a11814mr3342433f8f.10.1763659256775; 
 Thu, 20 Nov 2025 09:20:56 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb8a29sm6511463f8f.30.2025.11.20.09.20.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 09:20:56 -0800 (PST)
Message-ID: <350863e7-19eb-4c7e-8b33-c4f7956ead4b@linaro.org>
Date: Thu, 20 Nov 2025 18:20:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] target/riscv: RISCVCPUTimeSrcIf: add
 register_time_change_notifier
Content-Language: en-US
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>
References: <20251107102340.471141-1-luc.michel@amd.com>
 <20251107102340.471141-9-luc.michel@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251107102340.471141-9-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 7/11/25 11:23, Luc Michel wrote:
> Add the register_time_change_notifier method to the RISCVCPUTimeSrcIf
> interface. This method allows the time source user to register a
> notifier on tick counter asynchronous modification (i.e., a modification
> that is not due to the monotonic nature of the counter). This can happen
> if the time source counter is writable, which is the case of the `time'
> register of the ACLINT.
> 
> Use this mechanism in time_helper.c to recompute the sstc timers
> deadlines.
> 
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> ---
>   target/riscv/cpu-qom.h     |  7 +++++++
>   target/riscv/cpu.h         |  1 +
>   target/riscv/time_helper.h | 11 +++++++++++
>   target/riscv/time_helper.c | 13 +++++++++++++
>   4 files changed, 32 insertions(+)


> diff --git a/target/riscv/time_helper.h b/target/riscv/time_helper.h
> index b51fdd96570..074b516f4ad 100644
> --- a/target/riscv/time_helper.h
> +++ b/target/riscv/time_helper.h
> @@ -42,6 +42,17 @@ static inline uint32_t riscv_cpu_time_src_get_tick_freq(RISCVCPUTimeSrcIf *src)
>   
>       g_assert(rctsc->get_tick_freq != NULL);
>       return rctsc->get_tick_freq(src);
>   }
>   
> +static inline void
> +riscv_cpu_time_src_register_time_change_notifier(RISCVCPUTimeSrcIf *src,
> +                                                 Notifier *notifier)
> +{
> +    RISCVCPUTimeSrcIfClass *rctsc = RISCV_CPU_TIME_SRC_IF_GET_CLASS(src);
> +
> +    if (rctsc->register_time_change_notifier) {
> +        rctsc->register_time_change_notifier(src, notifier);
> +    }

What about some trace event to help developers? I.e.:

    if (!rctsc->register_time_change_notifier) {
        trace_riscv_cpu_time_src_register_time_change_without_notifier();
        return;
    }
    rctsc->register_time_change_notifier(src, notifier);

> +}

Anyhow:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


