Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC87CD1288
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 08:57:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rrwQp-0001T7-BH; Wed, 03 Apr 2024 04:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrwQo-0001Sd-Ej
 for qemu-riscv@nongnu.org; Wed, 03 Apr 2024 04:57:18 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrwQm-0004Ae-0Z
 for qemu-riscv@nongnu.org; Wed, 03 Apr 2024 04:57:18 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41624ebc501so1113985e9.1
 for <qemu-riscv@nongnu.org>; Wed, 03 Apr 2024 01:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712134634; x=1712739434; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kNjZfX30fpXdff1gNRVDukCDDvb5QAWZSO1Ykbj8XPg=;
 b=lJCzvfjjAqB30fFJPsVE9f4LA86T5RYaVUonujjFmxqRDMZPh9yZpvKfBCzO3gdowf
 +UqyEioBkKoM4CCy35icIQLDNEDINIi9vwyn9P6i13MKQaz1MM+iov+Z6ihysX5qQltV
 rvRvYvQrl5JEuTHOh9aiMNi1fxTNolLj1qV08e6o6zRT8jBzJdInDGTeLioJvEXRk/uf
 BDahZYnpBF1EesbhXCggtj57Q0UIVsCSUYwbWRDRm+1nmPBUmj4IP3dDWLvJs2wrpAZL
 LF0WmS8JgJs2uJlLLDs79vd1APQm2s6mbMXnzxBo8FcfOSvq9iCb7VDwgxgO0SkHmmrN
 dwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712134634; x=1712739434;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kNjZfX30fpXdff1gNRVDukCDDvb5QAWZSO1Ykbj8XPg=;
 b=diLOonfatGmySAVKxxW9XldU+pAqp3swY9YmzBeTAA7Z6RKRe0cwDgzAdz1fxWhqN2
 +PjdJZ8/u0gSuMcesLAMYJVYoobnF1CsX0GMeou+v8Vg8txwp1GDuBzo6kkRuLmckAOa
 lkDrdSgOmscDQ3p/Qd/SOSfKPGYJcvEiWrVvF4YAfifujwYDkVgJxDk6dVR51DSMVGhj
 zj2cMhzGLe3XcQrnqvKxp/7KT7GreGAzMIkeTDofMPg2TmfmN8i+WMcKRLeTcr3AXluk
 q225qSC+x3KlLftNRpntlxrww3wqzqG0hiITYaeT8IKT8r8J6kPzysv34j4qtbttZszP
 2+Zg==
X-Gm-Message-State: AOJu0Yx0/GP4QG6WTJW4LCBGmL2h8mvBNr6j+HA+qADGqUISA4XLgbrO
 yJxuLLFH8P3HfYCxwqnpx4DjVCNtzp53kTdrNujaEJdkebE5g4Leqqddr5aUh2o=
X-Google-Smtp-Source: AGHT+IGf4scT2B1j04GBa4SwKMFq+wLb3wUEcGiAJT1yOQS0CroicrBEgUWawoeOHim3kKiKKzFIBQ==
X-Received: by 2002:a05:600c:2313:b0:416:1df0:4f20 with SMTP id
 19-20020a05600c231300b004161df04f20mr2848604wmo.10.1712134633672; 
 Wed, 03 Apr 2024 01:57:13 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.223.215])
 by smtp.gmail.com with ESMTPSA id
 k35-20020a05600c1ca300b004156afd6843sm7623097wms.18.2024.04.03.01.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 01:57:13 -0700 (PDT)
Message-ID: <3d72ba88-4581-4b55-9ed4-75e177e12d57@linaro.org>
Date: Wed, 3 Apr 2024 10:57:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix incorrect disassembly format for certain RISC-V
 instructions
To: Michael Tokarev <mjt@tls.msk.ru>,
 Simeon Krastnikov <Simeon.Krastnikov@imgtec.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Shiva Chen <Shiva.Chen@imgtec.com>
References: <LO4P265MB66669BD6FF7CAB642AE30316933E2@LO4P265MB6666.GBRP265.PROD.OUTLOOK.COM>
 <f8622a76-7523-424e-88d5-cd6f251a625b@tls.msk.ru>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <f8622a76-7523-424e-88d5-cd6f251a625b@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Hi Simeon,

On 3/4/24 07:14, Michael Tokarev wrote:
> 02.04.2024 15:47, Simeon Krastnikov:
> 
> [Content-Type: text/html]
> 
> Your patch is html-damaged.  There's probably a way to extract the 
> text/plain
> version of it but it's better if you re-send it without html.

You can find tips on how to post patches here:
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#submitting-your-patches

Regards,

Phil.

