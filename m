Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54523C54E71
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 07:15:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rnZ6l-0001Xz-H2; Fri, 22 Mar 2024 03:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rnZ6k-0001Xi-6j
 for qemu-riscv@nongnu.org; Fri, 22 Mar 2024 03:14:30 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rnZ6i-00066F-84
 for qemu-riscv@nongnu.org; Fri, 22 Mar 2024 03:14:29 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56bc753f58eso1980434a12.3
 for <qemu-riscv@nongnu.org>; Fri, 22 Mar 2024 00:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711091666; x=1711696466; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2SMFmlKvi3XK+b9AwqD4mM21rYhCikFTvlns1pr8FQ8=;
 b=RjgO1tEBk4iPl+d+YUSOWqD+85hlK4VYH8DS8TutXkLuNIrkUqzeYYrXdBEcXC2QmG
 NHrW33mFabWm5J/gn2UcpaQ++FQvmK/PZDY0iwPlcjNpc3Ca3J6GHnbYgq2DF/xM5+lV
 +D+unIPPEb4OUDbba9jUYkr9owmdD7PysNPS2JhAmYTMEqdgMAI74y+SuH4vw0S0MyKK
 FQl5+4hGHR41OZ9i5Ph/i3UTNdphhL4g88nX9E9LpV1j4KohmgKW8JYHoh4gfXsyHVrX
 Z4I+y4HS3IvLv8WJZl/JawRA0/Ggg7K23RkLknMjAg9KWfg3sdlbcDO0gHLI6C1mD0qx
 ZGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711091666; x=1711696466;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2SMFmlKvi3XK+b9AwqD4mM21rYhCikFTvlns1pr8FQ8=;
 b=iwzuxtS0p6qb6od6qeJ7SAGkgy8Nq9QQ5bMMahAfmfcGnuQuJOhILXlfwOGxfvrRUy
 caEUzIF9AeAHf+0TGpl5z74fQj3D+uGPIsOZXpRfxOAmCUfIOEBnclnKqzspi6gy924X
 0vD8nYDOdnlJeU5DMUqIn417MgGhH/wlGcF+yDCe2fxa+CYTxGf9FpB8j76qu1H1ZQL8
 UoB5hc30bxInIhfzU673Ik4CxHjXM8Edv6rIU2Ecqs+LbEv04ng4JMvyMe0uaz0uCvdr
 1ubJG9hqGkofKGPjRAuRiXTJ+qdBU5D8dZwNovnL15pHKo6kvA7FMLr6VDW7CgGelt14
 lNzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnPYWBtUbd6kHbGAxzXv3MDejLSDyNE+z/SB2mGse3aDLys96HjSKSgtrDg8YgEXZB5PpvowpOMkA35nuDxnTNBQQAkyo=
X-Gm-Message-State: AOJu0YzQNNYGwZR8ei/7iLLDqR2IorYBXr32cvYiQ4NkotPsEZfamSeu
 5umygsa79wsvhMzzXOMcr8mZSb4GWNkFO07k3+fW6gteGJbtHlJUsK0grzMM/J8=
X-Google-Smtp-Source: AGHT+IFgT1c3Ls4XRxrWt1YwlmPa5s+ga1yFCAE2BBDrP31IhbtrImytLfsrkuv0Ach5QYBdF0OX/w==
X-Received: by 2002:a17:906:34c5:b0:a47:153b:45cb with SMTP id
 h5-20020a17090634c500b00a47153b45cbmr835977ejb.30.1711091665883; 
 Fri, 22 Mar 2024 00:14:25 -0700 (PDT)
Received: from [192.168.200.106] (83.11.22.169.ipv4.supernova.orange.pl.
 [83.11.22.169]) by smtp.gmail.com with ESMTPSA id
 ch11-20020a170906c2cb00b00a47090964casm690605ejb.184.2024.03.22.00.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Mar 2024 00:14:25 -0700 (PDT)
Message-ID: <cfac29ce-f353-4bbd-8e8d-4a7d40bf80e3@linaro.org>
Date: Fri, 22 Mar 2024 08:14:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 2/2] hw/riscv: Add server platform reference machine
Content-Language: pl-PL, en-GB, en-HK
To: Alistair Francis <alistair23@gmail.com>, Fei Wu <fei2.wu@intel.com>
Cc: pbonzini@redhat.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 andrei.warkentin@intel.com, shaolin.xie@alibaba-inc.com, ved@rivosinc.com,
 sunilvl@ventanamicro.com, haibo1.xu@intel.com, evan.chai@intel.com,
 yin.wang@intel.com, tech-server-platform@lists.riscv.org,
 tech-server-soc@lists.riscv.org, atishp@rivosinc.com,
 ajones@ventanamicro.com, conor@kernel.org, heinrich.schuchardt@canonical.com
References: <20240312135222.3187945-1-fei2.wu@intel.com>
 <20240312135222.3187945-3-fei2.wu@intel.com>
 <CAKmqyKN-Yj-HZrR2MtxD2jC=JR6nFn5cEq866EXm0OfaEydXsQ@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CAKmqyKN-Yj-HZrR2MtxD2jC=JR6nFn5cEq866EXm0OfaEydXsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ed1-x52e.google.com
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

W dniu 22.03.2024 o 05:55, Alistair Francis pisze:
> I see no mention of device trees in the spec, but I do see ACPI. Do we
> really expect a server platform to use DTs?

This platform "kind of" follows sbsa-ref where we have very minimalistic 
device tree sharing information qemu->firmware.

libfdt is small, format is known and describes hardware. Firmware is 
free to make use of it in any way it wants.

On sbsa-ref we parse DT in TF-A (base firmware) and provide hardware 
information to higher level (edk2) via SMC mechanism. Then EDK2 creates 
ACPI tables and provide them to the Operating System.

In physical system some parts of information provided in DT would be 
read by firmware from onboard Embedded Controller chip.

> These functions should be shared with the virt machine if we really do
> want DTs, but I'm not convinced we do


