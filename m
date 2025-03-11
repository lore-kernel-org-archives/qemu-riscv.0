Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70841C282EC
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 15:14:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ts1Ix-0000QA-BE; Tue, 11 Mar 2025 11:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ts1Iq-0000Ot-Ow
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 11:13:57 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ts1Il-0004Xn-Af
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 11:13:54 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-22401f4d35aso100406765ad.2
 for <qemu-riscv@nongnu.org>; Tue, 11 Mar 2025 08:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741706028; x=1742310828; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=86STdfu7sbDSkiwCii3eDdimSERy6/v6Vuyj4krzCSs=;
 b=w6HzDLYyzacHZifO4YDSqj//vC6Q7NdmQERYLp7uKhbqbEcWXGuZ1R0cXzxwtqcEAA
 bvcXO+CG9d+Vp+GDxW8TEvzm4UaXiZ9nBu1v8UXUugBua+K7ZzmqKXWQHd8Go3ZOI/Gs
 AUE0I6SVlsSNrmWfKFb5LSMV1UBXxltHbnV3yBcP4fzWzuQfMJ2sTfmJv2AUAIbo+I9j
 pJF0jCbT3pITkf8OHZDPKs2Suyrtj9M8Bke7SnGWM2ZHZQa36BvYW96iSK6NXkktryGS
 jmR3IxP8f04o0N7Ol2IAqPwh82cuWAqt5WMxO427RP3PXRPBQT3XklJomxfip+y4+Nhj
 aKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741706028; x=1742310828;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=86STdfu7sbDSkiwCii3eDdimSERy6/v6Vuyj4krzCSs=;
 b=t5TpkKJ4e4sv/QnDhBdmnFPZYL9LQDNSMH4EHmOBXgwJIvdJtIferi0SUskZvdWcYc
 XmEVtCP2QOhHtHxTWr0WUEZjHAs78yDb6ELuZT2zgP1gi+/L1b87tss+Td1HbfxMTglc
 vuDF/kfhC85FD6ZVcFDPwTdMbxy9nq9Dm9NYuygSe7WYJVbmPxRbwfdxL6ih+ty02u/j
 qTm0J3WzQCYE60buVAh7XRxqu0/9pqc72WivRsKlMeHN4ifogwuo1L72eUTdEHPbvGWs
 M5QxImnPuAHy4/6Ttq7BKT7s/H47PrdZa+1V3wfGi83cIVMFj88Vcgip6uJ0ofUbsU7U
 aqhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF5G91ZO4YWjosoKB1w1Dwm5rqE/S6SyLDwju5upqj1JP206gDy0+2Gig5d08rGZRKZotVR20fd097@nongnu.org
X-Gm-Message-State: AOJu0YxFtQcEkx9YgC6ma9+VFFRvWmqFyxlazFHA9ESxRqSfF83i2Cy5
 kVV2wVryqtSunrRBOCQ+KBoVEqI+3DpIfHd3zPSZmYc8MeIyX9NO5xBLSnMVZ/s=
X-Gm-Gg: ASbGnct3hoRTGlRKcuzgQlaR6TSeqSehInIUO0FDyicCKWYyMfY7Md6RIa+7xNWn3tj
 68nZ9AtZShStWHYl/SsdcDvjfSU1U21wQE7N4Zn7kU9lmGBxY6Cqs2wJutXqIhNvaaFG+ZnX/uN
 MYoVxmRVoaJNEwyqHZtSCQMS7XOo/ArL14C/71CDypDCOqAw9QbM+1ZPVSK3KPtL9hlw6p0QtTz
 aFE2gyfPR11ZMyk3l9NzhP4Mk+hoAIHK++HQmP7yY/ZvTnt9iEzDKCgPhP8nX8CCHw0YZX6exbd
 KgcmhQHhuSFY5SE+a0taYp8oGnmDU0eoWlttcrUBhLZgK0oANAB5Hfd01Q==
X-Google-Smtp-Source: AGHT+IEZ5MBTaCdyWT08MqOAa8+LxkV8QowtXuqs/UZhCfCdiX14jnvavHT21U00/SV+pE0VLr2heQ==
X-Received: by 2002:a05:6a00:10d5:b0:736:47a5:e268 with SMTP id
 d2e1a72fcca58-736eb7b363bmr5355533b3a.1.1741706027670; 
 Tue, 11 Mar 2025 08:13:47 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736cb466a6csm5505816b3a.165.2025.03.11.08.13.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 08:13:47 -0700 (PDT)
Message-ID: <72e938d4-fb4e-4be4-9a34-7b0321ee2554@linaro.org>
Date: Tue, 11 Mar 2025 08:13:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] exec/memory-internal: remove dependency on cpu.h
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org, manos.pitsidianakis@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
 <20250311040838.3937136-9-pierrick.bouvier@linaro.org>
 <9f92a783-3826-4a06-9944-0e0ec5faccc9@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <9f92a783-3826-4a06-9944-0e0ec5faccc9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62e.google.com
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

T24gMy8xMS8yNSAwMDoyNiwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDExLzMvMjUgMDU6MDgsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBSZXZpZXdlZC1i
eTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxp
bmFyby5vcmc+DQo+IA0KPiBNaXNzaW5nIHRoZSAid2h5IiBqdXN0aWZpY2F0aW9uIHdlIGNv
dWxkbid0IGRvIHRoYXQgYmVmb3JlLg0KPiANCj4+IC0tLQ0KPj4gICAgaW5jbHVkZS9leGVj
L21lbW9yeS1pbnRlcm5hbC5oIHwgMiAtLQ0KPj4gICAgMSBmaWxlIGNoYW5nZWQsIDIgZGVs
ZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZXhlYy9tZW1vcnktaW50
ZXJuYWwuaCBiL2luY2x1ZGUvZXhlYy9tZW1vcnktaW50ZXJuYWwuaA0KPj4gaW5kZXggMTAw
YzEyMzdhYzIuLmI3MjlmM2IyNWFkIDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9leGVjL21l
bW9yeS1pbnRlcm5hbC5oDQo+PiArKysgYi9pbmNsdWRlL2V4ZWMvbWVtb3J5LWludGVybmFs
LmgNCj4+IEBAIC0yMCw4ICsyMCw2IEBADQo+PiAgICAjaWZuZGVmIE1FTU9SWV9JTlRFUk5B
TF9IDQo+PiAgICAjZGVmaW5lIE1FTU9SWV9JTlRFUk5BTF9IDQo+PiAgICANCj4+IC0jaW5j
bHVkZSAiY3B1LmgiDQo+PiAtDQo+PiAgICAjaWZuZGVmIENPTkZJR19VU0VSX09OTFkNCj4+
ICAgIHN0YXRpYyBpbmxpbmUgQWRkcmVzc1NwYWNlRGlzcGF0Y2ggKmZsYXR2aWV3X3RvX2Rp
c3BhdGNoKEZsYXRWaWV3ICpmdikNCj4+ICAgIHsNCj4gDQoNCk5vIGRpcmVjdCBkZXBlbmRl
bmN5LCBidXQgd2hlbiBhIGNvbW1vbiBjb2RlIHdpbGwgaW5jbHVkZSB0aGF0IChsaWtlIA0K
c3lzdGVtL21lbW9yeS5jKSwgd2UgY2FuJ3QgaGF2ZSBhIGRlcGVuZGVuY3kgb24gY3B1Lmgg
YW55bW9yZS4NCkkgY2FuIHJlb3JkZXIgb3Igc3F1YXNoIGNvbW1pdHMgaWYgeW91IHByZWZl
ci4NCg==

