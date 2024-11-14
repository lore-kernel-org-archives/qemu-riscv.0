Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE61D637DF
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 04:09:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBRAS-0001Nh-8X; Wed, 13 Nov 2024 23:09:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tBRAQ-0001N1-JP
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 23:09:14 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tBRAN-0003Am-RR
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 23:09:14 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-20ce5e3b116so1209385ad.1
 for <qemu-riscv@nongnu.org>; Wed, 13 Nov 2024 20:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731557349; x=1732162149; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lQ0+qGxRd5qqh2SgUKXZ9OXZcju5M5t/HuXAsk9/oKA=;
 b=VsULW026FAnEh25U5c388onqI9w36HDP407PXcG5RLGkOlNLlFEF0X8k44AZxwtJOQ
 rYpe9Kwe+MkjxkcC1MHLL80ilUT48oRSLN1xQFa74q1562qGHKU/kK9rR7Y8x/UH1cWG
 LaB/H6yXNUeTYv68uvuAkgsV1rdVURkn7JerUADtBS2QCMuV5RIdB2Y6v/4/dkGQgaza
 vdVHrsolD+f774ymzUnBa5oaLzKVuKntuJj7UVUdeYJ9/PdI0Jj50W9DQTSt34mUAEGM
 hE4iVKXtO+3CHF/Kbhwgn1G2y9qkyJkD0vs+KQC1c8+qjdtuChGkNSqFcjiFRw9grIUq
 lIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731557349; x=1732162149;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lQ0+qGxRd5qqh2SgUKXZ9OXZcju5M5t/HuXAsk9/oKA=;
 b=ETl7Q2vE/bIf0Dt7bontA5SY5IVpAjeU068oPVzZZ/72LhnwrjfQarLSt2M4OKDRCQ
 DRkz9fBEzj8m4P05AzMi6yumFLA5I+pmgRrV41hYB9PbWnu/utH5YiBImAN37Do1pSX+
 lDqW6S4WjEl75kdP9ZD+tdA5+h236pSJQQ6S948wyQCKnQ5UP0MMByojX0LNFEmLhAS3
 ZYphVSchPxx1OvQgO6pzBWtK/ZldVcNT0+6vMDaf+hICWV7zdTvteBDhmREmGKR44eNe
 Z5oF0RetVMG9pNxlwFEZrXG/U7dQyTzrKW/nlTZqo3jC8kuhsukfPFnXTO91IVccTMkZ
 yUYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKaIz9vU2txDebNKHMDciilc/GBnCot/IHeNH4nuq25LL0Z2z39OGxNAleAYTPgv0B0R7EHhV2upD3@nongnu.org
X-Gm-Message-State: AOJu0YxFu1KvVt4jEQNq3a3EEbpL0r+oMbvSfJYlxgmIgtY5S2A+OAMd
 BU5oQA6lXAAMwHY3V/fhD2hfXkblMZUJH1WAKnOBVMKsj4acfaKfq/77dLPHBOM=
X-Google-Smtp-Source: AGHT+IGRpDdMGNn5+Vh56sta2pavYv15YctNTQha57Nm1Nt+XPo7thPN40tyPava8u/0xGMN0XSQLw==
X-Received: by 2002:a17:903:2b06:b0:20c:c15c:96ab with SMTP id
 d9443c01a7336-211c50ce7bemr11216025ad.48.1731557349129; 
 Wed, 13 Nov 2024 20:09:09 -0800 (PST)
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net.
 [216.180.64.156]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211c7ce9776sm1360135ad.121.2024.11.13.20.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 20:09:08 -0800 (PST)
Message-ID: <11b3990b-1f62-4e5f-a2c6-db651f11ec7a@linaro.org>
Date: Wed, 13 Nov 2024 20:09:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/24] exec/cpu-all: Include missing 'exec/cpu-defs.h'
 header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, 
 Peter Xu <peterx@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-2-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <20241114011310.3615-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x635.google.com
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

DQoNCk9uIDExLzEzLzI0IDE3OjEyLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToN
Cj4gVEFSR0VUX1BBR0VfQklUUyBpcyBkZWZpbmVkIGluICJleGVjL2NwdS1kZWZzLmgiLg0K
PiBJbmNsdWRlIGl0IGluIG9yZGVyIHRvIGF2b2lkIHdoZW4gcmVmYWN0b3Jpbmc6DQo+IA0K
PiAgICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vLi4vc3lzdGVtL3dhdGNocG9pbnQuYzoy
MzoNCj4gICAgaW5jbHVkZS9leGVjL2NwdS1hbGwuaDozNTY6MTk6IGVycm9yOiB1c2Ugb2Yg
dW5kZWNsYXJlZCBpZGVudGlmaWVyICdUQVJHRVRfUEFHRV9CSVRTJw0KPiAgICAgIDM1NiB8
IFFFTVVfQlVJTERfQlVHX09OKFRMQl9GTEFHU19NQVNLICYgVExCX1NMT1dfRkxBR1NfTUFT
Syk7DQo+ICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgXg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPg0KPiAt
LS0NCj4gICBpbmNsdWRlL2V4ZWMvY3B1LWFsbC5oIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZXhlYy9jcHUtYWxsLmggYi9pbmNsdWRlL2V4ZWMvY3B1LWFsbC5oDQo+IGlu
ZGV4IDQ1ZTY2NzY5MzguLjFjNDBlMjc2NzIgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZXhl
Yy9jcHUtYWxsLmgNCj4gKysrIGIvaW5jbHVkZS9leGVjL2NwdS1hbGwuaA0KPiBAQCAtMTM2
LDcgKzEzNiw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzdGxfcGh5c19ub3RkaXJ0eShBZGRy
ZXNzU3BhY2UgKmFzLCBod2FkZHIgYWRkciwgdWludDMyX3QgdmFsDQo+ICAgI2VuZGlmDQo+
ICAgDQo+ICAgLyogcGFnZSByZWxhdGVkIHN0dWZmICovDQo+IC0NCj4gKyNpbmNsdWRlICJl
eGVjL2NwdS1kZWZzLmgiDQo+ICAgI2lmZGVmIFRBUkdFVF9QQUdFX0JJVFNfVkFSWQ0KPiAg
ICMgaW5jbHVkZSAiZXhlYy9wYWdlLXZhcnkuaCINCj4gICBleHRlcm4gY29uc3QgVGFyZ2V0
UGFnZUJpdHMgdGFyZ2V0X3BhZ2U7DQoNClJldmlld2VkLWJ5OiBQaWVycmljayBCb3V2aWVy
IDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQoNCg==

