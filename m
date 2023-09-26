Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EC4E7E656
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 17:49:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qlCAx-0002oq-Bo; Tue, 26 Sep 2023 13:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qlCAv-0002oU-Ia
 for qemu-riscv@nongnu.org; Tue, 26 Sep 2023 13:48:45 -0400
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qlCAs-0000vX-7n
 for qemu-riscv@nongnu.org; Tue, 26 Sep 2023 13:48:43 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-495c9eb8911so3433385e0c.2
 for <qemu-riscv@nongnu.org>; Tue, 26 Sep 2023 10:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695750520; x=1696355320; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pvi4I09t+o9jEwk0h3e6se7nQVKAKaEgqHeIGnrQVEo=;
 b=UDNHLM+JmyfScUfCLdPwhmax7mbvSJVgsXV3J7ARODdaMJ8yopuO4vuF5R8+yGbwEz
 UKAYl/0EE+eWCRZBnNkeUatRWZQ7yfk9lV3sjCH59xaM8h9QRHPwr3EtN/ylslTcS8kJ
 00sTRu3Qgaws+kVJWfnF3xDWADeuFd9g98QTkmaTa5Hwb6kM5kmdfIZi22ImkR//fjFX
 pTXiSKLqBx42vhM8gsBhIN7MgsAV1r3cBegK3ZZmBjKlXFPaakRvXeYetkGX+VNm8yVf
 lo3pwmHMgNlhnKx987oqvXYSfwppL8TER4tNXE8MG24QyMyL/iMMG3MeD8ZBY/EuYa6o
 ricg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695750520; x=1696355320;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pvi4I09t+o9jEwk0h3e6se7nQVKAKaEgqHeIGnrQVEo=;
 b=a/hTkR1C61OLP60ZBqr+egFCIv1PSnaos0jXmfclis13BuTO/DgdwOdiOd9vngYI3J
 cA8FLE8XUvs8niXyFnDsCXKSd7Y6HA+XtVwYd8eSoo/w08/8/9Wt//A7dvh3WijQ1BUJ
 HV/ulArMYrDyoUBk4w2LMUfw758VLjgTkQI6yWLOm+FUd8pYa0WNQRHsHk1t+RJOeU25
 qq4GvFE8uCqbrxREgo156Wk86rQGMWwhipGDuR5KGN80ijbD7RUJx1oEyYCHfSjr1yCP
 d7XwPZnkTmcQyksGBOB+f3foeAZS8onjm2bo8QhXPutKy1VpAA3ymBBCv9hnzJFDO3GW
 A92g==
X-Gm-Message-State: AOJu0YynnBbzcUHIkkACcb0PlOngsajEC1qBVeMOxmlp5SJAsylvPN+d
 prEsn777igdJ69SBsmZLdOAVZA==
X-Google-Smtp-Source: AGHT+IEAZ/Zc/6YVPwFGv2i65nOfSC5ZwqmsQ5AkNm2hhCrfe6bGrUrkQvqwNm+ruVO+Y/MC70rLLQ==
X-Received: by 2002:a1f:4cc6:0:b0:495:cace:d59c with SMTP id
 z189-20020a1f4cc6000000b00495caced59cmr6923419vka.0.1695750520330; 
 Tue, 26 Sep 2023 10:48:40 -0700 (PDT)
Received: from [192.168.68.107] ([177.94.42.59])
 by smtp.gmail.com with ESMTPSA id
 m18-20020aa78a12000000b0068a2d78890csm10237523pfa.68.2023.09.26.10.48.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 10:48:39 -0700 (PDT)
Message-ID: <b8f80cf3-fcc6-c4b4-7603-592162a09710@ventanamicro.com>
Date: Tue, 26 Sep 2023 14:48:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/8] riscv: query-cpu-model-expansion API
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230920213743.716265-1-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230920213743.716265-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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

