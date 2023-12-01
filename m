Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D471C4167B
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 10:58:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r91DW-00023P-3G; Fri, 01 Dec 2023 05:57:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r91DT-00022u-5B
 for qemu-riscv@nongnu.org; Fri, 01 Dec 2023 05:57:51 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r91DR-0004N7-0R
 for qemu-riscv@nongnu.org; Fri, 01 Dec 2023 05:57:50 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40b4d9e81deso18876685e9.0
 for <qemu-riscv@nongnu.org>; Fri, 01 Dec 2023 02:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701428267; x=1702033067; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DNRPfE3nS0S9aFqg9iDHO3DZDtkZRObv/JYi45WTizo=;
 b=OS4mdo4Lj/VuiDkyuJ8pP7AoGJ+LB4MvndeQC76qwYg6pMVxvTPXUtNCheP8+pN7wd
 oj2eCn7x3tPULtb3wEllBO+XI0eNFWQYgO1NkdLwQcRjZFUIK6H/Pb4TUjs0B/0aVW/R
 AQJ4gWT90ywIOTcHGPW1jfPIJc2d+K600DCYr9lgNWCFt5nFfLf4290xHyQs+b7J27W6
 MdvTLvKQjxoUp4A9EfCFHK1UzC+WljLjOxYayPlOJ/h3H83Lu5TilP7ZQ4E+vpE4mIK8
 mAE9tEoHXCeBHuiIJV4C6c9gbqk4Wmde8/tnDX9ym1vyApAYtPgOvkJ930jjBwNz9hpc
 WBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701428267; x=1702033067;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DNRPfE3nS0S9aFqg9iDHO3DZDtkZRObv/JYi45WTizo=;
 b=X2GPQ0T1OFOOpmiS3SWzz9XZIMpcU6fyPkJS+KTYUvPVA0f/hl7l/iNsCaA/mNkhRa
 vXL149UCq21mpOvkolDDZ/4X79YawpuwZ+ySycnjjY8KhnUftdUUjLCjUoFeybqbV4I+
 pmwBEzpB0DOthls1sz86wa9J5AsETp7i1iiinCRC3RJXmIwdr8UXQBqY0NlfA+OW4KnV
 J3Pa12tXEO2orV9HjOy7E1yjrMM4ybuT8K5IvBkKrOHsy1DydI0wD7ewidzkIBBXgaGG
 hvqK7xLouQCyx7fnlDErUQoZ/x5Jd9HcNQJplwOqVjG3w91OlCMIiKOKSfdRgGzDwBqQ
 YmPA==
X-Gm-Message-State: AOJu0YzeF8BjfYnsQVz4FSqnhkSACMe4roVyvwardtDtlNHmFcmWhGmh
 GzddPxyLK/71OMnOExF04NqJkQ==
X-Google-Smtp-Source: AGHT+IG5WsuVWqCIgmlBCmfkg0OkVxgbaNYeOvgP60jLLTkRjCX0PiXTtDD6TLw1h8mkc5t5EJEyrA==
X-Received: by 2002:a05:600c:1709:b0:40b:5e59:c566 with SMTP id
 c9-20020a05600c170900b0040b5e59c566mr332467wmn.144.1701428267367; 
 Fri, 01 Dec 2023 02:57:47 -0800 (PST)
Received: from [192.168.69.100] ([176.176.160.225])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a05600c348d00b0040b5377cf03sm8725717wmq.1.2023.12.01.02.57.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Dec 2023 02:57:47 -0800 (PST)
Message-ID: <83046c42-1df3-499e-b202-b123391d39cb@linaro.org>
Date: Fri, 1 Dec 2023 11:57:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/9] machine: Improve is_cpu_type_supported()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231129042012.277831-1-gshan@redhat.com>
 <20231129042012.277831-4-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231129042012.277831-4-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 29/11/23 05:20, Gavin Shan wrote:
> It's no sense to check the CPU type when mc->valid_cpu_types[0] is
> NULL.

This case is a programming error, right? We should simply:

  assert(!mc->valid_cpu_types || *mc->valid_cpu_types);

> So the check is skipped for this particular case. The constraint
> has been taken when the error messags are appended.
> 
> A precise hint for the error message is given when mc->valid_cpu_types[0]
> is the only valid entry. Besides, enumeration on mc->valid_cpu_types[0]
> when we have mutiple valid entries there is avoided to increase the code
> readability, as suggested by Philippe Mathieu-Daudé.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/core/machine.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)


