Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ECCC282EC
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 15:11:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ts1G1-0006Zk-V9; Tue, 11 Mar 2025 11:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ts1Fs-0006Tz-DN
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 11:10:52 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ts1Fq-0003ax-Nr
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 11:10:52 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-225a28a511eso9117385ad.1
 for <qemu-riscv@nongnu.org>; Tue, 11 Mar 2025 08:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741705848; x=1742310648; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cQwJl5AaMpNuj13k4T9FN6aD7KIBuzBDEK+lwo9Ext8=;
 b=pbXfD0qAYuFLrZ8hNk7TNFIBcY0WCnhg6RtIBkvM7LJhqqRwA38G9BeUHgaqQlj4ct
 UxkBjI5jrdp7zD4Euw5rrYHOBfJvfmKlj6A93AVBrpy4R1VeZDQYvf9awxCm9IKZ+rcH
 pi5f7O62la+oLKZD8dIPl5yL9dclL111RdTxvfpc8w8MH7BoBZHNeCk4hhfTt15OJPAv
 +cnRQAwMLRxunFIkpPiBbvEfFV27lKhg9T3jh+OAG9iEibyo8RAElf0keSpvGoHeiv3B
 Qh365mU81A+jneRHwguFW//11cMdDJRIbGXSr6FswYu73LTduCCp5NfqcNoxtqRAsN5i
 HSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741705848; x=1742310648;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cQwJl5AaMpNuj13k4T9FN6aD7KIBuzBDEK+lwo9Ext8=;
 b=ho9hqRBG4YMG1fKpLxpoBdPTcydVDVRrePUhFAYAtOjU5cbjHMOOE1/CrfxfsNZEgL
 zfjcNSzF2mGbQBY7+oFVwnuTDM8B5cU0ZErX8qKlR4Wr0tdS/jAjEsbExNUvAADALCLq
 Utjz47E8T6Qo/yXucglvhTYJt5QtfmbjjLMvkHk0vCizR49eapWPaxttCVQCSHAl54i1
 nId6iZYsx9vtIExHmS/7Dypasqei2Y/Ns0iQRJWV689ZYppr73M+Scs+mUzsIhwGiAI6
 I3W1aLEmz1OqxS4VS/hdqs67NbNd+G0FQ0pcnIucA/cY1G7NoJN0LL3IxfAYDlAVuAdv
 gEhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1tnPwOIkK5Ghv2oeLkZ+ernt9Tn2sc/XXLr1QKa4fC7GY0/aFLFNdmeiVQKgNNNS/uix7tdhti5Ys@nongnu.org
X-Gm-Message-State: AOJu0Yxzbns81OBlXLECW7MIy7KRCR1lcMMv92av0TJ2OCw3MRPqblBt
 omwZDAfJyKd+4FSYnpvKMy6LHHqYUtek4vSpUD8d4Atk/X+d0WKDib3qgnyQTo8=
X-Gm-Gg: ASbGncueCuweBTW2Nurq36vThxJhXQ/BsYbJekGfSGAPXsAHfkp/xjKJweqqb16s5Wr
 oFgF5HLGt4VJu/a2icklxoM8VpIoxusOnheb0cDya3kxHhtFh+rRtdjgluvcwJK9vGhCBV+Rqlv
 olj/V0Dj13FXAwuK5hasvmYDbdyRbCItYHrArkj3vTS+AZayjOwjCv2EM7YSTrc2CwxEAiS3vGB
 DT9TH9PrGxxb4dtLPspyX/lS0ZLYJuI0ga8M/ufXPT7xGk7Te20LJwNcBeHw/r0XqsQlUmQRosH
 lltzEWccNPMiMAZXN5prE/iActF6Nhr8mya5YyfS4T67MZ8gfwQ7VzPJeQ==
X-Google-Smtp-Source: AGHT+IEITMrsbR3vHiF3IG5H7RZJtH9+eCZYnI84EngoCoPfv0vimXTB3AzAhTXNWBOwPqkcAjXLsA==
X-Received: by 2002:a05:6a20:7fa1:b0:1ee:dd60:194f with SMTP id
 adf61e73a8af0-1f544c378b7mr26705105637.26.1741705847979; 
 Tue, 11 Mar 2025 08:10:47 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28126d69bsm9585406a12.51.2025.03.11.08.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 08:10:47 -0700 (PDT)
Message-ID: <9706a688-b466-40ca-a6b8-0221b11f749c@linaro.org>
Date: Tue, 11 Mar 2025 08:10:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] exec/exec-all: remove dependency on cpu.h
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
 <20250311040838.3937136-8-pierrick.bouvier@linaro.org>
 <f0c7b0ff-a43a-4203-aba1-2e06a462771e@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <f0c7b0ff-a43a-4203-aba1-2e06a462771e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62b.google.com
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

T24gMy8xMS8yNSAwMDoyNiwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDExLzMvMjUgMDU6MDgsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBSZXZpZXdlZC1i
eTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxp
bmFyby5vcmc+DQo+IA0KPiBNaXNzaW5nIHRoZSAid2h5IiBqdXN0aWZpY2F0aW9uIHdlIGNv
dWxkbid0IGRvIHRoYXQgYmVmb3JlLg0KPiANCj4+IC0tLQ0KPj4gICAgaW5jbHVkZS9leGVj
L2V4ZWMtYWxsLmggfCAxIC0NCj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZXhlYy9leGVjLWFsbC5oIGIvaW5jbHVk
ZS9leGVjL2V4ZWMtYWxsLmgNCj4+IGluZGV4IGRkNWM0MGYyMjMzLi4xOWIwZWRhNDRhNyAx
MDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvZXhlYy9leGVjLWFsbC5oDQo+PiArKysgYi9pbmNs
dWRlL2V4ZWMvZXhlYy1hbGwuaA0KPj4gQEAgLTIwLDcgKzIwLDYgQEANCj4+ICAgICNpZm5k
ZWYgRVhFQ19BTExfSA0KPj4gICAgI2RlZmluZSBFWEVDX0FMTF9IDQo+PiAgICANCj4+IC0j
aW5jbHVkZSAiY3B1LmgiDQo+PiAgICAjaWYgZGVmaW5lZChDT05GSUdfVVNFUl9PTkxZKQ0K
Pj4gICAgI2luY2x1ZGUgImV4ZWMvY3B1X2xkc3QuaCINCj4+ICAgICNlbmRpZg0KPiANCg0K
UHJldmlvdXMgY29tbWl0IGlzIG5hbWVkOg0KY29kZWJhc2U6IHByZXBhcmUgdG8gcmVtb3Zl
IGNwdS5oIGZyb20gZXhlYy9leGVjLWFsbC5oDQpTbyBiZWZvcmUgdGhvc2UgY2hhbmdlcywg
aXQncyBub3QgcG9zc2libGUuDQoNCkkgY2FuIHJlcGVhdCB0aGF0IGhlcmUsIG9yIHNxdWFz
aCB0aGUgcGF0Y2hlcyB0b2dldGhlciwgYXMgeW91IHByZWZlci4NCg==

