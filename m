Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB38CCFA04
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 10:24:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vFrjM-0002VC-Tg; Mon, 03 Nov 2025 05:24:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrjK-0002Ua-9s
 for qemu-riscv@nongnu.org; Mon, 03 Nov 2025 05:24:07 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFrjF-0004rJ-Rd
 for qemu-riscv@nongnu.org; Mon, 03 Nov 2025 05:24:05 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-429c2f6a580so2256069f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 03 Nov 2025 02:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762165434; x=1762770234; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Rs1loIowige+ByKyM7eBpM0czRwX2BCXXvqEDgccqY=;
 b=iL6vV+CNdKDZiVumvffm8UBOLCyGt67exF4VsLI5yBD9oOr6rmdIyVGe9zEMCO+joC
 HVCSMkAcUxh9Qcz1rJhAt2fehMwppTn/TMS8dDNdz4G26A+MdTr8yM4z1w01hKJ8EQMm
 iP8YT3H6+0GG0nsEk2oV6KjOGol3Ki9H7pGgKY2YjUctz10m8059lNfn4qXPBwtM3yab
 IXTxckwZQe+sfBnOP3R7lr59wlIruWtE2duZv78dFL2zcLOn/MaeObldYFF7WlAzdqsL
 vm2z1fh8lDiDmzf25j1yb7ATY2Enk0KJD9x9C0TimjW8ODBWx7oT3jgZUNt+V4752A6O
 P3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762165434; x=1762770234;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Rs1loIowige+ByKyM7eBpM0czRwX2BCXXvqEDgccqY=;
 b=S/niXn64rPaXts+9ldcJK+IhIj55FQj5QzvUmocZn8EATNYsXUjPYKc9VQro7B90fz
 JFZfhiaWAW5ksit6s8kXeg5U6EU9CJ0Ch0jN4Q98bbbN+n/a4RFfSs73GDcCtmGv8nG/
 yoEVymCwVhkaKgEy4Fqe1zpWGDKfQnt/oDTvAcdPyXF2pR7KBfgglHyLH0xjotJi2rFg
 yHoMWE1aJb6QpX0rI9dYoBfYWstE+d+qE1zmp9zaZh7XQhrloRhR/bgz+ba4nsJxrwsP
 Tt9r8rULph0fDMsQZf+1osfPtqbvuNwhR1u+o2EZoLLcsQllgchOVYmAO/Y7pA8E8DRC
 LQ4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB4f31ZwPZBmYKV3Ipjxg6UlTfzNZzX9PR2/eUoMQpXd1idhIQvHjJ4CrJYFSCfZS1cJyoPjowuF4K@nongnu.org
X-Gm-Message-State: AOJu0YyfO19YIk0R8vhCtoc0xQebzBFL9eqZPIgu9jNcg/UBcF26DpNw
 QhWqidQZoKA4Ufs/q0b0dy1m9kUuOXmhtz9Ba/7BMwrGUBz8oov5STgFG8/Pc9SruRs=
X-Gm-Gg: ASbGncvB0+dclgAp22WRcpMZeF1MHbblHM6Ec34imHRcQPVsF57gd0HhB7P0ngykdAP
 gZ0undoBCuLam3S2jkTvkLwtsFzhSh27bsj3tl1Y2wdamfIdPzydNSNPgl7wPan3/s7QSxmNaGx
 /Ob3cmqV/oFG/QvthEkwoAO/bgF8OQrluE6WrqkrbBBUwJ9TAics1Bpq+pF7V4VsP3xqY+vVY6X
 L4iMac+5wr8sxLlptyhL75I7rGm/7J9ZHz7QKSyVjd/1bYOId5DBnBbJZF6tVQ282Oiq5QyGe8E
 AiBQsnDxnD1u/PSVe6pOa9uM79Avyj+LufyP9mx0yCsvpfRYuiFd0aKBinENV3zO6RoKbd5QpjK
 Ru+dFKA7HWh+pkWZ9Gi9aKttq3jiW6I3vhMVgdQcGXqTUACV5LX+Ur1Nn/BYA1qvslK2w7Hti4S
 6eQF+O/LdZ+rQVn5S0ia95ANsZvLWqTgfqVz1zfG8xx1HXWcaTIyy9JVghDlV/OA==
X-Google-Smtp-Source: AGHT+IF/WhahqqjQpW5bPzmu9S/E+qtRGStZYEwgFGzo321XsrlpcUFet0JFG3ETWPyKonrdy1F2YQ==
X-Received: by 2002:a05:6000:3105:b0:429:d4c2:cae1 with SMTP id
 ffacd0b85a97d-429d4c2ce42mr1540093f8f.63.1762165434360; 
 Mon, 03 Nov 2025 02:23:54 -0800 (PST)
Received: from [172.18.178.65] (ip-185-104-138-122.ptr.icomera.net.
 [185.104.138.122]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c5e19103sm16429099f8f.28.2025.11.03.02.23.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 02:23:53 -0800 (PST)
Message-ID: <4e02d77d-28d5-49a1-a7e6-46888882b339@linaro.org>
Date: Mon, 3 Nov 2025 11:23:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] target/riscv: Remove upper_half from
 riscv_pmu_ctr_get_fixed_counters_val
Content-Language: en-US
To: alistair23@gmail.com, qemu-devel@nongnu.org, anjo@rev.ng,
 palmer@dabbelt.com, dbarboza@ventanamicro.com, atishp@rivosinc.com
Cc: liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>
References: <20251103033713.904455-1-alistair.francis@wdc.com>
 <20251103033713.904455-9-alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251103033713.904455-9-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 3/11/25 04:37, alistair23@gmail.com wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> Now that mhpmcounter is always a 64-bit value we can remove the
> upper_half argument from riscv_pmu_ctr_get_fixed_counters_val() and
> always return a 64-bit value.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/csr.c | 40 +++++++++-------------------------------
>   1 file changed, 9 insertions(+), 31 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


