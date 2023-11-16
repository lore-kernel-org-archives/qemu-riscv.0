Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8EBC47071
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 07:55:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3XDQ-0007NI-Pu; Thu, 16 Nov 2023 02:55:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XDP-0007Hb-OD
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 02:55:07 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XDK-0001Vj-A8
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 02:55:07 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32fa7d15f4eso371286f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 15 Nov 2023 23:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700121300; x=1700726100; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xq4/PxYKKGerN15tuKWfbBlxgYYQcz5v17kAaUTTr4U=;
 b=Kgidu7OVKpT+I/nvV2ZwXR1ugp5DWoEJ+4yePJaTiXFojsqv+uRwe4jgklrulmGa+k
 OUYXH+X9iFjl+sPRnF3Y5/wY9Wg2DDWuE/8iom+4id0YpyPP7pfszzKJpPFSeAg4zeFt
 2dbQDJNEQ15qn+cVY55PsbHOWZ2XRflfXmBofuwWq0ooEy72tfb3DSr8Ui9/EXv6tQYn
 EgRjr3+79LzRX3A34qZ8ath92Sf7z5xz6ql97PqU0joXNzteNCUrG7wM/8AtnUcn8Cba
 aqJBFkvaIiV7SOqHth2ROoPGLOzqDLkiB5ImhD4KzoQablJFiBI8RizBdHx10pL3z927
 xXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700121300; x=1700726100;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xq4/PxYKKGerN15tuKWfbBlxgYYQcz5v17kAaUTTr4U=;
 b=L0La7UqlqQvuu8a44zJKgQkrsskwnZdNiUx5dM2r7sfLNIIieotWcGk5YYKLCIBKV6
 BWWyzVBjg8yBP45iykhHLNwtItXQZP4i64Tj3v7Dmwpb9XlfgkZMwSJ7eW/povbtqMct
 ID3kKZJIcNETXYT9hyF8b16Fg3mnPBS4RdGOABifFhbuMQS8l14dknTnPVfZruSfSSGB
 cs26fKoErGtPtn5CTxeE2Kg9ozsAKHKBHG5B+lL3JjIcRI28TxdmoqcFCz5n1ihvflw0
 4c/3tPbU2r1shhS7atV0DT+/bbrW9RdN1vh6Ua3hY5jT8fyCta4S7SWpka3Z3RtXwTwz
 fiVA==
X-Gm-Message-State: AOJu0YzdxxvJ4GgjtZIf+50KaNCDhbmuVVVY8h5RzGd0mtPsYD31kR4f
 1T2hudDQxBqdo5ZLPllWe37PkA==
X-Google-Smtp-Source: AGHT+IGhMIp2OyXueSUS7HRilCVAf/zEcGZF3g6foVnHhw7X2NSL0U0bcGVs9tHxk0b4CSnbYNQmiQ==
X-Received: by 2002:adf:b312:0:b0:32d:9d3a:d8c0 with SMTP id
 j18-20020adfb312000000b0032d9d3ad8c0mr9170922wrd.60.1700121300532; 
 Wed, 15 Nov 2023 23:55:00 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a056000024400b0032fb0e2087asm12582889wrz.82.2023.11.15.23.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 23:55:00 -0800 (PST)
Message-ID: <ad2b735e-9e98-4a1d-a1e2-9a189d703122@linaro.org>
Date: Thu, 16 Nov 2023 08:54:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/31] target/rx: Use generic cpu_list()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-19-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-19-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 15/11/23 00:56, Gavin Shan wrote:
> Before it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-rx -cpu ?
> Available CPUs:
>    rx62n-rx-cpu
> 
> After it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-rx -cpu ?
> Available CPUs:
>    rx62n
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/rx/cpu.c | 16 ----------------
>   target/rx/cpu.h |  3 ---
>   2 files changed, 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


