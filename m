Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E087C02194
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 18:20:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tfNWD-00015r-UC; Tue, 04 Feb 2025 13:19:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfNW4-0000u8-UA
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 13:19:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfNW2-0000HS-7M
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 13:19:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738693156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ajTcK5MikIywAO/1+psjGECkRXXHT6VX/KoGkSgWjp0=;
 b=VyMwc8uXLzKCqQIR4bJaOCWcVVyH+qx6uWNG7K59dETBzszAFW/3oi9t+HUxCtJaWMldQw
 S0G4eJ+xIbGuO8Feb5L3McGg6zjU7iJus9bDtf8QAFMym734DvDLdAVYp0e0BTn0b3YeRa
 W7UFLlAxF1otox2w5J55KTXWNpjfz+g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-8Wfyin2YNHiT2vHo9WKCWg-1; Tue, 04 Feb 2025 13:19:15 -0500
X-MC-Unique: 8Wfyin2YNHiT2vHo9WKCWg-1
X-Mimecast-MFC-AGG-ID: 8Wfyin2YNHiT2vHo9WKCWg
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38dac5643ecso1067511f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 04 Feb 2025 10:19:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738693154; x=1739297954;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ajTcK5MikIywAO/1+psjGECkRXXHT6VX/KoGkSgWjp0=;
 b=Vw+zPpvEMuhJlL7HEYN5e8wbsSiC/IOgBgGJuP9x3nj0jdaDDXoXz/7XUbNnei5Qiw
 jI6/oQILWhPv+mxM/c9cgCJK4u02B5KivN1XengjJ5wCIRXqaZuNtnc2vxZsL3hJsNWr
 1N4jAtSKkhGVb2RyfiEZi8mC2AMcaVHCevlBnjT81mhPxKKeLtE5MnXTXG81FVUTz9cs
 3OyPpjv4zCaQWSwXgfwJxO4pXEQxLWr/fGL2yDHGt7CEfPvAETaGL0NoBksEIxKgvG8p
 SDFc2u+m6rODq9rGKH76xF1rzHI1Ls7MLyfpJzV2DeFCLz5ldVr5rOy/5r1O42Ontg6C
 f7uA==
X-Gm-Message-State: AOJu0YxpgoTgbVD7m18qi8qo3jAMBHGdZ8C7tePwEXh9MNJj0C97wQX9
 54KVU7JeE1h3Zdk1c1PMansIuu1EpABHfH7AQ0WQA/rgZSCoR2hGzZ6T7Hsu+g/nVIWXi2aiwJ5
 tIgo3RdNoRhcI7jfTdHzPm6145PnCNpMqkqbo/ER/UulmkYBik0Wg
X-Gm-Gg: ASbGncvP3RIFprHRm7ie1fu/WjObm+YILsmx6JLbHZKHCVap0RpcALSRxjOzYei4SCT
 9Z5pesHxKoF5fNqx0Bo/lrBrhbWfMJmBOX+qWs3sw1BsBk5AOX72e/nOCwOCsRK2I02VojdcqeP
 /oF+9/moaUhGCFmDopBr15on27fbskQw3NRvfplzkRY/fN346pAB9xoC7lFagd7ERXdNA0dbLSU
 Dr/dTa0IQdkLZzgFWNQCE42g1vqrdpZzlHx6lkeAi3t2sq117kP5Bz1N79Y8LEroTiThSUMObEQ
 v/XCy/QKUaNBoG8057H1VfcSE/n7R2eBNXMa
X-Received: by 2002:a5d:64aa:0:b0:38d:a883:b95b with SMTP id
 ffacd0b85a97d-38da883bad6mr3888552f8f.28.1738693152863; 
 Tue, 04 Feb 2025 10:19:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFS67uM1bKh/HiAdl+Vd/bmvk2usyKWvEm0efGabDclMtQusgLrSRtOcqILusOVSkMOA17D4w==
X-Received: by 2002:a5d:64aa:0:b0:38d:a883:b95b with SMTP id
 ffacd0b85a97d-38da883bad6mr3888438f8f.28.1738693151054; 
 Tue, 04 Feb 2025 10:19:11 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-132.web.vodafone.de.
 [109.42.48.132]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e49ff278sm956474966b.119.2025.02.04.10.19.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 10:19:10 -0800 (PST)
Message-ID: <31346ebc-aa7d-45f2-b840-6dc3450983c6@redhat.com>
Date: Tue, 4 Feb 2025 19:19:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] hw/boards: Rename no_sdcard -> auto_create_sdcard
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20250204180746.58357-1-philmd@linaro.org>
 <20250204180746.58357-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250204180746.58357-4-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3OCaTeBHo-_ktUZQhsRaYhxq5mL-FATB_6Xkl4-KmDY_1738693154
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 04/02/2025 19.07, Philippe Mathieu-Daudé wrote:
> Invert the 'no_sdcard' logic, renaming it as the more explicit
> "auto_create_sdcard". Machines are supposed to create a SD Card
> drive when this flag is set. In many cases it doesn't make much
> sense (as boards don't expose SD Card host controller), but this
> is patch only aims to expose that nonsense; so no logical change
> intended (mechanical patch using gsed).
> 
> Most of the changes are:
> 
>    -    mc->no_sdcard = ON_OFF_AUTO_OFF;
>    +    mc->auto_create_sdcard = true;
> 
> Except in
>   . hw/core/null-machine.c
>   . hw/arm/xilinx_zynq.c
>   . hw/s390x/s390-virtio-ccw.c
> where the disabled option is manually removed (since default):
...
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index dc80181ea43..2d626a96b9b 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -463,11 +463,10 @@ static void zynq_machine_class_init(ObjectClass *oc, void *data)
>       mc->desc = "Xilinx Zynq Platform Baseboard for Cortex-A9";
>       mc->init = zynq_init;
>       mc->max_cpus = ZYNQ_MAX_CPUS;
> -    mc->no_sdcard = ON_OFF_AUTO_ON;
>       mc->ignore_memory_transaction_failures = true;
>       mc->valid_cpu_types = valid_cpu_types;
>       mc->default_ram_id = "zynq.ext_ram";
> -    mc->no_sdcard = ON_OFF_AUTO_OFF;
> +    mc->auto_create_sdcard = true;

That's now wrong, too ... it should get removed (as you say in the patch 
description).

  Thomas


