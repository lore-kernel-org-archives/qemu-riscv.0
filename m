Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46937C282D2
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 14:24:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tp6iQ-0000sM-0K; Mon, 03 Mar 2025 09:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tp6ht-0000fW-0Z
 for qemu-riscv@nongnu.org; Mon, 03 Mar 2025 09:23:45 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tp6hr-0000DX-3f
 for qemu-riscv@nongnu.org; Mon, 03 Mar 2025 09:23:44 -0500
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-30b99c6cd35so26887391fa.0
 for <qemu-riscv@nongnu.org>; Mon, 03 Mar 2025 06:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741011819; x=1741616619; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pF8mhgVS9mR7+xpM7SF4Y/E3aG2pQC5gehg+3H9tV80=;
 b=v5kfkr/sUcaPZXGKq7AOTS1+L5OOAYgrIxq1DBmDZYwJpbaGR/sqCYcZ3xYtzVywE9
 N4N3//ikMAJFufDfxuSYfc/3DO44j1/auPZMFFKr0ERzsxcqpFX1H3socX95eP3NrpIB
 hQy+Lg+Itbz9sCRwvYtKw1ydIpxumx4JOqTLoFQ+KkzYRQGe/EQjDDwYFTxcLyyD3YUB
 VnOXybetYPH6QthuKnhKg2u4vBMeUQmW4f4P9Ckn1sODkIvnuQttQiydXjBN+X99QMeK
 EWUjvOOQmXd4uAzpGUruoPiJ4Z4sBo2ky/2s3NsYwOdX7tHwKUicjGo4H+9UKrekvY3m
 Pvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741011819; x=1741616619;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pF8mhgVS9mR7+xpM7SF4Y/E3aG2pQC5gehg+3H9tV80=;
 b=SU1+bvTx+XkXvTi8VSJ9807m/DZfKmKV5TqX9g93yaUmyT6vgr4+1L4lsuS8vzCF2a
 mgdRCcejHTpuctXZuxHhlWl8zYYCw4BukqXgBhHdEPkpF5MY64fVj4hou7LsXfI/9CK+
 LiE77qcQVOp46cSGm9NKGP8Q6SSEJMHWIwoFv0rjTZoFjJLoALdYjqZf5cSeV0OalrPC
 CoXvYzbsWdB9etqPg1wr3hNNLyj69P+ygH73uA3/FTSR+c1B5MNh171kgpy4sPpO663F
 yCYPsCaZ0wc35gwqa0HfLQh5WLtFq4/31OFoCRldS3++JcaU3D2QnDaFUjvApObeQsYB
 Ifeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjZ1HxlHMk8Ql0HhNF53GyOv3SOqD+cAtccbS4VoHpFbqfus4NPRIAMQsSihXpKKdQRVupM5lubsCM@nongnu.org
X-Gm-Message-State: AOJu0YwTMMnOzORC2Rt3thx/xXl9jT9pwR+6CHID9qxc5ic4BfnUyV56
 qftRPFN3mttqgVO8awEo8CzzSKRu38XmmmbotSwdGbeRYQ//umQfR3xKmE0Ejnc=
X-Gm-Gg: ASbGncuIA3Z2B1IVBT8IS+RWcTC22Pmj391F9OV9wOaHosvDrVavyRFFU10vUWZc8dr
 /5d/IytCAsirdOJApEDrYe7/iPZ0PsTzqdE+45SaImyu/Rwt/o4XhTAGshPeYpEmdIbQwi+724n
 sllYrufz8g3zflGuC9HfcajuGSIFYpX1VJduTkfZWOyNLwDNEWMWjYsX/dIyIvJ+YaPPeHJAUvp
 gRXOK0Cg35yis+xKvsJwlXkDW7cZNtWrApLz33YWv+xjlq/OllBSIPaFI5S7k6hSg6Tpn5o1S01
 T30u31QWjY+DA6GXQVrrNr2hWcmGFAWVY5H4qSz5zyp8chEtIanPnBz3zjRanIeJU3xQYrQiw6Z
 KHVanIzonNj7j
X-Google-Smtp-Source: AGHT+IGautwzdxbFpKOav9W11W73VWUeR18+q7gSWI1T5LbnQC6a6mxUxouTG99MtltBGDByZeGB/A==
X-Received: by 2002:a05:651c:19a7:b0:302:2620:ec84 with SMTP id
 38308e7fff4ca-30b931f9d3dmr45740011fa.7.1741011819461; 
 Mon, 03 Mar 2025 06:23:39 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30bb22c2189sm5179171fa.33.2025.03.03.06.23.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 06:23:38 -0800 (PST)
Message-ID: <846d2da9-1254-4c38-aa36-d3160bb84b0e@linaro.org>
Date: Mon, 3 Mar 2025 15:23:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/char: sifive_uart: Free fifo on unrealize
To: Alistair Francis <alistair23@gmail.com>, palmer@dabbelt.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, chigot@adacore.com
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
References: <20250303023120.157221-1-alistair.francis@wdc.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250303023120.157221-1-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22c.google.com
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

On 3/3/25 03:31, Alistair Francis wrote:
> We previously allocate the fifo on reset and never free it, which means
> we are leaking memory.
> 
> Instead let's allocate on realize and free on unrealize.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   hw/char/sifive_uart.c | 44 +++++++++++++++++++++++++++----------------
>   1 file changed, 28 insertions(+), 16 deletions(-)

Patch queued, thanks!

