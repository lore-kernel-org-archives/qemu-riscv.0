Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3C5C02194
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 18:17:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tfNTZ-0006qY-Cc; Tue, 04 Feb 2025 13:16:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfNTX-0006p4-Oy
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 13:16:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfNTW-0008NM-2D
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 13:16:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738693000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dxEy0E6KZF4fY89Y0kh3AOoKSXRhbtiOt8I8jlSzR5k=;
 b=bNFPUIJyLj03JAacyUD7FKeO6ouwe4nk2dplY5NA1jSBOytoTqaTJjObsarCT7aR+3NVu0
 v0MyJya0rBTs17OmypnTOVAbw1mbx27B1wQdx0p6OH3Xl15tT0gNZiZIFfbkYPb61INNZf
 zaAyD2SySs4fc5uRRiQbtXLrH9HLM7k=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-adJOTOFbNO-CjmLrzWsZWw-1; Tue, 04 Feb 2025 13:16:38 -0500
X-MC-Unique: adJOTOFbNO-CjmLrzWsZWw-1
X-Mimecast-MFC-AGG-ID: adJOTOFbNO-CjmLrzWsZWw
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5d3c284eba0so8956026a12.1
 for <qemu-riscv@nongnu.org>; Tue, 04 Feb 2025 10:16:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738692997; x=1739297797;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dxEy0E6KZF4fY89Y0kh3AOoKSXRhbtiOt8I8jlSzR5k=;
 b=pdSVihNnXqTH3Y472hZYANfbtX9uam8UNn7ujipMwCTtip/+TYcUHl4cuOrvCIczq0
 0IE1ciUr1yqN2w8xuQ69iZq2f2A8jhoe2jfaqNJJH6frkoghaRfjTQ4bSoKX0lxmIGqa
 Hnqo4GRbp6GvAdZsNkcAn+jFkTUyraslNt24a5VA8ajHjRPL87yOH2SCe4Uvpg3AIlR7
 V8FhEXsi5trv14cnU2/b5KzKJ49QQupn6aCnC46TTL3v5q5zeAiQ6vFQOQHChHebT52I
 RdLv5gZtvH1Dvd0vXkiaqjrdpvFO/M7tiQUDs2GwPyWJWmqUl1KYJIBzxdxKfK2y7yKN
 1o1w==
X-Gm-Message-State: AOJu0YwxlpkMH0wCg4oTBtnA39WzJyiTjyvcpP1aOZHYpmpnXZrdrs0J
 Em10MyNRnlvA6G5gMJ4RvDhqaO1Cpt4bkPSZLUaZGLN4XMm9NHXGB6oFkvqEqNaZETsHeNpzfwi
 tuwJJbEKBwhKDQ3nYjq5+OmXg0HizJO6j1HUGBrNWzCut+N/ALJML
X-Gm-Gg: ASbGncsUuC1S2jEgQZ3RnklRlhIKAI5HrFI7PBWokX2jBvxPlb05tlpHfy/leksPDeX
 vlD7esdP2i5FWnZHhKmSk1nh7lnVRzH3LOacrQpCfd3CisDwt9X27u5CX7VwWkXsggRjkWZyPsr
 EuBuk6UgcnqH2pld+yAAPjpLGx61t+GyI+MHN/4C05TfD8CIrtq1GAdDjH/e3rDK/r2OBiUpEWp
 iDfu/Om89TXD5RZMX29/LnVtT+DKGHqH3Y9wu454dj14yfG0tluY6qeHbMCyJIIaEFcFy/+LDo4
 G4daTdSUhnPeVFa6tWPAZtWi2238fD7l050k
X-Received: by 2002:a05:6402:2687:b0:5dc:db28:6afc with SMTP id
 4fb4d7f45d1cf-5dcdb57fb04mr79141a12.0.1738692997525; 
 Tue, 04 Feb 2025 10:16:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHBcHQPDC8IKSuANj4px3X/xB1jPH11LzBx1/y0trHyhpX+ltzumjMSpgpoA2MSSs3OIwmLQ==
X-Received: by 2002:a05:6402:2687:b0:5dc:db28:6afc with SMTP id
 4fb4d7f45d1cf-5dcdb57fb04mr79114a12.0.1738692997196; 
 Tue, 04 Feb 2025 10:16:37 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-132.web.vodafone.de.
 [109.42.48.132]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcda03eaecsm214335a12.49.2025.02.04.10.16.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 10:16:36 -0800 (PST)
Message-ID: <42950b71-264c-48e2-96d1-5ce4d0990e64@redhat.com>
Date: Tue, 4 Feb 2025 19:16:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] hw/boards: Explicit no_sdcard=false as
 ON_OFF_AUTO_OFF
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20250204180746.58357-1-philmd@linaro.org>
 <20250204180746.58357-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250204180746.58357-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zlLAqkIKPd-6qqZWL4Hpu5pwx-Zcpl96MPRJujvEVHQ_1738692998
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Update MachineClass::no_sdcard default implicit AUTO
> initialization to explicit OFF. This flag is consumed
> in system/vl.c::qemu_disable_default_devices(). Use
> this place to assert we don't have anymore AUTO state.
> 
> In hw/ppc/e500.c we add the ppce500_machine_class_init()
> method to initialize once all the inherited classes.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
...
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 12418094f9d..dc80181ea43 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -467,6 +467,7 @@ static void zynq_machine_class_init(ObjectClass *oc, void *data)
>       mc->ignore_memory_transaction_failures = true;
>       mc->valid_cpu_types = valid_cpu_types;
>       mc->default_ram_id = "zynq.ext_ram";
> +    mc->no_sdcard = ON_OFF_AUTO_OFF;
>       prop = object_class_property_add_str(oc, "boot-mode", NULL,
>                                            zynq_set_boot_mode);
>       object_class_property_set_description(oc, "boot-mode",

This hunk seems to be wrong since the previous patch already sets no_sdcard 
to ON here?

  Thomas


