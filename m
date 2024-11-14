Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D092D637DF
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 04:11:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBRCA-000382-5O; Wed, 13 Nov 2024 23:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tBRC8-000371-Av
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 23:11:00 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tBRC6-0003Xa-BM
 for qemu-riscv@nongnu.org; Wed, 13 Nov 2024 23:10:59 -0500
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-7242f559a9fso138419b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 13 Nov 2024 20:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731557457; x=1732162257; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dUfD1eRm5TcDJOTQqmwAsohRECtZQFdTOirjQrvjgGY=;
 b=PyzZ+DD2QzWkscTVu6U7H1WqDe8xKK1QKtG0INFI0Wyl0Lf0xGjOkQcM7QFe4VugmH
 kC2VBb71xvektygnVcILP+Khy0YD3FxQANJk2yQkLgu7ce67FPpFMFQoHF4D1Rhhwy7d
 2r89ZFdUww7of5SvUialoSiO4p7PT1r+Br8kc7SKK+yWFvvIpiFXRSPHszCV0Pd07FHb
 7Dq3Tv/Dtmnw7p3MmlzYUNw5zigg7FCV8zXoACw59W2llxkwJU8dHUbTY/zIRxVl60OX
 RC3PxIg1CPMkGaSOKtaEXoZPwzMEQFgjMLc/tzpLdT9ASht5lqrWE5H/xnM3qtQl1T6m
 tHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731557457; x=1732162257;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dUfD1eRm5TcDJOTQqmwAsohRECtZQFdTOirjQrvjgGY=;
 b=rzp0kq7KTIKEyqovdSl+v3t+ndFdaPOfFlsxa6eZ6JKGK3s0b23DYKxZcLWcl0OtVd
 tcvE+XeZvX/B+GmI3APDluPA7XIHzjfAFXq3JEIRTuGTw4uTbZFD2F5x6vjn/2axpuLw
 25mFMJhEB3oYhlOczOvi79SL0bFLsx0np0S+PNQdHdVQmRObdAJpEhfyCkD2/P5VpVNi
 3rHrTdbiuAl/R3Db2KNHxXkcywsNOtjlzW2mbc8WpUo2zae7q8rYxIj0xXEBc/8IpOmh
 rwjOMoAKqOBWsFdG2rO+rVQeMp5geq8WilvLvBjz0TnhlQT6ABZGaaiMFg5PeMsdoxYD
 rWpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMyniy1ChME2CaTkKQxbkU5beNGW//nrA+i4SHKLbpfvwu13kyp6Gkobdru48umnFo0cNry/WW8ZNq@nongnu.org
X-Gm-Message-State: AOJu0YwsWeTF3PfRdWS12RaxSG7Tc9weMFJ99ax+DIb6TJAEmyw1QoFp
 s621Oqd3tB8oOjXuIhTwx5gSnJwh8fi9iQo5HgaR07ZKz3kvlIMrIj9PI4FQHO8=
X-Google-Smtp-Source: AGHT+IFV8GU0vRgpC7rvgSW3HjkWqYkbdmA4F9HNXwW3cVfPlTXRapZWT7FJiBW5/IC3RpuUKZsiUA==
X-Received: by 2002:a05:6a00:23c4:b0:724:603f:1f9c with SMTP id
 d2e1a72fcca58-724603f20abmr3896225b3a.16.1731557457003; 
 Wed, 13 Nov 2024 20:10:57 -0800 (PST)
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net.
 [216.180.64.156]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7246a6e7e43sm243876b3a.70.2024.11.13.20.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 20:10:56 -0800 (PST)
Message-ID: <8406e329-5b09-4960-b5b7-baca62d3747c@linaro.org>
Date: Wed, 13 Nov 2024 20:10:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] exec/translation-block: Include missing
 'exec/vaddr.h' header
Content-Language: en-US
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
 <20241114011310.3615-4-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241114011310.3615-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

T24gMTEvMTMvMjQgMTc6MTIsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPiAn
dmFkZHInIGlzIGRlY2xhcmVkIGluICJleGVjL3ZhZGRyLmgiLg0KPiBJbmNsdWRlIGl0IGlu
IG9yZGVyIHRvIGF2b2lkIHdoZW4gcmVmYWN0b3Jpbmc6DQo+IA0KPiAgICBpbmNsdWRlL2V4
ZWMvdHJhbnNsYXRpb24tYmxvY2suaDo1Njo1OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg
J3ZhZGRyJw0KPiAgICAgICA1NiB8ICAgICB2YWRkciBwYzsNCj4gICAgICAgICAgfCAgICAg
Xg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxt
ZEBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gICBpbmNsdWRlL2V4ZWMvdHJhbnNsYXRpb24tYmxv
Y2suaCB8IDEgKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZXhlYy90cmFuc2xhdGlvbi1ibG9jay5oIGIvaW5jbHVk
ZS9leGVjL3RyYW5zbGF0aW9uLWJsb2NrLmgNCj4gaW5kZXggYTZkMWFmNmU5Yi4uYjk5YWZi
MDA3NyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9leGVjL3RyYW5zbGF0aW9uLWJsb2NrLmgN
Cj4gKysrIGIvaW5jbHVkZS9leGVjL3RyYW5zbGF0aW9uLWJsb2NrLmgNCj4gQEAgLTksNiAr
OSw3IEBADQo+ICAgDQo+ICAgI2luY2x1ZGUgInFlbXUvdGhyZWFkLmgiDQo+ICAgI2luY2x1
ZGUgImV4ZWMvY3B1LWNvbW1vbi5oIg0KPiArI2luY2x1ZGUgImV4ZWMvdmFkZHIuaCINCj4g
ICAjaWZkZWYgQ09ORklHX1VTRVJfT05MWQ0KPiAgICNpbmNsdWRlICJxZW11L2ludGVydmFs
LXRyZWUuaCINCj4gICAjZW5kaWYNCg0KSSdtIGEgYml0IGNvbmZ1c2VkIGJ5IGNvbW1pdCBt
ZXNzYWdlLCBidXQgaXQgc2VlbXMgdGhhdCB0aGlzIHNlcmllcyBoYXMgDQpzb21lIGNvbW1p
dHMgdGhhdCB3aWxsIG5vdCBjb21waWxlLiBJcyB0aGF0IHNvbWV0aGluZyBhY2NlcHRhYmxl
Pw0KDQpJZiBpdCdzIG9rLA0KUmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJy
aWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCg0K

