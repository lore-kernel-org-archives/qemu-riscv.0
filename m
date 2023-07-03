Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1820EB64DD
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 15:55:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGLsn-00088m-8v; Mon, 03 Jul 2023 11:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGLsl-00088G-IH
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 11:54:32 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGLsk-0003ZH-4L
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 11:54:31 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fa9850bfebso47206235e9.1
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 08:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688399668; x=1690991668;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4QcY9Tnf2ytUomV6p7pqI0Ee7Nx+2k0qmvvW+Mej7nA=;
 b=BxVCD32WgsSWaCnyGI6751tPxCTih0QWnHAbrx1tJAHLw2fORIxn8bNFXDf/QHBK6v
 odgzr6I6fvuwbOZWspbaseag+Rr7Jzm3PkXNLNppeHhbruQV/iI1RF+NW1GT5Gp/inWD
 1sWZ2tu94Gj57brq1CllXZnnp4tZ4vTuE5voYMjt0JhyL//pCE41WLIhmjL0avJVVB4L
 EC+XYW7EgCMXlQzKJKo2XinOSwFsGFY0QxhLqwLtbRT1pR4Kna4YINqrJHiz8kT9trNN
 G41LbfPTniPGZm9vsZZrW7GVw/LiXuRueexKE+qZAdFImFvT62EVrziw3XAYIpGGK/2n
 DETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688399668; x=1690991668;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4QcY9Tnf2ytUomV6p7pqI0Ee7Nx+2k0qmvvW+Mej7nA=;
 b=BkESPyQOdsAJ3rwxLedChVGyRSL8DQDpXROOxkDWt4kMVKefACaaEr8lDq2UNyEMyd
 i8WxdRyhl95JSN5DFX+r5p56P3I1cZFkXHDU4qVxQfFCTyBjENS1Vkq2RcmuCTquz0n7
 hOtC/T941DSqghByoEUkZZ4a5/8KN3R/cwSTpeMtyLFFqPD/hHT+vsOECweukJBl3u95
 +5fd0p+lS2bg/KtodcEL9ZCjlJvFQN0LV4DWm+95VVTbxGSofZkfrrw3LQ7p2g4vQZYm
 wQpAq7cgMtQEFR4DtxoqOBbWCaSk0lTaSuQqlhqoZhETGlvKLNEJg+YX7AiUq39/OllO
 VIEw==
X-Gm-Message-State: AC+VfDyz9dMmm1XnagckCt3XyGP/q3fyjxfTCGFJMawwCrpavNRDvN3P
 FrbnuJ0dhkw2GdxtYVqUaFPIHQ==
X-Google-Smtp-Source: ACHHUZ7qJvPeNZeCl6sFIjkDwD9r7pt036WCuNnQz+wBME8w1kRovFpkeUIv3WyCVh6BKFGua3pIPA==
X-Received: by 2002:a7b:c409:0:b0:3f8:946:115d with SMTP id
 k9-20020a7bc409000000b003f80946115dmr8251379wmi.30.1688399668392; 
 Mon, 03 Jul 2023 08:54:28 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.178.91])
 by smtp.gmail.com with ESMTPSA id
 a10-20020adfeeca000000b00314103d6daesm13399835wrp.47.2023.07.03.08.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jul 2023 08:54:28 -0700 (PDT)
Message-ID: <11ff4ac7-75d1-864b-038d-04557926ad26@linaro.org>
Date: Mon, 3 Jul 2023 17:54:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2] target/riscv: Optimize ambiguous local variable in
 pmp_hart_has_privs
Content-Language: en-US
To: Ruibo Lu <reaperlu@hust.edu.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, luruibo2000@163.com, alistair.francis@wdc.com,
 liweiwei@iscas.ac.cn
References: <20230703140340.212360-1-reaperlu@hust.edu.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703140340.212360-1-reaperlu@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 3/7/23 16:03, Ruibo Lu wrote:
> These two values represents whether start/end address is in pmp_range.
> However, the type and name of them is ambiguous. This commit change the
> name and type of them to improve code readability and accuracy.
> 
> Signed-off-by: Ruibo Lu <reaperlu@hust.edu.cn>
> ---
>   target/riscv/pmp.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


