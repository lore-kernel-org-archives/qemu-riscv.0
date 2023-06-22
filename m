Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C07EB64DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 18:46:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCPJj-0000zG-D5; Thu, 22 Jun 2023 14:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCPJa-0000yK-Ns
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 14:45:56 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCPJV-0001GT-2k
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 14:45:51 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-561403f7225so604763eaf.1
 for <qemu-riscv@nongnu.org>; Thu, 22 Jun 2023 11:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687459543; x=1690051543;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XKyN5QSE+MTdh+8+dUkT/aMB00OyZJli1HAFK0+xm+Y=;
 b=Ssyrkfslz362xPdIp7qNlwKfJTcoyaKos0fxbpK2PLbvB5qDlFaNmT5zbs4CxfYnNB
 Ap3DWH5vRK8skZMXOzh7TZMkaNR0SBOKpjHAEpBddrcuEoQWMh4WafU3WG1vWFSQ+HNq
 Q96foL4x5DJQ4IQ/QwAS4eL4Ui8mExEztkhQ4sNuf+6idXXvrAXZhrII7NGVUyPnVbdQ
 83n8HXOpCMKTWI7JDry4smmTGpGaGgssBwhTviTgssn55ndBBBHDvDU+GcKdGlWszPm/
 EEONh9g2kYwXC6zNYwWrsQtcDvF3m16AJnnyg7kb6E3ifNjEs20V3/IbH8f99DtF/ZfB
 pXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687459543; x=1690051543;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XKyN5QSE+MTdh+8+dUkT/aMB00OyZJli1HAFK0+xm+Y=;
 b=CyGux1RD7GHYl2ZTzTtl41elsw115WbkUSuIqYTEV+p0zOivweoQc0J5B8zLNmpWYM
 1jiLpxRWtp5kFbafeESbULg07tDRyRyDaZEJz33HbFGrHPxpEZZFwRaZ8XuduIkBcz8Q
 QXcg7JRW1JSYWIJYzhJ/gVQsRWaip6R5dL7GktdCsim0q9ko09k62JVETwLKN+lP2jlF
 j0uTqYPdjl1GHGNnToQRkqttHLBq1tmOlYVcCcX6M9ry4beXlzuhb+Lmr8yOrK5XCZvS
 baaY7FL0/CYWb6qAGWdcIrugRN4ht7n6dkV50YwYYqnfHCzQC4M9SydFkrj1vfnmPndv
 2ueQ==
X-Gm-Message-State: AC+VfDzg1Atkq3TqR+vmNWfHCFT4MVuTTiXaqyba1qnY97u8ljiv68Tl
 b7dO2o//eS2RvfBPx3+0Cy3whA==
X-Google-Smtp-Source: ACHHUZ5iaB+lQl39UaiZXGSgKe75oXW6Oq9puiDOUo7kf6Z7ueVsTlBpbr/3ukkDS1YNXrMciNaU5Q==
X-Received: by 2002:a4a:dd04:0:b0:560:8f20:73d3 with SMTP id
 m4-20020a4add04000000b005608f2073d3mr6895126oou.1.1687459543437; 
 Thu, 22 Jun 2023 11:45:43 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 t7-20020a4ad0a7000000b00560b1febfdfsm434793oor.10.2023.06.22.11.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 11:45:43 -0700 (PDT)
Message-ID: <da9768b2-84be-5e80-cdfd-ca60bdb48ac9@ventanamicro.com>
Date: Thu, 22 Jun 2023 15:45:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH qemu v2] change the fdt_load_addr variable datatype to
 handle 64-bit DRAM address
Content-Language: en-US
To: ~rlakshmibai <lakshmi.bai.rajasubramanian@bodhicomputing.com>,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-devel@nongnu.org
References: <168728374725.24164.15960018589525015764-0@git.sr.ht>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <168728374725.24164.15960018589525015764-0@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

(CC-ing Alistair)

On 6/20/23 14:44, ~rlakshmibai wrote:
> From: Lakshmi Bai Raja Subramanian <lakshmi.bai.rajasubramanian@bodhicomputing.com>
> 
> fdt_load_addr is getting overflowed when there is no DRAM at lower 32 bit address space.
> To support pure 64-bit DRAM address, fdt_load_addr variable's data type is changed to uint64_t
> instead of uint32_t.

It's worth mentioning that fdt_load_addr receives the result of
riscv_compute_fdt_addr(), which is an uint64_t.

> 
> Signed-off-by: Lakshmi Bai Raja Subramanian <lakshmi.bai.rajasubramanian@bodhicomputing.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/virt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 95708d890e..c348529ac0 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1244,7 +1244,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
>       target_ulong start_addr = memmap[VIRT_DRAM].base;
>       target_ulong firmware_end_addr, kernel_start_addr;
>       const char *firmware_name = riscv_default_firmware_name(&s->soc[0]);
> -    uint32_t fdt_load_addr;
> +    uint64_t fdt_load_addr;



>       uint64_t kernel_entry = 0;
>       BlockBackend *pflash_blk0;
>   

