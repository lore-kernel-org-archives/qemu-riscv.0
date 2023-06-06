Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1EEC7EE29
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 14:51:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6Y0a-0004qY-9g; Tue, 06 Jun 2023 10:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Y0Y-0004pg-J8
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:50:02 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Y0W-0004t0-RH
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 10:50:02 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-53063897412so5718832a12.0
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 07:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686062999; x=1688654999;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=psOwtkaXSl9id2mHjaUpgh/S1Hy86LMxS5peKgKvoVE=;
 b=vJ98leLb80e8WUrX7DooTPDPlLY3/8LVkW3wFbwA4UOlf1AicAPsm5GkJzxU5FKZTK
 IeJIf5Ik1fAGzJ+h28nYey0eOR/K3lLhJtAru/saQOTQLahcsuP7V0V8RvygJ5bsuGCf
 9RrvgymIBgXJ2aIZNvZoWgrMTY2JCuB6EtXdmAt5mwWc8nU3l8ALC4rMGYumwG7sc29f
 WvK8E0VeVidtf0Ti+vsuwc3BUJ5OGFaZ/4mrMC6U75Aui4IuepM+ucCGrVPOX6bfJMsx
 jXcg3rY7yIpyCheh/FD/AcFqZ8b7NeddHVSddQoV/hNy+ASuOFZOEk3rgDnT74RxRsy0
 MdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686062999; x=1688654999;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=psOwtkaXSl9id2mHjaUpgh/S1Hy86LMxS5peKgKvoVE=;
 b=K28F+/mYAbJDPyjUxntDhzZFqkn8hYGL8NjzRoZJOEUVyHHSouQ2+HFO9EAjhaMmaf
 UuR/W4eqwaN/vRYZn1hvoDHvvLaxSIJ0WAcwPRSmRXWOwWO8AdqAe5RgoeU93J5sEcUt
 00ETABYmTSufldicGI8YFfCT+dI00KtSknkhCFQ88FcLyT4kVIeBtHXpeM8cEpeS/hcA
 LY27Q3bJLN1YBviJbaeuGwH2FWZMBoZgHzOkJOLuUz6zxPDGCRN61/AcaO+bouuGKg3D
 BThhqJCMrYuoG8kd1kid8e2ZzSxnGwpiYrhGZuzOTssAvTTOofr/7kjnp2lLKPNEOrot
 hvvA==
X-Gm-Message-State: AC+VfDwxNXyql+vqqX3FCvAbCChMsDgpVnfqhFiR1wuRFAfLoR+548dT
 bnVXA++WtsJDWnt0nsCH5KEStQ==
X-Google-Smtp-Source: ACHHUZ4OVjvR3fTXF1DUHDX3IepmhOiFu+HBGz8keKzIHRM4XjCHeBueC/rYedlaLAh0vIqgNAVqvg==
X-Received: by 2002:a17:902:e88d:b0:1b0:3c2a:2b4e with SMTP id
 w13-20020a170902e88d00b001b03c2a2b4emr3414254plg.8.1686062999401; 
 Tue, 06 Jun 2023 07:49:59 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a170902a3c600b001ae2b94701fsm8754590plb.21.2023.06.06.07.49.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:49:59 -0700 (PDT)
Message-ID: <f1e72c3a-64f1-3993-2567-03a3ec1541bf@linaro.org>
Date: Tue, 6 Jun 2023 07:49:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 4/9] target/ppc: Check for USER_ONLY definition
 instead of SOFTMMU one
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
References: <20230605222420.14776-1-philmd@linaro.org>
 <20230605222420.14776-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230605222420.14776-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 6/5/23 15:24, Philippe Mathieu-Daudé wrote:
> Since we*might*  have user emulation with softmmu,
> replace the system emulation check by !user emulation one.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/ppc/cpu_init.c    | 20 ++++++++++----------
>   target/ppc/helper_regs.c |  6 ++----
>   2 files changed, 12 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

