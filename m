Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E0ED5A6E2
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Nov 2024 05:25:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tFo4S-0007Tb-2z; Tue, 26 Nov 2024 00:25:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFo4O-0007Qs-Tg
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2024 00:25:04 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFo4N-0004ea-4S
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2024 00:25:04 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-432d86a3085so48026655e9.2
 for <qemu-riscv@nongnu.org>; Mon, 25 Nov 2024 21:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732598701; x=1733203501; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=btxhf/iHeq07QYd1FQs3cogb15E7zMtIyEa6dYcM9dE=;
 b=fG+A1pO0u+4Fo2usxKOCG8E7eY7cK01f8jTyj9U5tRuHNKnPoNoZjSBKXK5+ZMVfOJ
 RrRrDYoUj6+a+/r74gr0Md/cUtYSVyWQcmZ30kMQEbTBriY1B+9yI6Y4LO9U/BYBEUSs
 R/+xelEN4CQPUesoyvpNIjAFvTqODYKGYpSsxIrWKEMxnFlVn2Slx9oHsxUdyS/GamC9
 07xYijODz78MeWlzOqm7J05oStgHDM760oyfv1kWbbJACzro6cGWfqNBuVLgQONJklcs
 aYoJC82TSkZ09HBOFwXSkdy/qGjmQ7DpTiGb6POhRCK9odBL9ycrhH9HsAUw9LLvvOsI
 5dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732598701; x=1733203501;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=btxhf/iHeq07QYd1FQs3cogb15E7zMtIyEa6dYcM9dE=;
 b=itBv+Sdsimk4jzWj4RbosoLg4KD8hCT511Hdy5t3h7E6iBf4M/t4EeAEDfl/rLGuJF
 OBKYe7cuseRasnDJMTnVtRdZeT2lVangHxhjv9fblQyLW/ONK9ymZHxs89NvPW+nIAwu
 wQS2eVjxWicVmNJXJx0WwV1hK4qOoNKdfhfPzSxUmotLcFzDSP2y8F3gEv94jMTKM4Y6
 pazG3cXQiMJgEb+aWGppB21ysLIXiy30UEpW3g+3CU0CWqp7gT+C0mXml5cD58xgvmkq
 sZCS1KfaaEW8BitTHPJGlgJUwQsukUlPaY+LsQY+BZSTUVhjb3kHgwDU2O0nm1+1GDkL
 uO+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn8BSUlpnFa18EBTdPoKbBx9Dhyyq0LWIYeNAF17HBc+VXCD1wTKpfW8hxY9ChCROWxmkwSOHitgWg@nongnu.org
X-Gm-Message-State: AOJu0YwoB5WLBU5LCiayaU8k6MtRYEErPBa36GKkBlGEN8b4ZU5ghxqs
 ZqKFmA+A5ktpvF/djch9VIouuPyWda26JCRUlBEq2FXjeU5S5r2ICI1SofCt8QM=
X-Gm-Gg: ASbGncvl8qn0FwSVxz1JNP3iryv4hFe8vxRpakFgy5wN4KhwbQXWQNCb3W6CcYlMqQ0
 yLEYnO68yJOjwmcTzzZJEYPuAJwFreuLPhF+tdtFkLJfvydbeJvrqf5Ul3AvxWWXcnt8Hcvuewg
 VhLYfFlZ45ZObh6PV/Oa+oBwgAcHtVLNaQ++J4+EqHfIFeRl+IHBlSAene+FQ0S616zr0ngK62j
 gYTSrB2bRrDEdvdh9EKds0iuBIlYYcBD9tBt1OnhROQxAtx/4evWBZaKIPd6BnWpw==
X-Google-Smtp-Source: AGHT+IFwE9VXDaSVBaL4+4Hg+zw8Cu7rxBavC+ub9E/n8fTSutGPKiRrIt1GWKIhw49II6ggJnhlBg==
X-Received: by 2002:a7b:c04f:0:b0:434:882c:f746 with SMTP id
 5b1f17b1804b1-434882cf8a2mr133453215e9.17.1732598701431; 
 Mon, 25 Nov 2024 21:25:01 -0800 (PST)
Received: from [192.168.69.146] ([176.176.143.205])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434a0c889c5sm45564475e9.2.2024.11.25.21.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 21:25:00 -0800 (PST)
Message-ID: <219be312-4acc-46c9-8a56-16e5cb483ae4@linaro.org>
Date: Tue, 26 Nov 2024 06:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 0/3] hw/boards: Try to make sense of
 MachineClass::no_sdcard flag
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
References: <20241125181420.24424-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241125181420.24424-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 25/11/24 19:14, Philippe Mathieu-Daudé wrote:
> Invert MachineClass 'no_sdcard' flag logic and rename it
> to 'create_default_sdcard_drive' to make sense of this
> default value applied to all machines. No logical change
> intended.
> 
> Philippe Mathieu-Daudé (3):
>    hw/boards: Convert no_sdcard flag to OnOffAuto tri-state
>    hw/boards: Explicit no_sdcard=false as ON_OFF_AUTO_OFF
>    hw/boards: Rename no_sdcard -> create_default_sdcard_drive

I expect next steps to be:

  - Remove nonsense create_default_sdcard_drive (where
    machines don't have SDHCI devices)
  - When drive uses IF_SD, assert machine expose a SDBus
  - Explicitly create default drives for SDCards in
    each machine_init?
  - Remove MachineClass::create_default_sdcard_drive field
    and code handling default in system/vl.c

