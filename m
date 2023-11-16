Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83268C47071
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 07:49:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3X6H-0004us-7N; Thu, 16 Nov 2023 02:47:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3X6G-0004if-AJ
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 02:47:44 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3X6D-00069X-HT
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 02:47:42 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32fb190bf9bso989627f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 15 Nov 2023 23:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700120860; x=1700725660; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pP9C6CAEhsb2VDOmiwTJFPhrS9ReU4NCF7T8xtnl+rM=;
 b=zuQF416nUGSyhr4YYbmZomzK3/PHy/4sSuBOZs4imgw+2z1VG50uxutBvJxTZDNVsJ
 Jjlp9/3yQTREUXA54jLN/MubYlWZM4sdyHhu5WkJhS9TRIIyikz6baiiLH2GZ/B74wn6
 8ryMWQwA3y2fWBNXZTXBlBcGp/C0f2e/R8+KZr9sNGQ0gNqpnJZzwg6XqPd+4OnOyzlJ
 Fd6cVWRY7/6+j8gTXRlGXsLeOySzgMs6mNG37IKAF9WQkWwYDcf98+tJ3+TQ1NEcnlyS
 x/hcH1aq9TeXXdeRPf/+8nihI9Fqf6nvngws6t4FPATDpvj9sGlPHGt35eMAxLQiogQ1
 M8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700120860; x=1700725660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pP9C6CAEhsb2VDOmiwTJFPhrS9ReU4NCF7T8xtnl+rM=;
 b=Bz3qoBhFE2ZyM8ArwZaOTHCqSDUJDXzLXj1elLXFbcE/vwpjnIbLGyDPVkxzQdAVR5
 upQAIZgtZE9KfKtxBBeZ89aYgVBp8N6peoIXLoC4u4kMTeqg32vNSPCtv/iNvNtTT1Y2
 ZdEIsh5tX/e7irYOm3lOLfWktYZmyoX/Po8UMFe3M9PQwlXQcSh7VUw1+09RmvAhsWzR
 8gnjV+BPQISkwBev6JDmVdVoz4ApmGnaT0yOSq8Odzx5EM849avtVkCIWAVKATIeIHZB
 9tn2VGhJW8KwSStlfCMFwoEQV3o5H1QkvKKvWgaGOUMm107dRbkAEllXnN148KFwZuqa
 6W4Q==
X-Gm-Message-State: AOJu0YySnGgOkaPfg9tWx6R86VWGh4IyuKprUh0aLra3fSXRQL6DddsZ
 BQTjZmm1cQyYUQiO4loNbFXuCQ==
X-Google-Smtp-Source: AGHT+IFSa43xZ074JfYRKGNh6opIu8U3HZiFjXmcPAqJtNZ1/1ZYVT7vTtjcBqhz20n7mQNrv+oAIA==
X-Received: by 2002:adf:e7c9:0:b0:32d:d2aa:ed21 with SMTP id
 e9-20020adfe7c9000000b0032dd2aaed21mr553308wrn.28.1700120859949; 
 Wed, 15 Nov 2023 23:47:39 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 i1-20020adffc01000000b0032f7f4089b7sm12727292wrr.43.2023.11.15.23.47.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 23:47:39 -0800 (PST)
Message-ID: <caf79fbb-ad9e-44bc-9095-b241c63ca61f@linaro.org>
Date: Thu, 16 Nov 2023 08:47:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/31] target/alpha: Use generic cpu_list()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-8-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-8-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

On 15/11/23 00:56, Gavin Shan wrote:
> Before it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-alpha -cpu ?
> Available CPUs:
>    ev4-alpha-cpu
>    ev5-alpha-cpu
>    ev56-alpha-cpu
>    ev6-alpha-cpu
>    ev67-alpha-cpu
>    ev68-alpha-cpu
>    pca56-alpha-cpu
> 
> After it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-alpha -cpu ?
> Available CPUs:
>    ev4
>    ev5
>    ev56
>    ev6
>    ev67
>    ev68
>    pca56
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/alpha/cpu.c | 17 -----------------
>   target/alpha/cpu.h |  3 ---
>   2 files changed, 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


