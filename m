Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A150EC10F00
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 18:52:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWLcp-00059v-FZ; Wed, 16 Aug 2023 14:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qWLco-00059C-0T
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 14:52:10 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qWLcl-00041g-CA
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 14:52:09 -0400
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3a81154c570so1628876b6e.1
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 11:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692211925; x=1692816725;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xrkOIGx36+6M03XBz/kT6anAx7sGJYq+LHXwDDeSvyw=;
 b=E2/nhYfHtw80sQgfoFywTF8d7zHqrrvpCOb7wldUj1/kZj494/YqIraPM0+lH6Cy1m
 aLAC50+9N40sfVedT+qbU4AQsT2XOF7FQWAg2sEnoU33p/su5Hxhx9mcNSOIgqv9Oglz
 qdFlvJJkiMiDCXkyYqxCPHucB/hfygdnJZKEawuEYMU925XjieBRU/BKfVxWQhgwGPAs
 gbOtuMU0A3WBCEU/3iKPcO4Zd3VDxiBqawzB0WV+2pVo/5JndWhIZzV7inPKUrfaoInc
 /PGqF70UlJ91Y+0uYN0z4E3MalsAfJ8FauMSxKf8yAsdcJDqjQWMc37pL2YRP/krOrab
 jJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692211925; x=1692816725;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xrkOIGx36+6M03XBz/kT6anAx7sGJYq+LHXwDDeSvyw=;
 b=KxbGe86P72/jXajV6t0GSBSWmSdKnROqDo+txpnBIWbSg4CbNknJTwGaImpAdZQskK
 2F9BXCU29GgZCIXA0+uDG3P9e4wzZm7w0hCJz/JN/NgqOPxfyQGdUXgOo+25SANeBDap
 ls+h/nKnKsJRvLEItzX/GDQPSTReQOHX2mWikXLpTwdemiz7yWPaCJsw7wokPu6SlzDi
 WxK73zTg28zm61WFFgo17AjxUu5CNSjheEuI6HrAfxwlEIDUzrZStcOb3OOMINaO/poj
 9qwRhGKZjBjxl1R8XmbQAFOpxSoXV7LCYyG9K3DIIAFNbkR7xm5w9MKaEtvn1Tik5r/e
 krVQ==
X-Gm-Message-State: AOJu0YxHUUAyOT7f1GTueXnAxj5j2+QXC9f1DlXYu6xHMhoZHFk3lIu0
 Fb8GakdVc3N02gB5tn1bcL5Ukw==
X-Google-Smtp-Source: AGHT+IE556L+2MBLrm8dGihxA6Wmr4EUj40FJxNQgel6rffBptR5ugHKQymIn3dCok9axdiZTqnDbg==
X-Received: by 2002:a05:6808:6395:b0:3a7:48d2:fc82 with SMTP id
 ec21-20020a056808639500b003a748d2fc82mr2612708oib.38.1692211925182; 
 Wed, 16 Aug 2023 11:52:05 -0700 (PDT)
Received: from [192.168.68.108] (189-69-160-189.dial-up.telesp.net.br.
 [189.69.160.189]) by smtp.gmail.com with ESMTPSA id
 o26-20020a05680803da00b003a7847cf407sm6725822oie.44.2023.08.16.11.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 11:52:04 -0700 (PDT)
Message-ID: <badc96bf-821e-d769-ac40-39600f543e86@ventanamicro.com>
Date: Wed, 16 Aug 2023 15:51:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/10] hw/arm/virt-acpi-build.c: Move fw_cfg and virtio to
 common location
To: Igor Mammedov <imammedo@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
 <20230712163943.98994-2-sunilvl@ventanamicro.com>
 <20230724171859.212fec62@imammedo.users.ipa.redhat.com>
 <ZL/9XO47yEnaNzyN@sunil-laptop>
 <20230726102546.1cad6113@imammedo.users.ipa.redhat.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230726102546.1cad6113@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.165,
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

