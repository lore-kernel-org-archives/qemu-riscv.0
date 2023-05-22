Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B1BC77B75
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 May 2023 16:43:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q18cp-0006Kp-04; Mon, 22 May 2023 12:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q18cn-0006Jh-O4
 for qemu-riscv@nongnu.org; Mon, 22 May 2023 12:43:09 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q18cl-000108-VF
 for qemu-riscv@nongnu.org; Mon, 22 May 2023 12:43:09 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-397f3aec11aso1273435b6e.1
 for <qemu-riscv@nongnu.org>; Mon, 22 May 2023 09:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684773786; x=1687365786;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GOYy3bs/AQNdS/l+oVYBJG39Lu7iuY8UB/63FUs/KqI=;
 b=hUQWgdJ9ddwj/8VpA6dBc94K72jN8mzwCdQInBj/GvyQSlsHmJV+VMCPoL8EF5nXbM
 Hvbp5yZEngzPpncLEMl0oFRPodsMJUW3f/1xAWyuRz0hJIeb5Q6NtNVQYiopyyHfvdr7
 wGGmEQjSWAdzBcjytridOAMlR3P4J5NbwGkqetUho8qYK0b/CjLM1LYc1/jfhxwkheG5
 qTSc6Jd/qynMtjPvPx8IU6RfUXRCfjC/baASfskkG2fXvKzU9nVSjF9UVaXA4YOO8+6/
 jE83T+XE+1mfT/YPrmR/u+sTCzxWDWEucd6qD7xq67aAfUgN8RW/1dCb3ppjf/1iBx11
 d58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684773786; x=1687365786;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GOYy3bs/AQNdS/l+oVYBJG39Lu7iuY8UB/63FUs/KqI=;
 b=CurHdKxGj4xonHhpLrHnAg1QnE+PeHFMYIZIp+vIZlTe8g4JhLJP+x67HxOJa5Itej
 AINDFG6pY/WTwFTutL540dOYVJKh8JbL4MrgBON6rY/5ESjThIRUQjH8iyR/1OXzuHpT
 1PiOvz4fIQOC0oMXEdjGsu38x9ZBDo10epzUpY7kUpzj/9DGZaHCzsmL13dTzMrfbPC8
 If34GkhuxL6I61DsK6u4NUyMFjaTQ4Qg+6SY01AYkKO484D9qJTGlHvVT0FQdj8cLW8n
 7+9mqMD2gpNYCZrPf1bEOGpRZdN8IwiysrSepEZ+tbj1xzsOcd402xqwr2gtoeHzbto4
 DLUw==
X-Gm-Message-State: AC+VfDywnYGAZfPSxXKcjW7SCZULIyWNcCz/+sTzeo7quWb+7ii6lq4K
 DcNuPQgSzXXaUrD9NhBLMvLrZw==
X-Google-Smtp-Source: ACHHUZ753WmWEwE6L0CQT5uMWY2pvXWVze06fEoF2YYUzooX/qaYpxPCM79x18/VBE2Qj2qHfG+DIg==
X-Received: by 2002:aca:620b:0:b0:396:1512:6fd1 with SMTP id
 w11-20020aca620b000000b0039615126fd1mr8346568oib.17.1684773786692; 
 Mon, 22 May 2023 09:43:06 -0700 (PDT)
Received: from [192.168.68.107] ([179.111.98.125])
 by smtp.gmail.com with ESMTPSA id
 v128-20020a4a5a86000000b005555797999dsm762019ooa.17.2023.05.22.09.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 09:43:06 -0700 (PDT)
Message-ID: <1ec71603-577c-b8da-9f41-6ddb4938d417@ventanamicro.com>
Date: Mon, 22 May 2023 13:43:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/6] target/riscv: Set VS* bits to one in mideleg when
 H-Ext is enabled
Content-Language: en-US
To: Rajnesh Kanwal <rkanwal@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com,
 apatel@ventanamicro.com
References: <20230518113838.130084-1-rkanwal@rivosinc.com>
 <20230518113838.130084-4-rkanwal@rivosinc.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230518113838.130084-4-rkanwal@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

