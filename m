Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96708C47071
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 07:52:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3XAx-0003OO-Dg; Thu, 16 Nov 2023 02:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XAv-0003Hn-UC
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 02:52:34 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XAt-000166-UW
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 02:52:33 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32db188e254so347164f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 15 Nov 2023 23:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700121150; x=1700725950; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RWuu26MSVGnxWPCs7sTkKg1s6DMwMXLKcNAVvmmemuA=;
 b=C1Rjbf77dHn7VDnPNdzsFTRzcBf/JArl6VQAS0fK08lZ16csccE8LMi57ZppmHtj6j
 8WjZL1uO3Cb5ZDueBvVg5Yvhxm06vzRgLdg39fnmOC2+Sn1aP3XvVlUnQflHhBESry9E
 xaIUuLwoJpTzME9GroNNdaIshAnOnT3KV34RrrYJd8qsBC0GLwS/N2+LX13Cdsk9k3Gn
 H4KVjxsXy0Gh55Nu39jlbHGbggSCKfycE93pEXV3mEteFhYLZFSVoN15vUdk9MfVtK1j
 zxdPz//uqXtITrruWMrPQOul8DU5jX3/b7/rq3J9BPJECRhgCjzcnVTosSTgoctsgN7g
 saUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700121150; x=1700725950;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RWuu26MSVGnxWPCs7sTkKg1s6DMwMXLKcNAVvmmemuA=;
 b=BeWwOe4CD3cjKyWu37Sz43n1kc+hhNnhArcKKeHw8oxssn2gYW1b1PPJ6QchUBoRV9
 rOrm8omnqMCVkvhRvpGyAXb27TQLNTEvbLK4fJtisWHdjmkirDvLH2pKOjw3sWXMYjoP
 eWvjfpmqq86ezu/elEFhwzzVUjbp/t1ceOu4ZR7Ct3f16fiqITH15h3xpYrXmt5utYlW
 wRMPX7CxQWTJ3Lrew203T1h0L3R+AglcqfSxqVeWtCPZVSB0cybrZTSH9LVXPztoNIy8
 mx5gFF1aTc/cjUfRAE7uoyDH6PKwLBaG9nilibaOnsvqSJ0/2uPN73FB127kWIyudDTr
 XL6Q==
X-Gm-Message-State: AOJu0YxkYHMDVllKNlKUFbKE5tJc3UvKy85huDsm5aJgURWdNe5FOkC4
 d/dcPIsmv+ffATRxp4zQ7BasSg==
X-Google-Smtp-Source: AGHT+IFUA+xqyZQcJV/cmZGtjOamkdJGdlBtHGcfaRM+ALmFAnmEsEs+zIKN9UCep9Gs4sRWm17eVw==
X-Received: by 2002:a5d:59a6:0:b0:32d:b2e0:ed76 with SMTP id
 p6-20020a5d59a6000000b0032db2e0ed76mr13720275wrr.49.1700121150443; 
 Wed, 15 Nov 2023 23:52:30 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a056000024400b0032fb0e2087asm12582889wrz.82.2023.11.15.23.52.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 23:52:30 -0800 (PST)
Message-ID: <2aa0fcb3-8118-4eb9-8f8c-a9a56b9f732b@linaro.org>
Date: Thu, 16 Nov 2023 08:52:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/31] target/cris: Use generic cpu_list()
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
 <20231114235628.534334-11-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-11-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 15/11/23 00:56, Gavin Shan wrote:
> Before it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-cris -cpu ?
> Available CPUs:
>    crisv8
>    crisv9
>    crisv10
>    crisv11
>    crisv17
>    crisv32
> 
> After it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-cris -cpu ?
> Available CPUs:
>    crisv10
>    crisv11
>    crisv17
>    crisv32
>    crisv8
>    crisv9
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/cris/cpu.c | 38 --------------------------------------
>   target/cris/cpu.h |  3 ---
>   2 files changed, 41 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


