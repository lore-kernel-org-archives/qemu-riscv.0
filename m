Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4A7C02193
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 18:12:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tfNO4-0008Nl-AP; Tue, 04 Feb 2025 13:11:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNNn-0007j7-3z
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 13:10:49 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNNj-0007cF-Nz
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 13:10:46 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so59024155e9.3
 for <qemu-riscv@nongnu.org>; Tue, 04 Feb 2025 10:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738692641; x=1739297441; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZlE4fNYmUStQOF+rAXXEDQvHrAQjzPrrJWt5KEXXmgw=;
 b=crBb+v0yWDqdCQF38FVc5mk+JBTPjIuXGKWDIVz06Nmws/NcBh6sPxwdKC9x3aVBxr
 B3Qd8rli/OMPvU7qBnXP+DcYf7Ui/mEB8QLKQ+JwrQKLTP6Cm9aXG2qw8vEbJe26KvK1
 3U8FQFu6a9WlovjMW9ZPbSL3zv5v6CegFVKncfXCOeOQCBkgokat4HHc9bokvnVRqtRh
 m9PjowIYgV4tAzn0vCIDEif6h7nFhT1M3kA7L0hLjYjGKrDbdJYn8LCCEKjfpNWSVPoA
 TAvB5uK499Sd2Xkcl5dZPB0t3flmiOuAWFyASUDQaaFcVuc89l6oNyht5ChF6dCZoeiq
 ugxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738692641; x=1739297441;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZlE4fNYmUStQOF+rAXXEDQvHrAQjzPrrJWt5KEXXmgw=;
 b=CSPDU3n39gzfUSIsDO7ajJdqQtgwUuXhsAo5T36bymGAkIW1I+NypmW94UfqBqtVSs
 fWwy+fkJFkFt/mMrUy93+1DQK8WUc7xlZ6R0IWFsYhmhDlsjAnwKKnJGYGbU4OVoypOD
 wy/4hh1d7FZNY5BRdbupSedFY/E8mqEDtLOckDfSNQQREwYeN3ygGY74uGWyldE6hUtL
 bzc4/qbeVOo18UhPGId+1rHtiQqIaYEeXJ+RKHvFaQat5t35P1JyRnCqQGNDRpmbqUs+
 bJnMHibRYn4J8Rf2Z8d9gNOUjw5fFfeXgMc9oFjjma9YvCzlTtNd0TjRBFhx+vyPer/b
 ETOQ==
X-Gm-Message-State: AOJu0Yzq+LUJe4GvzLmxFA7wiodAE/KCNedtZsK2qgo57K6cATam08iW
 nrLpkTrWZd+oAPOfTt/IZohNEcI5Jp+Wwf/wANn2Bj8wlUD45yy90W4318LaznYJ6U/vtDwR4bi
 yCyw=
X-Gm-Gg: ASbGncu13GkJAuSHIpMRQ+G9RBhLicO3aN3wmONLTPcalxGpot3fpY226Ng2q0ZhZnn
 qLIWmk+RYKNQ1emVpqldXBGgoW2qEa8v8d4NWJ/aymwP1XmZuHEc/PNd7JMHr9mz/Iw0Ne4Slp6
 v+F3qDC8fb7+VSfOwke+6QCnxIFZ/PZTm2G2q61BsJtDHzOt0jQWmIDaDIe9Oi4cOZZV1ZUmywY
 Keh6yQXKdlNYVWhu+a/OWeDgmnvuWOUpnYDdl2wh3eH+jalKUrLJfk3MnWsJNsr5pjSzhXaNUGI
 K1fgApIOUZy+cXiwxMO7owx+B1Xb67xAtVdPQkpf62WkKBvOFDHphhaUJaA=
X-Google-Smtp-Source: AGHT+IFxZNVmxFf+mZ5sRNUQMaaf/RLjUDYZ1foqcJeEkgROcJokkvylsbTG319ol953lldio1PF4w==
X-Received: by 2002:a05:6000:1a8b:b0:385:ecdf:a30a with SMTP id
 ffacd0b85a97d-38c51b63ed0mr24849695f8f.33.1738692641616; 
 Tue, 04 Feb 2025 10:10:41 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc13151sm231467285e9.1.2025.02.04.10.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 10:10:41 -0800 (PST)
