Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B1EC4345F
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 19:35:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s0RL3-00079D-Do; Fri, 26 Apr 2024 15:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1s0RKv-00077Z-CY
 for qemu-riscv@nongnu.org; Fri, 26 Apr 2024 15:34:21 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1s0RKs-0001Hv-J7
 for qemu-riscv@nongnu.org; Fri, 26 Apr 2024 15:34:21 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2a2d248a2e1so2689588a91.0
 for <qemu-riscv@nongnu.org>; Fri, 26 Apr 2024 12:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160055; x=1714764855; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m+Ylf8YtrrHtw/DdiVzN8IRtPB4Fe4ozL1NRbrzq8l4=;
 b=HTjEzB1U+zxBx0WSUOQ6kP9Ok91Xl1DoD9FlDEaaBd8Euj9Zfi85XnkhuRZ9hPFtEU
 ziPSM50yZDOJQsR1QxlCO/tvq4+QzFTmTzwOkehoOFkWnh+u2V6Y4QhHD8RaG+w0iAla
 xcPzF2+pSaB3MyQfNSgC9/ZZ0PbsFwwGZ66Zo3nPbvJYmVv3elL6Scv4iWCuVvEn01lF
 Wy0USR3peAjtemHaC7FKP3oIPK1m2a6onUYdH8R4pnCMl+8K3862/b/6Rat6SHA5c3E2
 M7fPlqaYy8yXC65xqTU8Vf3AgMgrDZ4A1vhAptAP5EqskOyOzIteaGeUiBDk7VSH/Vk6
 VBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160055; x=1714764855;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m+Ylf8YtrrHtw/DdiVzN8IRtPB4Fe4ozL1NRbrzq8l4=;
 b=It7Gdl5HZ8H1JDjg9GtxIIwKcgbNPEh+hsKb0BewWFT0x283VeduzSKv72CD6ZkcFt
 cBkAg2Br63Vj0E+jhXiqUXStvj/GpxIcuEQX+A3vhRJCA24fvThxkb1VgYPeZujFF4jO
 y4Sov/xxDgrC7wzPtGl/fPGW2FhnpzFZnvp+TUY9DySTYgF5CRzggNhRG+pGt80ekxoY
 Zc+RJQpzd+CzPBk7U0dw2bGyIHqMP2WvWAIa3qh8rfxncJqEFT4aRpVzkWR9ydi/j5Ot
 SNkHCh7hOKkrA1eQAKQ8JrqXmnf+eyFwUdGHgz1tNfOdMNTk2AhG9/uZDZyTVbO9Ur6X
 jw/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjjOhSjNZ67pGfpkwUefrqEFRKa8KsLvoHwmSE8eWPNc1/XJ8iYWdIEkUk2r6R+kN0RQETUy1Y+S6zSC14D+uepWJs/ow=
X-Gm-Message-State: AOJu0YybcMLaZdRrceOR0HWpKLy/lY7lD2AAbjojlith/hvmMALETmik
 KiB0W6A7p0mKvEQDE2KxU4mdaPuOaj5SO0+d00p62lMt4FlghRHj/XUlmSC9E68=
X-Google-Smtp-Source: AGHT+IEeTVMIF4CQktUYMKbZ446pl1MS5mi6qVDru/JGYGVK2QrZIOnaDhzXbOAdfjdHnan3iUGU3Q==
X-Received: by 2002:a17:90a:3d4e:b0:2a2:faf4:71da with SMTP id
 o14-20020a17090a3d4e00b002a2faf471damr852171pjf.10.1714160055121; 
 Fri, 26 Apr 2024 12:34:15 -0700 (PDT)
Received: from ?IPV6:2604:3d08:937d:c610::abdb? ([2604:3d08:937d:c610::abdb])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a17090aac1000b002a27132ac02sm14900680pjq.2.2024.04.26.12.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 12:34:14 -0700 (PDT)
Message-ID: <6a4c2b81-ffea-437c-aa96-d96d009f3a1c@linaro.org>
Date: Fri, 26 Apr 2024 12:34:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/24] plugins: Include missing 'qemu/bitmap.h' header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-19-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240418192525.97451-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102d.google.com
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

T24gNC8xOC8yNCAxMjoyNSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+ICJx
ZW11L3BsdWdpbi5oIiB1c2VzIERFQ0xBUkVfQklUTUFQKCksIHdoaWNoIGlzDQo+IGRlY2xh
cmVkIGluICJxZW11L2JpdG1hcC5oIi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBl
IE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICAgaW5jbHVk
ZS9xZW11L3BsdWdpbi5oIHwgMSArDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9xZW11L3BsdWdpbi5oIGIvaW5jbHVk
ZS9xZW11L3BsdWdpbi5oDQo+IGluZGV4IDEyYTk2Y2VhMmEuLjQxZGI3NDhlZGEgMTAwNjQ0
DQo+IC0tLSBhL2luY2x1ZGUvcWVtdS9wbHVnaW4uaA0KPiArKysgYi9pbmNsdWRlL3FlbXUv
cGx1Z2luLmgNCj4gQEAgLTEzLDYgKzEzLDcgQEANCj4gICAjaW5jbHVkZSAicWVtdS9xdWV1
ZS5oIg0KPiAgICNpbmNsdWRlICJxZW11L29wdGlvbi5oIg0KPiAgICNpbmNsdWRlICJxZW11
L3BsdWdpbi1ldmVudC5oIg0KPiArI2luY2x1ZGUgInFlbXUvYml0bWFwLmgiDQo+ICAgI2lu
Y2x1ZGUgImV4ZWMvbWVtb3BpZHguaCINCj4gICAjaW5jbHVkZSAiaHcvY29yZS9jcHUuaCIN
Cj4gICANCg0KUmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZp
ZXJAbGluYXJvLm9yZz4NCg==

