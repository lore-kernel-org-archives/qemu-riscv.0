Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064C3C4707B
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 06:02:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNo9K-00088i-M1; Thu, 11 Jan 2024 01:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rNo9J-000882-T8
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 01:02:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rNo9H-00021M-ME
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 01:02:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704952957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=svmVfxBLPI/Y3WTiwU0rrYfGXA1e8Kn/6Y7iOqANOS4=;
 b=KgPZgku/WECqpzbi5gQOIdEcncnzhV7A5wAOq6M0xOz17WE/sVH2hH/BNZKZE1gcL1xlOZ
 7j+OOgq0HyQrxpneEUR07KybChM2M6ZL8r17vsw3wgJDO2l6peL9yE3Wk/4GI/g8b31bRA
 cSlJrIjZ12eDHe936Ft09L5k/LlO+V0=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-eMzHWtvZM_K3ppQPe8zkTQ-1; Thu, 11 Jan 2024 01:02:36 -0500
X-MC-Unique: eMzHWtvZM_K3ppQPe8zkTQ-1
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-6da380cc0d6so5921491b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 10 Jan 2024 22:02:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704952955; x=1705557755;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=svmVfxBLPI/Y3WTiwU0rrYfGXA1e8Kn/6Y7iOqANOS4=;
 b=rw/EiL4YPaDoklpFaa8LlGWYiIxW1ry3lWa3YJ67hJD5uWX9AIFP1R0zG2JoTROQiv
 o5nK7xAWTohN5VPsX6XwQeBcyFAk0Q03/6f4nD+8Zv4RTzQQMVvMO4x6aaIN2ZqfSf3m
 eNDaRB01LvKMNwRYNbHJIgbAxwPzjzUkbWwc4eOH62j39FgBcXRZVrNM59aZ7PNyKniQ
 yMei0uqMOtCbs9caScKk7/Ir1D63mvIjIM4Z3w32ofZAf2n0U1UTIl/JXCgX8dheUx2B
 BKGsPsZfEk2K3BHCBtFIM96HiNoEADoCAMBFAumducDCW+82mugrPummU4STZJESDkne
 2YxA==
X-Gm-Message-State: AOJu0Yx7RzqtKcWotcTKQ5OOv+5QJJsICL3OH8hVEEL9q9954qjwgPth
 LE6v7Ymbq8eHPMXLyCl3gDvIfV0aFwLGY0tV1ASfISrq/z+dZPuytDOhVLhkHbMeEk1Gg+2VkJC
 hkNCCzcbVogYiS1si0FfMS7Y=
X-Received: by 2002:a05:6a00:4087:b0:6d4:511d:e0a1 with SMTP id
 bw7-20020a056a00408700b006d4511de0a1mr954580pfb.21.1704952955029; 
 Wed, 10 Jan 2024 22:02:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbToi55ogH033L6C0wThjlTpoFBwQJNtITb1WMHTywBQ8VixyXWWaj3D69zN7zdKWK1z5W5Q==
X-Received: by 2002:a05:6a00:4087:b0:6d4:511d:e0a1 with SMTP id
 bw7-20020a056a00408700b006d4511de0a1mr954562pfb.21.1704952954762; 
 Wed, 10 Jan 2024 22:02:34 -0800 (PST)
Received: from [10.72.112.34] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a056a00195100b006d9bf71461asm317590pfk.86.2024.01.10.22.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 22:02:34 -0800 (PST)
Message-ID: <d05eada5-7839-47df-984b-0d7956c0b3ee@redhat.com>
Date: Thu, 11 Jan 2024 16:02:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 29/71] hw/arm/virt: Check CPU type in
 machine_run_board_init()
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
 <20240105154307.21385-30-philmd@linaro.org>
 <CAFEAcA8P+kDHv_crqDmrbzzJHDpy1fe4T_tXsu8+nWggmjymgQ@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <CAFEAcA8P+kDHv_crqDmrbzzJHDpy1fe4T_tXsu8+nWggmjymgQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.774,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi Peter,

On 1/10/24 00:33, Peter Maydell wrote:
> On Fri, 5 Jan 2024 at 15:46, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> From: Gavin Shan <gshan@redhat.com>
>>
>> Set mc->valid_cpu_types so that the user specified CPU type can be
>> validated in machine_run_board_init(). We needn't to do the check
>> by ourselves.
> 
> Hi; after this change if you try to use the 'virt' board from
> qemu-system-arm with an invalid CPU type you get an odd
> error message full of "(null)"s:
> 
> $ ./build/x86/qemu-system-arm -machine virt -cpu cortex-a9
> qemu-system-arm: Invalid CPU model: cortex-a9
> The valid models are: cortex-a7, cortex-a15, (null), (null), (null),
> (null), (null), (null), (null), (null), (null), (null), (null), max
> 
> This seems to be because we print a "(null)" for every 64-bit
> only CPU in the list, instead of either ignoring them or not
> compiling them into the list in the first place.
> 
> https://gitlab.com/qemu-project/qemu/-/issues/2084
> 

Yes, it's because all 64-bits CPUs aren't available to 'qemu-system-arm'.
I've sent a fix for it. Please take a look when getting a chance.

https://lists.nongnu.org/archive/html/qemu-arm/2024-01/msg00531.html

Thanks,
Gavin


