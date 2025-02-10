Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D24DC02198
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 20:38:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thaXD-0003Jg-4K; Mon, 10 Feb 2025 15:37:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thaWt-0003Bg-9f
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 15:37:25 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thaWq-0002mU-KN
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 15:37:18 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38dc8b5bb0bso2053735f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 12:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739219834; x=1739824634; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RC7sHgzHavW3ol4mYW8u376+AF+In7fWDQ+2UaL7XNw=;
 b=eSoVgPOO1mnK0I5zsLVBAnGMClciaI+TvR16m7kiF6KUV3q+C4LqhC/7LbivQkA/zO
 JdTBKO+OIaYcBuXEPqizVqWnDZdgzs37gEp7NFn8BvH/e3fznPr6Tble+FsmN0bfo55C
 3D5cS91ZzZN1enfPM9f8lue6o+V9u/3zjS9B2WizGMZe3VeaxtSR22vMdyxDxvBkue6Z
 vDN4goxflGV7ApfiLoFMD4Of8NYgyXNKZQCyuaTThC69gnHWcNYvmyFt4NtuKN+/k04N
 JHQuGnIU79vgaNRNOBcvHiXhcrMvEB/sv7uGBSHmMHLDf60YGdQr4yJ1kGsXZNGeufb4
 F2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739219834; x=1739824634;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RC7sHgzHavW3ol4mYW8u376+AF+In7fWDQ+2UaL7XNw=;
 b=LNqXWt62UxHZkNxhrL+pirMvnAaOgMVyB3vSztRUzj3MNuef7OrH6yJxVCglz1y9rs
 1LxvOFz+w751+NxiZ3V6KM4QJxP1JCm/pJHEsmYYVI1sCl7d5kJ+93ga4nWx534Iw4zk
 UlYELMoZ1ZUeskLxZ8V5fbcZj+NOeYNr1okk7KB0AidfQsH3O0IQffGQA9GVFWvuoFhz
 HZwiDwvk9Y80RpqJvH2u3i0fuaXJILJnFIYvonq6dWJ4+Gs2UQrf2aoROTHmUjpZU8if
 Z2gITzSwT4buzVkZIMhlyk/NGpZSO9bx5KensROyTH6pBXpwqlfQoyede4Q6TeewEvgW
 y9iA==
X-Gm-Message-State: AOJu0YyR6rbtWLcjr0kmnMBPvfQY6FjWcf/JU3VRHlxXlLrPKbbr+vSw
 Far15p36S9DmCcFWiP6QBgfC9GQ3sY0p1I3e1bpp72QJYfVVZTa8SAPw5MjA0cRXwBA/nsPredy
 W/qU=
X-Gm-Gg: ASbGncsMNccGlR7WbBWjQct5IPMRP5hVO6d5u1RGik03Y41bX/35BXAaa4hWhy1EqU6
 y0ath6v4fioq5CWZGxmFCTVfJEIcH1/OFV5TyZNIkRB5LDcyIJ0kGlJlmbS8vYF9003qpJG+ytA
 uAyBCIK9VL9F9/OAG6PRx0rgIK7MFJ5RWGEUT1oZe/weasWFUIVMlVHgNVaztRhIkLrRYRvUjad
 c5QG252/gzjO6qktCXH1+WYGQcYMo9yx1XplsjiOYZVngp53dU4+J7LCdWhwL4GxdqBqaUzqBQm
 xJDBb5xKKrEpDnau8lk+oxbKS0VdKHh3D+kSwVziAXPys8rdlYIJAV5nk3g=
X-Google-Smtp-Source: AGHT+IEMmaejRpJee6sHI97Mdi02sZfrrigF/m7Y1KeAMkInsoOipuqOaQr53gHPFy/JQeXkTYWTMw==
X-Received: by 2002:a5d:6d8a:0:b0:38d:dfdc:52a2 with SMTP id
 ffacd0b85a97d-38ddfdc546amr4461506f8f.40.1739219833782; 
 Mon, 10 Feb 2025 12:37:13 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d94d685sm189934845e9.13.2025.02.10.12.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 12:37:13 -0800 (PST)
Message-ID: <76bcf481-2175-47a0-ab28-f67695e27ee8@linaro.org>
Date: Mon, 10 Feb 2025 21:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] hw/boards: Try to make sense of
 MachineClass::no_sdcard flag
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
References: <20250204200934.65279-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250204200934.65279-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 4/2/25 21:09, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (7):
>    hw/boards: Convert no_sdcard flag to OnOffAuto tri-state
>    hw/boards: Explicit no_sdcard=false as ON_OFF_AUTO_OFF
>    hw/boards: Rename no_sdcard -> auto_create_sdcard
>    hw/boards: Remove all invalid uses of auto_create_sdcard=true
>    hw/arm: Remove all invalid uses of auto_create_sdcard=true
>    hw/riscv: Remove all invalid uses of auto_create_sdcard=true
>    hw/boards: Ensure machine setting auto_create_sdcard expose a SD Bus

Series queued including Markus' description update from v2, thanks!

