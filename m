Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686F6C2BD09
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 17:20:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sMsn8-0005RV-7w; Thu, 27 Jun 2024 13:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMsn4-0005N8-Lf
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2024 13:20:10 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMsmz-0003rm-NL
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2024 13:20:08 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-72c03d2926eso165272a12.2
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2024 10:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719508803; x=1720113603; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bLvHBy8eQBMjMdzqqJMMqwAWeNUvQ9mKhw9ayUi7+q8=;
 b=Bf8vxeXExMvw8dy/NtfVQNoFXqKfLiWxfG3SU7TfiW1O0Q24H82I0tt9waRug6DQu+
 VlHXaaY7FM6alTlvj3FS8zR2DdwWhugvoAyYyoRqv1TQeCuLCAi5ppJ9HEdGGKnplW49
 buquYyng0YJnQlHePEr02sFje4AAjy41430aro121t1YH5qFgFRKIdBTnMoERJoAoinw
 ONb6EYdfz/l2eWaC308sRe0dys+G0MS3/RimumWYMDc72tv0sdqXtk2z4Ip/iVTazks3
 HjascRs+l3KG4vJaJz3O4oEeOsbmazvZ+7CDeCXvr5si4ufYAL9Cyga6u3PaA7UjpRiu
 w2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719508803; x=1720113603;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bLvHBy8eQBMjMdzqqJMMqwAWeNUvQ9mKhw9ayUi7+q8=;
 b=BjPhj5qRtLKLFs7ntgY68xyjhISAw9SN895IQbisrNKCozhHTr6Mc4i9OUvWY+5stu
 8eYP2vIYBmXY5blvg1zww2ahJkkC5yeFPyyTeq0GjajXfdRk9ws1kEGN4qJSF06HhsYV
 18JQ0u7I7xra6o02ve/8mVxdWowjqQF1BkoWwiN6zit3nap1MSnkb/w0B6s0MP2y8boB
 Jpnz8i+HBDdWWQrMpCt6jSuP4HBvgT/OYyJ3ubfnjJzh8peKc0JraNdjVja3Jxk7LikP
 zNoe1Ov2tLCXoK+HeAhlBQRl3XvZdDUpM9ZtmtFTNkIo2XaqQk+cTTnr37a2RaL2Pbwd
 5Kxw==
X-Gm-Message-State: AOJu0Yzauo/ulAuM9FtXgJxrwloXMkFkRUS9qaaturj2W9diX69kV8Ia
 thDyEP+FFsjJzrCZ1NV55xJ4z9yzlbF/LgqvFgnAI3Ku1MKSpwpEiX3beXuhmqY=
X-Google-Smtp-Source: AGHT+IEWpQyA8BWoJmN6Gq3Kix7tDT/rqsSWxXvX7PUJYJPuBibZnRoScLB6YFH28wYmljm2xK7aiw==
X-Received: by 2002:a05:6a20:12c5:b0:1be:c5ab:7388 with SMTP id
 adf61e73a8af0-1bec5ab74ccmr5685803637.25.1719508802580; 
 Thu, 27 Jun 2024 10:20:02 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706b4a3abd2sm1674956b3a.149.2024.06.27.10.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 10:20:02 -0700 (PDT)
Message-ID: <ee7713f2-a05e-4533-a070-97df934d7888@linaro.org>
Date: Thu, 27 Jun 2024 10:20:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tcg/riscv: Fix building on OpenBSD/riscv64
To: Brad Smith <brad@comstyle.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <ZnzqNlUbHG5Ue6L1@humpty.home.comstyle.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ZnzqNlUbHG5Ue6L1@humpty.home.comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

On 6/26/24 21:27, Brad Smith wrote:
> tcg/riscv: Fix building on OpenBSD/riscv64
> 
> Use ucontext_t/struct sigcontext member name from machine/signal.h
> instead of Linux specific name.
> 
> Signed-off-by: Brad Smith <brad@comstyle.com>
> ---
>   tcg/riscv/tcg-target.c.inc | 5 +++++
>   1 file changed, 5 insertions(+)

Thanks.  I'm going to clean all of this up into util/cpuinfo-riscv.c, similar to other 
hosts, and I will include this.


r~

> 
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 639363039b..aeae9a8ad8 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -2116,7 +2116,12 @@ static void sigill_handler(int signo, siginfo_t *si, void *data)
>   {
>       /* Skip the faulty instruction */
>       ucontext_t *uc = (ucontext_t *)data;
> +
> +#ifdef __OpenBSD__
> +    uc->sc_sepc += 4;
> +#else
>       uc->uc_mcontext.__gregs[REG_PC] += 4;
> +#endif
>   
>       got_sigill = 1;
>   }


