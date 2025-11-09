Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3944BCCFA1A
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Nov 2025 13:56:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vI5uC-0005fH-Ru; Sun, 09 Nov 2025 08:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vI5tv-0005Zx-EV
 for qemu-riscv@nongnu.org; Sun, 09 Nov 2025 08:56:18 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vI5tr-0003AF-7P
 for qemu-riscv@nongnu.org; Sun, 09 Nov 2025 08:56:14 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b3c2c748bc8so275154566b.2
 for <qemu-riscv@nongnu.org>; Sun, 09 Nov 2025 05:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762696568; x=1763301368; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KIdpjXo0r6s66hWwLKpdXWvog9BjlXyRWXujWoi5mMU=;
 b=S5zRwUPjEo9I3+/n8rIryHRkw8h7UFnbj7fU0yT7Rf/2T+7L21aUm3x58kLhnrBMKq
 ulipg9R8g9KhR6PPn5vy7biu7NOd/G1gLguPIjsPgPPBDVqTCrT2jy+YnON3UpR6HVko
 /hS+Dso7g0HPk6qabKjTp7BYQGz3+VKkjP2ROBzD5gCb+TjX9ORb1A7UYWvOuTOypWkU
 qjhk6yjuObiObZaMY/8nj9hMTE9O7v5uiCWqBaSHo+GCWPhyQEphxUFj3howM5hwGN3R
 Slyffs3ki1FffmWiQ83JB0Aitevt3JGb8jplcw43HUAai+zxn2Ghpxffq1DA0MQPW1sH
 g+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762696568; x=1763301368;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KIdpjXo0r6s66hWwLKpdXWvog9BjlXyRWXujWoi5mMU=;
 b=Dt6E3c33BnaUWy+IigvUzy6gDA2keU1vi7fkiVyVc1GPuS3tXWNHxuOe/kwCXoTmIU
 1DR+ILMB6cx/jMYXLoMLpSxZ383CKTeWbgHZ/M/VM0FCLdu22f0OSTJBTYWVpgzu9PFk
 VOwXHghtfcPwGjcMo1noT8YuRnUI1iuiHhsZNXkQo9Ld+cihfC/opWlhGw86Alz6/v3i
 VQ0kY+mRmRk17Yqn4a58NaXYeqJODxyvhwj8haHGMfvqqLgc3YjTn4KuLo2y5ofSpDG6
 vmcjtOxE5LErLle0GAkehxBxw0oZfPV2Gi9x38qR5ha1a5UkUtuGOgLfH3v8i1e9pAkf
 OAgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU78c1tc2xWm6+YRJwutECY3bF7gGbhABeAAs69Xc/GUofdfVIL02cynrTS51HP8SnIHdQuKcQ8EiXk@nongnu.org
X-Gm-Message-State: AOJu0Yyu7h0Y6F24p86FwkHN/QlxpMQyZghf1taUze32pFXIrszAgS/+
 trcOorEdQHNZkuw6WLoZZO+Y79/cT93HzAmOj0ZxhMO+oDAPtKjDOEQK0BEmkwpmwMY=
X-Gm-Gg: ASbGncswKZzZAwDtPhXsoQ27dC/7R9eK1rWBE6vGc4QewG7JzoUsqkM7mIzNrXansu8
 t8jgy++K2x9y40vd48Wy7OwuQmUD2vkA0G1fo3LlXF2AwBn+JzNev/VJzjdeJZGX4tIvaOrggc6
 oHm/Qfn+UVmM2okZiNpmFXtHmbQajDP+M3UGL3C4e25PrhIs8u79ZZzOrz2jx7vvHgA8J9RpEt0
 lGwaJKEuSK3g4OdOLwGAXF8VuulznRLLAGeofpsbtrzCEJM3CoZ3kdtC+ATQZsK2FIWiYI0Z9Yo
 wOQNizsm/mJHNRgSP7VnZr05sdAEas1r1SYbdAbnIagHE0uOQzVbn9z/r3L5qOZfJ1VW4OiJXhm
 jIftDqVWpFdmSEMH/25onoms9PDC2CH6NndGHZsGq5O11/BDhK5HOiRCesivLNtrzdwLvIiN0aG
 +pKhVTQzL5leD9SWMImE3KtoP983AmRJPR/SVk9s1JPN1zkBM=
X-Google-Smtp-Source: AGHT+IHx4/lpPmoD0dy5mjaAWMmzLwBwQYS1I5sMzfgig3IEkS2ijPWHm/iCzwGQckiAYr3N7jHtWA==
X-Received: by 2002:a17:907:60d1:b0:b70:bc2e:a6f0 with SMTP id
 a640c23a62f3a-b72e02b3521mr452532166b.5.1762696567704; 
 Sun, 09 Nov 2025 05:56:07 -0800 (PST)
Received: from [192.168.2.7] (tmo-086-152.customers.d1-online.com.
 [80.187.86.152]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf407a01sm810683766b.22.2025.11.09.05.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Nov 2025 05:56:07 -0800 (PST)
Message-ID: <dde87e6d-6790-40e3-bfc6-418645b3dd91@linaro.org>
Date: Sun, 9 Nov 2025 14:56:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] hw/intc/riscv_aclint: fix coding style
Content-Language: en-US
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>
References: <20251107102340.471141-1-luc.michel@amd.com>
 <20251107102340.471141-3-luc.michel@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251107102340.471141-3-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
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

On 7/11/25 11:23, Luc Michel wrote:
> Fix coding style in `riscv_aclint_mtimer_class_init' and
> `riscv_aclint_swi_class_init' functions.
> 
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> ---
>   hw/intc/riscv_aclint.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


