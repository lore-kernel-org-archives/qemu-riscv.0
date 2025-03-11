Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45B8C28B2E
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 07:57:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1truTX-0000Bn-Jt; Tue, 11 Mar 2025 03:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1truTM-0000AR-Ou
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 03:56:21 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1truTJ-0004Xh-Pr
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 03:56:20 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3913fdd0120so1440869f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 11 Mar 2025 00:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741679774; x=1742284574; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X7Iu1u2dXqtHxA7odZOWuoQYWQu8cNtKWb4foxrTEPs=;
 b=dEvV5lRxK2NfyobMDnxRipzgmdepgBK2D7PI2Xc+dByw+syB0epWXsskdPVCPlKY+y
 1YkcAh1R3KHQAPYZRx4A8arK5NM/U9fSwyQl+HcbvtN8+xZZOpLEPSpu1Johs1FC4HT/
 W7u1J13MUF/NUuDyrxVeNBsW3wu9xTObdyOO9BbgrPQoowjS/5IViyU++oqb0zLwcusM
 hezbu2/7TbD36ORpuE0p1EGUO20lVMFdgPUPcGHywnA8J9DrYbUDPo4DLcj0W784O9Lz
 xtQ99A0XLIdXlGGg7386qXVB5BBIu7iuCAGaxW0IEpUyIcyBHeh91wGXyf04yXuMR+5L
 zrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741679774; x=1742284574;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X7Iu1u2dXqtHxA7odZOWuoQYWQu8cNtKWb4foxrTEPs=;
 b=pooV+iWVg4PcgQZNr7QsmHGzsAIYG5FjDuXFE4nB93KtUgQLODhnIAGveubvnYTYU3
 872dmxNJWTxzdQcPy3XdogAHoBzzzip1lBHcnRyqYT7SBKUsKfJYW135sFF+Jh35k/Dg
 Bmn6dg3QhO5eWr1/s6i7tVfjBf73a8kRM7Q28oyDnLjd9UkeCgrsHzQuP7dpcaRzwEJ3
 iB902+0WWScvS4EVU7ZcW+WuP0KSGA6n2Ad98NE7ZSvL9csLvY1RUThl/wmHzmOyrNIM
 hD/r9IHF8d4j1zX2gOdcjmskiwU52psvN8MVTb7ZJ18CRPSW+CzBa/uE+rLcW3WnDd3B
 el0g==
X-Gm-Message-State: AOJu0Ywd+zRrot/rNiS5/pamF1cvcEhHpVsQktpJYJFaDM+bfpEjJ9+a
 bf0nq8EY3+/bHM0BBeFgiLHNaPCRHBEipQX+NgpZ1wKipP0dVRZCa8+tTa0jsxk=
X-Gm-Gg: ASbGncsWsIRhLRA0ZPwdUq7JprQy4SSdt344P0rU20qPo1yAc0T4WzdeddPclpC51Pq
 DpRSp6t58Ohdzr1/h9sLmrUAq5iNQ6HLl07w1bI4OCNNKVYjv3AdobH7fbDsZnHOLGdpkGU7W8f
 JEEiTFVTDrfpfaSvmmf+1S2LTeNm/ilq6kpXJG6tGQa52CA2W/DlkGjWD6ds/XnH5lz+WqchaSW
 JMPMMF+UaQTz57t7pi++u6Lb+FrC0rxYmTjRbcWbq1cJPw892sFSNhOYie0ZvQjoxy2FxJtqvAE
 3qWRucJZVXB4p330UciVrs3TFojLgxMQRzlYDBpi0FnSICCicy1eUZWdAQGLZ29EMWLVj4kostA
 cTItJWYTtgvXw
X-Google-Smtp-Source: AGHT+IEtiRF/8Iuorn7Gjtn0HyQeDa/EcflgYbR8utiTJ0JsmB5lzqLJ5M2/N+y0q4woAzCFGdNG9A==
X-Received: by 2002:a05:6000:1867:b0:391:253b:405d with SMTP id
 ffacd0b85a97d-39132d98a1emr13213647f8f.41.1741679773775; 
 Tue, 11 Mar 2025 00:56:13 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfba8a9sm17297839f8f.9.2025.03.11.00.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 00:56:12 -0700 (PDT)
Message-ID: <28c4b011-29e6-479a-9eb5-96c0bac5b8c6@linaro.org>
Date: Tue, 11 Mar 2025 08:56:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-9.1 00/21] qapi: Make @query-cpu-definitions
 command target-agnostic
To: qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20240315130910.15750-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

(+Pierrick for historical background)

On 15/3/24 14:08, Philippe Mathieu-Daudé wrote:
> Hi Alex, Markus,
> 
> Markus mentioned QAPI problems with the heterogeneous emulation
> binary. My understanding is, while QAPI can use host-specific
> conditional (OS, library available, configure option), it
> shouldn't use target-specific ones.
> 
> This series is an example on how to remove target specific
> bits from the @query-cpu-definitions command. Target specific
> code is registered as CPUClass handlers, then a generic method
> is used, iterating over all targets built in.
> 
> The first set of patches were already posted / reviewed last
> year.
> 
> The PPC and S390X targets still need work (help welcomed),
> however the code is useful enough to be tested and see if this
> is a good approach.
> 
> The only drawback is a change in QAPI introspection, because
> targets not implementing @query-cpu-definitions were returning
> "CommandNotFound". My view is this was an incomplete
> implementation, rather than a feature.
> 
> Regards,
> 
> Phil.

