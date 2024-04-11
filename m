Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5F3C4345F
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 21:30:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rv1zX-0000ZY-24; Thu, 11 Apr 2024 17:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv1zV-0000Xe-LL
 for qemu-riscv@nongnu.org; Thu, 11 Apr 2024 17:29:53 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv1zT-00034w-2r
 for qemu-riscv@nongnu.org; Thu, 11 Apr 2024 17:29:53 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-222c0572eedso163610fac.3
 for <qemu-riscv@nongnu.org>; Thu, 11 Apr 2024 14:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712870990; x=1713475790; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mxeb9Qi5ilEzWYWacyUKXpeH6yDELX9V1W2dQgietGQ=;
 b=pdaRJ9qWEokG91ZhM/ACKVOlW102ZW4IZXS8l5OlJNcTkdZJPPiU13Mzpu1QPeY7je
 TJYz1eIsL4gOX1aQhsk8hFJ9amqtjXGeJo74k8WuZThAaePxLWA3Nhsb0KtCUQfT+FsU
 JlRgPvDmKidpVKJ4MUpkA1qLhUX2/9+P+SKAHSXxkCDa82WN8kJg+nmF7SG+u7nMUiyk
 DdimXbNc1iGgIh7kXxEHNCkVMSiyFxZ4fbIbmo+REeXTK/fPhhvWv18ysrQtDdjcmTU7
 ux03dBH66RDhFg7j/KKqd4CWVtR7xN9u4uYn7Mo78KW9WV4iia/cbfNCv4Milq55kwWH
 eB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712870990; x=1713475790;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mxeb9Qi5ilEzWYWacyUKXpeH6yDELX9V1W2dQgietGQ=;
 b=tONEENI9YZFF3PtcotT3Ex/HRmVUtOsmXAlVxRZyILK0vY6FLxrmUskrMIATvViNfX
 u4XnrPPu4t9zQH7RPEOANXNQwnt196joKUksVoyIKFnp3KtVh72nq0UvvPc4asd+JO2p
 gO6/flUDm0HIKiL8tAEfM891bKTK7WFPvEyqQ+bdIWSerHv9AeOISsLHTls4ozpINMOD
 r5DNzWigHV9Av+c47ZGcXDXJHiHE1BPmZ0Vta2Pe3QSvlECpy5DD5dIspMuP0rROHiKE
 ItV8YlXYjDsIKVY8r7VdP1dPmp48lVAQKoaY7kLGj5qsjQlhujzfoWjfkr2f2z9+K/DG
 lHmw==
X-Gm-Message-State: AOJu0YxUavYft02j/2jaTXJtb3XfA1yEeTJRiu9UxdSosSF6S9Hu8QWe
 ktN/igspkXNtuiogv0vJysADMVAuaYaKQxlfMhp/hPnomJoBw8elosZHvu7d3fY=
X-Google-Smtp-Source: AGHT+IHeDw79VNjh4f99OQcxlOJEkb0U2VzKrV5YzeuFSU+t+VOd+sjjZbLjVpNj8WKWl4KVGQGWoA==
X-Received: by 2002:a05:6870:8c19:b0:229:8169:ae49 with SMTP id
 ec25-20020a0568708c1900b002298169ae49mr554932oab.46.1712870989851; 
 Thu, 11 Apr 2024 14:29:49 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b005d6a0b2efb3sm1504986pgc.21.2024.04.11.14.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 14:29:49 -0700 (PDT)
Message-ID: <e43c2c7d-e12c-43ba-b3d2-7a5bdce2b364@linaro.org>
Date: Thu, 11 Apr 2024 14:29:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] target/arm: Replace sprintf() by snprintf()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240411104340.6617-1-philmd@linaro.org>
 <20240411104340.6617-9-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240411104340.6617-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
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

On 4/11/24 03:43, Philippe Mathieu-Daudé wrote:
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience. Use snprintf() instead.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/cpu64.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