SGksDQoNCkknbGwgc3BsaXQgcGF0Y2hlcyAxIGFuZCAyIGFuZCBzZW5kIHRob3NlIHN0YW5k
YWxvbmUuIEZpcnN0IGJlY2F1c2UgdGhleQ0KY2FuIHN0YW5kIG9uIGl0cyBvd24uIFNlY29u
ZCBiZWNhdXNlIHBhdGNoIDIgaW4gcGFydGljdWxhciBpcyBnb2luZyB0byBiZQ0KYSBwcmVy
ZXF1aXNpdGUgZm9yIHRoZSBwcm9maWxlIHN1cHBvcnQgd29yay4NCg0KDQpUaGFua3MsDQoN
CkRhbmllbA0KDQoNCk9uIDkvMjAvMjMgMTg6MzcsIERhbmllbCBIZW5yaXF1ZSBCYXJib3ph
IHdyb3RlOg0KPiBCYXNlZC1vbjogMjAyMzA5MjAxMTIwMjAuNjUxMDA2LTEtZGJhcmJvemFA
dmVudGFuYW1pY3JvLmNvbQ0KPiAoIltQQVRDSCB2MyAwMC8xOV0gcmlzY3Y6IHNwbGl0IFRD
Ry9LVk0gYWNjZWxlcmF0b3JzIGZyb20gY3B1LmMiKQ0KPiANCj4gSGksDQo+IA0KPiBUaGUg
cGFyZW50IHNlcmllcyBpcyBpbiBhIG1vcmUgc3RhYmxlIHN0YXRlIHNvIEkgZGVjaWRlZCB0
byBnbyBhaGVhZA0KPiBhbmQgcG9zdCB0aGlzIHdvcmsuDQo+IA0KPiBUaGlzIHNlcmllcyBp
bXBsZW1lbnRzIHF1ZXJ5LWNwdS1tb2RlbC1leHBhbnNpb24gZm9yIFJJU0MtVi4gVGhlDQo+
IGltcGxlbWVudGF0aW9uIHdhcyBiYXNlZCBvbiB0aGUgQVJNIHZlcnNpb24gb2YgdGhlIHNh
bWUgQVBJIGluDQo+IHRhcmdldC9hcm0vYXJtLXFtcC1jbWRzLmMuDQo+IA0KPiBBIGNvdXBs
ZSBvZiBjaGFuZ2VzIHdlcmUgbWFkZSBpbiB0aGUgZmlyc3QgMyBwYXRjaGVzLiBUaGUgbW9z
dCBpbXBhY3RmdWwNCj4gaXMgaW4gcGF0Y2ggMiwgd2hlcmUgd2UncmUgbm93IGV4cG9zaW5n
IGV4dGVuc2lvbiBwcm9wZXJ0aWVzIGZvciB2ZW5kb3INCj4gQ1BVcy4gVGhpcyB3YXMgZG9u
ZSB0byBhbGxvdyB0aGUgQVBJIHRvIHJldHJpZXZlIHRoZSBleHRlbnNpb24gc3RhdGUgZm9y
DQo+IHRob3NlIENQVXMsIHdoaWNoIHdlcmUgb3RoZXJ3aXNlIGhpZGRlbiBpbnNpZGUgY3B1
LT5jZmcuIFRoZSByZXN1bHQgaXMNCj4gdGhhdCB1c2VycyB3aWxsIGhhdmUgYSBsaXR0bGUg
bW9yZSBwb3dlciBiZWNhdXNlIHdlJ3JlIG5vdyBhbGxvd2luZw0KPiB2ZW5kb3IgQ1BVIGV4
dGVuc2lvbnMgdG8gYmUgZGlzYWJsZWQuIEVuYWJsaW5nIGV4dGVuc2lvbnMgZm9yIHRob3Nl
IENQVXMNCj4gaXMgc3RpbGwgZm9yYmlkZGVuLiBQYXRjaCAyIGNvbW1pdCBtc2cgZ2l2ZXMg
bW9yZSBkZXRhaWxzIG9uIHdoYXQgaXMgbm93DQo+IHBvc3NpYmxlIHRvIGRvLg0KPiANCj4g
VGhlIGZpcnN0IDMgcGF0Y2hlcyBjYW4gYmUgcHVzaGVkL21lcmdlZCBzZXBhcmF0ZWx5IGZy
b20gdGhlIEFQSSBzaW5jZQ0KPiB0aGV5IGNhbiBzdGFuZCBvbiB0aGVpciBvd24uDQo+IA0K
PiBBIHNtYWxsIHR3ZWFrIGluIHRoZSBleHRlbnNpb24gdmFsaWRhdGlvbiBpbiB0aGUgVENH
IGRyaXZlciB3YXMgYWxzbw0KPiBuZWVkZWQuIFdlJ3JlIG5vdyBjZW50cmFsaXppbmcgYWxs
IGV4dGVuc2lvbiB2YWxpZGF0aW9uIGluDQo+IGZpbmFsaXplX2ZlYXR1cmVzKCksIGFuZCBl
eHBvcnRpbmcgZmluYWxpemVfZmVhdHVyZXMoKSB0byBiZSB1c2FibGUgYnkNCj4gdGhlIG5l
dyBBUEkuIFRoaXMgd2lsbCBhbGxvdyB1cyB0byB2YWxpZGF0ZSBtb2RlbCBwcm9wZXJ0aWVz
IGFuZCByZXBvcnQNCj4gYmFjayBpZiB0aGUgZGVzaXJlZCBtb2RlbCBpcyB2YWxpZCBvciBu
b3QuDQo+IA0KPiBUaGlzIHNlcmllcyBjYW4gYmUgdGVzdGVkIGRpcmVjdGx5IHVzaW5nIHRo
aXMgYnJhbmNoOg0KPiANCj4gaHR0cHM6Ly9naXRsYWIuY29tL2RhbmllbGhiL3FlbXUvLS90
cmVlL3FtcC1jcHUtZXhwYW5zaW9uX3YxDQo+IA0KPiANCj4gSGVyZSdzIGFuIHVzYWdlIGV4
YW1wbGUuIExhdW5jaCBRRU1VIHdpdGggIi1TIiB0byBiZSBhYmxlIHRvIGlzc3VlIFFNUA0K
PiBxdWVyeSBjb21tYW5kcyBiZWZvcmUgdGhlIG1hY2hpbmUgc3RhcnRzOg0KPiANCj4gJCAu
L2J1aWxkL3FlbXUtc3lzdGVtLXJpc2N2NjQgLVMgLU0gdmlydCAtZGlzcGxheSBub25lIC1x
bXAgIHRjcDpsb2NhbGhvc3Q6MTIzNCxzZXJ2ZXIsd2FpdD1vZmYNCj4gDQo+IFRoZW4gdXNl
IFFNUCB0byBhY2Nlc3MgdGhlIEFQSToNCj4gDQo+ICQgLi9zY3JpcHRzL3FtcC9xbXAtc2hl
bGwgbG9jYWxob3N0OjEyMzQNCj4gV2VsY29tZSB0byB0aGUgUU1QIGxvdy1sZXZlbCBzaGVs
bCENCj4gQ29ubmVjdGVkIHRvIFFFTVUgOC4xLjUwDQo+IA0KPiAoUUVNVSkgIHF1ZXJ5LWNw
dS1tb2RlbC1leHBhbnNpb24gdHlwZT1mdWxsIG1vZGVsPXsibmFtZSI6InJ2NjQifQ0KPiB7
InJldHVybiI6IHsibW9kZWwiOiB7Im5hbWUiOiAicnY2NCIsICJwcm9wcyI6IHsiemljb25k
IjogZmFsc2UsICJ4LXp2ZmgiOiBmYWxzZSwgIm1tdSI6IHRydWUsICJ4LXp2ZmJmd21hIjog
ZmFsc2UsICJ4LXp2ZmJmbWluIjogZmFsc2UsICJ4dGhlYWRicyI6IGZhbHNlLCAieHRoZWFk
YmIiOiBmYWxzZSwgInh0aGVhZGJhIjogZmFsc2UsICJ4dGhlYWRtZW1pZHgiOiBmYWxzZSwg
InNtc3RhdGVlbiI6IGZhbHNlLCAiemZpbngiOiBmYWxzZSwgIlp2ZTY0ZiI6IGZhbHNlLCAi
WnZlMzJmIjogZmFsc2UsICJ4LXp2ZmhtaW4iOiBmYWxzZSwgInh2ZW50YW5hY29uZG9wcyI6
IGZhbHNlLCAieHRoZWFkY29uZG1vdiI6IGZhbHNlLCAic3ZwYm10IjogZmFsc2UsICJ6YnMi
OiB0cnVlLCAiemJjIjogdHJ1ZSwgInpiYiI6IHRydWUsICJ6YmEiOiB0cnVlLCAiemljYm96
IjogdHJ1ZSwgInh0aGVhZG1hYyI6IGZhbHNlLCAiWmZoIjogZmFsc2UsICJaZmEiOiB0cnVl
LCAiemJreCI6IGZhbHNlLCAiemJrYyI6IGZhbHNlLCAiemJrYiI6IGZhbHNlLCAiWnZlNjRk
IjogZmFsc2UsICJ4LXpmYmZtaW4iOiBmYWxzZSwgInprIjogZmFsc2UsICJ4LWVwbXAiOiBm
YWxzZSwgInh0aGVhZG1lbXBhaXIiOiBmYWxzZSwgInprdCI6IGZhbHNlLCAiemtzIjogZmFs
c2UsICJ6a3IiOiBmYWxzZSwgInprbiI6IGZhbHNlLCAiWmZobWluIjogZmFsc2UsICJ6a3No
IjogZmFsc2UsICJ6a25oIjogZmFsc2UsICJ6a25lIjogZmFsc2UsICJ6a25kIjogZmFsc2Us
ICJ6aGlueCI6IGZhbHNlLCAiWmljc3IiOiB0cnVlLCAic3Njb2ZwbWYiOiBmYWxzZSwgIlpp
aGludG50bCI6IHRydWUsICJzc3RjIjogdHJ1ZSwgInh0aGVhZGNtbyI6IGZhbHNlLCAieC16
dmJiIjogZmFsc2UsICJ6a3NlZCI6IGZhbHNlLCAieC16dmtuZWQiOiBmYWxzZSwgInh0aGVh
ZHN5bmMiOiBmYWxzZSwgIngtenZrZyI6IGZhbHNlLCAiemhpbnhtaW4iOiBmYWxzZSwgInN2
YWR1IjogdHJ1ZSwgInh0aGVhZGZtdiI6IGZhbHNlLCAieC16dmtzZWQiOiBmYWxzZSwgInN2
bmFwb3QiOiBmYWxzZSwgInBtcCI6IHRydWUsICJ4LXp2a25oYiI6IGZhbHNlLCAieC16dmtu
aGEiOiBmYWxzZSwgInh0aGVhZGZtZW1pZHgiOiBmYWxzZSwgIngtenZrc2giOiBmYWxzZSwg
InpkaW54IjogZmFsc2UsICJ6aWNib20iOiB0cnVlLCAiWmloaW50cGF1c2UiOiB0cnVlLCAi
c3ZpbnZhbCI6IGZhbHNlLCAiemNmIjogZmFsc2UsICJ6Y2UiOiBmYWxzZSwgInpjZCI6IGZh
bHNlLCAiemNiIjogZmFsc2UsICJ6Y2EiOiBmYWxzZSwgIngtc3NhaWEiOiBmYWxzZSwgIngt
c21haWEiOiBmYWxzZSwgInptbXVsIjogZmFsc2UsICJ4LXp2YmMiOiBmYWxzZSwgIlppZmVu
Y2VpIjogdHJ1ZSwgInpjbXQiOiBmYWxzZSwgInpjbXAiOiBmYWxzZSwgIlphd3JzIjogdHJ1
ZX19fX0NCj4gDQo+IA0KPiANCj4gRGFuaWVsIEhlbnJpcXVlIEJhcmJvemEgKDgpOg0KPiAg
ICB0YXJnZXQvcmlzY3Y6IGFkZCByaXNjdl9jcHVfZ2V0X25hbWUoKQ0KPiAgICB0YXJnZXQv
cmlzY3YvdGNnLWNwdS5jOiBhZGQgZXh0ZW5zaW9uIHByb3BlcnRpZXMgZm9yIGFsbCBjcHVz
DQo+ICAgIHRhcmdldC9yaXNjdi9rdm0va3ZtLWNwdS5jOiBhZGQgbWlzc2luZyBwcm9wZXJ0
eSBnZXR0ZXJzKCkNCj4gICAgcWFwaSxyaXNjLXY6IGFkZCBxdWVyeS1jcHUtbW9kZWwtZXhw
YW5zaW9uDQo+ICAgIHRhcmdldC9yaXNjdi90Y2c6IGFkZCB0Y2dfY3B1X2ZpbmFsaXplX2Zl
YXR1cmVzKCkNCj4gICAgdGFyZ2V0L3Jpc2N2OiBoYW5kbGUgY3VzdG9tIHByb3BzIGluIHFt
cF9xdWVyeV9jcHVfbW9kZWxfZXhwYW5zaW9uDQo+ICAgIHRhcmdldC9yaXNjdjogYWRkIHJp
c2N2X2NwdV9hY2NlbGVyYXRvcl9jb21wYXRpYmxlKCkNCj4gICAgdGFyZ2V0L3Jpc2N2L3Jp
c2N2LXFtcC1jbWRzLmM6IGNoZWNrIENQVSBhY2NlbCBpbg0KPiAgICAgIHF1ZXJ5LWNwdS1t
b2RlbC1leHBhbnNpb24NCj4gDQo+ICAgcWFwaS9tYWNoaW5lLXRhcmdldC5qc29uICAgICAg
fCAgIDYgKy0NCj4gICB0YXJnZXQvcmlzY3YvY3B1LmMgICAgICAgICAgICB8ICAzOCArKysr
KysrLQ0KPiAgIHRhcmdldC9yaXNjdi9jcHUuaCAgICAgICAgICAgIHwgICAzICsNCj4gICB0
YXJnZXQvcmlzY3Yva3ZtL2t2bS1jcHUuYyAgICB8ICA0MCArKysrKysrKy0NCj4gICB0YXJn
ZXQvcmlzY3YvcmlzY3YtcW1wLWNtZHMuYyB8IDE2MCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ICAgdGFyZ2V0L3Jpc2N2L3RjZy90Y2ctY3B1LmMgICAgfCAxMjIg
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCj4gICB0YXJnZXQvcmlzY3YvdGNnL3RjZy1j
cHUuaCAgICB8ICAgMiArDQo+ICAgNyBmaWxlcyBjaGFuZ2VkLCAzMjcgaW5zZXJ0aW9ucygr
KSwgNDQgZGVsZXRpb25zKC0pDQo+IA0K