DQoNCk9uIDUvMTgvMjMgMDg6MzgsIFJham5lc2ggS2Fud2FsIHdyb3RlOg0KPiBXaXRoIEgt
RXh0IHN1cHBvcnRlZCwgVlMgYml0cyBhcmUgYWxsIGhhcmR3aXJlZCB0byBvbmUgaW4gTUlE
RUxFRw0KPiBkZW5vdGluZyBhbHdheXMgZGVsZWdhdGVkIGludGVycnVwdHMuIFRoaXMgaXMg
YmVpbmcgZG9uZSBpbiBybXdfbWlkZWxlZw0KPiBidXQgZ2l2ZW4gbWlkZWxlZyBpcyB1c2Vk
IGluIG90aGVyIHBsYWNlcyB3aGVuIHJvdXRpbmcgaW50ZXJydXB0cw0KPiB0aGlzIGNoYW5n
ZSBpbml0aWFsaXplcyBpdCBpbiByaXNjdl9jcHVfcmVhbGl6ZSB0byBiZSBvbiB0aGUgc2Fm
ZSBzaWRlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUmFqbmVzaCBLYW53YWwgPHJrYW53YWxA
cml2b3NpbmMuY29tPg0KPiAtLS0NCj4gICB0YXJnZXQvcmlzY3YvY3B1LmMgfCA1ICsrKysr
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL3RhcmdldC9yaXNjdi9jcHUuYyBiL3RhcmdldC9yaXNjdi9jcHUuYw0KPiBpbmRleCBk
YjA4NzVmYjQzLi45MDQ2MGNmZTY0IDEwMDY0NA0KPiAtLS0gYS90YXJnZXQvcmlzY3YvY3B1
LmMNCj4gKysrIGIvdGFyZ2V0L3Jpc2N2L2NwdS5jDQo+IEBAIC0xMjg4LDYgKzEyODgsMTEg
QEAgc3RhdGljIHZvaWQgcmlzY3ZfY3B1X3JlYWxpemUoRGV2aWNlU3RhdGUgKmRldiwgRXJy
b3IgKiplcnJwKQ0KPiAgICAgICAgICAgcmV0dXJuOw0KPiAgICAgICB9DQo+ICAgDQo+ICsg
ICAgLyogV2l0aCBILUV4dCBWU1NJUCwgVlNUSVAsIFZTRUlQIGFuZCBTR0VJUCBhcmUgaGFy
ZHdpcmVkIHRvIG9uZS4gKi8NCj4gKyAgICBpZiAocmlzY3ZfaGFzX2V4dChlbnYsIFJWSCkp
IHsNCj4gKyAgICAgICAgZW52LT5taWRlbGVnID0gTUlQX1ZTU0lQIHwgTUlQX1ZTVElQIHwg
TUlQX1ZTRUlQIHwgTUlQX1NHRUlQOw0KPiArICAgIH0NCj4gKw0KDQpUaGlzIGNoYW5nZSBi
cmVha3MgbGludXgtdXNlciBidWlsZDoNCg0KRkFJTEVEOiBsaWJxZW11LXJpc2N2NjQtbGlu
dXgtdXNlci5mYS5wL3RhcmdldF9yaXNjdl9jcHUuYy5vDQpjYyAtbTY0IC1tY3gxNiAtSWxp
YnFlbXUtcmlzY3Y2NC1saW51eC11c2VyLmZhLnAgLUkuIC1JLi4gLUl0YXJnZXQvcmlzY3Yg
LUkuLi90YXJnZXQvcmlzY3YgLUkuLi9jb21tb24tdXNlci9ob3N0L3g4Nl82NCAtSS4uL2xp
bnV4LXVzZXIvaW5jbHVkZS9ob3N0L3g4Nl82NCAtSS4uL2xpbnV4LXVzZXIvaW5jbHVkZSAt
SWxpbnV4LXVzZXIgLUkuLi9saW51eC11c2VyIC1JLi4vbGludXgtdXNlci9yaXNjdiAtSXFh
cGkgLUl0cmFjZSAtSXVpIC1JdWkvc2hhZGVyIC1JL3Vzci9pbmNsdWRlL2dsaWItMi4wIC1J
L3Vzci9saWI2NC9nbGliLTIuMC9pbmNsdWRlIC1JL3Vzci9pbmNsdWRlL3N5c3Byb2YtNCAt
ZmRpYWdub3N0aWNzLWNvbG9yPWF1dG8gLVdhbGwgLVdpbnZhbGlkLXBjaCAtV2Vycm9yIC1z
dGQ9Z251MTEgLU8yIC1nIC1pc3lzdGVtIC9ob21lL2RhbmllbGhiL3dvcmsvcWVtdS9saW51
eC1oZWFkZXJzIC1pc3lzdGVtIGxpbnV4LWhlYWRlcnMgLWlxdW90ZSAuIC1pcXVvdGUgL2hv
bWUvZGFuaWVsaGIvd29yay9xZW11IC1pcXVvdGUgL2hvbWUvZGFuaWVsaGIvd29yay9xZW11
L2luY2x1ZGUgLWlxdW90ZSAvaG9tZS9kYW5pZWxoYi93b3JrL3FlbXUvdGNnL2kzODYgLXB0
aHJlYWQgLVVfRk9SVElGWV9TT1VSQ0UgLURfRk9SVElGWV9TT1VSQ0U9MiAtRF9HTlVfU09V
UkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLURfTEFSR0VGSUxFX1NPVVJDRSAtZm5vLXN0
cmljdC1hbGlhc2luZyAtZm5vLWNvbW1vbiAtZndyYXB2IC1XdW5kZWYgLVd3cml0ZS1zdHJp
bmdzIC1XbWlzc2luZy1wcm90b3R5cGVzIC1Xc3RyaWN0LXByb3RvdHlwZXMgLVdyZWR1bmRh
bnQtZGVjbHMgLVdvbGQtc3R5bGUtZGVjbGFyYXRpb24gLVdvbGQtc3R5bGUtZGVmaW5pdGlv
biAtV3R5cGUtbGltaXRzIC1XZm9ybWF0LXNlY3VyaXR5IC1XZm9ybWF0LXkyayAtV2luaXQt
c2VsZiAtV2lnbm9yZWQtcXVhbGlmaWVycyAtV2VtcHR5LWJvZHkgLVduZXN0ZWQtZXh0ZXJu
cyAtV2VuZGlmLWxhYmVscyAtV2V4cGFuc2lvbi10by1kZWZpbmVkIC1XaW1wbGljaXQtZmFs
bHRocm91Z2g9MiAtV21pc3NpbmctZm9ybWF0LWF0dHJpYnV0ZSAtV25vLW1pc3NpbmctaW5j
bHVkZS1kaXJzIC1Xbm8tc2hpZnQtbmVnYXRpdmUtdmFsdWUgLVduby1wc2FiaSAtZnN0YWNr
LXByb3RlY3Rvci1zdHJvbmcgLWZQSUUgLWlzeXN0ZW0uLi9saW51eC1oZWFkZXJzIC1pc3lz
dGVtbGludXgtaGVhZGVycyAtRE5FRURfQ1BVX0ggJy1EQ09ORklHX1RBUkdFVD0icmlzY3Y2
NC1saW51eC11c2VyLWNvbmZpZy10YXJnZXQuaCInICctRENPTkZJR19ERVZJQ0VTPSJyaXNj
djY0LWxpbnV4LXVzZXItY29uZmlnLWRldmljZXMuaCInIC1NRCAtTVEgbGlicWVtdS1yaXNj
djY0LWxpbnV4LXVzZXIuZmEucC90YXJnZXRfcmlzY3ZfY3B1LmMubyAtTUYgbGlicWVtdS1y
aXNjdjY0LWxpbnV4LXVzZXIuZmEucC90YXJnZXRfcmlzY3ZfY3B1LmMuby5kIC1vIGxpYnFl
bXUtcmlzY3Y2NC1saW51eC11c2VyLmZhLnAvdGFyZ2V0X3Jpc2N2X2NwdS5jLm8gLWMgLi4v
dGFyZ2V0L3Jpc2N2L2NwdS5jDQouLi90YXJnZXQvcmlzY3YvY3B1LmM6IEluIGZ1bmN0aW9u
IOKAmHJpc2N2X2NwdV9yZWFsaXpl4oCZOg0KLi4vdGFyZ2V0L3Jpc2N2L2NwdS5jOjEzNjY6
MTI6IGVycm9yOiDigJhDUFVSSVNDVlN0YXRl4oCZIHtha2Eg4oCYc3RydWN0IENQVUFyY2hT
dGF0ZeKAmX0gaGFzIG5vIG1lbWJlciBuYW1lZCDigJhtaWRlbGVn4oCZDQogIDEzNjYgfCAg
ICAgICAgIGVudi0+bWlkZWxlZyA9IE1JUF9WU1NJUCB8IE1JUF9WU1RJUCB8IE1JUF9WU0VJ
UCB8IE1JUF9TR0VJUDsNCiAgICAgICB8ICAgICAgICAgICAgXn4NClsxNzIwLzI3OThdIENv
bXBpbGluZyBDIG9iamVjdCBsaWJxZW11LXJpc2N2NjQtbGludXgtdXNlci5mYS5wL2xpbnV4
LXVzZXJfcmlzY3ZfY3B1X2xvb3AuDQoNCg0KDQpUaGUgcmVhc29uIGlzIHRoYXQgJ21pZGVs
ZWcnIGlzIGEgc3lzdGVtIGVtdWxhdGlvbiBhdHRyaWJ1dGUgb25seSAoaS5lLiBkZWZpbmVk
DQppbiBhICNpZm5kZWYgQ09ORklHX1VTRVJfT05MWSBibG9jaykuIFRoZXJlJ3MgYSBibG9j
ayBsaWtlIHRoYXQgcmlnaHQgYmVmb3JlIHRoaXMNCnBvaW50IHdoZXJlIHJpc2N2X3RpbWVy
X2luaXQoKSBpcyBiZWluZyBjYWxsZWQuIEkgc3VnZ2VzdCBtb3ZpbmcgdGhpcyBjb2RlIHRo
ZXJlLg0KDQoNClRoYW5rcywNCg0KDQpEYW5pZWwNCg0KDQoNCj4gICAgICAgcmlzY3ZfY3B1
X3JlZ2lzdGVyX2dkYl9yZWdzX2Zvcl9mZWF0dXJlcyhjcyk7DQo+ICAgDQo+ICAgICAgIHFl
bXVfaW5pdF92Y3B1KGNzKTsNCg==

