Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D502C87FCB
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 17:03:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ukQUW-0008Ig-Kp; Fri, 08 Aug 2025 13:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ukQUV-0008I3-9y
 for qemu-riscv@nongnu.org; Fri, 08 Aug 2025 13:02:51 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ukQUS-0000qy-Pc
 for qemu-riscv@nongnu.org; Fri, 08 Aug 2025 13:02:51 -0400
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-7e62a1cbf82so164104185a.2
 for <qemu-riscv@nongnu.org>; Fri, 08 Aug 2025 10:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754672567; x=1755277367; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hX1EdMERcc/cpXmk877A92VJUK6N0YpUh3j1jQLfqcs=;
 b=KKGOab0UHM1WAdoJUeml7T3FK/HId+LlZUoEWSh6FlFITsiFT9xP4Nk6qpqfduC4YW
 OnBHnQrMlWDd2C8BGgF18vImmoS05O4vh79LySoN3hEvJnNmE10XK97i/VjMbp311/ZX
 T6Bwc71YXkRm6UzwDHn0B+e1AgNHIw5O9u2gqLyMmiF3AHmGLGvBMCJyskj4ADdiGWtc
 6nN5eYtClc7fXmfO2BvWQZncuilYuNjLbgCug05IaVY9BnM+e3f3bMlHfkKochsQhlcx
 6VWBs6WOdyX1OgJc6huK4bp/QGiprGanAo9lyoMy3eIWg/JGs0v1DGxbmw3Bcg+EP9d3
 +SmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754672567; x=1755277367;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hX1EdMERcc/cpXmk877A92VJUK6N0YpUh3j1jQLfqcs=;
 b=Knqpfv2IkS35HlxwQuFG9BEy3UnhRBztFbSFKDb0D3jWU7Befkq1br6KbAgiUdUsQh
 jONn0i5f1re9kD4+T0pprsnfzJ6WZudJZudKWwUV1L30BbCK5j2Egm+hx4XQKzSJ/rQ2
 5z0bDdyo7UocbxbEVlbGVjC/8nOoqV1ubfOj8s7nXjQgKDW/uxEYZ+vdhYL2bp5xGKe1
 wKW1IZHlyUWNdY9X5kt/NC6Z1sNS4qjcFRSKJzSsQ6iy06RaHJ6vfzUW9kq9OscEwvSa
 dUxaTwtRVhsTr+x0rzLtPkOdJ4I4HZ+KUq0Ik/S+Nt6LNVPBGa7xvlnAzsM5vqrBjHTG
 Y/zw==
X-Gm-Message-State: AOJu0YzP1KPaK49RK2LCeMC+jECghNyB37ZMc64EoST0Pk2y4ZF6O2MY
 MmK/Art1F4t/KSQ8VWUVIWoN4/0sDWxvtDe9z7M9FR9GlaOhGmh2TBkGNoTie/PSEPo=
X-Gm-Gg: ASbGncvuGfiVDsC3wpXeOBqBNQNKVAfjF7bvImt4/sYmgl+J415N+uDWyAySUQWJ4yN
 u6gWLXQrjH6vwDwBPp4iPoGd38heHqiVvXZuTqsTQ13z8D561ojMofXFgBM7Dg18WCTrHgmrfm5
 oO4P+lsCk3/abjuXMxOQngMe9QK/tB9qMZSbeuuCzHyMWItkMbFlo5QrFYNBdwIP3XEr6nooefn
 4lpBl6M5WD1F1t07UqSbxo5W7EJFCwPyMJggWH+tir2hersuvvyPU5sl6zTu2FJbFKHy+jrOLi3
 FckXTo/W5Noh6Of4xa3JjUS/PUw9fHcXsjH4O6mJDXvGIr87ArGlnAClK81sPNNP6Yjk8snx6eq
 Qi1mKyQRkD2GXLMh9ua+0bAy2CxXugVf6Y5NCS+d8F2gs7gup3ejHIuKcev1DYHpWRA==
X-Google-Smtp-Source: AGHT+IGHdhNKzbMLa9GOycImQ554pJR7E07y23DfDRD27WaQbu8H1SVOOutCpCJDo6KSUxwhu7lwIw==
X-Received: by 2002:a05:620a:40ce:b0:7e3:46da:9e12 with SMTP id
 af79cd13be357-7e82c7b3df9mr621629585a.57.1754672566849; 
 Fri, 08 Aug 2025 10:02:46 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e67f5cd509sm1146499785a.40.2025.08.08.10.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 10:02:46 -0700 (PDT)
Message-ID: <18b51ea3-abea-4a1e-ae48-43bf12bb9afc@linaro.org>
Date: Fri, 8 Aug 2025 19:02:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/14] target/riscv: Add MIPS P8700 CPU
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>
References: <20250717093833.402237-1-djordje.todorovic@htecgroup.com>
 <20250717093833.402237-4-djordje.todorovic@htecgroup.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250717093833.402237-4-djordje.todorovic@htecgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=philmd@linaro.org; helo=mail-qk1-x72e.google.com
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

On 17/7/25 11:38, Djordje Todorovic wrote:
> Introduce P8700 CPU by MIPS.
> 
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> ---
>   target/riscv/cpu-qom.h      |  1 +
>   target/riscv/cpu.c          | 15 +++++++++++++++
>   target/riscv/cpu_vendorid.h |  1 +
>   3 files changed, 17 insertions(+)


> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e584bdc5ac..401c0f6c7d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -3180,6 +3180,21 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>           .cfg.max_satp_mode = VM_1_10_SV39,
>       ),
>   

Can we add the datasheet link here?

        /* https://mips.com/products/hardware/p8700/ */

> +    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_MIPS_P8700, TYPE_RISCV_VENDOR_CPU,
> +        .misa_mxl_max = MXL_RV64,
> +        .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU,
> +        .priv_spec = PRIV_VERSION_1_12_0,
> +        .cfg.max_satp_mode = VM_1_10_SV48,
> +        .cfg.ext_zifencei = true,
> +        .cfg.ext_zicsr = true,
> +        .cfg.mmu = true,
> +        .cfg.pmp = true,
> +        .cfg.ext_zba = true,
> +        .cfg.ext_zbb = true,
> +        .cfg.marchid = 0x8000000000000201,
> +        .cfg.mvendorid = MIPS_VENDOR_ID,
> +    ),


