Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADB3C54E68
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 21:14:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rmgmx-0002I2-0U; Tue, 19 Mar 2024 17:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rmgmv-0002Hf-L4
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 17:14:25 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rmgmt-0008Cn-DH
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 17:14:25 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6e6b22af648so225227b3a.0
 for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2024 14:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710882861; x=1711487661; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mNvi2tmZ8zJngxfI5KhlPbVp84w4oyI5JdITFeSXGR8=;
 b=TylFaU36l1QVDUTppyWw4V/pbaB3INFAKBsPiDaLtDTy9WTef1pG1sn8nzBU5QQjdo
 Y1/ymDhaiZugTJ12zHhnwgRQawlse9cRDkQ0O2yfcfvAFMSQv3T7/zbXdg4G0ehZeG0B
 PFVKPybtLLvAeZuxlWsrWrvX7lbNTjk1lJs7QUAVuLw/BCU4YfV/808IsPJzfNzggiYl
 N70rWh++BZ8mKUcaMUcGva2h7j45jvdovyEBTIUl3LV9OREW8+7FIf6W5Lnntr9j5TZ/
 1rE6hIhu/PjmdYOg9lVm72e8KB5HCwbmamZILRbT9FMKo2B8FUNwFvW686pCQ/uDbrpn
 3rTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710882861; x=1711487661;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mNvi2tmZ8zJngxfI5KhlPbVp84w4oyI5JdITFeSXGR8=;
 b=cH1sg5o4IenYQx7tSbn5sGSxvYq1rsm+mAMVB+gWJVBl9+2FYReqDQcLRics03JFqK
 HxQlNIgzeEPJZzQDYjINeY7+GXmcRo/mzP0PddQsn2mkSB11csGxCtwALVN9KAQ2Zo+O
 mX4Nw85sV+AK6yaVW71QlAzIfzWb5OrFzym7VHDp+ZtKmyZtld/I2VZehaDf+pRp8st4
 eLNZn+2o4nFy3d35GVz3AdgHiQK9+9JlnqgrrkcHCH6eI4Jhx++UJPUasl5nTQOWAaTX
 ETVQ12juJJd6tq9PZB76L5ThSHJCNSPph+PlicevLnWwrlatYNZ2WGIe+6MyMRvlgwFR
 s4lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyNiEu4On11zYrQIG4mSYcrw1dfR2Oe5NZrqlmFdzsZGbNUbpXFF0Dh+XMf9QgifumHTZhFqRm2/Ic0vCHTSXj1QWbm14=
X-Gm-Message-State: AOJu0YzunNl9qbw9E9/bqwSABLBgNtQ2amB/R+pzCfbgUCIsHrh9ZpYo
 xpMpv4d2lWHBhNNfHc2yWsALhluXycQiAT7rWYxg0L/lCPwFHf5E3u3zEksjV0Q=
X-Google-Smtp-Source: AGHT+IGCYV9Z/bxiIAC6PB4I+CCedOi4j/ITh+O85iRlB7FvzQYPOOGOGghToGhjNSms0BhvovF1uA==
X-Received: by 2002:a05:6a20:2d11:b0:1a3:6644:df05 with SMTP id
 g17-20020a056a202d1100b001a36644df05mr5750034pzl.16.1710882861462; 
 Tue, 19 Mar 2024 14:14:21 -0700 (PDT)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 h3-20020a654043000000b005dc49afed53sm8259622pgp.55.2024.03.19.14.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 14:14:20 -0700 (PDT)
Message-ID: <9b23f721-7ea4-4f12-8f8c-3d87aa9ebefd@linaro.org>
Date: Tue, 19 Mar 2024 11:14:16 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 24/27] target/sparc: Convert to
 TCGCPUOps::get_cpu_state()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20240319154258.71206-1-philmd@linaro.org>
 <20240319154258.71206-25-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240319154258.71206-25-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 3/19/24 05:42, Philippe Mathieu-Daudé wrote:
> Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/sparc/cpu.h       | 37 ++-----------------------------------
>   target/sparc/cpu.c       |  1 +
>   target/sparc/translate.c | 33 +++++++++++++++++++++++++++++++++
>   3 files changed, 36 insertions(+), 35 deletions(-)

Again, why translate.c?

r~

