Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D53C02188
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 13:50:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tcPVl-0007Sc-5F; Mon, 27 Jan 2025 08:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tcPVi-0007RP-NP
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 08:50:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tcPVg-00070m-3n
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 08:50:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737985838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LT9VQhIDpIzBCFjyuqGneXYXbeyEceEUbB7BeIxKyPM=;
 b=ZW0GyGmZ7erW03BYWZ4JpvqmenQHM/pnxD/iiAClT50oLDdjzZGwZLOQ7H+6Qfv3W/Lqxw
 leHmypQCQlTj6jWI2aR8vomilUs73bx+/nZgKCQKlAHSkOZpa/RMh1sMFY7NjolsTQKse3
 3m1YeMYeMKW0CKX/jBCwWRncJCc/Lvw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-lW6D5XpZPX2j15mgDnUCTw-1; Mon, 27 Jan 2025 08:50:36 -0500
X-MC-Unique: lW6D5XpZPX2j15mgDnUCTw-1
X-Mimecast-MFC-AGG-ID: lW6D5XpZPX2j15mgDnUCTw
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4388eee7073so25985045e9.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Jan 2025 05:50:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737985835; x=1738590635;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LT9VQhIDpIzBCFjyuqGneXYXbeyEceEUbB7BeIxKyPM=;
 b=VC5Z/xhD5RIFxmai8iYesosGGQnO2kheS7y81Kg9ueEdxkkBX6tZSJK4vnqLfQyhvL
 FKkSVSXzSao5YedG1LPqHxhzVuWUVZklwMRTxm/kIrqQSs/cs/x6DNF3P9pSrXwoMMzx
 VapMaHXrAvjH3WftP4YyHaEMGOocQzYVUurlcAkgWSgjs8S/6gA8UwswqKmaj9YtdbvY
 HnTWaqMGECc203K21G6yhvFtDSB6iC/NRotdCR51gZgeGfS1Xdzj3LQ1cjjvOTsxK0rO
 0D3efd1Czpo1477YldC5VFFEPock+ub8tJL8ORg4Fm1aQ0prclUGixeRRKghh+cUvcyb
 v5QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgt1IkwmDcr2n5arf0T5YE+GshCfYKNKgS4DaLyqzhADlTaNl5JLpWI9AeDZbYsQDOoZSYbD69Cbdp@nongnu.org
X-Gm-Message-State: AOJu0Ywd2St8oyRBgmKFNkZ3uxI/g2rXAzZSj3M110hB+nSVPRiyabHr
 KA6lyBfe1NzJgzOJFG+vu6VKnygWhhTHFjkt+6lWLE/duEGhehSsOKFGO3GsqjeFenCkV2uJmee
 hF4sTuNs60b7Hk2nismdtE91EMOfMfFJHxNg8X+s5FGf9dP+93fO1
X-Gm-Gg: ASbGnctB5ImqCMcm0gvAPrzVSdh8/12mDvibbd8b91jjR9ld4fgPeMSfmYPOmnwb2Ub
 WTomFeFuujqdZlUplGfFlY4M5gqtkzWPasFuLjgHAbuFPVBe2MXOurNYMXJZpjW4ejQGksAFpLb
 Gy5+3L+WmwLo5qFOEYACAgvTZLbTQTICaoJh5JqI3/DBt7EBjvm6J0LlhmgGBK7U77PQv/cAVDJ
 q2nwhQ4UDpmKOq++fty+wtO0AFb3DQpazR3/m1MhLcIK7iqrqkP6szKxKW6M3Vk/wmDuuRgC+6k
 7CVSEVwY5PbS7XJlJ5hHycB+aCoBVQ==
X-Received: by 2002:a05:600c:58c9:b0:436:e3ea:64dd with SMTP id
 5b1f17b1804b1-438bd0a88dbmr118594165e9.11.1737985835451; 
 Mon, 27 Jan 2025 05:50:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1hX+tceSkgtoATL68UakasUh05pcnLT62Y5y6OUDjCotgN1Z0h82LDVkO2lwoBnQtGaZ7Ow==
X-Received: by 2002:a05:600c:58c9:b0:436:e3ea:64dd with SMTP id
 5b1f17b1804b1-438bd0a88dbmr118594015e9.11.1737985835124; 
 Mon, 27 Jan 2025 05:50:35 -0800 (PST)
Received: from [10.33.192.228] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd48574csm133861605e9.9.2025.01.27.05.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 05:50:34 -0800 (PST)
Message-ID: <80233ece-0b7d-4ef4-969c-077ee98cdd62@redhat.com>
Date: Mon, 27 Jan 2025 14:50:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] target: Set disassemble_info::endian value for
 big-endian targets
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
References: <20250127115426.51355-1-philmd@linaro.org>
 <20250127115426.51355-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250127115426.51355-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fTRBt01ECejycESwsIi20_d8i-3pDTfrWNhPdfuAWPg_1737985835
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

On 27/01/2025 12.54, Philippe Mathieu-Daudé wrote:
> Have the CPUClass::disas_set_info() callback set the
> disassemble_info::endian field for big-endian targets.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/hppa/cpu.c     | 1 +
>   target/m68k/cpu.c     | 1 +
>   target/openrisc/cpu.c | 1 +
>   target/s390x/cpu.c    | 1 +
>   target/sparc/cpu.c    | 1 +
>   5 files changed, 5 insertions(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>


