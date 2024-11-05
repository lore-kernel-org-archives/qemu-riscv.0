Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CC8D1CA02
	for <qemu-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 04:30:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t8BCZ-00027a-LA; Mon, 04 Nov 2024 23:29:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1t8BCU-00021a-2Q
 for qemu-riscv@nongnu.org; Mon, 04 Nov 2024 23:29:56 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1t8BCR-00051V-OY
 for qemu-riscv@nongnu.org; Mon, 04 Nov 2024 23:29:53 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-20ca1b6a80aso51062945ad.2
 for <qemu-riscv@nongnu.org>; Mon, 04 Nov 2024 20:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730780990; x=1731385790; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vJYmKWG/oFRir5g0YXPZ2GA21Bbx1I5FbyafMC0WtSo=;
 b=I0geFUFKtb1buVh/WAcltfokvABqjReZSIOKWOzQ4LpzGuePDAS9wsD6LHgqpPuH/Y
 ro8w2zWH+prWNzpIQs3oL5/7Jc69bYhBl+UpdtActGFk7iyNHIc0SFU7sJBfhTt5gT0k
 AMLoLsT0WEJ0Qn5rg05gRsquWOrc8iaSf4Bs25knsUncWj2GRr8Um5ZhzGo9gmMkd4Vf
 Rj+s+wYiWS3kkdQLxuodywnQQdD1PMF6XB4QjZ0aLyjQN2fiCadp6c3Kpfo3593ig98Z
 m6MQ3Gif6PqOjjPGWmIxdNx1VusQXBpdpPmrUuSBJsutIvab7+EVyXg7Mk6ufJA3CvFk
 7wCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730780990; x=1731385790;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vJYmKWG/oFRir5g0YXPZ2GA21Bbx1I5FbyafMC0WtSo=;
 b=pSIfPnuiqQspKRjPdnsPLdK6B47kY4oStYYABy4tFl7OEUTJ94o0GQgEc+x1AzNNco
 WzQ+YJJrGK9c3nCreqQf5XBtTk2Nhlh/KxLQQh1w63SDs9g8MdQirEwvN74lHeaL07JH
 1aNA+Oks2BvRHeMTU9oL188wUX41t63LuRCvNGNbB3D7i/iSH8sdECyK3PlIJAzOXHQs
 U4fM2awwsW9FZHxXksLNiD0oKo9WoO15JKfwSsn/RGFULIcL94qXiweGgQd5XbKNQfDR
 OaB6vDFJzXlf+ZhgUvgaGEA2uVlZNWQwxn4IHem2GWRoDoBiq08fRSJ2bVCYJo3BjAA/
 PI1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7euh4c1fe4cXKQGV2SSL9Xf4PayQuL8Wz6FQlnW2sqp/slkw7L2D7dTLkUO22O2bTRStVd7hUizq6@nongnu.org
X-Gm-Message-State: AOJu0YzRXbB4BZ/h4qWpYcd5i+xI6sWhiFpdHsS1XYlLsRzesbCgWwfD
 dk6Xv735WVC7yb43gl/CZ5e+ub0HHn96kVJi+iCwHzFfPPCA+rsL11qsbVOFkME=
X-Google-Smtp-Source: AGHT+IFc7Afc2WVwCZ0iIAuudzdu23gzN+uO+0GWcnCs5sFEKjXvOouu1GqqrrO+JMlq5a/dfPkQ/A==
X-Received: by 2002:a17:903:22c8:b0:20b:920e:8fd3 with SMTP id
 d9443c01a7336-2111af7b2f8mr236806595ad.35.1730780989681; 
 Mon, 04 Nov 2024 20:29:49 -0800 (PST)
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net.
 [216.180.64.156]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21105706891sm69479195ad.69.2024.11.04.20.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 20:29:49 -0800 (PST)
Message-ID: <a9c03f45-13d5-49ef-9c26-f3ab81c5932f@linaro.org>
Date: Mon, 4 Nov 2024 20:29:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/riscv: fix build error with clang
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Bin Meng <bmeng.cn@gmail.com>, tjeznach@rivosinc.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, pbonzini@redhat.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 peter.maydell@linaro.org, Cameron Esfahani <dirty@apple.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20241104222225.1523751-1-pierrick.bouvier@linaro.org>
 <CAKmqyKN+mYMRqA7=Tb+-qNr_b7TQ8rapaB_YDPqjgKWAggeygA@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAKmqyKN+mYMRqA7=Tb+-qNr_b7TQ8rapaB_YDPqjgKWAggeygA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62a.google.com
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

VGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KRmVlbCBmcmVlIHRvIHB1bGwgdGhlIHBhdGNoIGlu
IHlvdXIgbmV4dCBQUiwgc28gaXQgY2FuIGJlIGF2YWlsYWJsZSBmb3IgDQpyZWxlYXNlIDku
Mi4NCg0KUmVnYXJkcywNClBpZXJyaWNrDQoNCk9uIDExLzQvMjQgMTg6MzcsIEFsaXN0YWly
IEZyYW5jaXMgd3JvdGU6DQo+IE9uIFR1ZSwgTm92IDUsIDIwMjQgYXQgODoyM+KAr0FNIFBp
ZXJyaWNrIEJvdXZpZXINCj4gPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4gd3JvdGU6
DQo+Pg0KPj4gSW50cm9kdWNlZCBpbiAwYzU0YWMsICJody9yaXNjdjogYWRkIFJJU0MtViBJ
T01NVSBiYXNlIGVtdWxhdGlvbiINCj4+DQo+PiAuLi9ody9yaXNjdi9yaXNjdi1pb21tdS5j
OjE4NzoxNzogZXJyb3I6IHJlZGVmaW5pdGlvbiBvZiAnX3BleHRfdTY0Jw0KPj4NCj4+ICAg
IDE4NyB8IHN0YXRpYyB1aW50NjRfdCBfcGV4dF91NjQodWludDY0X3QgdmFsLCB1aW50NjRf
dCBleHQpDQo+Pg0KPj4gICAgICAgIHwgICAgICAgICAgICAgICAgIF4NCj4+DQo+PiBEOi9h
L190ZW1wL21zeXM2NC9jbGFuZzY0L2xpYi9jbGFuZy8xOC9pbmNsdWRlL2JtaTJpbnRyaW4u
aDoyMTc6MTogbm90ZTogcHJldmlvdXMgZGVmaW5pdGlvbiBpcyBoZXJlDQo+Pg0KPj4gICAg
MjE3IHwgX3BleHRfdTY0KHVuc2lnbmVkIGxvbmcgbG9uZyBfX1gsIHVuc2lnbmVkIGxvbmcg
bG9uZyBfX1kpDQo+Pg0KPj4gICAgICAgIHwgXg0KPj4NCj4+IEFmdGVyIGEgY29udmVyc2F0
aW9uIG9uIHRoZSBtYWlsaW5nIGxpc3QsIGl0IHdhcyBkZWNpZGVkIHRvIHJlbmFtZSBhbmQN
Cj4+IGFkZCBhIGNvbW1lbnQgZm9yIHRoaXMgZnVuY3Rpb24uDQo+Pg0KPj4gU2lnbmVkLW9m
Zi1ieTogUGllcnJpY2sgQm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0K
PiANCj4gUmV2aWV3ZWQtYnk6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNA
d2RjLmNvbT4NCj4gDQo+IEFsaXN0YWlyDQo+IA0KPj4gLS0tDQo+PiAgIGh3L3Jpc2N2L3Jp
c2N2LWlvbW11LmMgfCAyMyArKysrKysrKysrKysrKysrKysrKy0tLQ0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvaHcvcmlzY3YvcmlzY3YtaW9tbXUuYyBiL2h3L3Jpc2N2L3Jpc2N2LWlvbW11
LmMNCj4+IGluZGV4IGZlYjY1MDU0OWFjLi4xMmYwMWE3NWY1ZCAxMDA2NDQNCj4+IC0tLSBh
L2h3L3Jpc2N2L3Jpc2N2LWlvbW11LmMNCj4+ICsrKyBiL2h3L3Jpc2N2L3Jpc2N2LWlvbW11
LmMNCj4+IEBAIC0xODMsOCArMTgzLDI1IEBAIHN0YXRpYyB2b2lkIHJpc2N2X2lvbW11X3By
aShSSVNDVklPTU1VU3RhdGUgKnMsDQo+PiAgICAgICB9DQo+PiAgIH0NCj4+DQo+PiAtLyog
UG9ydGFibGUgaW1wbGVtZW50YXRpb24gb2YgcGV4dF91NjQsIGJpdC1tYXNrIGV4dHJhY3Rp
b24uICovDQo+PiAtc3RhdGljIHVpbnQ2NF90IF9wZXh0X3U2NCh1aW50NjRfdCB2YWwsIHVp
bnQ2NF90IGV4dCkNCj4+ICsvKg0KPj4gKyAqIERpc2NhcmRzIGFsbCBiaXRzIGZyb20gJ3Zh
bCcgd2hvc2UgbWF0Y2hpbmcgYml0cyBpbiB0aGUgc2FtZQ0KPj4gKyAqIHBvc2l0aW9ucyBp
biB0aGUgbWFzayAnZXh0JyBhcmUgemVyb3MsIGFuZCBwYWNrcyB0aGUgcmVtYWluaW5nDQo+
PiArICogYml0cyBmcm9tICd2YWwnIGNvbnRpZ3VvdXNseSBhdCB0aGUgbGVhc3Qtc2lnbmlm
aWNhbnQgZW5kIG9mIHRoZQ0KPj4gKyAqIHJlc3VsdCwga2VlcGluZyB0aGUgc2FtZSBiaXQg
b3JkZXIgYXMgJ3ZhbCcgYW5kIGZpbGxpbmcgYW55DQo+PiArICogb3RoZXIgYml0cyBhdCB0
aGUgbW9zdC1zaWduaWZpY2FudCBlbmQgb2YgdGhlIHJlc3VsdCB3aXRoIHplcm9zLg0KPj4g
KyAqDQo+PiArICogRm9yIGV4YW1wbGUsIGZvciB0aGUgZm9sbG93aW5nICd2YWwnIGFuZCAn
ZXh0JywgdGhlIHJldHVybiAncmV0Jw0KPj4gKyAqIHdpbGwgYmU6DQo+PiArICoNCj4+ICsg
KiB2YWwgPSBhIGIgYyBkIGUgZiBnIGgNCj4+ICsgKiBleHQgPSAxIDAgMSAwIDAgMSAxIDAN
Cj4+ICsgKiByZXQgPSAwIDAgMCAwIGEgYyBmIGcNCj4+ICsgKg0KPj4gKyAqIFRoaXMgZnVu
Y3Rpb24sIHRha2VuIGZyb20gdGhlIHJpc2N2LWlvbW11IDEuMCBzcGVjLCBzZWN0aW9uIDIu
My4zDQo+PiArICogIlByb2Nlc3MgdG8gdHJhbnNsYXRlIGFkZHJlc3NlcyBvZiBNU0lzIiwg
aXMgc2ltaWxhciB0byBiaXQgbWFuaXANCj4+ICsgKiBmdW5jdGlvbiBQRVhUIChQYXJhbGxl
bCBiaXRzIGV4dHJhY3QpIGZyb20geDg2Lg0KPj4gKyAqLw0KPj4gK3N0YXRpYyB1aW50NjRf
dCByaXNjdl9pb21tdV9wZXh0X3U2NCh1aW50NjRfdCB2YWwsIHVpbnQ2NF90IGV4dCkNCj4+
ICAgew0KPj4gICAgICAgdWludDY0X3QgcmV0ID0gMDsNCj4+ICAgICAgIHVpbnQ2NF90IHJv
dCA9IDE7DQo+PiBAQCAtNTI4LDcgKzU0NSw3IEBAIHN0YXRpYyBNZW1UeFJlc3VsdCByaXNj
dl9pb21tdV9tc2lfd3JpdGUoUklTQ1ZJT01NVVN0YXRlICpzLA0KPj4gICAgICAgaW50IGNh
dXNlOw0KPj4NCj4+ICAgICAgIC8qIEludGVycnVwdCBGaWxlIE51bWJlciAqLw0KPj4gLSAg
ICBpbnRuID0gX3BleHRfdTY0KFBQTl9ET1dOKGdwYSksIGN0eC0+bXNpX2FkZHJfbWFzayk7
DQo+PiArICAgIGludG4gPSByaXNjdl9pb21tdV9wZXh0X3U2NChQUE5fRE9XTihncGEpLCBj
dHgtPm1zaV9hZGRyX21hc2spOw0KPj4gICAgICAgaWYgKGludG4gPj0gMjU2KSB7DQo+PiAg
ICAgICAgICAgLyogSW50ZXJydXB0IGZpbGUgbnVtYmVyIG91dCBvZiByYW5nZSAqLw0KPj4g
ICAgICAgICAgIHJlcyA9IE1FTVRYX0FDQ0VTU19FUlJPUjsNCj4+IC0tDQo+PiAyLjM5LjUN
Cj4+DQo+Pg0K

