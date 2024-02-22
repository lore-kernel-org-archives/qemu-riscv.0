Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DFDC48BF8
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 07:59:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rd3zY-0003Ti-MC; Thu, 22 Feb 2024 02:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd3zV-0003OV-0d
 for qemu-riscv@nongnu.org; Thu, 22 Feb 2024 02:59:37 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd3zS-0005e7-8l
 for qemu-riscv@nongnu.org; Thu, 22 Feb 2024 02:59:36 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33d36736d4eso3307889f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 21 Feb 2024 23:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708588772; x=1709193572; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U+qskoK6ZgMX8Z+7ktDl6pHmeJ2x8kH1X9ToHpBL90w=;
 b=F5fs3wWQGR5CPh6Ya+vWRBHKinoB3ONSND1do200Fo/21DsygSUrOBOgXOT1nIxMIU
 f2/oZgjGarRluIA+4TJFo56b4+bx2VH0PuJ831F+Ud/UcsQJ3LXSR01Vu18EyVPNS7+j
 TmVb4T+NU4hq8ogt2xKqmD8oeiUxwXYYt2ycaDBilKiPWwK9v3slcBFWc9gyGDSE9Dg7
 XxMFGY12Z85moU6E0EusO+1gzcTk1sCiAD6kC/TjAgfnfTdlkTf5iLeWhmi5gCGBdMOE
 VpFIH5404AryA9KNgR6npO8n6fEiJVexpzGjUdS8+l/mLDZSgjCDIbPjeqqlFPLAw4rC
 HBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708588772; x=1709193572;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U+qskoK6ZgMX8Z+7ktDl6pHmeJ2x8kH1X9ToHpBL90w=;
 b=sPDm+XnlEh1wDdk2vzsRXy2qm/SKVDS4lXJQ51SPDxs9RJgK5nNvURMTVOqV/8PtHi
 rCAnStiqfiM/KafU1xhQr/pBY27NLmNjV1HxdRSGqJDF/wUt+D99A2wDwn9ZIIe/DgVK
 vS2NoCLrye8yYGC5ikMZfP7ta2vPrwaVZQ5wHrIKuauiVDlskMmtxVcmec0xNQaieuL0
 L4vdyjLNbL0AgrOlv8lPDY63BDA6m+C04mQHJi8wo0xvAtMRHWwXpvZ/+pT2YNrDsFCm
 j908QKQtH6uKJlANBqP+Wx8LAQd7peWo4HUVHmIAgIawx9ZXQIamQZygWaKssskVbdeL
 ll3Q==
X-Gm-Message-State: AOJu0YyC/LpMM4hlDxe2uqd7VsJyIMJ85fGFiucHJHZIDYSY8s/TBNFt
 RpqbkC0OOYQ8QR6OkGc9Vsict3hMEu0PpNablY/c9XkGwpByWygmn2TBUW7Yepw=
X-Google-Smtp-Source: AGHT+IHiM0C0xu70BefCR+yCPzwKOuFGKnWdAzvMXlIepI6pBZbz+ciuk553kmuIRCG8EyYLYUgq5g==
X-Received: by 2002:a5d:4a0c:0:b0:33d:1bc8:b169 with SMTP id
 m12-20020a5d4a0c000000b0033d1bc8b169mr11379865wrq.61.1708588772516; 
 Wed, 21 Feb 2024 23:59:32 -0800 (PST)
Received: from [192.168.184.175] (41.red-95-127-32.staticip.rima-tde.net.
 [95.127.32.41]) by smtp.gmail.com with ESMTPSA id
 ba20-20020a0560001c1400b0033d640c8942sm9188080wrb.10.2024.02.21.23.59.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 23:59:32 -0800 (PST)
Message-ID: <a0d09fa7-1867-4dc7-8484-a2f8648b0242@linaro.org>
Date: Thu, 22 Feb 2024 08:59:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/9] target/riscv/translate.c: remove 'cpu_vstart'
 global
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com
References: <20240221213140.365232-1-dbarboza@ventanamicro.com>
 <20240221213140.365232-5-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240221213140.365232-5-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

On 21/2/24 22:31, Daniel Henrique Barboza wrote:
> The global is unused after recent changes.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/translate.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


