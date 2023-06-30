Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F074EB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 09:53:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFAoh-0006CN-Ba; Fri, 30 Jun 2023 05:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qFAof-0006C0-2t
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 05:53:25 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qFAod-00031K-F5
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 05:53:24 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f96d680399so2766132e87.0
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 02:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688118801; x=1690710801;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ciXx/obEGczeDCUtZozDj2KptWgGW6aCzwQpIySY3EE=;
 b=fTqF196p3h3WOu0bvX50TA391Qkll+s5MYdkP9sJfedDovSmbkdsg+DpjonGjQRPB0
 lTbgN+4iWPkJueLG7qdT/IexjP5AcDM9QHeRApIe6pAjjWLPumvPBXeCYwBwmJpnKvaW
 eRj4dzu4sSw7x0fmkcnTMI0gB77LdkKQgQ5AAKxJFg/V2DAFgfkjjvjENhBXp57/wCMJ
 rJ39xEztqpeK5Q/APb2HR3vnf7WRi+j4BZnGWYoCwOZ2j5pFdR9odG/Ex/jPkpYdtFZK
 VyJ1wDmMLpO1cBNDvKdFqh1+sUsYRQZmXoDVODS32gw5OUYobRTIRlIaG9VbnMNKVFCn
 Ru9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688118801; x=1690710801;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ciXx/obEGczeDCUtZozDj2KptWgGW6aCzwQpIySY3EE=;
 b=WDR6niuJtXHeb54NcI3NndyTqzoZ74V5l8kuxBzhAsZcTvT105C6JOfAw+AAmgqbBw
 aqMj/7wa0H6j02bd5xOfV1DGiWvV0uHAyqhoDdDAaJBTVDvhGuobGTJXCqaIefZJmWVT
 1uDhEmM9bzUrOpCaKQJe+/DW/dgEzXz0EGB/wMEXGfK3BkaGbZCDQ5h0rCHV096UuQz7
 Rb6jHZaFiJPJhaFoXsgvAcnS+kRBItdMCCUjpMVQUqpjJQWqZMQq3VJrL0FdkyejEyIS
 TgQ7jsGei9zCFTDbF7StnGUE/zng+CXGKeXcPUa7/yuD+BEreNLiXGZXCqxtf0MJWaor
 P8Iw==
X-Gm-Message-State: ABy/qLaMOBFUSyzUtvoNKE/wif1csP7KDDZLWFi5HKIwBS1svCFUGGVt
 byoaz9YmikmZtubaqI3xmaWLug==
X-Google-Smtp-Source: APBJJlEVj9IDlVUcjUd/4lc1SJZk2EYlF6dvy/VJvgB8oOtyd4XJldlfVD6pnOSRmUIyOvFBsx6hGw==
X-Received: by 2002:a05:6512:3c90:b0:4f8:58d3:b7ab with SMTP id
 h16-20020a0565123c9000b004f858d3b7abmr2651273lfv.4.1688118801449; 
 Fri, 30 Jun 2023 02:53:21 -0700 (PDT)
Received: from [192.168.1.208] ([139.47.41.96])
 by smtp.gmail.com with ESMTPSA id
 s2-20020adff802000000b00313de682eb3sm17864367wrp.65.2023.06.30.02.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jun 2023 02:53:21 -0700 (PDT)
Message-ID: <1c8f3c84-60ba-abd8-f1c0-2bb85ed47399@linaro.org>
Date: Fri, 30 Jun 2023 11:53:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/3] riscv: Add support for the Zfa extension
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jeff Law <jeffreyalaw@gmail.com>, Tsukasa OI <research_trasio@irq.a4lg.com>,
 liweiwei@iscas.ac.cn, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Rob Bradford <rbradford@rivosinc.com>
References: <20230630091303.1676486-1-christoph.muellner@vrull.eu>
 <20230630091303.1676486-2-christoph.muellner@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230630091303.1676486-2-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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

On 6/30/23 11:13, Christoph Muellner wrote:
> +static bool trans_fli_h(DisasContext *ctx, arg_fli_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_ZFH(ctx);
> +
> +    /* Values below are NaN-boxed to avoid a gen_nanbox_h(). */
> +    const uint64_t fli_h_table[] = {

static const.


r~

