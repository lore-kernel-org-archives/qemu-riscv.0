Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7836EE57DC
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 23:16:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1soWZ2-0003s4-Nu; Wed, 11 Sep 2024 19:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soWYy-0003jk-5t
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2024 19:15:52 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soWYw-0002G6-2I
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2024 19:15:51 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2054e22ce3fso4146565ad.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2024 16:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726096548; x=1726701348; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xRiFsrXZxD+0mMxKY7ViZO6RkCZKUT9FknTYEl1MhrE=;
 b=Tv4Dtup+y16R1hp9CbC5mz7ksl2OEMHMD3hMNOd8EJs5dIeE/GSCstDxwY4Zu/YDw5
 Kt/pvwThjGdyGWvkb3kVoZ17tywmDs5gMoeXPleXzXUhxECGHGZrQCaN5iZJPgIX8Xmu
 eXEat/q6YHa+BJ7DjoyFNds+B60cMDvO7KXjl9OGbXX/TCKh+5ygWn6jlHslJZt+f0rQ
 yzNfvMQk+WkMpMcggWu+bZgvUc93ZRA8mnjD25lx5ID0BPg0N/NU70c+FJm82LG+ASIT
 dRPFez9EL6PD2CtuZBg3kKWnawk0vZ06ibtfauS6Zf4VQbW48cHaP3W/ktW4ujUz3vwi
 yUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726096548; x=1726701348;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xRiFsrXZxD+0mMxKY7ViZO6RkCZKUT9FknTYEl1MhrE=;
 b=omKtRxYpvoWuTJ7w6Z6dj14DBlkva23K5e0/vup2BiG34ig179wRMqhw9Uf1vxzJK3
 04kJ8eV3YHuGkUJrsVBK1pO18LQ2Q74kjuhOf/IFO61mhom/HMfPPStDHPhDGUEDunEY
 y/FrKoSp8a2J2DuBlkG84T9UOwjIm6KMRA8+HkFPb5JAMMhcBr8qhBMJGFmhwgoKauLy
 OpARrboBdkz0z7Z/i7AZyinDVgYeSHp/HIZfRlcWrhWtXQM2RrpEQ10nF3ca6cO4qs/N
 Uap2dpoEFM+1sPyg5kdNXfTEyv2fx/5YUbeZawyCZi/LXSMZ9AKRTyvGur+f7U31Q0oR
 0j+Q==
X-Gm-Message-State: AOJu0YwxUkCufVEFF8HLLyLV64D9lwtbv1mOjZau36WwdVZPFK0554Zz
 xs8dn6weBwOJq43wX9RSReEFamXoAtM1d96kFLO4y3FTbA6JSEeRn9vFmES8Inc=
X-Google-Smtp-Source: AGHT+IFkDqJrmFSDD8wFDxELqvOgnb4mG5PAgEEu9GEsShGpnyYsJQaO0joSya7JrddxFfHwmbEoQA==
X-Received: by 2002:a17:903:2a8e:b0:1fb:3e8c:95a6 with SMTP id
 d9443c01a7336-2076e3f86ffmr11614655ad.40.1726096548011; 
 Wed, 11 Sep 2024 16:15:48 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076af2580esm4429985ad.53.2024.09.11.16.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 16:15:47 -0700 (PDT)
Message-ID: <e49559d3-30fa-4014-8cbe-467d566b8926@linaro.org>
Date: Wed, 11 Sep 2024 16:15:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] tcg/riscv: Implement vector shi/s/v ops
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20240911132630.461-1-zhiwei_liu@linux.alibaba.com>
 <20240911132630.461-11-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240911132630.461-11-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/11/24 06:26, LIU Zhiwei wrote:
> From: TANG Tiancheng<tangtiancheng.ttc@alibaba-inc.com>
> 
> Signed-off-by: TANG Tiancheng<tangtiancheng.ttc@alibaba-inc.com>
> Reviewed-by: Liu Zhiwei<zhiwei_liu@linux.alibaba.com>
> ---
>   tcg/riscv/tcg-target-con-set.h |  1 +
>   tcg/riscv/tcg-target.c.inc     | 76 ++++++++++++++++++++++++++++++++++
>   tcg/riscv/tcg-target.h         |  6 +--
>   3 files changed, 80 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

