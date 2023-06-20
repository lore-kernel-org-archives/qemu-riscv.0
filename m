Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93149EB64DB
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 05:09:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBTc6-0004j8-Iq; Tue, 20 Jun 2023 01:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBTc5-0004iQ-0G
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 01:09:09 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBTc3-0002gI-EK
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 01:09:08 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-985b04c46caso643050466b.0
 for <qemu-riscv@nongnu.org>; Mon, 19 Jun 2023 22:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687237745; x=1689829745;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tO9RhSBgd5mDrWMLbAqZqZxnLiz+ksyFVZEevX5A3ys=;
 b=xVg4xUaNN1nMMLVtn8EjhqQiCDSZyZP1wqomZjwdAib8gt5BcXjXLM7P0OlI9eD9xt
 I+dgAbnmrOZ155QBIlvDkfd0dbHBKmSL35UGVCDk7YePA3+xQ/ffnTnQFXM8di4pZxPy
 VahqJAtEPTlg7CoXW5tdf7M4LBMd46rvOwX74bq9ubDveKaCZ1P1YmgrOag8iyrT6Izs
 SXmZ5vEvdHBuqna8UnPgtLW8O+rc+NoELbDVwxXCYrvPAAJ5B0yuFR31q8yflz+M89Wg
 s/dFvt3GgNMdneswn2/9Hm2LMc3l8VsrV1W44OsC2R9eNn46bkViaQMKLvlNkYP2ezE+
 FZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687237745; x=1689829745;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tO9RhSBgd5mDrWMLbAqZqZxnLiz+ksyFVZEevX5A3ys=;
 b=QCxjTEH0DHcpyYRSzP8lzbDLrJynMoMLvt1gpd0eJJnNgOdb4bXl/jR2A0i5m9F+L0
 xobZkwrduzmE6kZnOpGh8iEy+fMGxn+N+kLs9CR/JNQrQKHoHoX7RWt+LKM17xWgLNdb
 BPeA5Sy0Nn+3pX4fmxiu30KQuQuVTX7LIkithhXWY9a2OdKnatH8Je7cXnTVumwBHP06
 ap3F6m/BpNQDmZ7UHK7VpTCe429jD5kX5a6ZSCte00MEuYutmoAz7AdBp885POHW11Jk
 0nnJe9fQv8LEKraHAKTaVfjldgV2OvKzsbSh802EBPXsUCtWOOFbcU8KULvp7QJeqWZD
 QG9Q==
X-Gm-Message-State: AC+VfDysfwNbSAW7GqGbxaOBRuznqsrQ7I8ln//DZJdUrbHGrNvDjSkw
 7yWj0OwQJiPQ3SQYPxO1EpHRzw==
X-Google-Smtp-Source: ACHHUZ76uH18hPHHkSfSDTnDC7NC6D2yqFYJQo78y6b2uO1yw1PN3L+hd4/ShPA6FyCYeNtN/Ue7eA==
X-Received: by 2002:a17:907:3685:b0:973:c070:1b5f with SMTP id
 bi5-20020a170907368500b00973c0701b5fmr9812828ejc.44.1687237745513; 
 Mon, 19 Jun 2023 22:09:05 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a17090640c400b009788dfde0b2sm659743ejk.12.2023.06.19.22.09.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 22:09:05 -0700 (PDT)
Message-ID: <605d50ee-071c-2a38-60a3-8e3e296e32c9@linaro.org>
Date: Tue, 20 Jun 2023 07:09:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 33/38] crypto: Implement aesdec_IMC with AES_imc_rot
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-34-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230609022401.684157-34-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 9/6/23 04:23, Richard Henderson wrote:
> This method uses one uint32_t * 256 table instead of 4,
> which means its data cache overhead is less.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   crypto/aes.c | 42 +++++++++++++++++++++---------------------
>   1 file changed, 21 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


