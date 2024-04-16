Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7947C04FF9
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 14:50:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rwk8V-0004zC-AT; Tue, 16 Apr 2024 10:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwk8H-0004u2-Iz
 for qemu-riscv@nongnu.org; Tue, 16 Apr 2024 10:50:01 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwk8E-0003Cx-7J
 for qemu-riscv@nongnu.org; Tue, 16 Apr 2024 10:50:01 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-516d4d80d00so5521707e87.0
 for <qemu-riscv@nongnu.org>; Tue, 16 Apr 2024 07:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713278995; x=1713883795; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kEi6ruhnU3S3FhwT8XtVe9Nr9s6T4FUQEEvlScExHyc=;
 b=djIaG7kOClXddZGE+9JEagwnwEIvZ1LjI4FVY+3zXh/h61RxyEgcxucUDa2wQPfKs8
 q2YyxrkZ+AkkPhuUR7eEuiakQJJ1PdzJfm+aRKqk+gDSHIk6cOW1w0toAAqkEifIyHmH
 1vA+iCbAvLNZ7kkF3DUkwpwMRfKIDBK1qQEhyXIg7kJ3hmEZDYIswgvRPbHs/+9w2R+F
 tnjWwU0ZK7LRxB7V/7p785nLq2B938XJfQw/UkBi7dTgAK9eF0BOC+4E5TjwqvdXz2B4
 QzrNvMFVSvOnRAGfQyQ4kvLEp5/v6IKithbeVMWREfZr1JhClhg+zbJnoZEbF2brhaeP
 fHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713278995; x=1713883795;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kEi6ruhnU3S3FhwT8XtVe9Nr9s6T4FUQEEvlScExHyc=;
 b=IFChhh4SLMJCWrIR1zjHZ1o/B+a7MccyvJwrikQjcLBSHQvAxsOfL4Lgjww3QVfa9o
 6DfUyTdnF1GzvjLtMeEzwNuo89m9clFaXIbsUNEzmTRnthMrFTqHZ1L/uwRd1R8YzhOW
 7n4gHBXCDgDTLdcavx6EgvDBbHAERrGwX+LNAUWth1bO2L9ke23CtonvQTtpxM6oR9Hd
 HUZyxIvRGQA1jy70jUcaVZLHI04eQy/+scI3/UjAe7IV2wUeBs1GLbabcxDUuSi8sZeW
 hjamo1y5ESoo+1vVoK5bBtS8tNGqlpooSjMKRLNyLSzUdVi8L4hPFzymu5TMJ+1EXUo3
 rfhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4X63xEqPfTDBzizSM9Iy6E12MpdQ9Ew16H9pTPmRQBQM6/7+XloC1KcI7nIdl1s0ollQWdTjtT8az+dU86V06suGtcj0=
X-Gm-Message-State: AOJu0YwBs88KA/YOzFmIoKm2q8m9AC1ilzgeTGEPFQh+i5Pckb0f+ktd
 yVnxIspV0fsCLhLjtjzhjSOTULrrUpLStozCmUfxNncpRXrjUpXheKlm02WB9XM=
X-Google-Smtp-Source: AGHT+IEFW0wxbRlpsM9T0SXQI8EERPCH7oVpr4Wl4hCu1JQUItg82RhJ0oWcdVqUe6xN1nqrCyhzDA==
X-Received: by 2002:a05:6512:3094:b0:519:13be:c42b with SMTP id
 z20-20020a056512309400b0051913bec42bmr3013879lfd.61.1713278994641; 
 Tue, 16 Apr 2024 07:49:54 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.155.61])
 by smtp.gmail.com with ESMTPSA id
 ho41-20020a1709070ea900b00a524318c380sm5036114ejc.80.2024.04.16.07.49.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Apr 2024 07:49:54 -0700 (PDT)
Message-ID: <68336e9f-7a30-47f7-b4c7-ad8afc2c16f3@linaro.org>
Date: Tue, 16 Apr 2024 16:49:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/22] hw/i386/pc: Deprecate 2.4 to 2.7 pc-i440fx
 machines
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 devel@lists.libvirt.org, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20240416135252.8384-1-philmd@linaro.org>
 <20240416135252.8384-2-philmd@linaro.org>
 <15834b55-8226-4355-91f2-9d5df4d3bc9b@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <15834b55-8226-4355-91f2-9d5df4d3bc9b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 16/4/24 16:23, Thomas Huth wrote:
> On 16/04/2024 15.52, Philippe Mathieu-Daudé wrote:
>> Similarly to the commit c7437f0ddb "docs/about: Mark the
>> old pc-i440fx-2.0 - 2.3 machine types as deprecated",
>> deprecate the 2.4 to 2.7 machines.
>>
>> Suggested-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   docs/about/deprecated.rst | 4 ++--
>>   hw/i386/pc_piix.c         | 2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index 7b548519b5..967ee34267 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -219,8 +219,8 @@ deprecated; use the new name ``dtb-randomness`` 
>> instead. The new name
>>   better reflects the way this property affects all random data within
>>   the device tree blob, not just the ``kaslr-seed`` node.
>> -``pc-i440fx-2.0`` up to ``pc-i440fx-2.3`` (since 8.2)
>> -'''''''''''''''''''''''''''''''''''''''''''''''''''''
>> +``pc-i440fx-2.0`` up to ``pc-i440fx-2.3`` (since 8.2) and 
>> ``pc-i440fx-2.4`` up to ``pc-i440fx-2.7`` (since 9.1)
>> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> 
> Didn't we want to mark everything up to 2.12 as deprecated?

I took your suggestion:
https://lore.kernel.org/qemu-devel/2a01baa6-b6a3-4572-94cd-63b2eaab7b38@redhat.com/
I am happy to go up to 2.12 :)

> Anyway,
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks!


