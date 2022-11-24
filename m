Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyCYo-0007NG-ER
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 08:46:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyCYn-0007Mz-9G
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 08:46:37 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyCYl-00088u-HF
 for qemu-riscv@nongnu.org; Thu, 24 Nov 2022 08:46:36 -0500
Received: by mail-wr1-x434.google.com with SMTP id z4so2568932wrr.3
 for <qemu-riscv@nongnu.org>; Thu, 24 Nov 2022 05:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8AaT/GhGTjy8ESIpRFvBoR67Yyx+6akM558wY5Ap6vc=;
 b=qnEG7HzEcwBr+Y4oc5y2Ue9OQ6iDoub//yLy0DYbfxPeHnMiJEJoOcnVhPZniXpTbu
 aEVUZuGtekJuzfe+hQzAnWZkqkXXx4H0c9pJDMnKhdRCxaGxoa+7w7VCUJ6It6HClidH
 PkFQPtw6MykPjgewZMgiXVMRjeLa9I/6Ab+3boGu8MIF4My4Za+yILFEzvrjm4pGXC2+
 ya5nksM/lZZxol0z2uriBhL+XIM+1NjhYZ1O8oqhJ3PIDhuMXA0+44lp1Xc1zGUpkS5V
 nIG8y5YBrLtCiUyFd6jkCPACSp/Dq9HgPrATThR+gMpVfUb3djUUOo9OXFdQlRC8zxW7
 y+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8AaT/GhGTjy8ESIpRFvBoR67Yyx+6akM558wY5Ap6vc=;
 b=BuOE5TB52jg7z1mcZ70xtCc2Mt+G4+vZB2xJfN6skimOJFEO9aynOs9c1f7kK0ZymS
 d3xH/VRAPS19x/s9Y2LAAzgiXFOkwitfQ5VcV4v1fVGBbcBY03M80Kx9raC5PUgCphx9
 fpT4OxmmtmW/j7RUyrb4EC2kuVQCcqOOrPdSuzV8pJVsqXPNmpoS4NT61bmEfwnbIAVm
 2HYU+Pgr5w/pwUPJegsdV3g/6ng+0myups5amRASbyVx7gvRA8nKKsTIwP7Y7reicGQo
 S71N+fgQ69p80GRBiZABQvV8/GYrR5tN2hCpV7tf0Q7swuBLIZyGyLLKMgXnGgi+44TR
 RCtg==
X-Gm-Message-State: ANoB5pkNpIchN9Xr7wCfX4ahOUvZvr5eKJnfFlrg4/hAzYWP6VOp2tWC
 bxlTPq1hy7FEVCExOyj7JcOKsA==
X-Google-Smtp-Source: AA0mqf6YX7uqV9S4WYPXl/HVz8XiQYdLg8OeJzLjI7ijK1U5MJpbRvLld7dRGY5gi7+N9aNG9MZLwQ==
X-Received: by 2002:a5d:4568:0:b0:241:e8b0:cdcc with SMTP id
 a8-20020a5d4568000000b00241e8b0cdccmr6197800wrc.581.1669297593585; 
 Thu, 24 Nov 2022 05:46:33 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a12-20020adfe5cc000000b0022cc3e67fc5sm1340878wrn.65.2022.11.24.05.46.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 05:46:32 -0800 (PST)
Message-ID: <51024464-6fd6-4181-633d-1e261c19917a@linaro.org>
Date: Thu, 24 Nov 2022 14:46:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 00/19] Convert most CPU classes to 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 24 Nov 2022 13:46:37 -0000

On 24/11/22 12:50, Peter Maydell wrote:
> This patchset converts the TYPE_CPU base class and most subclasses
> to use 3-phase reset. (The exception is s390, which is doing
> something a bit odd with its reset, so the conversion there isn't
> going to be simple like these others. So I'll do that one
> separately.)
> 
> The rationale here is that we should be able to get rid of
> all the remaining uses of device_class_set_parent_reset()
> and remove/simplify some of the transitional code that's
> currently bridging between "legacy" reset and 3-phase reset.
> 
> NB: even with this series, it's not possible to usefully do
> anything requiring 3-phase reset of a CPU yet, because all
> CPU objects get ad-hoc reset by some code somewhere doing
> a cpu_reset() call on them, which will just do all 3 phases
> in order. I would like to try to address that eventually,
> but it's not trivial.
> 
> thanks
> -- PMM
> 
> Peter Maydell (19):
>    hw/core/cpu-common: Convert TYPE_CPU class to 3-phase reset
>    target/arm: Convert to 3-phase reset
>    target/avr: Convert to 3-phase reset
>    target/cris: Convert to 3-phase reset
>    target/hexagon: Convert to 3-phase reset
>    target/i386: Convert to 3-phase reset
>    target/loongarch: Convert to 3-phase reset
>    target/m68k: Convert to 3-phase reset
>    target/microblaze: Convert to 3-phase reset
>    target/mips: Convert to 3-phase reset
>    target/nios2: Convert to 3-phase reset
>    target/openrisc: Convert to 3-phase reset
>    target/ppc: Convert to 3-phase reset
>    target/riscv: Convert to 3-phase reset
>    target/rx: Convert to 3-phase reset
>    target/sh4: Convert to 3-phase reset
>    target/sparc: Convert to 3-phase reset
>    target/tricore: Convert to 3-phase reset
>    target/xtensa: Convert to 3-phase reset

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


