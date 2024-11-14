Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F252CD6A228
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 19:23:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBfQI-0005QP-4F; Thu, 14 Nov 2024 14:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBfPk-0005BQ-08
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 14:22:00 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBfPg-0000mQ-HV
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 14:21:58 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2e2ed59a35eso904793a91.0
 for <qemu-riscv@nongnu.org>; Thu, 14 Nov 2024 11:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731612114; x=1732216914; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vd8hIq/RC9Fcj+DKQsNCH4i0R6za3XbmScuQL0ivEbU=;
 b=AvTd98bcJfUC1sFIEIvX1nE3RZNqX+wB75pzcvdEaWuTxjpDKthXWzG8CK7XdNuA09
 XLr25s9E1EJoyJxUbUWkP7zkgLPP/atoRP8MGtqP4rbVlaSB7FsD+fWUVdnwQ02rLEmq
 /J98feV7olXq47/LH3pMpfB6usEFjK1/fghLpjjmmWe9qLx1ly+Q82xKXjLrFxiAWLop
 KtiwHSvRRdZeNqpEEAu3OKwwBQOPPXEZAluDghqz0mx1Z7kCT2gNaixkxijayd7iVWa/
 X03ryfMm4oClHHWJGF3JmgCftLW1+jGvMks70OOqQMrovBgiBWCWZ4JjT3QWscM+TGmv
 yMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731612114; x=1732216914;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vd8hIq/RC9Fcj+DKQsNCH4i0R6za3XbmScuQL0ivEbU=;
 b=VVfHeB+AroPAyi/YQpNMqNtIbVz1Z5S6HAHLqLTZxAKkvnQyADxB+2ziEk8sSDDEF7
 euUwBMTDfK7rO3lumvBUgXLCKhpxwXEJzR5yUdSiJ0FAI/vPnrU2VKDb1lkNOe8XUwdV
 n5LBeP2IsL0yajmc7J5AOwChIZBqamonIq7da4trBskZ9nVGeu7PBPFd1k39X/XK9JPN
 jdW8SrkNviGpZ7ZlJu2BocnEGwSvYuRRzuBVKMuUEhFJ4puy4K94vst+zvG85qCSBmk8
 7pn2sq5JzaZU+gcXb8x2RxWNTVymqt8lT8++kNP31kpkOialOSCtp6Qei/XxYvn5Vq0P
 UZhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWraKLmgRyxnLmBwrNex/a0CQAUM4hrVwdAy8XSqcYDaLQiMPCTHPQAJGk/u+0XB+ILgKgr6PI7jQGx@nongnu.org
X-Gm-Message-State: AOJu0YyxxOoDaDKbwDGuoJK5n/h/dEPfuB2u9qMAiZDBz5xpWUHAYLCU
 9ruEN4HZRc5hvrwQGsrdrKph9vCi2EiFH5rEZjtBt9ytBX0hAjshrkOckBUCemc=
X-Google-Smtp-Source: AGHT+IFJ+RWYdtAvTk6DWTgYt8JsX+ILyyi6ae5MuLqLFerqQjwV6Lk89jtOoUIs1bPrDWo0Bf2htw==
X-Received: by 2002:a17:90a:e188:b0:2cf:fe5d:ea12 with SMTP id
 98e67ed59e1d1-2ea155a254cmr35944a91.24.1731612114054; 
 Thu, 14 Nov 2024 11:21:54 -0800 (PST)
Received: from [192.168.0.4] ([71.212.136.242])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211c7c2d72esm14227475ad.9.2024.11.14.11.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 11:21:53 -0800 (PST)
Message-ID: <d6a52090-a8d3-4cb6-881f-071a5668f1d3@linaro.org>
Date: Thu, 14 Nov 2024 11:21:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/24] exec: Declare tlb_init/destroy() in 'exec/cputlb.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, 
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-15-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
> Move CPU TLB related methods to "exec/cputlb.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cputlb.h   | 28 +++++++++++++++++++++++-----
>   include/exec/exec-all.h | 17 -----------------
>   accel/tcg/cpu-exec.c    |  1 +
>   3 files changed, 24 insertions(+), 22 deletions(-)

This is only within accel/tcg/.  Better to move to accel/tcg/internal-common.h.


r~

