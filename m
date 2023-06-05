Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E31C7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 10:47:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q67k5-0007SI-VC; Mon, 05 Jun 2023 06:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q67jy-0007RD-8C
 for qemu-riscv@nongnu.org; Mon, 05 Jun 2023 06:47:10 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q67jn-0007jw-NU
 for qemu-riscv@nongnu.org; Mon, 05 Jun 2023 06:47:09 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-30c4c1fd511so3725369f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 05 Jun 2023 03:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685962018; x=1688554018;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OdmBl+opk/gIH1Do7GTdKurFLH1++4JOKG0OT9lZTwk=;
 b=C9CNvkYdJkJo4fggXNBImhrpAfpr5LqayDyywWx0JT0l/WR/I0Axwsl+aSFC8Ag3Y+
 wZyDJz5EQUd521uYr5WZW1nvYb0SPfdI+DrTULiCLnFcJkBQAn42IgFj1KuU8uu2VoGR
 R5wkRv7ctU8qqWqeMh5sVKE8zsPFCe8QBTlHtcGE6qQ7Nph3s9qm+dpNRyuhgnaOM8Ir
 7/2NR88Y8RW3bquvb/HjF3kTDvNXHzu2mZW8+1Tq6OjHGjt7HdgFaiBfZm/w0uxALfXZ
 mGcPlzlw/qNxIaKcuseJpzRaFzy91jgNxHaL4U8Y/rCObPE8LmCtUlGwZYhY7mkPAr/S
 PElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685962018; x=1688554018;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OdmBl+opk/gIH1Do7GTdKurFLH1++4JOKG0OT9lZTwk=;
 b=gukefhvB2Stsvzc3Ynd3Z6JYyWcJSKBD+XphmOxXJbgOGY9GvdGbYIQn+kGyV6PVRx
 HSZlL0PHDPqHt7lgW4cbH0t1yUAd8CRiUJRQKn818S6C2cd8FwdvVNR7/hThD5V6RH/c
 Ob8/qfUDFZ422hNu2i/ezABZnBNT5Mypgb0UEfGqV+Z4PHb84G+CskBeU4avR9KowVkG
 iG6MRxA9A/MIWPhYI19dM9maqhehjuRA//os+5UDPcJ17vcaJx4vmhjn7B6G0XyldFuC
 mRgNj+eB43/PJSJjdoZZwDTtzIiKppt5NdlITiYVBQ+wUBLpyVFSH77F/1Lt63GngZW1
 WHUQ==
X-Gm-Message-State: AC+VfDxZ1NWN03mLW9aKMWFYjOXWYJtgDJWAMM9UeZxhTMFS36E/zJ+v
 0VsNaF/iPngAJ+r+tbht4YpgCw==
X-Google-Smtp-Source: ACHHUZ6jQ/uw2FYWmnAxt5ebldDiqBRVYy1QjTTO+92u5lUm7M2/AWEGpkLx2YvBmjDYtfl3J5HJJA==
X-Received: by 2002:adf:da4a:0:b0:2f9:a798:602f with SMTP id
 r10-20020adfda4a000000b002f9a798602fmr6048623wrl.48.1685962018298; 
 Mon, 05 Jun 2023 03:46:58 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.217.157])
 by smtp.gmail.com with ESMTPSA id
 k9-20020adfe8c9000000b0030644bdefd8sm9263783wrn.52.2023.06.05.03.46.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jun 2023 03:46:57 -0700 (PDT)
Message-ID: <3df44d64-4799-d883-067d-2353fb2415f0@linaro.org>
Date: Mon, 5 Jun 2023 12:46:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 03/35] crypto/aes: Add constants for ShiftRows,
 InvShiftRows
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
 <20230603023426.1064431-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230603023426.1064431-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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

On 3/6/23 04:33, Richard Henderson wrote:
> These symbols will avoid the indirection through memory
> when fully unrolling some new primitives.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   crypto/aes.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 48 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


