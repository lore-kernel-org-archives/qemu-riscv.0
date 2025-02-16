Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5049EC021A4
	for <qemu-riscv@archiver.kernel.org>; Sun, 16 Feb 2025 21:03:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tjlnS-0008Do-6q; Sun, 16 Feb 2025 16:03:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tjlnO-0007vI-B9
 for qemu-riscv@nongnu.org; Sun, 16 Feb 2025 16:03:22 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tjlnL-0007zo-5c
 for qemu-riscv@nongnu.org; Sun, 16 Feb 2025 16:03:22 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43948021a45so38759635e9.1
 for <qemu-riscv@nongnu.org>; Sun, 16 Feb 2025 13:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739739797; x=1740344597; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qPXnTP3mseIxnWi5iwGj0e5kf+IUC/Zf2WfBfSwUIyQ=;
 b=N80bRGaCrRZuPaYgn8bsIHidBUvFPGTTjYowD72J91lKZzv+vfJ7HYKRppuiXVJ5bG
 qv8+nGZ3mPx4W5OYdBWbE8xgEKkmZvaMCaj8HlN77SmElaOwuywaAlurhjFR2fVbsuuu
 YuMWv7Qm5ghV+gx9KYaHG+hnt6N5H2bcq4WC86ik6YXBIaUVm4KTKG7OOjYiQs3WKren
 KTAR6wjasfuRAqPdbj5WdxJbtt0t4Qzy2XstLFi2c+dDxVb/DA3nwmQA731Yt7gb53cB
 pQd87i0lSi8dlGC6sRvZJ7ks0vyH8Wnw2imdml44m/n8fdZogjEYiW95DYOMYipthjJR
 xGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739739797; x=1740344597;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qPXnTP3mseIxnWi5iwGj0e5kf+IUC/Zf2WfBfSwUIyQ=;
 b=Xcbfjwu1t8sbD9xdM8I0ASBH29ZLdLVsNdkwz9sJLWLmJBt3uxkn05DfemC3d+4cGa
 TF59AA5tIpiiUNVnNugMQvT3Z++h00yYmHWKJ1bCJbNXI/Ske/yeu/sXY6JTAHHztH17
 rdUtFVkqu6OWKVBxltVBwus1GKfsuj6xSUC7c7vPlYjSisDVvBuKTM3oUFur71Lkbvxm
 DvXFLQn9/opZx5G+53ky9a77WVyBpOVFIH8m38EFbnzXATcef7Ww7KhkFee9R70pobPn
 ueuWvt5/5DWkCkmyazOevBLWgHf5uKLj6PqFY6NpuUd4MA1veaF6HHjoO+YRX0Kkf399
 ZJvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIfp6yfBImiy6+QxIACNOdTJuM7xxWLOWduNi/rUDe2okIfxhriHeVx3Kya8H1S8VpxlLdON9KpuX2@nongnu.org
X-Gm-Message-State: AOJu0YwxiZCA5swIgU7gkQyQiT7G7KJlXH6B+mu+GXcD3w4ke2poVA8/
 uQU6w4pzX6pMh8R/i/Z/RidAP0z6mXoJWGop3KYFZ6c+yCOh8pghJSRwuoJFHK4I8XRI2g87ZL7
 sk98=
X-Gm-Gg: ASbGncujxWFPbdSgoJ03qVPVYiU40Sd8/YY35SqlXpUHPzbX4+L1I7+IWyDhxGHUwiD
 lhbv4Nn5749Vqb1eXC/wD2PSPd9azfTXIZhEJiz99h4JY//Tiz3R+IHlz5aJMARyWij6WL01cZH
 j8yzz9ITT1zdgrClNzzRan+Kb2179AJmbqq9ZYMZfI88+OngDcDwe/IjgWxgA6sN/ahNRMpPL6U
 urzQEeGFo/3QdNHVjQU9yDYJ7VzMWNbIVHnbUZsqpkdRWYT8i9h8A36fFElQ7MMsDtQxxUNxRyE
 xtFYTcOg+UD7DXZHLRE9wo5xMGUG1MHjYzjFsYBiTwe3xDHaaNnwT2ml7fEYAGd/
X-Google-Smtp-Source: AGHT+IGe9IKju6xLCRnsjrM2PR3gKvWlBbJW3BKX00jwJvVvLQIb5sYlpdBXYK4zSlD7Kqf6S3GwYw==
X-Received: by 2002:a05:600c:4f94:b0:439:30bd:7df9 with SMTP id
 5b1f17b1804b1-4396e6aa4a4mr57876685e9.9.1739739796980; 
 Sun, 16 Feb 2025 13:03:16 -0800 (PST)
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1aa7e8sm135359705e9.26.2025.02.16.13.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2025 13:03:15 -0800 (PST)
Message-ID: <ff65a241-5035-41a7-beb3-d1c3232430d4@linaro.org>
Date: Sun, 16 Feb 2025 22:03:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/6] hw/microblaze: Allow running cross-endian vCPUs
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20250213122217.62654-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250213122217.62654-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 13/2/25 13:22, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (6):
>    hw/qdev-properties-system: Introduce EndianMode QAPI enum
>    hw/intc/xilinx_intc: Make device endianness configurable
>    hw/net/xilinx_ethlite: Make device endianness configurable
>    hw/timer/xilinx_timer: Make device endianness configurable
>    hw/char/xilinx_uartlite: Make device endianness configurable
>    hw/ssi/xilinx_spi: Make device endianness configurable

Series queued again, thanks.

