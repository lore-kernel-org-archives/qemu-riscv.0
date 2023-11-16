Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA24EC47071
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 07:56:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3XEA-0000Tc-MF; Thu, 16 Nov 2023 02:55:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XEA-0000Sn-6B
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 02:55:54 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XE8-0001rV-Dn
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 02:55:53 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32dc9ff4a8fso322285f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 15 Nov 2023 23:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700121351; x=1700726151; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cFoTgEeWXc18tohVHeA/OEwWs5XNYjB1PoQdidTWc7Y=;
 b=GY49NM9v2BM5Km+Le0E8ktCtkKOnEzq61tcUx6+wcLPjxH9cijmmfRPlO678MxxFlh
 LZGQx3a17yrurBbanAqoj+IPoNghCIWgd6qLSubv5Ehc6eE3UayH8bboIJrSBSVF7vyM
 2Tp6A1RaNlHK3TmbmKOMkdAQta9KNKSe3VEE+Mj1y5VDuwnrr3vWoLJAcUbCyvL0c79E
 oCD4TpmsXGoTEHQSn4l06ynimC3f87wi3CLXXpP1iDBc+UT/XdCwPXiDGtdp183JG/K6
 3lW6NUHwG9fPbFOAzxk8xtsnXOLFofmPUq9P9RRSn2gRQ62FFpVC9/uqHO2j5CoBtE5n
 MFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700121351; x=1700726151;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cFoTgEeWXc18tohVHeA/OEwWs5XNYjB1PoQdidTWc7Y=;
 b=dCqc0ZCF24knfJekmLejqGBM59mX9nStiQmFl3e39MJn/KeI+0Z4AcBIauajIzaGBg
 2Yqo09kO1uDy0N5u3EuWBhoszyOlDNHuwpvinTWTuGi/k8HAkPw7oy3njKjMg1EIPiJd
 ucVuuiQLBiKg8iGetiuMn62dy2Dqvbj3nSa/d94wn163ljlnOprJ9uSusCRSP/i0MNOg
 +2cvMqnlS7BZitVWgiZxRBQhSoqP6pmvKwAX7MSnAMpCyeH3JepjoU+bbqojsPqpliGi
 wNBA+bJG7UkhayEFil0qs6JO3itLrktmJmJYJTd6bA+u5lqHTXWmtXauHApMFNKSPkhL
 zoLA==
X-Gm-Message-State: AOJu0YzXiaxMKzUKhCag8RvW7jIS24Q1pd0SeGmUEtleDUNsIULy6rWA
 m7sFe6V89ldh0VPeRwSTMa29+g==
X-Google-Smtp-Source: AGHT+IEN78Kp1KLfBlalIHd5VkVKqIpM8OBbRuWid6oyF1l0R00CJT1U6uTgLGNVcLp6s+6kOtCItQ==
X-Received: by 2002:adf:ee41:0:b0:32f:aaff:96dd with SMTP id
 w1-20020adfee41000000b0032faaff96ddmr10435764wro.4.1700121351078; 
 Wed, 15 Nov 2023 23:55:51 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a056000024400b0032fb0e2087asm12582889wrz.82.2023.11.15.23.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 23:55:50 -0800 (PST)
Message-ID: <a70806d2-9188-4d67-9f3e-8535458b6506@linaro.org>
Date: Thu, 16 Nov 2023 08:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 20/31] target/tricore: Use generic cpu_list()
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
 <20231114235628.534334-21-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-21-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
> No changes in the output from the following command.
> 
> [gshan@gshan q]$ ./build/qemu-system-tricore -cpu ?
> Available CPUs:
>    tc1796
>    tc1797
>    tc27x
>    tc37x
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/tricore/cpu.h    |  4 ----
>   target/tricore/helper.c | 22 ----------------------
>   2 files changed, 26 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


