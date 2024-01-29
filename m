Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4038C47DDB
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 16:50:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rUUq1-00043d-F0; Mon, 29 Jan 2024 11:50:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rUUpz-0003gF-7v
 for qemu-riscv@nongnu.org; Mon, 29 Jan 2024 11:50:23 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rUUpv-00058D-3D
 for qemu-riscv@nongnu.org; Mon, 29 Jan 2024 11:50:22 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e5afc18f5so34983635e9.3
 for <qemu-riscv@nongnu.org>; Mon, 29 Jan 2024 08:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706547017; x=1707151817; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=omKaa0iHW1o+ye+O07qQ9YI+SPw/nbBCLeN2GURIQnI=;
 b=zmfC6C1fFqVbAWm1bARwkaLTiIvxiDsxKqp5itaTaFpbCxbhP8Nb0WJgKkoKt3gTH5
 5uOxdLzclXzDo3QI44h1NRLgMk7te7pMvjthKDVcLV0OhnckBeZU1ygYhL0dR0jcwuW2
 1GQ4uFMD6y3/kd5NGQQspQfC/slbO0wsmidiy9/5c5Q2N5s8hhvFcRljLVMAtSRb5BPw
 HQ2Yx42oYsHz/cAJ0zoA13mTL6A7W7yfNiCW8lbpR8BsL7Py+GLKEE2lNup92bTFhbHu
 PQwtdnwsEBy7zPe+0YTiaT7Q62eEyOOqEcJJfPRJOAV1qUL+6MJ3yFsA4LcYFTYq2if/
 6bxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706547017; x=1707151817;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=omKaa0iHW1o+ye+O07qQ9YI+SPw/nbBCLeN2GURIQnI=;
 b=aHnIgwOH6Oi9sWdn6qBMs0dcvxjfQZ/PxSuOFNqB7bW3eAU+pOCGBYQSrDYw0lne68
 XCHPg8rVqTffg41Gn6ssfbFO9IYXO2KzCRJZ4VdatateulOoyD9sVUwc+5eoSeaTCmtt
 PrTLcrwwPq0YKHrbUn0p6tgQDQMe2UoEVGJuKtEluADVK6CF9WboItSJTXSt/teYPuJi
 D8ujaN6RoZr8G3Szl9Cdud1DzjuGcq5dKVBVQPEG7+Lwp2Disu2ES7wWUFNkRe27kc1z
 PMxAGIQ1tnZrIHOA7HL/3BubfoVjfC3dL5G+qzuy5w1f9WKgpUBQkT1zY4oHlxSFOk/U
 wlug==
X-Gm-Message-State: AOJu0Yw6xT68w2aRmUno41Y6JgkrTQnZZ3UsEA1xl33cD0Bd/1Dmut4h
 GRtRV7CTJxizKnBWQl9TJOhkE0wcpFDS5t+E2mBmPbu0FzxuOlJiBHnbzq4VVmw=
X-Google-Smtp-Source: AGHT+IENRodsNqBb2ZsMapK29qw3M64BL/PIvqlcP6V/HUTtgCz0m1D+dNQrPnYAHAiX3P1S+64j7w==
X-Received: by 2002:a05:600c:4e88:b0:40e:5523:e6dd with SMTP id
 f8-20020a05600c4e8800b0040e5523e6ddmr5423979wmq.30.1706547016686; 
 Mon, 29 Jan 2024 08:50:16 -0800 (PST)
Received: from [192.168.69.100] ([176.187.219.39])
 by smtp.gmail.com with ESMTPSA id
 iv16-20020a05600c549000b0040e3635ca65sm14633892wmb.2.2024.01.29.08.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jan 2024 08:50:16 -0800 (PST)
Message-ID: <36852ecc-36da-4b8e-bb81-13938a100100@linaro.org>
Date: Mon, 29 Jan 2024 17:50:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/29] target/i386: Prefer fast cpu_env() over slower
 CPU QOM cast macro
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
References: <20240129164514.73104-1-philmd@linaro.org>
 <20240129164514.73104-15-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240129164514.73104-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 29/1/24 17:44, Philippe Mathieu-Daudé wrote:
> Mechanical patch produced running the command documented
> in scripts/coccinelle/cpu_env.cocci_template header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/i386/hvf/vmx.h                | 13 ++-------
>   hw/i386/fw_cfg.c                     |  3 +-
>   hw/i386/vmmouse.c                    |  6 ++--
>   hw/i386/xen/xen-hvm.c                |  3 +-
>   target/i386/arch_dump.c              | 11 ++------
>   target/i386/arch_memory_mapping.c    |  3 +-
>   target/i386/cpu-dump.c               |  3 +-
>   target/i386/cpu.c                    | 37 ++++++++----------------
>   target/i386/helper.c                 | 42 ++++++++--------------------
>   target/i386/hvf/hvf.c                |  8 ++----
>   target/i386/hvf/x86.c                |  4 +--
>   target/i386/hvf/x86_emu.c            |  6 ++--
>   target/i386/hvf/x86_task.c           | 10 ++-----
>   target/i386/hvf/x86hvf.c             |  9 ++----
>   target/i386/kvm/kvm.c                |  6 ++--
>   target/i386/kvm/xen-emu.c            | 32 +++++++--------------
>   target/i386/tcg/sysemu/bpt_helper.c  |  3 +-
>   target/i386/tcg/sysemu/excp_helper.c |  3 +-
>   target/i386/tcg/tcg-cpu.c            | 14 +++-------
>   target/i386/tcg/user/excp_helper.c   |  6 ++--
>   target/i386/tcg/user/seg_helper.c    |  3 +-
>   21 files changed, 67 insertions(+), 158 deletions(-)

Actually this one had:

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

But since I addressed Zhao's suggestion in patch 1
("bulk: Access existing variables initialized to &S->F when available")
which added more changes to this patch, I dropped the tags.