DQoNCk9uIDcvMjYvMjMgMDU6MjUsIElnb3IgTWFtbWVkb3Ygd3JvdGU6DQo+IE9uIFR1ZSwg
MjUgSnVsIDIwMjMgMjI6MjA6MzYgKzA1MzANCj4gU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOg0KPiANCj4+IE9uIE1vbiwgSnVsIDI0LCAyMDIzIGF0IDA1
OjE4OjU5UE0gKzAyMDAsIElnb3IgTWFtbWVkb3Ygd3JvdGU6DQo+Pj4gT24gV2VkLCAxMiBK
dWwgMjAyMyAyMjowOTozNCArMDUzMA0KPj4+IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5h
bWljcm8uY29tPiB3cm90ZToNCj4+PiAgICANCj4+Pj4gVGhlIGZ1bmN0aW9ucyB3aGljaCBh
ZGQgZndfY2ZnIGFuZCB2aXJ0aW8gdG8gRFNEVCBhcmUgc2FtZSBmb3IgQVJNDQo+Pj4+IGFu
ZCBSSVNDLVYuIFNvLCBpbnN0ZWFkIG9mIGR1cGxpY2F0aW5nIGluIFJJU0MtViwgbW92ZSB0
aGVtIGZyb20NCj4+Pj4gaHcvYXJtL3ZpcnQtYWNwaS1idWlsZC5jIHRvIGNvbW1vbiBhbWwt
YnVpbGQuYy4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogU3VuaWwgViBMIDxzdW5pbHZs
QHZlbnRhbmFtaWNyby5jb20+DQo+Pj4+IC0tLQ0KPj4+PiAgIGh3L2FjcGkvYW1sLWJ1aWxk
LmMgICAgICAgICB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
Pj4+PiAgIGh3L2FybS92aXJ0LWFjcGktYnVpbGQuYyAgICB8IDQyIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+Pj4gICBody9yaXNjdi92aXJ0LWFjcGktYnVp
bGQuYyAgfCAxNiAtLS0tLS0tLS0tLS0tLQ0KPj4+PiAgIGluY2x1ZGUvaHcvYWNwaS9hbWwt
YnVpbGQuaCB8ICA2ICsrKysrKw0KPj4+PiAgIDQgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0
aW9ucygrKSwgNTggZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9ody9h
Y3BpL2FtbC1idWlsZC5jIGIvaHcvYWNwaS9hbWwtYnVpbGQuYw0KPj4+DQo+Pj4gcGF0Y2gg
bG9va3MgZmluZSBtb2R1bG8sDQo+Pj4gSSdkIHB1dCB0aGVzZSBpbnRvIHJlc3BlY3RpdmUg
ZGV2aWNlIGZpbGVzIGluc3RlYWQgb2YgZ2VuZXJpYw0KPj4+IGFtbC1idWlsZC5jIHdoaWNo
IHdhcyBpbnRlbmRlZCBmb3IgYmFzaWMgQU1MIHByaW1pdGl2ZXMNCj4+PiAoaXQgJ3MgZ290
IHBvbGx1dGVkIG92ZXIgdGltZSB3aXRoIGRldmljZSBzcGVjaWZpYyBmdW5jdGlvbnMNCj4+
PiBidXQgdGhhdCdzIG5vdCB0aGUgcmVhc29uIHRvIGNvbnRpbnVlIGRvaW5nIHRoYXQpLg0K
Pj4+DQo+Pj4gQWxzbyBoYXZpbmcgdGhvc2UgZnVuY3Rpb25zIGFsb25nIHdpdGggZGV2aWNl
cyBtb2RlbHMNCj4+PiBnb2VzIGFsb25nIHdpdGggc2VsZiBlbnVtZXJhdGluZyBBQ1BJIGRl
dmljZXMgKGN1cnJlbnRseQ0KPj4+IGl0IHdvcmtzIGZvciB4ODYgUENJL0lTQSBkZXZpY2Ug
YnV0IHRoZXJlIGlzIG5vIHJlYXNvbg0KPj4+IHRoYXQgaXQgY2FuJ3Qgd29yayB3aXRoIG90
aGVyIHR5cGVzIGFzIHdlbGwgd2hlbg0KPj4+IEkgZ2V0IHRoZXJlKQ0KPj4+ICAgIA0KPj4g
VGhhbmtzISwgSWdvci4gTGV0IG1lIGFkZCB0aGVtIHRvIGRldmljZSBzcGVjaWZpYyBmaWxl
cyBhcyBwZXIgeW91cg0KPj4gcmVjb21tZW5kYXRpb24uDQo+IGp1c3QgYmUgY2FyZWZ1bCBh
bmQgYnVpbGQgdGVzdCBvdGhlciB0YXJnZXRzICh3aGlsZSBkaXNhYmxpbmcgdGhlIHJlc3Qp
DQo+IGF0IGxlYXN0IG5vIHRvIHJlZ3Jlc3MgdGhlbSBkdWUgdG8gYnVpbGQgZGVwcy4gKEkn
ZCBwaWNrIDIgd2l0aCBBQ1BJDQo+IHN1cHBvcnQgdGhhdCB1c2UgYW5kIG5vdCB1c2VzIGFm
ZmVjdGVkIGNvZGUpIGFuZCAxIHRoYXQgIHVzZXMgZGV2aWNlDQo+IG1vZGVsIGJ1dCBkb2Vz
bid0IHVzZSBBQ1BJIGF0IGFsbCAoaWYgc3VjaCBleGlzdHMpDQoNClN1bmlsIGlzIGFscmVh
ZHkgYXdhcmUgb2YgaXQgYnV0IEknbGwgYWxzbyBtZW50aW9uIGhlcmUgc2luY2UgaXQgc2Vl
bXMgcmVsZXZhbnQNCnRvIElnb3IncyBwb2ludC4NCg0KDQpUaGlzIHBhdGNoIGJyZWFrcyBp
Mzg2LXNvZnRtbXUgYnVpbGQ6DQoNCg0KRkFJTEVEOiBsaWJxZW11LWkzODYtc29mdG1tdS5m
YS5wL2h3X2kzODZfYWNwaS1taWNyb3ZtLmMubw0KY2MgLW02NCAtbWN4MTYgLUlsaWJxZW11
LWkzODYtc29mdG1tdS5mYS5wIC1JLiAtSS4uIC1JdGFyZ2V0L2kzODYgLUkuLi90YXJnZXQv
aTM4NiAtSXFhcGkgLUl0cmFjZSAtSXVpIC1JdWkvc2hhZGVyIC1JL3Vzci9pbmNsdWRlL3Bp
eG1hbi0xIC1JL3Vzci9pbmNsdWRlL2dsaWItMi4wIC1JL3Vzci9saWI2NC9nbGliLTIuMC9p
bmNsdWRlIC1JL3Vzci9pbmNsdWRlL3N5c3Byb2YtNCAtZmRpYWdub3N0aWNzLWNvbG9yPWF1
dG8gLVdhbGwgLVdpbnZhbGlkLXBjaCAtV2Vycm9yIC1zdGQ9Z251MTEgLU8yIC1nIC1mc3Rh
Y2stcHJvdGVjdG9yLXN0cm9uZyAtVV9GT1JUSUZZX1NPVVJDRSAtRF9GT1JUSUZZX1NPVVJD
RT0yIC1XdW5kZWYgLVd3cml0ZS1zdHJpbmdzIC1XbWlzc2luZy1wcm90b3R5cGVzIC1Xc3Ry
aWN0LXByb3RvdHlwZXMgLVdyZWR1bmRhbnQtZGVjbHMgLVdvbGQtc3R5bGUtZGVjbGFyYXRp
b24gLVdvbGQtc3R5bGUtZGVmaW5pdGlvbiAtV3R5cGUtbGltaXRzIC1XZm9ybWF0LXNlY3Vy
aXR5IC1XZm9ybWF0LXkyayAtV2luaXQtc2VsZiAtV2lnbm9yZWQtcXVhbGlmaWVycyAtV2Vt
cHR5LWJvZHkgLVduZXN0ZWQtZXh0ZXJucyAtV2VuZGlmLWxhYmVscyAtV2V4cGFuc2lvbi10
by1kZWZpbmVkIC1XaW1wbGljaXQtZmFsbHRocm91Z2g9MiAtV21pc3NpbmctZm9ybWF0LWF0
dHJpYnV0ZSAtV25vLW1pc3NpbmctaW5jbHVkZS1kaXJzIC1Xbm8tc2hpZnQtbmVnYXRpdmUt
dmFsdWUgLVduby1wc2FiaSAtaXN5c3RlbSAvaG9tZS9kYW5pZWxoYi93b3JrL3FlbXUvbGlu
dXgtaGVhZGVycyAtaXN5c3RlbSBsaW51eC1oZWFkZXJzIC1pcXVvdGUgLiAtaXF1b3RlIC9o
b21lL2RhbmllbGhiL3dvcmsvcWVtdSAtaXF1b3RlIC9ob21lL2RhbmllbGhiL3dvcmsvcWVt
dS9pbmNsdWRlIC1pcXVvdGUgL2hvbWUvZGFuaWVsaGIvd29yay9xZW11L2hvc3QvaW5jbHVk
ZS94ODZfNjQgLWlxdW90ZSAvaG9tZS9kYW5pZWxoYi93b3JrL3FlbXUvaG9zdC9pbmNsdWRl
L2dlbmVyaWMgLWlxdW90ZSAvaG9tZS9kYW5pZWxoYi93b3JrL3FlbXUvdGNnL2kzODYgLXB0
aHJlYWQgLURfR05VX1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1EX0xBUkdFRklM
RV9TT1VSQ0UgLWZuby1zdHJpY3QtYWxpYXNpbmcgLWZuby1jb21tb24gLWZ3cmFwdiAtZlBJ
RSAtaXN5c3RlbS4uL2xpbnV4LWhlYWRlcnMgLWlzeXN0ZW1saW51eC1oZWFkZXJzIC1ETkVF
RF9DUFVfSCAnLURDT05GSUdfVEFSR0VUPSJpMzg2LXNvZnRtbXUtY29uZmlnLXRhcmdldC5o
IicgJy1EQ09ORklHX0RFVklDRVM9ImkzODYtc29mdG1tdS1jb25maWctZGV2aWNlcy5oIicg
LU1EIC1NUSBsaWJxZW11LWkzODYtc29mdG1tdS5mYS5wL2h3X2kzODZfYWNwaS1taWNyb3Zt
LmMubyAtTUYgbGlicWVtdS1pMzg2LXNvZnRtbXUuZmEucC9od19pMzg2X2FjcGktbWljcm92
bS5jLm8uZCAtbyBsaWJxZW11LWkzODYtc29mdG1tdS5mYS5wL2h3X2kzODZfYWNwaS1taWNy
b3ZtLmMubyAtYyAuLi9ody9pMzg2L2FjcGktbWljcm92bS5jDQouLi9ody9pMzg2L2FjcGkt
bWljcm92bS5jOjQ4OjEzOiBlcnJvcjogY29uZmxpY3RpbmcgdHlwZXMgZm9yIOKAmGFjcGlf
ZHNkdF9hZGRfdmlydGlv4oCZOyBoYXZlIOKAmHZvaWQoQW1sICosIE1pY3Jvdm1NYWNoaW5l
U3RhdGUgKinigJkNCiAgICA0OCB8IHN0YXRpYyB2b2lkIGFjcGlfZHNkdF9hZGRfdmlydGlv
KEFtbCAqc2NvcGUsDQogICAgICAgfCAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+
fg0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9ob21lL2RhbmllbGhiL3dvcmsvcWVtdS9pbmNs
dWRlL2h3L2FjcGkvYWNwaV9hbWxfaW50ZXJmYWNlLmg6NSwNCiAgICAgICAgICAgICAgICAg
IGZyb20gLi4vaHcvaTM4Ni9hY3BpLW1pY3Jvdm0uYzoyOToNCi9ob21lL2RhbmllbGhiL3dv
cmsvcWVtdS9pbmNsdWRlL2h3L2FjcGkvYW1sLWJ1aWxkLmg6NTAzOjY6IG5vdGU6IHByZXZp
b3VzIGRlY2xhcmF0aW9uIG9mIOKAmGFjcGlfZHNkdF9hZGRfdmlydGlv4oCZIHdpdGggdHlw
ZSDigJh2b2lkKEFtbCAqLCBjb25zdCBNZW1NYXBFbnRyeSAqLCB1aW50MzJfdCwgIGludCni
gJkge2FrYSDigJh2b2lkKEFtbCAqLCBjb25zdCBNZW1NYXBFbnRyeSAqLCB1bnNpZ25lZCBp
bnQsICBpbnQp4oCZfQ0KICAgNTAzIHwgdm9pZCBhY3BpX2RzZHRfYWRkX3ZpcnRpbyhBbWwg
KnNjb3BlLCBjb25zdCBNZW1NYXBFbnRyeSAqdmlydGlvX21taW9fbWVtbWFwLA0KICAgICAg
IHwgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fg0KWzUvNzE0XSBDb21waWxpbmcgQyBvYmpl
Y3QgbGlicWVtdS1pMzg2LXNvZnRtbXUuZmEucC9od19pMzg2X2t2bV9jbG9jay5jLm8NCg0K
VGhpcyBoYXBwZW5zIGJlY2F1c2UgdGhlIGNvbW1vbiAnYWNwaV9kc2R0X2FkZF92aXJ0aW8n
IGZ1bmN0aW9uIG1hdGNoZXMgYSBsb2NhbA0KZnVuY3Rpb24gd2l0aCB0aGUgc2FtZSBuYW1l
IGluIGh3L2kzODYvYWNwaS1taWNyb3ZtLmMuIFdlIHdvdWxkIG5lZWQgdG8gZWl0aGVyDQpy
ZW5hbWUgdGhlIHNoYXJlZCBoZWxwZXIgb3IgcmVuYW1lIHRoZSBsb2NhbCBhY3BpLW1pY3Jv
dm0gZnVuY3Rpb24gb3IgZG8gc29tZXRoaW5nDQpsaWtlIElnb3IgbWVudGlvbmVkIHRvIGF2
b2lkIHRoaXMgbmFtZSBjb2xsaXNpb24uDQoNCg0KVGhhbmtzLA0KDQpEYW5pZWwNCg0KDQoN
Cg0KDQoNCg0KDQo+IA0KPj4NCj4+IFRoYW5rcyENCj4+IFN1bmlsDQo+Pg0KPiANCg==

