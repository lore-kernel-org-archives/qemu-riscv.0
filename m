Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9F4E77188
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 07:03:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tUh8S-0000IF-9R; Mon, 06 Jan 2025 02:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tUh8Q-0000Hb-5Y
 for qemu-riscv@nongnu.org; Mon, 06 Jan 2025 02:02:46 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tUh8O-0008MQ-JH
 for qemu-riscv@nongnu.org; Mon, 06 Jan 2025 02:02:45 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so160085955e9.1
 for <qemu-riscv@nongnu.org>; Sun, 05 Jan 2025 23:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736146962; x=1736751762; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yPcfyLj0RsI9wYqcaozKL/Cd1GLzEcln//Q2DeARfPs=;
 b=PajKtqA+KN0PycsIE40avwu79WrkJ3FMRdAgKcRrLPXrwhbof+7v3642Dl2evjv4X1
 6VYzIqTFISXjRHiPRZkAgTbTE3HQ9wCOMtJBSMepsZatG8MHVLc+41/8Mw8d5ikU05qI
 k/CsGVbJWame2FChawEWanSWxiZ2LniK8Mt4lm8gIgtJUySTebUGc2cpwLDGWeqNR2v/
 f9k66pxWQUFaxWryKatH3bDbIF5SRc4lbOCY2WiF8meLtn9cY8DumgOP9B1ANMgOTzpl
 bVqQndItlq05En9Em6ES8hk82X2LnoaadmQ5AFl58wBE753tF9PW+yqb4sVHdEr6m7MR
 BavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736146962; x=1736751762;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yPcfyLj0RsI9wYqcaozKL/Cd1GLzEcln//Q2DeARfPs=;
 b=gLR/lemrosaFxcGwEABd25puTmnO/278c9c1L7UnXo5i517DvG6ew+C9YN3LjaQsHk
 aKBQFEetkOv5OrrgyBtnG7JhjpZ56dA4YSqTeWUi/E0gKZGFWPKcFHEOEs3v+8T9fA0Q
 roeiBiJ2XZgTAdDoL/p6wwmipo4txzCGA9XgHrA20Ru41DMrIcPDBORvtJpamKlignuj
 UTjouP/d+WclQ+0r8KVPIC9PyeAGZqhrwQFwXuaNNp6wjrOuS2S3uUxtQPfjZcWCkibA
 RmdrqP3tQkQYYKv9N4MX6RQ8ged1XWMdmrjhiLyb9ic1mujWnS1wZPaL1gt3aS19bIoO
 2dTA==
X-Gm-Message-State: AOJu0YyHhmQaXDLIHGq8+aLWQ181LFI03W8M16sbp7liuapk5zPaUhyG
 bjTaHU/oWkuZfcekHU0VXLzR/XJ7cXykI9F1Tjug5qkvjBUEqxpm0s4vtwOD9ck=
X-Gm-Gg: ASbGncsUjuEqhuJ7GnAYR+hK9uO1B1G8/rZP50oQyYUUYkv9evARiXWCrbgD3O6TcSQ
 5HGX078GE6DNwx0kYoNLjMNTLmmlT3bKPVNAsOuSgeYi3aLfZ7bvErn+7OrSCh4iDnZouFDYQ94
 dT7s48r2V7yT+BUgpnUe+dnB7qxpTf/vt5g9calflXua7iZYYaSc/b9YOjsKFyPCbHiTVQoY6mq
 uPY8OKL5UjMb3m6sBITSP8ivd/md6rIkRkOulsT3dKgz3THbcPVI0kNdp5H+EVA8ozh9PMEtgJN
 GAhdoBQOb8FLz5xv7gXC6blV
X-Google-Smtp-Source: AGHT+IGLP6anKpHeC9pRPahJb2wo3oOk2ftUwLUu6FbNfufkWu2GWeHTxgDEO2TbDM2IMZF4HqOEMQ==
X-Received: by 2002:a05:6000:1542:b0:385:fc70:7f6 with SMTP id
 ffacd0b85a97d-38a221e1f67mr44293784f8f.7.1736146962417; 
 Sun, 05 Jan 2025 23:02:42 -0800 (PST)
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e1acsm47238416f8f.68.2025.01.05.23.02.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jan 2025 23:02:41 -0800 (PST)
Message-ID: <3b82468c-e388-4275-8a9c-b0085777e768@linaro.org>
Date: Mon, 6 Jan 2025 08:02:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/riscv: use RISCVException enum in exception
 helpers
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20241219174657.1988767-1-dbarboza@ventanamicro.com>
 <20241219174657.1988767-2-dbarboza@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241219174657.1988767-2-dbarboza@ventanamicro.com>
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

On 19/12/24 18:46, Daniel Henrique Barboza wrote:
> Do a cosmetic change in riscv_raise_exception() to change 'exception'
> type from uint32_t to RISCVException, making it a bit clear that the
> arg is directly correlated to the RISCVException enum.
> 
> As a side effect, change 'excp' type from int to RISCVException in
> generate_exception() to guarantee that all callers of
> riscv_raise_exception() will use the enum.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.h       | 3 ++-
>   target/riscv/op_helper.c | 3 ++-
>   target/riscv/translate.c | 2 +-
>   3 files changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


