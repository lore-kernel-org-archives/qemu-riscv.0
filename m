Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D560EB64DB
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 13:46:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBFDK-0001tY-VT; Mon, 19 Jun 2023 09:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBFDJ-0001s2-N9
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 09:46:37 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBFDG-0006IC-UX
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 09:46:37 -0400
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b46d270ea1so26100461fa.1
 for <qemu-riscv@nongnu.org>; Mon, 19 Jun 2023 06:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687182393; x=1689774393;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RZAFf7a7CQepa6D+gIU51FI4q5YibaV1KpSK1tAnOSk=;
 b=kIrei8YLpsn2Cya3HB6gW+DFnTb3qQ5INGhMEdriy3TwpwRjHiGzcLqo9gTpnHetLv
 sY29UnIgZ+Ig2K+kjQnTgmcKK7eBpqIrixC0H2NLiOyVxHie0XoBa4cFnMuQjC4aDxJM
 CiMUdxDi+DpkYuNWyYkuwzwrOkyQ4BiLJaJO6LngkQLoL54lMzh0ZikSOZm/mtz+C7in
 JRulSNc8j2TNngbKqgWb9P8tjVvEFdU3Nj2FnY1QbZ8neKDfgukUdfwxpd4N3pYjPGM5
 tC0Jqw/rSoYdINzkWQYpvGVN9oGJOGueAVkxsjUIe/2Vz/c5VUmBroVatiuRwqdQaeRj
 LMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687182393; x=1689774393;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RZAFf7a7CQepa6D+gIU51FI4q5YibaV1KpSK1tAnOSk=;
 b=mHBLdVdVMOLFyiLQ6OAq14Jznw8jIE8y4KmPUkjnwyPchluvwHURp6Bnir/LmZelc2
 NBIwEip9AwEfAnBwcet+HOebumA07laSvoONmWZWvJSLeEOOd0oIKCxebpgFn86Q7X+I
 sMQ8bXuFq1TT+gF6Us29Ng1afWpHbxYXooI4rU4GUY9aHc3CHQGIr3Wyv8dZCJHRIN1S
 yUiP4juxrAPx8Qtl6+vT75Boa5VnAbKWxy6Pehz54kIOkdDhzF1jbPW15wmth9+bCIK0
 3Ojiq59ZT0fIDBSD5+QJ9/Y3vGa4vyF57NQr5cd4XHNEkuQa2VabtvSyLrKhhhRQVRr2
 CZbQ==
X-Gm-Message-State: AC+VfDyTEMeqOmzYwKNrfNu34hrS/9B/x9Yrr5EApHZUjhYH1/ZYtXK4
 QtqO9g2Y9As0ltfddPoiTYkcfQ==
X-Google-Smtp-Source: ACHHUZ5JFE1GnE5mBt8DS0BGosQ1RMIwoD93ASbajwFvqHmHlIZTY80s6L+VPOL+NUZl4/kzjqCWkg==
X-Received: by 2002:a2e:9011:0:b0:2b4:5c50:f60a with SMTP id
 h17-20020a2e9011000000b002b45c50f60amr5081641ljg.7.1687182393057; 
 Mon, 19 Jun 2023 06:46:33 -0700 (PDT)
Received: from [192.168.69.115] (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 bk4-20020a170906b0c400b0096f675ce45csm14657406ejb.182.2023.06.19.06.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 06:46:32 -0700 (PDT)
Message-ID: <327c9d66-2adf-921f-50ca-e856d362a3c1@linaro.org>
Date: Mon, 19 Jun 2023 15:46:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 31/38] target/ppc: Use aesdec_ISB_ISR_AK_IMC
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-32-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230609022401.684157-32-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x231.google.com
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
> This implements the VNCIPHER instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/int_helper.c | 19 ++++---------------
>   1 file changed, 4 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


