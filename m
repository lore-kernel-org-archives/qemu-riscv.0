Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3639C5B543
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 07:35:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uOtVA-0000ze-Np; Tue, 10 Jun 2025 03:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uOtV9-0000zI-2m
 for qemu-riscv@nongnu.org; Tue, 10 Jun 2025 03:34:31 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uOtV7-0003G7-6X
 for qemu-riscv@nongnu.org; Tue, 10 Jun 2025 03:34:30 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so1931835f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 10 Jun 2025 00:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749540867; x=1750145667; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kAe2KhF1gPzIHfnQv0JLbg+NNMmazzLcusGORwmMghc=;
 b=hxb9XemjMc6vgndFM+UoINkSd+xH34HvQmjtpluHgzCOcHY6dq6Glocm30QScRSMyX
 idi9A/ct3rYesIKr/qaDZbahglJKk0QKrx3gvV/qXWkh7M64BlQoJFBdrji1AhVu9Yq3
 sFoAVt0uGtuhTytwZ1kyo4OnUDeP9EMvVQj6rpdCe/iWUBEVJ3+jb/UWGm4E0Ke8vEbw
 Cn/2r3JvqczRK3j0ddKdnYOMgKouJQokwoQ/skJ2W1qnaU5D+Z9N3ezvPD7suOYkG+YE
 MoJbM0Wgb3nSOwqQJAqGBLP2WMdlDOFslljLdaDVM0FVcnOLkkIOYm19Z+ek7DnJPG1e
 W6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749540867; x=1750145667;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kAe2KhF1gPzIHfnQv0JLbg+NNMmazzLcusGORwmMghc=;
 b=vwBpbxgqTu9wKVr18F+PVayPhRVJaVUhZ5rzj/SwJHlzd+AJ7763tFWYvql/f5zZ1P
 516IDpyEY4XS1hqb0Qt1lj7q449Jl3uxy07ICY+gzXgj9RVzBfywaF6VMOU+dzcwa29j
 G7UG3qVh22+HUAsJFsC1iHq2rfBx5riJYk5ytLLzsVchUsT0f2tQqKJu+b/t+IdVr8ps
 dFd44254ptVmZDElybKsHqXkXtDiHaCuCfM1XxuCVRsZhjS3ppkuYuFcnEZQ4qNPUUd3
 pSHdYCZMCn9Xv9vXoueqbFV5Ah3p+QMql0s+fq7AKloU3gYB27H+4bFRGZymKooQv25Z
 7XcQ==
X-Gm-Message-State: AOJu0YzWyLI9IoB6zyVgAsWsqzRtbwH1IZCXcKyWpLGgQJT7uMOs0JQO
 DTZ3liPg7iDbs4+eVKS4HiXZRdW7Vfl5jiMI0/VVVHJpVEmXirs7SwCYnSi+GdBNh0AAdXjDo/2
 8/O4c1Wo=
X-Gm-Gg: ASbGncvH2EGp9sEgh4focwkxqKfY30vX840qHQkAVjs9QpA/d0ENEVrbSBQ12v8VyS0
 3dZjo14N9A6ig1GnSk1GRDwsQQaL4c86vXZDoMyzcOnvu9w4Pf4GH1kVELS4TcWIjaVUFIFqQd/
 S+MiRRWVtYfrZ2XpvsBFteoiC4kVp8mg8fhbNcZAUTFRVwjF3DQ0IMEFj1yHJsO/pFNuBkhWGpW
 ij5MVoav1k7LDmVQts+wML35LeeR1b8w4an3gy+NcA8MgUk9KrbJJlJEIqjEHcz+w2+JwtDa+Xi
 uSkX1tcBTphQMtSyFuiH0pCrOhdaZA9uSsheGBgcn/E48uGrtUR9sljZs9EHwt1b9lposKgMvbm
 Nx66BTUSOdOwxhN7D1DA5BPrFvW3D83Zd8Jc=
X-Google-Smtp-Source: AGHT+IFN0Wn1IiTW8yMmOmxQlK5i0E8SRsAl+K77couTWwuqCqkky0mkxw0Oj+ZrApVf4KIADtsAjQ==
X-Received: by 2002:a05:6000:40dc:b0:3a4:e5bc:9892 with SMTP id
 ffacd0b85a97d-3a531cac62bmr12634916f8f.21.1749540866729; 
 Tue, 10 Jun 2025 00:34:26 -0700 (PDT)
Received: from [192.168.69.138] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5324638e9sm11338840f8f.89.2025.06.10.00.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 00:34:26 -0700 (PDT)
Message-ID: <2b5cd757-5440-43d5-9415-6f2ccb5f2ea6@linaro.org>
Date: Tue, 10 Jun 2025 09:34:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] hw/intc: Allow gaps in hartids for aclint and aplic
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cfu@mips.com" <cfu@mips.com>
References: <20250602131226.1137281-1-djordje.todorovic@htecgroup.com>
 <20250602131226.1137281-2-djordje.todorovic@htecgroup.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250602131226.1137281-2-djordje.todorovic@htecgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

Hi,

On 2/6/25 15:12, Djordje Todorovic wrote:
> This is needed for riscv based CPUs by MIPS.

This justification is not really convincing.

> 
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> ---
>   hw/intc/riscv_aclint.c | 33 +++++++++++++++++++++++++++++++--
>   hw/intc/riscv_aplic.c  | 10 +++++++---
>   2 files changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index b0139f03f5..5bda02a179 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -131,6 +131,9 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
>           size_t hartid = mtimer->hartid_base +
>                           ((addr - mtimer->timecmp_base) >> 3);
>           CPUState *cpu = cpu_by_arch_id(hartid);
> +        if (cpu == NULL) {
> +            return 0;

It looks like some misconfiguration. How do you reach that?
Otherwise please log as GUEST_ERROR.

> +        }
>           CPURISCVState *env = cpu ? cpu_env(cpu) : NULL;
>           if (!env) {
>               qemu_log_mask(LOG_GUEST_ERROR,
> @@ -174,6 +177,9 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
>           size_t hartid = mtimer->hartid_base +
>                           ((addr - mtimer->timecmp_base) >> 3);
>           CPUState *cpu = cpu_by_arch_id(hartid);
> +        if (cpu == NULL) {

If so, please log:

             qemu_log_mask(LOG_GUEST_ERROR,
                           "aclint-mtimer: invalid hartid: %zu", hartid);

> +            return;
> +        }
>           CPURISCVState *env = cpu ? cpu_env(cpu) : NULL;

Then env is valid, so this line needs update.

