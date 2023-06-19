Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042B2EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 10:52:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBCUF-0005Cp-Ak; Mon, 19 Jun 2023 06:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBCUD-00059Z-9c
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 06:51:53 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBCUB-0006AL-Nv
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 06:51:53 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f90a7325f6so19364405e9.3
 for <qemu-riscv@nongnu.org>; Mon, 19 Jun 2023 03:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687171910; x=1689763910;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C1LXp2sElNMvaZ6Gc9HvwnoN40XblXy+VlnOvjsvqLc=;
 b=DrT3QWkG25hUg+RPjqtbbldQOqxSGqLHBOWzNP6oV8ET2Lxz66cFFgudEDnSorV21d
 PNxHwDRtcjBckdc8JvIdr5vrewwXhnSsDTV+lw25qNMKNNsTWnh4xc9Aset+7HEslaMa
 cySW6b4dHsngWAvbcOvSKB31LfCuKM2W9ihf3uLiqEkyxUQvxBKL5S6Si+CivefeeHn+
 XEuqNqrFHJqOgU3NOAmSP1EzD331QHimZrg8nv2PiI3Vly3X7snetskII7Q37TRu6VmO
 rpavZ8zn6voK67AtfiU+7a8PhQRhsUjrf/HZ+VjL/9004STMmSP9nh7jwnGw+eUQJplf
 LCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687171910; x=1689763910;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C1LXp2sElNMvaZ6Gc9HvwnoN40XblXy+VlnOvjsvqLc=;
 b=G1JkUwW05Pc1GeWAHx5YMe3Sc5t+I+KVyIkYp/FdotMiIzYGfDbALnb6WIho5TUSps
 kPbudDvff+bgnaukcJyyUHpvJLv3h3qPuy0lItfiRaLQIm0imS7XL6m2lOLOKusbgEQ3
 YimnK2sT4nAmgFUbzrRYxGnESIwRnrWhs7u01VFKF0p6OZtRZnvjyDS9UZHF+SPXus7H
 rcfz2Hjjkj1A7Z+k5IX36S5GudZvbwIn+v07pnr7Pd9N0vyeZ0SLqyVkhEetCHZZkpwT
 sg5ZGvDIT67AqqElwIEhHPxl9ToOkRjq5348gPbtjhMyI7IWCqADGIbA4h9W2bnOkh7x
 hSyQ==
X-Gm-Message-State: AC+VfDzx+kTLShYnVAxizNFAZMG9Q9BhUgPu3SEqfN32hP6qfPRqO95G
 GDyhQNK7fpnX1hx2YAMheprOseMWup/W4ZVQsiovtg==
X-Google-Smtp-Source: ACHHUZ7Iru10SlTtrrzm90eRjoVQC5zQty0jKy0oLPvjcKh/L6CDJod27jRyHv9j8YEcX/Yax980Xw==
X-Received: by 2002:a05:600c:2942:b0:3f8:efc5:3382 with SMTP id
 n2-20020a05600c294200b003f8efc53382mr9420977wmd.31.1687171910465; 
 Mon, 19 Jun 2023 03:51:50 -0700 (PDT)
Received: from [192.168.69.115] (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 d17-20020adffbd1000000b0030fb4b55c13sm25060305wrs.96.2023.06.19.03.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 03:51:50 -0700 (PDT)
Message-ID: <5e5edc69-665e-2fb7-0dd6-9378b4a05ff8@linaro.org>
Date: Mon, 19 Jun 2023 12:51:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 15/38] target/ppc: Use aesdec_ISB_ISR_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230609022401.684157-16-richard.henderson@linaro.org>
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

On 9/6/23 04:23, Richard Henderson wrote:
> This implements the VNCIPHERLAST instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/int_helper.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


