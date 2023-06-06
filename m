Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCF0C77B73
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 16:32:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6Zb2-0005AP-U2; Tue, 06 Jun 2023 12:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Zb0-00058q-TA
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 12:31:47 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Zaz-0003A7-2n
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 12:31:46 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1b0478487c3so28244595ad.1
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 09:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686069103; x=1688661103;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CCSZOC3ace9mgIPiCLtuSJqT1KrCOoXa+Sft6OEDda0=;
 b=wcLupTDwB2WAZsscImkXoR6/nE2UCz6/svrkcLEob5Oa9SCKK+zDA0W3LMFIMcXBhO
 hHUVMxUDnQ9EwWiFkiDX3Cldo7R1h9bFctvsiadHmd99TIdJF3lkMvEbWi4vB/BrN9d8
 9lykGd1OxqctDPgOfL5zao1zOcMFUetIsc1R5l3AmAsz/Ma5R3L9CiFaDnq9+KNaLVU4
 Gawv8/brAtNSNT0v22LNsQesjtCuyNxg52qnGTEohGnGiESInH4alGdH3mvsHj4XGn7C
 s3sxFsd6V3NdwxKVD2rKXOSTwRIK7simShiZ8WWcJ1fj3hMzSPSad1tpNyWR2YCcymeV
 fziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686069103; x=1688661103;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CCSZOC3ace9mgIPiCLtuSJqT1KrCOoXa+Sft6OEDda0=;
 b=TKbpXYBqUe1yATpvNAPn2ox7evq5GQKCFWbx1CkFU+7mAxq5OSD7yGnEUM6Ts4+wZT
 7W12kehM/FbuAwVHjPIp3ANHW0Mmq21eOCTyTNIonaGyGMRTgU7iEgFcpb1N2V01T6JG
 oc0sC4N8FUkEqAIML8dCShkOjBO21x8auJs6jGyCL2y6Scu0CK+9YdumrI1+uUaRsLkb
 Slr9jZNHFBQqNBK3lcLfvCuXHHmolryald+cl4TBqxUZb1pXogKJc53gsCByNx2WOXkc
 lXIQ1k0vWVQGJ/nOfozuQnUBrQsTYxyLU5jEj2AoDSyccTG8A28Wks1gZf9Auxz9BTVl
 /+Hg==
X-Gm-Message-State: AC+VfDz1i0c3NCFXK3cIjz0s30hZ5UAaQgaxvIeeNvCuKJdkI/MyIUF5
 S9UW7V3OyJKNDt5wwK1tgdsvLw==
X-Google-Smtp-Source: ACHHUZ4aJf+qqsz6XcGRR2polUHRTRIviQyHSI9K6uDIB44fWTtJBvQyfF/pRMTuv3xQ9d5FQRMr9A==
X-Received: by 2002:a17:902:7c92:b0:1ac:8be5:8787 with SMTP id
 y18-20020a1709027c9200b001ac8be58787mr1060626pll.21.1686069103125; 
 Tue, 06 Jun 2023 09:31:43 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a170902ee9100b001ab1b7bae5asm8777394pld.184.2023.06.06.09.31.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 09:31:42 -0700 (PDT)
Message-ID: <5642acfc-46b3-c471-f8e9-1dbcc512e61a@linaro.org>
Date: Tue, 6 Jun 2023 09:31:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/5] target/arm: Rename helper template headers as '.h.inc'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20230606141252.95032-1-philmd@linaro.org>
 <20230606141252.95032-3-philmd@linaro.org>
 <9ff0f082-1b04-8bf2-6a97-1e9220aa4509@linaro.org>
 <f991008b-015b-dcce-fe00-838a6ddefde5@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f991008b-015b-dcce-fe00-838a6ddefde5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 6/6/23 08:49, Philippe Mathieu-Daudé wrote:
> For example in translate-a64.c handle_msr_i(SVCR) calls
> gen_helper_set_svcr() which is declared in helper-sme.h.

The placement in helper-sme.h was not done with consideration as to which compilation 
units might need to use it, since that wasn't a thing at the time.


r~

