Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BA9CE7AE6
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 08:20:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1smUD1-0000S6-Me; Fri, 06 Sep 2024 04:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1smUCt-0008VE-Od
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2024 04:20:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1smUCs-0005KX-3F
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2024 04:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725610837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dIb+aFEPnxa+ecwx4BMFsy/dVU1NZkNcrs1QqIlJkao=;
 b=QRPt8Hu606j1m7vnslXE0a1B+L9lQInYiCW94n49bfeCvBPFM21J1WHEK87jV56+Z131i/
 PjKKVruMIOneO4v1RHOEWbVYOjIZu/3GJ1MDe3CyjSUofs2mKGScDql8p0biV/+qTU2Der
 WjpFNvvzYl/G//OpHrdjnaiqMMkCY5U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-PvTeEd_2NQGjMJW3xRMjTw-1; Fri, 06 Sep 2024 04:20:34 -0400
X-MC-Unique: PvTeEd_2NQGjMJW3xRMjTw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-374c54e188dso1489845f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 06 Sep 2024 01:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725610833; x=1726215633;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dIb+aFEPnxa+ecwx4BMFsy/dVU1NZkNcrs1QqIlJkao=;
 b=UmN6rK9BD5UJ2sEIs6M+I1sn90pWNxJ8X9bhnR7TxW91cxN/p6bA39B8/pLbTfmDWA
 LU176CboPLyRJq+aGkOS4w8SN9CYw7SnR9JYZ8nNz6OeuHhb12IEIys2OiJAWhYaTB+1
 dYnLbcI8lLiwffQMhDCijuXZOQksAvdC0C8EgbUAmujfd4Hl74A4EQ3x6QB6mfww6Smw
 HTe2Ns2tB41sWFiyycl3CoFKzXuX+EVS9OXTH7pShm0iYDjPSCWqIym8zlrnltLVmy4F
 0fs+FE7ITiXLr7EwgRhU4d00BofkWFiETqXQ7GrXxC2mZuNm82D8AUdTeIMUfRfynm+l
 7huw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9Y50l/rOrfGpq3k6n4QXtYE3Ymirz686jsy/giC7pxQm+EXISROUlqs7S+3+NQuTOPy4Xi2QojUfJ@nongnu.org
X-Gm-Message-State: AOJu0Yz9mPO0BsbUR1RDwPepyBizFK3pIqg2iJJSP2OCf/2buSCr0DSe
 k4nDSskZZpzE4eK1YjcHHaF2DHtiwfxFQqGhW4ePYwZn7liIx85+qdR9YDCxMaQOHUS2Fvl5KZ4
 A2vL9WkIl4UamMPsL+dLY0c9NT/Hz6K0gJ1+H7fHaJ7lYPw2BtbZbsfA5w2PG
X-Received: by 2002:adf:f70d:0:b0:374:c3e4:d6e3 with SMTP id
 ffacd0b85a97d-378885c045fmr1175039f8f.5.1725610833137; 
 Fri, 06 Sep 2024 01:20:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzruKUuH2kPqYWCivA8T7JKLnQSxjGtEa4P0lNiMLrY0B8mt/TsbeErxFP806qSoPHvdEvwA==
X-Received: by 2002:adf:f70d:0:b0:374:c3e4:d6e3 with SMTP id
 ffacd0b85a97d-378885c045fmr1175010f8f.5.1725610832555; 
 Fri, 06 Sep 2024 01:20:32 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-115-52.web.vodafone.de.
 [109.43.115.52]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ef812cbsm21209895f8f.83.2024.09.06.01.20.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 01:20:32 -0700 (PDT)
Message-ID: <e36bd72e-2f98-45d3-8171-0eac7d509c13@redhat.com>
Date: Fri, 6 Sep 2024 10:20:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 13/16] target/riscv: Restrict semihosting to TCG
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Anton Johansson <anjo@rev.ng>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20240722110413.118418-1-alex.bennee@linaro.org>
 <20240722110413.118418-14-alex.bennee@linaro.org>
 <bf198824-70c0-4724-b1d4-b6aa348322c1@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <bf198824-70c0-4724-b1d4-b6aa348322c1@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 05/09/2024 19.08, Thomas Huth wrote:
> On 22/07/2024 13.04, Alex Bennée wrote:
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> Semihosting currently uses the TCG probe_access API. To prepare for
>> encoding the TCG dependency in Kconfig, do not enable it unless TCG
>> is available.
>>
>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Anton Johansson <anjo@rev.ng>
>> Message-Id: <20240717105723.58965-7-philmd@linaro.org>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20240718094523.1198645-14-alex.bennee@linaro.org>
>>
>> diff --git a/target/riscv/Kconfig b/target/riscv/Kconfig
>> index 5f30df22f2..c332616d36 100644
>> --- a/target/riscv/Kconfig
>> +++ b/target/riscv/Kconfig
>> @@ -1,9 +1,9 @@
>>   config RISCV32
>>       bool
>> -    select ARM_COMPATIBLE_SEMIHOSTING # for do_common_semihosting()
>> +    imply ARM_COMPATIBLE_SEMIHOSTING if TCG
>>       select DEVICE_TREE # needed by boot.c
>>   config RISCV64
>>       bool
>> -    select ARM_COMPATIBLE_SEMIHOSTING # for do_common_semihosting()
>> +    imply ARM_COMPATIBLE_SEMIHOSTING if TCG
>>       select DEVICE_TREE # needed by boot.c
> 
>   Hi,
> 
> this patch broke compilation with "--without-default-devices":
> 
> /usr/bin/ld: libqemu-riscv64-softmmu.a.p/target_riscv_cpu_helper.c.o: in 
> function `riscv_cpu_do_interrupt':
> .../qemu/target/riscv/cpu_helper.c:1678:(.text+0x283c): undefined reference 
> to `do_common_semihosting'
> 
> Could you please have a look? I think we either have to revert to "select" 
> instead of "imply", or you might need to put some "#if 
> CONFIG_ARM_COMPATIBLE_SEMIHOSTING" into the code that calls 
> do_common_semihosting() ...?

Suggested a patch here now:

https://lore.kernel.org/qemu-devel/20240906080928.710051-1-thuth@redhat.com/

  Thomas



