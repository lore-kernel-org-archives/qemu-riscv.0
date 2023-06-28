Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8DCEB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 07:55:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEQ1R-0003j5-E4; Wed, 28 Jun 2023 03:55:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEQ1K-0003i7-P5
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 03:55:23 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEQ1J-0001la-2j
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 03:55:22 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-98e1d3be004so478549966b.1
 for <qemu-riscv@nongnu.org>; Wed, 28 Jun 2023 00:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687938919; x=1690530919;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8FkPvJUYL5+A7956IsLwDUAOtiRR2ssOj/eTdwSyLeo=;
 b=XjHEYyCUsPyKaayabs/FtNNXPVkmUf/pTPQouiFxTQIKrtU1ZU26bd63niGLQ7EiMN
 1ZwX3QykQb8eSMPx8BF7A2T6HrTdMW0Y5wjWHzN+NcuWWE2GWf7uXoV07tXXc9pe7JmM
 LDM24/++3KOyUvz++WUKxeiMMHW1M/xsCtis4HbCNHV4XmyfqWgZNQUKTC56vav3PzxB
 E6IwjVYY0gk8iOHhfgrkvbzlf66GrFekiS3TqtJMrDrqLA6IXb4wd7sZ/xVzcjx77AxI
 crAYNQI1EqxhqktHsbpHWZQcBG+TbJHzlkjW2fX4guEr5awNN6R+/48/bRnOo39F4jFp
 Leow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687938919; x=1690530919;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8FkPvJUYL5+A7956IsLwDUAOtiRR2ssOj/eTdwSyLeo=;
 b=TrZ33KdVZvmtuxc5JlJ87zugv+KZ78JJ5xqI2LFkpPm818w/rGdchxYG1iaV6+MH33
 amjX9kW89kmth8RI2RPUOsYNM6oXT6MKyKfuTxtuiCxvK0LmeB/r7e6ptlQpicsTb7Ei
 0cxQbnHPtK20QdjuPW5uRNn1x4jzASzV/nzv66nT1OG5ufRQAN2GfVvsDaQzssii4RXS
 SlX0urAHkHnkB4nih+MfnDPXoVIj+8Jkn6rBEQ4iLy69Of0sewxoKh28d2VzEyauljLq
 bEuTCVA6m75jgipNXWaIBXLsJ2O5ZZGjFDlDg6CIvESZGG7ip9ilykiCVytT/7KXB5sz
 HmBw==
X-Gm-Message-State: AC+VfDz5OVGGaqn8cqKkTk3JMlQEInKR8TOwsN5enYqx0bVb2FgqdrCN
 Hxlq5G2ReAempRN0S3ypBzWxWA==
X-Google-Smtp-Source: ACHHUZ4Nd022tyB2XWG1cdNlQ52nvPaKIPz7Ta7ADuOllDNqdkNpOr0/KzSAQc9a8Q8Q0A3aMv3nZA==
X-Received: by 2002:a17:907:a426:b0:992:bc8:58e4 with SMTP id
 sg38-20020a170907a42600b009920bc858e4mr4450713ejc.20.1687938919072; 
 Wed, 28 Jun 2023 00:55:19 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.207.229])
 by smtp.gmail.com with ESMTPSA id
 t23-20020a170906179700b00987f64b84afsm5352762eje.39.2023.06.28.00.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jun 2023 00:55:18 -0700 (PDT)
Message-ID: <b57d62e3-181d-d496-7793-77fd9b2a59cd@linaro.org>
Date: Wed, 28 Jun 2023 09:55:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 0/2] target/riscv: Only build qemu-system-riscv$$ on rv$$
 host
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org
References: <20230627143235.29947-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230627143235.29947-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.103,
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

On 27/6/23 16:32, Philippe Mathieu-Daudé wrote:
> Per Anup Patel in [*]:
> 
>   > Currently, we only support running rv64 guest on rv64 host
>   > and rv32 guest on rv32 host.
>   >
>   > In the future, we might support running rv32 guest on rv64
>   > host but as of now we don't see a strong push for it.
> 
> Therefore, when only using the KVM accelerator it is pointless
> to build qemu-system-riscv32 on a rv64 host (or qemu-system-riscv64
> on a rv32 host). Restrict meson to only build the correct binary,
> avoiding to waste ressources building unusable code.
> 
> [*] https://lore.kernel.org/qemu-devel/CAAhSdy2JeRHeeoEc1XKQhPO3aDz4YKeyQsPT4S8yKJcYTA+AiQ@mail.gmail.com/
> 
> Based-on: <20230626232007.8933-1-philmd@linaro.org>
> "target/riscv: Allow building without TCG (KVM-only so far)"
> https://lore.kernel.org/qemu-devel/20230626232007.8933-1-philmd@linaro.org/

Alistair: I just noticed there is no strict dependency with the
other series (aimed for 8.2), so this can get merged for 8.1.

