Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6qnL-0001ve-Sm
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 04:16:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6qnH-0001sI-Na; Mon, 10 Jan 2022 04:16:49 -0500
Received: from [2a00:1450:4864:20::334] (port=36850
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6qnG-0002qF-6z; Mon, 10 Jan 2022 04:16:47 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so9296439wmk.1; 
 Mon, 10 Jan 2022 01:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jOyzg3Rt8z3MJD3QWTZsoIE3qmNx0cA+eSBO5UhQJWg=;
 b=l28Lka42sui1gH+YQDUmlVXRpYop6EvX3VOjE+rPb5Kt1uQyPToMNuPJ/cfA/PkN1O
 SAcoB3yV501YLXfdFEJtJfXKGjOvZSCizMHyM3zZzv8VjPTthkgqFd5KxyiGh1pWpPjf
 2YTMRedYzBfwoKfDJ6AdaFUkX4z8VwocxHQutwbP8ukV08+SEv8EJuOm+v9yZC79oAqZ
 dVBkkfw2DLAQld9nQy14M4Rd9BvP99ww8pgdGohzqhidT6B3RPPZPFNir+W6x0kRgRlQ
 UMaUM4+pyEHl1GIqRIxs2FkNMZGvREt8pUdVK9ZWtCX7MAZoPdtovh+sBbl5xtJFV2Qq
 VYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jOyzg3Rt8z3MJD3QWTZsoIE3qmNx0cA+eSBO5UhQJWg=;
 b=jsx2sa+skO16hNbE2fSIGPKr2I9LxyuCPaxEOO8pVlztyHTqt6Yfc2poMVDSq+9shW
 Q68Zz4eTuo0nFmJ+vUFUsgtQDp7f2JdemJPMHP0X346PHDq2v+vgOogRF5nx97RPBiMF
 gGxhiW1MDN3zRVKdCNc+/3YxG4yf+oB6DQkVCLd3T5G8DksOkiFLFbosaORviBK+7gGa
 fb5ahpOw04NOjW3mpQZK8R4lUv1zpzx6qTGbb9sQlRYekcWtiEUwEggYJVLNmRka0Ac8
 JmSZDIrdg5EwAAFaXX34NlVeYD3xUpdw4e5vCyMYk72uz5g3yVaJS8SLnYszHId5uqm+
 5MLw==
X-Gm-Message-State: AOAM5327VQg63LQfbEC3IrWgRcqRqMXLLFt0Mq/+2o/Uh4QGXC85eau3
 ocLSy731B+JcaWvIRQb3NHY=
X-Google-Smtp-Source: ABdhPJzl7d7Z+zY9NvUdkc3z/lR1dRAVey4gjz/ncq5Xo1pzJyORhnCdmUiN7bQmicuyzw6bQyrOAA==
X-Received: by 2002:a1c:9acc:: with SMTP id c195mr10815129wme.10.1641806203204; 
 Mon, 10 Jan 2022 01:16:43 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id e13sm1229347wrw.3.2022.01.10.01.16.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:16:42 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <fca7449f-b42c-4c9e-44bf-152b4b01ba37@amsat.org>
Date: Mon, 10 Jan 2022 10:16:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] hw: timer: ibex_timer: Fixup reading w/o register
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, wilfred.mallawa@wdc.com
References: <20220110051606.4031241-1-alistair.francis@opensource.wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220110051606.4031241-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 10 Jan 2022 09:16:49 -0000

On 1/10/22 06:16, Alistair Francis wrote:
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> 
> This change fixes a bug where a write only register is read.
> As per https://docs.opentitan.org/hw/ip/rv_timer/doc/#register-table
> the 'INTR_TEST0' register is write only.
> 
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
>  hw/timer/ibex_timer.c         | 14 +++++---------
>  include/hw/timer/ibex_timer.h |  1 -
>  2 files changed, 5 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

