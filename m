Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A67C6FD1F
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 21:01:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rmgan-00045S-HP; Tue, 19 Mar 2024 17:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rmgak-0003kl-44
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 17:01:50 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rmgah-0005qr-5A
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 17:01:49 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-5d8b70b39efso4689681a12.0
 for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2024 14:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710882106; x=1711486906; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=riE02hczxK9zG6YmAaBUA1+i/O6/nJveV7qJthCUwf0=;
 b=nYWsxcKbWXERQw8FEyuBc8J668K6ZiFJnsWzCGGOu6jd6EYzgujFPuLxf1VnnpZLH/
 wDOQb33SQrh4g0/tP/AaPSlwIAaOACXpkwfOOZJT8cXw2z/hYW31ByEl8oCDD7T4kq9N
 OKqMSXRbABFEqtUJaDHlqcSvGhPSu6b7p+ZiYZjxevEavjiUcVHggsvn2/ICb0Mt92bR
 uukzxAR+TRLoqy9hu3CuqeD/DI0NGIFvPOrohE0tOojwoQaqDALsMMXIYJfei7kNwecn
 yD46SO1I3AT4dm0Uvi4HMUH9Q4W4vyjYlbmnoHFrgwNNgphKN/zteDx9XYLSjS4LQyK+
 Rsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710882106; x=1711486906;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=riE02hczxK9zG6YmAaBUA1+i/O6/nJveV7qJthCUwf0=;
 b=iNB23n0692mZ57weP1kVpCT2nxSeqr63Gehqn5jD1k2Z4/4W1i2jWj0yxunqwMqPxn
 +f8OTiYgu5+9ZHoItuKwYiQkXM7sBdcCNpW7UZKC7Ka1YCAJxlpDkq4efG0aS5Tdqrk1
 yj/gdC9OEE43w0Zro9PuHBxo18Psr6ljJCATsuM+t0+/WP9WfI5IJWA/qk5eBnSYht1y
 Uf9G8wqYi74WOOQSOdEjOdDCw7wLpPutnH027MZB/ZDZwjItXm1ysJMeO5VQSd7BeGJj
 4jkpOHpbFayvEE/F3I1GQr7NMI900sR0A6+Q/xlkw1ob59kXdUQpER6ZYvknukrkg574
 vtOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlSd1es9ar76yuJU78pFWIPFMjrdICag3M0cuWj0TGf993OWNzNjC8VcHj4W6VV2P5jZKbJMjw/DDrsZjNiyF/CxoDQCg=
X-Gm-Message-State: AOJu0YzRHzM38FO00Zebsnw19I1xHRBnrACiRbybQ9pft3/9XmZ4vSVt
 y3qc0Elapq0O6Qf5L1QKTOb4Zbm+kVMkyvAaML1hRvhj8s7Sl74aXz5TD1/tY/I=
X-Google-Smtp-Source: AGHT+IEfT0Pg9MXmChIbz6Bodn67EZyK2AOut7/oN1CX/ll+lpDa0ry3BEzlE7K7CvcuyD8oOfLD+Q==
X-Received: by 2002:a17:90a:fd89:b0:29d:faf3:16a with SMTP id
 cx9-20020a17090afd8900b0029dfaf3016amr10169692pjb.25.1710882105281; 
 Tue, 19 Mar 2024 14:01:45 -0700 (PDT)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 f1-20020a17090ace0100b0029bde896fb1sm10087874pju.55.2024.03.19.14.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 14:01:44 -0700 (PDT)
Message-ID: <13e1a475-6d57-4be1-991d-9cff1e6875d9@linaro.org>
Date: Tue, 19 Mar 2024 11:01:41 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 10/27] target/i386: Convert to
 TCGCPUOps::get_cpu_state()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20240319154258.71206-1-philmd@linaro.org>
 <20240319154258.71206-11-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240319154258.71206-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

On 3/19/24 05:42, Philippe Mathieu-Daudé wrote:
> +static inline void x86_get_cpu_state(CPUX86State *env, vaddr *pc,

Remove inline.


r~

