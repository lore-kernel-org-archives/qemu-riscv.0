Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0EAEB64D9
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 19:50:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHrTY-000274-N7; Fri, 07 Jul 2023 15:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHrTT-00021m-5s
 for qemu-riscv@nongnu.org; Fri, 07 Jul 2023 15:50:40 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHrTQ-0007F2-HR
 for qemu-riscv@nongnu.org; Fri, 07 Jul 2023 15:50:38 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51e29964942so2953050a12.2
 for <qemu-riscv@nongnu.org>; Fri, 07 Jul 2023 12:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688759435; x=1691351435;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oeUR+SdX/6yesgIiuLAqr0CsQFOhF/7irAv5qteWJGE=;
 b=KvX+XASwH8gFK2yBTejVf+FyxyXxC73W5+hPAUFkQmmoMONyfV0xUCctrLGAKrCpTK
 hfEcTsPO50TbvDydTD+rKGPr3rjaRHrnScPN1dq9LDrcaTuA1WOn6qtz5TJis2R6iKUz
 cPTUhX7yS7jaZBoRUN6qjS82wHznivvhjlB/ll0Z3WIN0KaRoJPnbXDeKeSVyvewdKwW
 mUsfjn1jOfaMJaCW8+0FhIbbQ8w6SBf6p4H28aTOkRMHeU7ZmiIJU10vVuW90apqavcO
 j+apNPf/WUMjJF4VOudkgOFGJkS7nWaB8nTH8EO9DJ0wkui1TjDqQ0ec+EckgA534VVe
 5now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688759435; x=1691351435;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oeUR+SdX/6yesgIiuLAqr0CsQFOhF/7irAv5qteWJGE=;
 b=fRvQegcJQ6/9lXsGcyGjxiiWs10EOEFIooDVAKB/2/w8zntb7JFOaaCpOmyZYdSwZx
 PBvKDNcUsb7n0Wc+BMAYKEpT501M/ZgD/U0lKDQMbT+HsJcPPOhRpXcUBvl8qjfY7QRU
 gtteowYKazMmMALtlaGz0zJ8VqWcZYkQcS5y1Gchf45OxqOsmSY3zAJkzlXE58joGZ94
 F3YR6d7bm863Tn4xWPflrri+uv92tCDStGh4fOTEdTTnqNzD5cGeYau4Bj5fn3MCRl2V
 CwqOpkGo5c3VwjY8stpcNugInTe7RvSB171Wzc2/OrYvNJ0wC31argP9g2npMIay18yA
 bMQw==
X-Gm-Message-State: ABy/qLbpnxlWlQYjLgQamHiRAP0Wj4CGTgq02V0IR41oEphnCtTxZdsj
 Zfli1yewg+Puz+rV++YjTyQsoA==
X-Google-Smtp-Source: APBJJlFGuERbAeSKLdQlY6bIo0gyACbve1TWZ6BRiLr02fAt4zSYnbl+p6zpGYo0tuWY6ytCt+MBgA==
X-Received: by 2002:aa7:ccd4:0:b0:51d:e255:6173 with SMTP id
 y20-20020aa7ccd4000000b0051de2556173mr4628748edt.0.1688759435091; 
 Fri, 07 Jul 2023 12:50:35 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.215.192])
 by smtp.gmail.com with ESMTPSA id
 i22-20020aa7c716000000b0051df13f1d8fsm2398964edq.71.2023.07.07.12.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 12:50:34 -0700 (PDT)
Message-ID: <35340e21-fff9-e04b-808f-0eb9775daea3@linaro.org>
Date: Fri, 7 Jul 2023 21:50:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 17/37] target/ppc: Use aesenc_SB_SR_MC_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 3/7/23 12:05, Richard Henderson wrote:
> This implements the VCIPHER instruction.
> 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/int_helper.c | 14 ++++----------
>   1 file changed, 4 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


