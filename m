Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD49CE7A81
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 09:09:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkhaL-000089-9k; Mon, 25 Sep 2023 05:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkhaH-00007m-UI
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 05:08:55 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkhaE-0003l8-14
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 05:08:52 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-692b2bdfce9so3713980b3a.3
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 02:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695632928; x=1696237728; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1/SwGyCSvN76EolJiFlZuR+WwGm96y/58SlZGqEmW9k=;
 b=m6k/9thSBT04hGlwYjiRE59ginkT2p5VZwyixrEF+yIiWc42k4KD7B3nKHcnJyFQJx
 AIh5NgkLnNRQl6w+m0zWwkWZ1/HTXRgjfNpjDlA+6IwebfqJQ10izthDe9ve3bzWIQOV
 Ns4BxRI89QvR3i4AVD6Zsgiq8kP9/wDsjTMMmkUnSjKV4RRc9PNl5U/xkrokPHm7/sND
 H3r/XjPV1SNRRx4Z1MUeb7/A5GQAM7YvBs8/WdfcbeIpkZBVYufZRWhw/lO4+mLNPOXB
 tCYFf+lTsNilApSTxI4J31HmnWCro9Du+T2pTGYDbDarJmqKMUwaWHEucACbAQvOIRm/
 sGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695632928; x=1696237728;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1/SwGyCSvN76EolJiFlZuR+WwGm96y/58SlZGqEmW9k=;
 b=t1f4pFlPMpfW5kBNtyXuPf6msIguljRPtpYjTkTCzjTn40qgSLRghGO4qtLl4vEJho
 vb4vjve/FUTf3pg6h68QKQoC0L+iin6akruKEVCEFH9i+thiu+A2uyieaWhYH29xXgOY
 GVac2PpyXOgStL5laMMYBzmHwfYzsLOQdcbJGNvZrbjh8g77C77i/PAslHYlUX4yQ4Ri
 h9zxa07kPhdPaMZfwqvfnXX2AgFnv6XYNYZJhQK4yGGUECIjjUsx0Qu5V/D+pGGjtEXR
 Z1zKYQkDqClv5XNIVyiooeTS3To7bnM9to+A5MmaYNWH11Btpi71TP2CDc8qy3SCQxVX
 Ww0w==
X-Gm-Message-State: AOJu0YyMDqcWzrh+k00RkemFF9uK8NZU9SxJYNgf2EuoymyhjU0uLyaf
 RdCq/v7E8FuAkHuHq9fzFwMiBw==
X-Google-Smtp-Source: AGHT+IGrWHten8FonWYEP0qpHu60hSnYmIiZsfzA/cycRwnWHLJElsFdqqrG8nrI871s94if8kTjeQ==
X-Received: by 2002:a05:6a00:1a8d:b0:691:320:b551 with SMTP id
 e13-20020a056a001a8d00b006910320b551mr7902122pfv.34.1695632928085; 
 Mon, 25 Sep 2023 02:08:48 -0700 (PDT)
Received: from [192.168.68.107] ([177.94.42.59])
 by smtp.gmail.com with ESMTPSA id
 fn1-20020a056a002fc100b00692e9bf82fcsm1524743pfb.182.2023.09.25.02.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 02:08:47 -0700 (PDT)
Message-ID: <2a3168e9-813f-75fb-51e1-4202042923bf@ventanamicro.com>
Date: Mon, 25 Sep 2023 06:08:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/4] hw/riscv: opentitan: Fixup local variables shadowing
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>, david@gibson.dropbear.id.au,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: bmeng.cn@gmail.com, alistair.francis@wdc.com,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, palmer@dabbelt.com,
 liweiwei@iscas.ac.cn, Bin Meng <bin.meng@windriver.com>
References: <20230925043023.71448-1-alistair.francis@wdc.com>
 <20230925043023.71448-2-alistair.francis@wdc.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230925043023.71448-2-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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



On 9/25/23 01:30, Alistair Francis wrote:
> Local variables shadowing other local variables or parameters make the
> code needlessly hard to understand.  Bugs love to hide in such code.
> Evidence: "[PATCH v3 1/7] migration/rdma: Fix save_page method to fail
> on polling error".
> 
> This patch removes the local variable shadowing. Tested by adding:
> 
>      --extra-cflags='-Wshadow=local -Wno-error=shadow=local -Wno-error=shadow=compatible-local'
> 
> To configure
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/opentitan.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 6a2fcc4ade..436503f1ba 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -227,7 +227,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>                                              IRQ_M_TIMER));
>   
>       /* SPI-Hosts */
> -    for (int i = 0; i < OPENTITAN_NUM_SPI_HOSTS; ++i) {
> +    for (i = 0; i < OPENTITAN_NUM_SPI_HOSTS; ++i) {
>           dev = DEVICE(&(s->spi_host[i]));
>           if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi_host[i]), errp)) {
>               return;