Message-ID: <af58daa1-45a0-4252-be09-38be43233db0@linaro.org>
Date: Tue, 4 Feb 2025 19:10:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] hw/boards: Try to make sense of
 MachineClass::no_sdcard flag
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20250204180746.58357-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250204180746.58357-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 4/2/25 19:07, Philippe Mathieu-Daudé wrote:
> Invert MachineClass 'no_sdcard' flag logic and rename it
> to 'create_default_sdcard_drive' to make sense of this
> default value applied to all machines.
> We use the OnOffAuto tri-state to catch implicit default
> values. Then we toggle the logic and remove invalid uses.
> No logical change intended (except the assertion added).
> 
> Philippe Mathieu-Daudé (8):
>    hw/boards: Convert no_sdcard flag to OnOffAuto tri-state
>    hw/boards: Explicit no_sdcard=false as ON_OFF_AUTO_OFF
>    hw/boards: Rename no_sdcard -> auto_create_sdcard
>    hw/boards: Remove all invalid uses of auto_create_sdcard=true
>    hw/ppc/e500: Remove empty ppce500_machine_class_init()
>    hw/arm: Remove all invalid uses of auto_create_sdcard=true
>    hw/riscv: Remove all invalid uses of auto_create_sdcard=true
>    hw/boards: Ensure machine setting auto_create_sdcard expose a SD Bus
> 
>   include/hw/boards.h        |  2 +-
>   hw/arm/cubieboard.c        |  1 +
>   hw/arm/integratorcp.c      |  1 +
>   hw/arm/mcimx7d-sabre.c     |  2 ++
>   hw/arm/npcm7xx_boards.c    |  5 +++++
>   hw/arm/omap_sx1.c          |  2 ++
>   hw/arm/orangepi.c          |  1 +
>   hw/arm/realview.c          |  4 ++++
>   hw/arm/stellaris.c         |  1 +
>   hw/arm/vexpress.c          |  2 ++
>   hw/arm/xilinx_zynq.c       |  1 -
>   hw/core/null-machine.c     |  1 -
>   hw/riscv/microchip_pfsoc.c |  1 +
>   hw/riscv/sifive_u.c        |  1 +
>   hw/s390x/s390-virtio-ccw.c |  1 -

We can now easily see the machines automatically creating SDcard:

$ git grep 'auto_create_sdcard = true'
hw/arm/cubieboard.c:125:    mc->auto_create_sdcard = true;
hw/arm/integratorcp.c:691:    mc->auto_create_sdcard = true;
hw/arm/npcm7xx_boards.c:484:    mc->auto_create_sdcard = true;
hw/arm/npcm7xx_boards.c:497:    mc->auto_create_sdcard = true;
hw/arm/npcm7xx_boards.c:510:    mc->auto_create_sdcard = true;
hw/arm/npcm7xx_boards.c:523:    mc->auto_create_sdcard = true;
hw/arm/npcm7xx_boards.c:536:    mc->auto_create_sdcard = true;
hw/arm/omap_sx1.c:219:    mc->auto_create_sdcard = true;
hw/arm/omap_sx1.c:238:    mc->auto_create_sdcard = true;
hw/arm/orangepi.c:124:    mc->auto_create_sdcard = true;
hw/arm/realview.c:418:    mc->auto_create_sdcard = true;
hw/arm/realview.c:439:    mc->auto_create_sdcard = true;
hw/arm/realview.c:458:    mc->auto_create_sdcard = true;
hw/arm/realview.c:478:    mc->auto_create_sdcard = true;
hw/arm/stellaris.c:1444:    mc->auto_create_sdcard = true;
hw/arm/vexpress.c:806:    mc->auto_create_sdcard = true;
hw/arm/vexpress.c:822:    mc->auto_create_sdcard = true;
hw/riscv/microchip_pfsoc.c:653:    mc->auto_create_sdcard = true;
hw/riscv/sifive_u.c:727:    mc->auto_create_sdcard = true;


