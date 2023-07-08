Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6E9EB64DC
	for <qemu-riscv@archiver.kernel.org>; Sat,  8 Jul 2023 17:19:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIBaE-0008Px-Hs; Sat, 08 Jul 2023 13:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBaB-0008Oi-Lr
 for qemu-riscv@nongnu.org; Sat, 08 Jul 2023 13:18:55 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBaA-0003iV-2g
 for qemu-riscv@nongnu.org; Sat, 08 Jul 2023 13:18:55 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-991fe70f21bso368351866b.3
 for <qemu-riscv@nongnu.org>; Sat, 08 Jul 2023 10:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688836732; x=1691428732;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8PsZ/p+CNNR2iUPqY+K1d+GerH8ve0BFS3vABcWtGTk=;
 b=TWb7cdmpaNnWlK79sdbW9acjA/xW1GRTSl0RUPYwM7xRNutjg9uZ1hGz6pYFv4e1ju
 Bq0vfTFp5RhoaLnj/nJbloLY05hM05GdqsTqr+atMEkf2Llq8AECifNKEHN8gMIM2YHD
 dImGkn/mAeYKCIp19o6hEA3KQfRoLdcm2NpsQE0qhcyHqvH+EfYV5ZpAXkNtCAjHuAZW
 aDv0rDmkFFG3QOGjtYwTbN8Mx1sziGdAxrK3U4jv0zF7rI0h7thF/dM3ykdXG0fpsS1n
 Yx4tZCLhO+B+GmyNxWcXt8IJwWR8PdZZmiN+iK7bpw29fcCbLgINb7fuuiwjnfrQaexB
 t2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688836732; x=1691428732;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8PsZ/p+CNNR2iUPqY+K1d+GerH8ve0BFS3vABcWtGTk=;
 b=FGCVmB0eRvJnARxE8uQwsT3kQH9wpl3iuUenIy3wMJII59T/n6luLiEVBAI+/LQ1HT
 Z4/ip6XBF9pW5R3Taq39sU/ailGGAcNZVsLPT9bwaiiqCw+bgfKIxqLEvgeSEmVj710c
 kYewNaqZ5+uwlsdBwOHxg0UtpdhRQtT2/51IaAi3vKEFUdp+oVeKWTPGLsILrNYQJ67l
 We7CvUrudtKsByQ6xubZ7ysIjv5pa5ije58GM7b04WCfVXiuBsV7uYi/edmXgAVilVhW
 pdA2fnEY5kMKPOsS4yCU21ZOXN0dnzt1d4xwjS4MvwTmH438iDx74A4XEORSKBVvjyCg
 rRbg==
X-Gm-Message-State: ABy/qLbihD4Bsa0uq0M1AywFgvOvPxyVOHY4Uhye0YDs1yWAgFsvYVxM
 CqEWbGCt6uQXk88WRsZaBxigXw==
X-Google-Smtp-Source: APBJJlFdlD1MQzulff/DLckChqQYShACqv064bB4hgWXsJ3Pfwb059CIu4jzcuDhGRiBrxhZ1G3U4g==
X-Received: by 2002:a17:906:c7d1:b0:991:b834:af83 with SMTP id
 dc17-20020a170906c7d100b00991b834af83mr5391330ejb.59.1688836732091; 
 Sat, 08 Jul 2023 10:18:52 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.32])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a1709063b8200b0098e42bef732sm3684001ejf.183.2023.07.08.10.18.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jul 2023 10:18:51 -0700 (PDT)
Message-ID: <80d5659c-b75c-63d2-0415-a97ef6f2f6c9@linaro.org>
Date: Sat, 8 Jul 2023 19:18:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 25/37] target/arm: Use aesenc_SB_SR_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-26-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
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

On 3/7/23 12:05, Richard Henderson wrote:
> This implements the AESE instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/crypto_helper.c | 24 +++++++++++++++++++++++-
>   1 file changed, 23 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


