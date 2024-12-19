Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FDEE77184
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 17:11:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tOK3w-0008M5-45; Thu, 19 Dec 2024 12:11:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tOK3u-0008L7-AG
 for qemu-riscv@nongnu.org; Thu, 19 Dec 2024 12:11:46 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tOK3s-0005mY-St
 for qemu-riscv@nongnu.org; Thu, 19 Dec 2024 12:11:46 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-385ef8b64b3so793759f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 19 Dec 2024 09:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734628303; x=1735233103; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CmHnEsj3gsaS1zdUBiynZBNgVYBd1XrnEMj/qbSnzLI=;
 b=TszhWQ6sBzJA5sCLF/G3da7SP/+FyctRLz3WR/7eFVO7lP95be0As+qeXEu4CsnP1G
 uTw1hdr1K7qQBzqHh3Tg6x0XXwLGVeqvtV7F3JxZeb1yxa4Omaz5fdo1/KShhObxjVqj
 32RPXuGW6BbnhmTc7b+ttL97vChYtKaBzY+YXmx2mXsua+I1xz5eXTDDgmWiBZLsEK5A
 jXMvquEaHPs1KzhZMEFSErkhaNfmJoc0br99vq/u1fJvBsry8f0430LYUe+qoFAcygyY
 xarBFoZ6+Lft2/zgXxkvxF+QI4P+24yg0n4yT1m1vbe9oPEeJylief1yw0X+Fny09jc+
 Y2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734628303; x=1735233103;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CmHnEsj3gsaS1zdUBiynZBNgVYBd1XrnEMj/qbSnzLI=;
 b=f1MiPTqfirHTkXSsb9BbKdt2HTBYDHBf5ciqTk1+83ZPQa+sDQ+IRM9ySZKme1Q541
 0ba5DWdu3tMHdFLeAIRSTIBdP/9wI3ppmMYSwLlK6H9SeRyLJ/r5hJiYFyNhO++1JEF6
 b6WbzRyZSm8frGkIP2+Euk6+4Pa8OmYA5qsr8ywxKqY3I9mdbqGR+WzmgdfSGq+0aFXm
 BQu9nBCUBcpR/9+fIEGMFRqJmEu0JReEGxGnZHTIdy9es3+wavt8QdhmbyUCVQ4FMg8Y
 k7QL5wGmSnk02ViVKrnKtyN42gZBHkQ9Nbc4eIIQv3wLZSBwGfXOWe1gjwBTFfXEIiOv
 8TPA==
X-Gm-Message-State: AOJu0Yz2h5BlwvCaVueE4CP0WjzomalgxbIx0rOPofFC4ey9yShC3MLS
 MEt/MOomkH86a+vksJDTItydKj/ydQe12iWO6ObYODG/qouluMHSI0T7LrlUrnA=
X-Gm-Gg: ASbGncvCfj4gP8QtEBdpRK46mSSmCJwPDB+dAkrJbMrP0UHmMgLCJ4nDL+7183K2kBw
 ZURZL9GsHt384EjXKlooMq4fIjw4pxrHa/73T+wFJdbz+u7mstEiETgtuK1s6tePbVGf3HuuhVo
 u6rf5ZHLe17b75C1ls9PBiElL2mlWe8XuKXPgzQnsMqFPElcrMqxUCQQZCEnOvVLRtHsmpPMdFi
 XV+5bpOGZJEeqK22EHgek7/+EtGxLh099/uzp7UWsD0UAtMokxzgoC3GeO3tNoh+p/7F34=
X-Google-Smtp-Source: AGHT+IF+ZqXlAZt2iKiq6RbJ7N7JQxmAmuE6Pxkhc5ca1Mnl+qLhANmGSrqdNYRtpTI0ZVguN/Pu2A==
X-Received: by 2002:a5d:6c64:0:b0:385:edd1:2249 with SMTP id
 ffacd0b85a97d-388e4d99564mr6498460f8f.50.1734628303336; 
 Thu, 19 Dec 2024 09:11:43 -0800 (PST)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656af6aeesm57730605e9.6.2024.12.19.09.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 09:11:42 -0800 (PST)
Message-ID: <914c9d14-a416-4156-bd03-dc6764d17088@linaro.org>
Date: Thu, 19 Dec 2024 18:11:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/tcg: Un-inline translator_is_same_page()
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20241218154145.71353-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241218154145.71353-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

On 18/12/24 16:41, Philippe Mathieu-Daudé wrote:
> Remove the single target-specific definition used in
> "exec/translator.h" (TARGET_PAGE_MASK) by un-inlining
> is_same_page().
> Rename the method as translator_is_same_page() and
> improve its documentation.
> Use it in translator_use_goto_tb().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Richard, I'll merge this myself once reviewed.
> ---
>   include/exec/translator.h    | 15 +++++++--------
>   accel/tcg/translator.c       |  7 ++++++-
>   target/i386/tcg/translate.c  |  6 +++---
>   target/riscv/translate.c     |  4 ++--
>   target/s390x/tcg/translate.c |  4 ++--
>   5 files changed, 20 insertions(+), 16 deletions(-)

Patch queued.


