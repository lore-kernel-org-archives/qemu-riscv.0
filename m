Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F73C197A0
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 20:46:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5B9k-00007n-MD; Mon, 20 Nov 2023 15:46:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1r5AAm-0002hd-GW
 for qemu-riscv@nongnu.org; Mon, 20 Nov 2023 14:43:08 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1r5AAk-0002q8-NY
 for qemu-riscv@nongnu.org; Mon, 20 Nov 2023 14:43:08 -0500
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-507bd19eac8so6199302e87.0
 for <qemu-riscv@nongnu.org>; Mon, 20 Nov 2023 11:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700509384; x=1701114184; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=bHJWYgO21Fl5OFrQpFr8Mpr/ZcYte6sL6+pCQxc4KRw=;
 b=gc7FV84jcDy0JVOoCYOaLqN4wmZlXboltwkAhpyhSF6if9aPa6Up8e7XPLG7yCy4C0
 Ir1UqPRy+IZTeMTh47oycRcxj7GonAyrI3kaeP8yK8KgLHjwDS9iNYOrVO9BcFasPIQE
 syeIA3t5AV3bQXll4AtxnOjsFkm+KKFToHIuM0YEazBof9QkTCnfsqo/zdYMPs83BvpK
 dm3OSZwDrffRHJbgLMepeOwPlbMWriOg7sEyzCT78ejuMtvpx6Bsw1HKjXWHHYkqP/7t
 np/JXvlVxbogDjne43gRjfw2aJ9QUdnQd1EgkrkJkoo3UNjMq8dUetQ3lJuuQoox7a45
 BJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700509384; x=1701114184;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bHJWYgO21Fl5OFrQpFr8Mpr/ZcYte6sL6+pCQxc4KRw=;
 b=p2fVttoDzdHYJPEs1tHSTgnfWW46n5L5xqSRD0y0Dwc9yM6lHHWfzmA0p8nq2t5mEf
 GbIgn4nZBjrbz0WckzPWID6UpNmCfn8buE3GLHJdeKSlQEiEHYwP5H/UhzPEXhRljF3W
 TomE05bRbMUG72JvkCWl6m6sDbxHSubDbjwZ4sdYjRbl3ZTj8UNFWnP2jwF/6+F9vDw5
 bbrMVl3g/egkDxXenPkfmWIf+YwyA9AHlgy5NipRl+1RczFm9wBUrUmctQKbgknYsB/m
 jF17mw9eYBrcMptfNnB7rReUJ4Vat8mnm/EvftSKhD7Mo0JxooHhyk2CZwbRvZ023YgH
 i98g==
X-Gm-Message-State: AOJu0YwfcBUBiODXvm7LDRzy3ekUIBDCwAqP6BuuV9Be9yl5j36iVSDy
 rSpPwdbwEfzfdsdiygs0nxv2Xg==
X-Google-Smtp-Source: AGHT+IHc5PPaXyBmdHdZdApgogoKgqsBefx5Ta7PyPpN6kMlvl9BUDIbjjRLMic1DrMzyhckOuppbQ==
X-Received: by 2002:ac2:5486:0:b0:505:6c99:bd7c with SMTP id
 t6-20020ac25486000000b005056c99bd7cmr5839767lfk.57.1700509383932; 
 Mon, 20 Nov 2023 11:43:03 -0800 (PST)
Received: from [192.168.200.206] (83.11.8.194.ipv4.supernova.orange.pl.
 [83.11.8.194]) by smtp.gmail.com with ESMTPSA id
 j19-20020aa7ca53000000b005488ae52752sm2275111edt.18.2023.11.20.11.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 11:43:02 -0800 (PST)
Message-ID: <8a386258-1a5b-4c69-972e-49f9d1e59f51@linaro.org>
Date: Mon, 20 Nov 2023 20:42:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/8] Unified CPU type check
Content-Language: pl-PL, en-GB, en-HK
To: Gavin Shan <gshan@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231120002724.986326-1-gshan@redhat.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20231120002724.986326-1-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Nov 2023 15:46:07 -0500
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

W dniu 20.11.2023 o 01:27, Gavin Shan pisze:
> Testing
> =======
> 
> With the following command lines, the output messages are varied before
> and after the series is applied.
> 
>    ./build/qemu-system-aarch64            \
>    -accel tcg -machine virt,gic-version=3 \
>    -cpu cortex-a8 -smp maxcpus=2,cpus=1
> 
> Before the series is applied:
> 
>    qemu-system-aarch64: mach-virt: CPU type cortex-a8-arm-cpu not supported
> 
> After the series is applied:
> 
>    qemu-system-aarch64: Invalid CPU type: cortex-a8-arm-cpu
>    The valid models are: cortex-a7, cortex-a15, cortex-a35, cortex-a55,
>                          cortex-a72, cortex-a76, a64fx, neoverse-n1,
>                          neoverse-v1, cortex-a53, cortex-a57, max


$ ./build/qemu-system-aarch64 -M sbsa-ref -cpu cortex-a53
qemu-system-aarch64: Invalid CPU type: cortex-a53
The valid types are: cortex-a57, cortex-a72, neoverse-n1, neoverse-v1, 
neoverse-n2, max

$ ./build/qemu-system-aarch64 -M sbsa-ref -cpu sa1100
Unexpected error in object_property_find_err() at ../qom/object.c:1329:
qemu-system-aarch64: Property 'sa1100-arm-cpu.secure-memory' not found
Aborted (core dumped)


Similar with 'host' or 'pxa250' while QEMU/master does:

$ qemu-system-aarch64 -M sbsa-ref -cpu sa1100
qemu-system-aarch64: sbsa-ref: CPU type sa1100-arm-cpu not supported

