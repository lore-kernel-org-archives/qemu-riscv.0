Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BA7C98304
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 19:06:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9SHa-0005JG-3u; Wed, 23 Sep 2026 15:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9SHO-0005Ff-DH
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 15:05:20 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9SHM-0004QO-3b
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 15:05:17 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 d9443c01a7336-2d747ed6d6eso8477495ad.2
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 12:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790190314; x=1790795114; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=nmW9VM2/bPkRtZjUhxbmpOA5bBl5cxzt2jdW1QRycgk=;
 b=oj5xTSXb+IL0Goy8+7SzwTISMLjydeUap4/jR8kNqKR5OJC0beF4UazIQpUqA5NfXe
 gzJcl7tzBOTNMT3ZiAH/8uzVp91FqQEN2jEPQbu0ZW0Sit9VphvnCd1ZvHPaii2czPKi
 2SCIebNNKOjbnM/yMDE+tPLk4egBQn/XbPyBi0DVfcv/35VhLPXJ07cfYc7Q0boKlO28
 CcK3p4bcxRMWnxvvqbt8AUO/o+4Oy1DMLOvBANMmiX3wtjGAak3Aww3Ku1vB3F3tKOjy
 oZ/KnV7uDkONzJeiWD/vKLsBGNEJC9foEVbpsau9H9yfevmxpZEztfUO+7LA6wD9uRNy
 z8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790190314; x=1790795114;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nmW9VM2/bPkRtZjUhxbmpOA5bBl5cxzt2jdW1QRycgk=;
 b=HH4UxcX6/aokYRBxq0ltOFQF67TpJ+R6SsmQBk7thwdWrgRnB60Yg8PdxJQT44LQgu
 VeuwqUc36jg8GlH/HkjKuMk8EgCSkI6HMWbLBS/XR7aOTEQGRPt8bb7ucGkMlSzAs7gn
 2EwPvscuESBqNpdun7lVXsDDwUpsVn3QGJZCIpzmBzCq+ev482pbOlp7GdcxBtLyK8DM
 vrI/6ERX/C/2xLT3o5WSWQXulUnSROAu8x8VlwLGvErxv62IbYzMazwOCRlnAQR2oP3t
 w54Nl0b0YsoEgWcCNSgGIG1nHm+4lfxms2bY88tyfc90+u4qUdkVMFZfCpBj18hupfvI
 TWpw==
X-Forwarded-Encrypted: i=1;
 AKwUvBz3FqkChq0x89+4SyJ/iMs9uXp92A4PO+l/Ewu5P5hPOz4tYt+emlOLsGUBmXsCeohtwoWOq6rHEyNC@nongnu.org
X-Gm-Message-State: AFuF++lRq+CU19e9Ldctwr1bfzfAzYH0841VWCAJAyenBWN61uY/K7om
 B76Q1vNdZNb6D2xU+M4H98AnBN89RHIWah9gTB3H/u79p1kq04UZGWmD4GZw7C1izXA=
X-Gm-Gg: AYBFou3JoGHT1KoTk99ZJtSvJ4tRyn9jPqw14MLoAs8VAEFXLcgZAa2Tk3K0C/8VTmc
 l89Z4TfQ+aymA/u3qZQvJMFl4huHc8xI4rIO8FhpTVZWzFxWF1OuGWsBLhMYC6kkMOGOpRMh4Er
 DJwXVFi5SpF2LzmDPrWD4lAwE+RhWm7t05+zWqKMF9ZfkbH9vSuWGyE7GYy5L4tn3O8e9ZN4wMN
 pNyY8+qjX8DNaKvq5oSa8nOHRh+hwAxmMXtRp7XrZ3zvOvhOH8f0G/EBDmD43T3RxocNsJ0XXjf
 cu4cAGawZyOUp2UZI4nP1aF9zNLTZZSYxXb8RxBoPNpT7Ej42a0JbNH+CR1NwZ6cyq++s7N9Mt1
 Lg25JSWLWBIg6378B5tPW7vab+L8FYPZAhfmAxJdNk/TNzDXnvpKn0BL1IEg3lVVJ498+z2wlP6
 hroqTAWIY7FAaYKRajBYE5V0la+D3FEc5XY0B6GSmIRIvRf2eQC6sFzo7eBRoDFxrqAGEnb47Z6
 ahOBAa537mzQhXFYwy7fTTtVoN9tfxgmxpZJmNA
X-Received: by 2002:a17:902:fc4e:b0:2dd:c100:4b7a with SMTP id
 d9443c01a7336-2df7dd6e9cfmr802275ad.49.1790190314200; 
 Wed, 23 Sep 2026 12:05:14 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2df6a5a48dbsm15647795ad.26.2026.09.23.12.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 12:05:13 -0700 (PDT)
Message-ID: <06dcd0e4-7922-471c-a976-55551c6aa8b8@linaro.org>
Date: Wed, 23 Sep 2026 12:05:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/21] target/riscv: Access MIP atomically
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
 <20260923171116.31276-13-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260923171116.31276-13-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/23/26 10:11, Philippe Mathieu-Daudé wrote:
> Use qatomic_read() in riscv_cpu_get_mip() and qatomic_set()
> when updating env->mip. This makes MIP accesses safe for
> riscv_cpu_has_work(), which may run without the BQL.
> 
> Reported-by: Paolo Bonzini<pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   target/riscv/tcg/cpu_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

