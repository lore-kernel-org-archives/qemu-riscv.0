Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38706C4167B
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 09:31:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r7uQz-0003jb-Ht; Tue, 28 Nov 2023 04:31:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r7uQx-0003j3-7A
 for qemu-riscv@nongnu.org; Tue, 28 Nov 2023 04:31:11 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r7uQv-000118-JM
 for qemu-riscv@nongnu.org; Tue, 28 Nov 2023 04:31:10 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-54b532b261bso2880003a12.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Nov 2023 01:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701163868; x=1701768668; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Svy5cZsWqt/aCpwc6dh9SFoxobLMcvkgoTmp1ZdyvkI=;
 b=GMoXx9lltWlWsxHrduxLSvRh4i6BsvttqcwU9eiLnS1aS3xid6jlXyJMd/tODoyzku
 fkVAeXRhudyxmj+vmaga4WvTR7Q73+QLV5S1zxd/o4v3KE735SAhHTmXy+zEbsmN8CZ+
 DGz+74EJhLsLZGj5jnsmDW7Ic5kEm/YuHeB/ITZlaFdoCD4RNf9HRlHdIwVwFcS6QLuz
 oWAWZ+fClS2cOOUHtmTrdl+DbRBOkqlh8A5gxMDLzBun/X5k2UXD1/YHL4GDNrt3M/Rd
 EjBztR3YElupb9I7cXLevQgCvJ5JhZS7dyl03+eDoeoXmyFQiQFmWbld65Y9DBFsPWsb
 CuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701163868; x=1701768668;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Svy5cZsWqt/aCpwc6dh9SFoxobLMcvkgoTmp1ZdyvkI=;
 b=Vwp4SiwzNYaey/ANuQp1OUCHocE8c1ph1BVghZvjhEeZKJVHxJYzE9X8sCTABn4PYH
 7zTCfWtVGniHENmOIHnkTd7SIl5+6cCe6i2cDglhliBRHwzK78BUCYe7tYZaVWkULKST
 lhRMofV6jVf6kDNwS3hn6BjohWUZVgoMQIszPdNyF58vvnRzW08u8s18gH0q/iwGcZl+
 rDCrrolCeqFKsYZYHv4mAgJooeJG0EStjc/9T6AouqMPIVB2cWiIfthfvtCL/vnfiAma
 p9CmDS3LEro3EGKW7moyKlQjqga3+bJ0A228AnKQU23UE1/V2In0ehGzfBRGU2SkS4x8
 c3LQ==
X-Gm-Message-State: AOJu0YxJBNqmvrbcc5sm4nV9dedi8FMq4tTCwXz8KV4iUSsEOtW8GKzV
 /C0jnFBI3NGcvnSZx7w84FhL+g==
X-Google-Smtp-Source: AGHT+IFqUsDF+RVlE2BX6Askw8qiiNL1dI9AH+T0oIUMAtfpQmZf7W3jypqkw/ODV/G7VCXK3skYJg==
X-Received: by 2002:a17:906:6c9a:b0:a11:d39e:8c6f with SMTP id
 s26-20020a1709066c9a00b00a11d39e8c6fmr2754961ejr.54.1701163868206; 
 Tue, 28 Nov 2023 01:31:08 -0800 (PST)
Received: from [192.168.69.100] (crb44-h02-176-184-13-61.dsl.sta.abo.bbox.fr.
 [176.184.13.61]) by smtp.gmail.com with ESMTPSA id
 bw24-20020a170906c1d800b009fc24437439sm6580993ejb.158.2023.11.28.01.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 01:31:07 -0800 (PST)
Message-ID: <44b6f4f2-0d30-45bd-8ee4-b481aa1b2943@linaro.org>
Date: Tue, 28 Nov 2023 10:31:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] hw/arm: Check CPU type in machine_run_board_init()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, richard.henderson@linaro.org,
 quic_llindhol@quicinc.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231126231210.112820-1-gshan@redhat.com>
 <20231126231210.112820-8-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231126231210.112820-8-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
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

On 27/11/23 00:12, Gavin Shan wrote:
> Set mc->valid_cpu_types so that the user specified CPU type can
> be validated in machine_run_board_init(). We needn't to do it by
> ourselves.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/arm/bananapi_m2u.c   | 12 ++++++------
>   hw/arm/cubieboard.c     | 12 ++++++------
>   hw/arm/mps2-tz.c        | 26 ++++++++++++++++++++------
>   hw/arm/mps2.c           | 26 ++++++++++++++++++++------
>   hw/arm/msf2-som.c       | 12 ++++++------
>   hw/arm/musca.c          | 12 +++++-------
>   hw/arm/npcm7xx_boards.c | 12 +++++-------
>   hw/arm/orangepi.c       | 12 ++++++------
>   8 files changed, 74 insertions(+), 50 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


