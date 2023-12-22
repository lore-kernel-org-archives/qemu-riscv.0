Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212D2C41535
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 12:03:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGeFU-0002We-6m; Fri, 22 Dec 2023 07:03:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGeFT-0002WJ-A6
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 07:03:27 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGeFR-0001Mj-Ox
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 07:03:27 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1d3ea5cc137so14736925ad.0
 for <qemu-riscv@nongnu.org>; Fri, 22 Dec 2023 04:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703246604; x=1703851404; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2OZrcMbF4IC72z/H6USRbLJpj60y8dWQhBpm2pxlgdI=;
 b=DC8CRTddlFgWvO2wrcr13dWFIp13Y8d8hoVn3swfesHb1BkjwfR3DFBaCD08+SRRL4
 Tuqp5rqNRhNJ+ERPot8dEs+noR+qGn9dRDjNPANnqdVg3WaOqVXTsFsbxMslFDf4uJ1V
 1RCPHxxjhAZhb2ZnR9+KI2wI/vW86yFKYH3ELKlLxuJkefWkuSeo+AlyeIRZjkSXvioO
 vLknuVZ0l5JYGw1XxU2MCLlHvRjIDgz9sOgS/tN0y/W6CgWjqVsJ8klFKcOykT+bPWoD
 xYRCCfxRjv65TOuaMbhogAPIaKCjnx88R35a5gZAMjRyS88Q1WIkSdSIFG1+5d94OBX+
 HkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703246604; x=1703851404;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2OZrcMbF4IC72z/H6USRbLJpj60y8dWQhBpm2pxlgdI=;
 b=wHKbShp3a6AuuQ6PwWBZZkxrnE/9x48pINjsXRaDAF0BfNBloy56uFFtXjUQwzWY4I
 vrdUpNKbQa+dXsuKNWaCyXcEQdAWSwyYRUovnahkV3a7DYe1/YvbGJbhMpPj+L0L4eDr
 jVFzfjC7pGpgU0u6ekKOvmnNbKcERtXlGbSSwRDxYzVkR7+G3L9xtTxQ/jxEH/MCuMBQ
 dWsuORjhr3bviXvGOyzsaTSQDqsIT4hcHpc0RtNAOZtAOWdjwoKtLYa8qebmGaZBKOn8
 YxBMLgTNcIw/apGZFpy/OxugK2qkkjtLK0j8OhNwL8tmXo/Sfb1lKCjXrUL/+9v4akvx
 3Ehg==
X-Gm-Message-State: AOJu0YxJo9St/x6uD5DJfPC0gsTiIBgneBd86d/DLEd3EHmYX3nKAiYi
 xYy91oZ14VFr9NfwsHz+ZmnQGvveeUPwgQ==
X-Google-Smtp-Source: AGHT+IE96dKw4yNtfYmBr4gkJYGkDu2cO1NasS8Qj4RokDTN4tZj4u5TM/w0zoUztD8BlPaKDQjJKg==
X-Received: by 2002:a17:903:244a:b0:1d0:8e08:35be with SMTP id
 l10-20020a170903244a00b001d08e0835bemr1349592pls.7.1703246603781; 
 Fri, 22 Dec 2023 04:03:23 -0800 (PST)
Received: from [192.168.68.110] (201-69-66-51.dial-up.telesp.net.br.
 [201.69.66.51]) by smtp.gmail.com with ESMTPSA id
 g22-20020a170902869600b001cca8a01e68sm3271402plo.278.2023.12.22.04.03.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Dec 2023 04:03:23 -0800 (PST)
Message-ID: <10ab017f-41a0-4e1f-a0b4-d18495d2b616@ventanamicro.com>
Date: Fri, 22 Dec 2023 09:03:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] target/riscv: move 'cbom_blocksize' to
 riscv_cpu_properties[]
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20231221175137.497379-1-dbarboza@ventanamicro.com>
 <20231221175137.497379-12-dbarboza@ventanamicro.com>
 <18451041-c186-4e33-be31-3bfd4cf5b401@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <18451041-c186-4e33-be31-3bfd4cf5b401@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 12/22/23 01:40, Richard Henderson wrote:
> On 12/22/23 04:51, Daniel Henrique Barboza wrote:
>> +const PropertyInfo prop_cbom_blksize = {
> 
> static?  Same for cboz in the next patch.

Same in every other patch where I added a PropertyInfo it seems.


I'll fix it in v2. Thanks,


Daniel

> 
> 
> r~

