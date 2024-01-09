Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B108C47073
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 14:52:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNDT4-00004z-Ge; Tue, 09 Jan 2024 09:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1rND3J-0000Mp-AU
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 09:26:03 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1rND3F-0000gB-0j
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 09:25:59 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40d6b4e2945so36245695e9.0
 for <qemu-riscv@nongnu.org>; Tue, 09 Jan 2024 06:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704810355; x=1705415155; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u1AEBceW3yFlpwPWlgM2E0KSqURLnKs6XEX+Lp2G+N4=;
 b=u6bZSBnjUUGnBrugK1NfyAz/kI6Io3wxc96RzP+EFBwvyeKOwrdHiFfcPS3RwYiCjW
 RYUL9vITwdrDGOGolYqYemHhAjGy1V+WNTQ1hsXFTD6H/z475/WdOSMt5kPmMN6m4YMV
 W0ADA/boDaGZMiD0HjkPOOYBnUR4C9k7UOXF/WL5yIOCJvsdxNxEy6XhhYTWw4jPOsKv
 Nfx6f19DRpLfruG32CJAnrFcuA2bQCr9M76YgFf1IvXOhEULMvRQF76Q4dUkws4XICVR
 KRYLDpW9X3mvppOd+81/9cauLPHVVpKLxXisy9sSYnkhbD41kKUzJfBF2hU1dPdCn2la
 BVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704810355; x=1705415155;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u1AEBceW3yFlpwPWlgM2E0KSqURLnKs6XEX+Lp2G+N4=;
 b=V5uwze8e7xFHNXYXGnkl2FcIMg6BEH3WfAUGXBSYg+Dn3nKerz4H7CuDWXtGnw1A8W
 vkZT79eJ9phk0VCCasGgBn2/zTBg8eEs4p+520M8hu/4P91ynyCDWE6DkI3FGEGnh8lb
 HmnNlo7n1uh9r085hSFZWdugk8x1reEZyBjD0I0+Jod/ktCNoKvskK1D4ZWCtWFcKWiE
 ijmLX7equUUQkCFyeb3G0iBWRTz0HAfXsn/6Mnyk8tSgWsdm1aSG4daT3M0j7LY89f/z
 cFdOuF2tjK/admRCAhSn7H6A2NCC1xMFPOhMFjq6WEszDHN79B1WhglwPlPuMQnj8gmE
 44Bg==
X-Gm-Message-State: AOJu0YzFDFSzbp/jwo4SKYiiLnq9Bwgr1WS1BWscSMfdV45/xHL/jmhc
 gNYfOnC4oRBcphV5tBUrGVeuaQgaeVlhUw==
X-Google-Smtp-Source: AGHT+IHY3kSZpB9bUQ9rZCp+7ar1YHv+53ISVHQsGVm43Q5eEUUT+WQeFBsEeK9v7TycA/Mni84MDQ==
X-Received: by 2002:a05:600c:1c16:b0:40e:470a:d867 with SMTP id
 j22-20020a05600c1c1600b0040e470ad867mr1263182wms.222.1704810355230; 
 Tue, 09 Jan 2024 06:25:55 -0800 (PST)
Received: from [192.168.1.24] ([102.35.208.160])
 by smtp.gmail.com with ESMTPSA id
 ay26-20020a05600c1e1a00b0040e53f24ceasm7614wmb.16.2024.01.09.06.25.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 06:25:54 -0800 (PST)
Message-ID: <e7896134-bf88-4742-bd89-9a80f701206a@linaro.org>
Date: Tue, 9 Jan 2024 18:25:44 +0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 42/43] docs/devel: lift example and plugin API sections
 up
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-43-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240103173349.398526-43-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 09 Jan 2024 09:52:36 -0500
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

UmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJv
Lm9yZz4NCg0KT24gMS8zLzI0IDIxOjMzLCBBbGV4IEJlbm7DqWUgd3JvdGU6DQo+IFRoaXMg
bWFrZXMgdGhlbSBhIGJpdCBtb3JlIHZpc2libGUgaW4gdGhlIFRDRyBlbXVsYXRpb24gbWVu
dSByYXRoZXINCj4gdGhhbiBoaWRpbmcgdGhlbSBhd2F5IGJlbGxvdyB0aGUgVG9DIGxpbWl0
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5h
cm8ub3JnPg0KPiAtLS0NCj4gICBkb2NzL2RldmVsL3RjZy1wbHVnaW5zLnJzdCB8IDYgKysr
LS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kb2NzL2RldmVsL3RjZy1wbHVnaW5zLnJzdCBiL2Rv
Y3MvZGV2ZWwvdGNnLXBsdWdpbnMucnN0DQo+IGluZGV4IGZhNzQyMTI3OWY1Li41MzVhNzQ2
ODRjNSAxMDA2NDQNCj4gLS0tIGEvZG9jcy9kZXZlbC90Y2ctcGx1Z2lucy5yc3QNCj4gKysr
IGIvZG9jcy9kZXZlbC90Y2ctcGx1Z2lucy5yc3QNCj4gQEAgLTE0Myw3ICsxNDMsNyBAQCBy
ZXF1ZXN0ZWQuIFRoZSBwbHVnaW4gaXNuJ3QgY29tcGxldGVseSB1bmluc3RhbGxlZCB1bnRp
bCB0aGUgc2FmZSB3b3JrDQo+ICAgaGFzIGV4ZWN1dGVkIHdoaWxlIGFsbCB2Q1BVcyBhcmUg
cXVpZXNjZW50Lg0KPiAgIA0KPiAgIEV4YW1wbGUgUGx1Z2lucw0KPiAtLS0tLS0tLS0tLS0t
LS0tDQo+ICs9PT09PT09PT09PT09PT0NCj4gICANCj4gICBUaGVyZSBhcmUgYSBudW1iZXIg
b2YgcGx1Z2lucyBpbmNsdWRlZCB3aXRoIFFFTVUgYW5kIHlvdSBhcmUNCj4gICBlbmNvdXJh
Z2VkIHRvIGNvbnRyaWJ1dGUgeW91ciBvd24gcGx1Z2lucyBwbHVnaW5zIHVwc3RyZWFtLiBU
aGVyZSBpcyBhDQo+IEBAIC01OTEsOCArNTkxLDggQEAgVGhlIHBsdWdpbiBoYXMgYSBudW1i
ZXIgb2YgYXJndW1lbnRzLCBhbGwgb2YgdGhlbSBhcmUgb3B0aW9uYWw6DQo+ICAgICBjb25m
aWd1cmF0aW9uIGFyZ3VtZW50cyBpbXBsaWVzIGBgbDI9b25gYC4NCj4gICAgIChkZWZhdWx0
OiBOID0gMjA5NzE1MiAoMk1CKSwgQiA9IDY0LCBBID0gMTYpDQo+ICAgDQo+IC1BUEkNCj4g
LS0tLQ0KPiArUGx1Z2luIEFQSQ0KPiArPT09PT09PT09PQ0KPiAgIA0KPiAgIFRoZSBmb2xs
b3dpbmcgQVBJIGlzIGdlbmVyYXRlZCBmcm9tIHRoZSBpbmxpbmUgZG9jdW1lbnRhdGlvbiBp
bg0KPiAgIGBgaW5jbHVkZS9xZW11L3FlbXUtcGx1Z2luLmhgYC4gUGxlYXNlIGVuc3VyZSBh
bnkgdXBkYXRlcyB0byB0aGUgQVBJDQo=

