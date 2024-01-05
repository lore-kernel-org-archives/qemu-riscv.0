Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94487C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 11:00:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLhwH-0004pg-5G; Fri, 05 Jan 2024 06:00:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLhw9-0004p6-MF
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 06:00:27 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLhw6-0004yZ-33
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 06:00:25 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5572a9b3420so801110a12.1
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 03:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704452420; x=1705057220; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2oQ8RmKNSwUYagdexe6ijrxEbemFp9CmA2w04t1AZZg=;
 b=Fa7ulPCj4jV8V51Tc3/gUyHzmNTISOk22BVxttN35FfmpVNEpI4zFnlBX4g5qKbSf3
 FcqNzRee1JcPcq34Xqz3XrD8IUnEjyk3Lh5ohRVyUg52K2tG4xCSwhtXwEEx/bJxKd05
 SrcR7AKj48Z0D/CvgqaH5fFnAR+SISo1VWVZticev5lQiggPogGjCpTG+G8fMB8EjQp0
 4tNwh1zMDa82sW9b06VlEh9XJF63EyD1qHaVPq3k/Tz43JuEYvGM63g3BGUQ2iumwZ9v
 gWV26jC429s+5tM1vAwopbOgPkzaxuih+ikD3xGDa0jkFMyZHNWj5uL+Jl69j0hUAQQP
 c/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704452420; x=1705057220;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2oQ8RmKNSwUYagdexe6ijrxEbemFp9CmA2w04t1AZZg=;
 b=NKCxBDtLVSDrZBSJYyg0rh48PpU5rgFrlQ5Zj0RVTnnjnft59K+wAxITvEhcTucpdu
 BVU4M3v1uUtqwWxKUKKol5pfrtWifLvcn2AvI2CZ6o83XnHuDJo69wNEB7LVxjGpKnQX
 0B2T89egSg1uf68ev5zLzIg7/jrVu6MWhr6lEttnA+8t4EYJCqX7HYDADpgl1kyzzfhq
 +1mSALPNvIHzP00CF8/C3e9COYbHtPxXduwxRxtODB1yARAg2on6tCrVlYGTI/SqLxU7
 j64xv3XnQ75M21kjOjGOYCnm2aSE5Y3b1Dr1rtIy7qMNUbrVWYRTtaalqXMaC8Jf1T6E
 KOwQ==
X-Gm-Message-State: AOJu0YyL0t2j/dVoxH1il2lWVZNM6TctXiTdt8UnLmFY+bsFyQBV7M9J
 4Mc2Id3O6H6SjL2ELxYQj/DHMvsHVI7Z6g==
X-Google-Smtp-Source: AGHT+IHGXvSOgWuk2Rpu3bq4NXExCyNRQZBWEUQOfkpdbQfFG5G7NZpcy48gMhZS8I3K1CUpBva/PA==
X-Received: by 2002:a17:907:bb93:b0:a28:abfa:e405 with SMTP id
 xo19-20020a170907bb9300b00a28abfae405mr1912612ejc.58.1704452420161; 
 Fri, 05 Jan 2024 03:00:20 -0800 (PST)
Received: from [192.168.69.100] (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 oz39-20020a170906cd2700b00a1f7ab65d3fsm751363ejb.131.2024.01.05.03.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jan 2024 03:00:19 -0800 (PST)
Message-ID: <0bbd5bff-2f38-4625-9e0b-12245f512c01@linaro.org>
Date: Fri, 5 Jan 2024 12:00:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/9] machine: Use error handling when CPU type is
 checked
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, armbru@redhat.com
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, imammedo@redhat.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com, qemu-arm@nongnu.org
References: <20231204004726.483558-1-gshan@redhat.com>
 <20231204004726.483558-2-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231204004726.483558-2-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
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

On 4/12/23 01:47, Gavin Shan wrote:
> Functions that use an Error **errp parameter to return errors should
> not also report them to the user, because reporting is the caller's
> job. The principle is violated by machine_run_board_init() because
> it calls error_report(), error_printf(), and exit(1) when the machine
> doesn't support the requested CPU type.
> 
> Clean this up by using error_setg() and error_append_hint() instead.
> No functional change, as the only caller passes &error_fatal.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> ---
> v9: Improved change log                                  (Markus)
> ---
>   hw/core/machine.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 0c17398141..bde7f4af6d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1466,15 +1466,16 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
>   
>           if (!machine_class->valid_cpu_types[i]) {
>               /* The user specified CPU is not valid */
> -            error_report("Invalid CPU type: %s", machine->cpu_type);
> -            error_printf("The valid types are: %s",
> -                         machine_class->valid_cpu_types[0]);
> +            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
> +            error_append_hint(errp, "The valid types are: %s",
> +                              machine_class->valid_cpu_types[0]);
>               for (i = 1; machine_class->valid_cpu_types[i]; i++) {
> -                error_printf(", %s", machine_class->valid_cpu_types[i]);
> +                error_append_hint(errp, ", %s",
> +                                  machine_class->valid_cpu_types[i]);
>               }
> -            error_printf("\n");
>   
> -            exit(1);
> +            error_append_hint(&errp, "\n");

This doesn't build:

hw/core/machine.c:1488:31: error: incompatible pointer types passing 
'Error ***' (aka 'struct Error ***') to parameter of type 'Error *const 
*' (aka 'struct Error *const *'); remove & 
[-Werror,-Wincompatible-pointer-types]
             error_append_hint(&errp, "\n");
                               ^~~~~

> +            return;
>           }
>       }
>   

Squashing:
-- >8 --
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 021044aaaf..1898d1d1d7 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1487,3 +1487,3 @@ void machine_run_board_init(MachineState *machine, 
const char *mem_path, Error *

-            error_append_hint(&errp, "\n");
+            error_append_hint(errp, "\n");
              return;
---

