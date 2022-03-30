Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZXto-0000pT-1b
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 08:58:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phantom@zju.edu.cn>)
 id 1nZXbG-0008M4-Df; Wed, 30 Mar 2022 08:39:00 -0400
Received: from mail.zju.edu.cn ([61.164.42.155]:13242 helo=zju.edu.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <phantom@zju.edu.cn>)
 id 1nZXb7-0003Z0-R7; Wed, 30 Mar 2022 08:38:54 -0400
Received: by ajax-webmail-mail-app2 (Coremail) ; Wed, 30 Mar 2022 20:38:30
 +0800 (GMT+08:00)
X-Originating-IP: [10.190.67.184]
Date: Wed, 30 Mar 2022 20:38:30 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: phantom@zju.edu.cn
To: "Idan Horowitz" <idan.horowitz@gmail.com>
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, qemu-devel@nongnu.org
Subject: Re: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.8 build 20200806(7a9be5e8)
 Copyright (c) 2002-2022 www.mailtech.cn zju.edu.cn
In-Reply-To: <CA+4MfEKzZStKBx3-FVm8uiyh=LhiWAXPvChxGyVD20sHkcQRSg@mail.gmail.com>
References: <7f383fc2.81a2.17f93c0dad7.Coremail.phantom@zju.edu.cn>
 <CAOnJCUJck5o_-cayf-=mccenoZH048+2zhGDGOoWKiVMUFWWmQ@mail.gmail.com>
 <CA+4MfE+hFQhRYEgEXy-u10=MBhnmA5f7MdRFjW7Xc0dLPSiLXw@mail.gmail.com>
 <CAOnJCU+ZMnLoi2GNDdKz24KJbHpEBQT1=Qo5LbSE1xz=WvwbrA@mail.gmail.com>
 <CA+4MfEKzZStKBx3-FVm8uiyh=LhiWAXPvChxGyVD20sHkcQRSg@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <621d67f0.257cf.17fdad5aa33.Coremail.phantom@zju.edu.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: by_KCgCXDxdGT0Ri7GTIAA--.18663W
X-CM-SenderInfo: qssqjiatstq6lmxovvfxof0/1tbiAgIFAVZdtY9ZVwAAs7
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Received-SPF: pass client-ip=61.164.42.155; envelope-from=phantom@zju.edu.cn;
 helo=zju.edu.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 08:58:06 -0400
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
X-List-Received-Date: Wed, 30 Mar 2022 12:39:24 -0000

SSBhZ3JlZSB3aXRoIHlvdSBwYXJ0bHksIG15IHRlc3QgY2FzZSBpcyBhY3R1YWxseSBmcm9tIGxp
bnV4IGtlcm5lbCwgSSBub3RpY2UgCnRoZSBzdHJhbmdlIHNmZW5jZS52bWEgYmVmb3JlIHdyaXRl
IHNhdHAgZHVyaW5nIHdyaXRlIG91ciB0ZWFjaGluZyBrZXJuZWwuCkkgdGhpbmssIHRoZSBzdHJh
bmdlIGNvZGUgaXMgdXNlZCB0byBieXBhc3MgdGhlIHFlbXUgYnVnIHRoYXQgSWRhbiBwYXRjaGVk
LgpCZWNhdXNlIGluIGhhcmR3YXJlLCBpZiB0aGUgc3RhcCBpcyBlbXB0eSwgc2ZlbmNlLnZtYSB3
aWxsIGRvIG5vdGhpbmcuCkFuZCB0aGF0J3Mgd2h5IG5vYm9keSByZXBvcnQgaXQuCkJlZm9yZSBw
YXRjaCwgcWVtdSB3b24ndCBlbmQgYSBCQiBhZnRlciBzZmVuY2UgKGJ1dCBqdW1wIGFuZCBDU1Ig
d3JpdGUgZG8pLgpTbywgdGhlIGtlcm5lbCBhdXRob3IgcmVvZGVyZWQgd3JpdGUgc3RhcCBhbmQg
c2ZlbmNlLnZtYSB0byBtYWtlIHNmZW5jZS52bWEgCnBsYWNlIGluIHRoZSBzYW1lIEJCIHdpdGgg
d3JpdGUgc2F0cCwgaW5zdGVhZCBvZiB0aGUgZm9sbG93aW5nIHdyaXRlIHN0dmVjLgooSWYgZG9u
J3QgcmVvcmRlciwgc2ZlbmNlLnZtYSB3aWxsIHBsYWNlIGluIHRoZSBzYW1lIEJCIHdpdGggd3Jp
dGUgc3R2ZWMsCnRoYXQgd2lsbCBjcmFzaCBrZXJuZWwsIHNlZSBteSBvcmlnaW4gYW5hbHlzaXMp
LgoKSG93ZXZlciwgaW4gaGFyZHdhcmUsIHNpbmNlIHRsYiBpcyBlbXB0eSwgcHV0IHRoZSBmaXJz
dCBzZmVuY2Uudm1hIGJlZm9yZSBvciAKYWZ0ZXIgd3JpdGUgc2F0cCBpcyBub3QgcmVhbGx5IG1h
dHRlcnMuCkluIHFlbXUsIGFzIEF0aXNoJ3MgbG9nIHNob3duLCB3ZSBzaG91bGQgZG8gYSBpbXBs
eSBpbnZpc2libGUgc2ZlbmNlLnZtYSBhZnRlcgp3cml0ZSBzdGFwIHRvIGludmFsaWQgcWVtdSdz
IHRyYW5zbGF0aW9uIGNhY2hlLgoKSmlueWFuCgoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2VzLS0t
LS0KPiBGcm9tOiAiSWRhbiBIb3Jvd2l0eiIgPGlkYW4uaG9yb3dpdHpAZ21haWwuY29tPgo+IFNl
bnQgVGltZTogMjAyMi0wMy0zMCAxNTozNToxOSAoV2VkbmVzZGF5KQo+IFRvOiAiQXRpc2ggUGF0
cmEiIDxhdGlzaHBAYXRpc2hwYXRyYS5vcmc+Cj4gQ2M6IHBoYW50b21Aemp1LmVkdS5jbiwgIm9w
ZW4gbGlzdDpSSVNDLVYiIDxxZW11LXJpc2N2QG5vbmdudS5vcmc+LCAiQWxpc3RhaXIgRnJhbmNp
cyIgPEFsaXN0YWlyLkZyYW5jaXNAd2RjLmNvbT4sICJxZW11LWRldmVsQG5vbmdudS5vcmcgRGV2
ZWxvcGVycyIgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz4KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB0
YXJnZXQvcmlzY3Y6IEV4aXQgY3VycmVudCBUQiBhZnRlciBhbiBzZmVuY2Uudm1hCj4gCj4gT24g
V2VkLCAzMCBNYXIgMjAyMiBhdCAxMDoyOCwgQXRpc2ggUGF0cmEgPGF0aXNocEBhdGlzaHBhdHJh
Lm9yZz4gd3JvdGU6Cj4gPgo+ID4gSSB0ZXN0ZWQgb24gdjUuMTcgYnVpbHQgZnJvbSBkZWZjb25m
aWcgZm9yIHJ2NjQuCj4gPgo+ID4gSGVyZSBpcyB0aGUga2VybmVsIGNvZGUgZXhlY3V0aW5nIHNm
ZW5jZS52bWEKPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE3L3NvdXJj
ZS9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMjTDEyMgo+ID4KPiAKPiBJIGJlbGlldmUgdGhpcyBp
cyBhIGtlcm5lbCBidWcgYW5kIG5vdCBhIFFFTVUgb25lLiBUaGV5IHBlcmZvcm0gYQo+IHdyaXRl
IHRvIHRoZSBTQVRQIHdpdGggdGhlIHNhbWUgQVNJRCBhcyB0aGUgb25lIHVzZWQgYmVmb3JlICgw
KSBhbmQKPiB0aGVuIGV4cGVjdCBpdCB0byBiZSB1c2VkLCB3aXRob3V0IHBlcmZvcm1pbmcgYW4g
c2ZlbmNlLnZtYSBmb2xsb3dpbmcKPiBpdC4KPiBUaGlzIHdhcyBleHBvc2VkIGJ5IG15IGNoYW5n
ZSwgYXMgcHJldmlvdXNseSB0aGUgd3JpdGUgdG8gdGhlIHNhdHAgd2FzCj4gcGVyZm9ybWVkIGlu
IHRoZSBzYW1lIFRCIGJsb2NrIGFzIHRoZSBzZmVuY2Uudm1hICpiZWZvcmUgaXQqLCB3aGljaAo+
IG1lYW50IHRoZSBUTEIgd2FzIG5vdCBmaWxsZWQgaW4gYmV0d2VlbiB0aGUgcHJldmlvdXMgc2Zl
bmNlIGFuZCB0aGUKPiB3cml0ZSB0byBTQVRQIGZvbGxvd2luZyBpdC4KPiBJIHdhcyBhYmxlIHRv
IHJlcHJvZHVjZSB0aGUgaXNzdWUgd2l0aCB0aGUgRmVkb3JhIFJhd2hpZGUgaW1hZ2UgaW4gdGhl
Cj4gd2lraSwgYW5kIEkgd2FzIGFibGUgdG8gcmVzb2x2ZSBpdCBieSBhcnRpZmljaWFsbHkgZm9y
Y2luZyBhIFRMQiBmbHVzaAo+IGZvbGxvd2luZyBhbGwgd3JpdGVzIHRvIFNBVFAuCj4gSSB0aGlu
ayB0aGUgY29ycmVjdCBjb3Vyc2Ugb2YgYWN0aW9uIGhlcmUgaXMgdG86Cj4gMS4gUmVwb3J0IHRo
ZSBpc3N1ZSB0byB0aGUgbGludXgga2VybmVsIG1haWxpbmcgbGlzdCBhbmQvb3IgY29udHJpYnV0
ZQo+IGEgcGF0Y2ggdGhhdCBhZGRzIHNhaWQgbWlzc2luZyBzZmVuY2Uudm1hIGZvbGxvd2luZyB0
aGUgU0FUUCB3cml0ZS4KPiAoQXRpc2g6IEFyZSB5b3UgYWJsZSB0byB0ZXN0IGlmIGFkZGluZyBh
biBzZmVuY2Uudm1hIGluIHlvdXIga2VybmVsCj4gYnVpbGQgZml4ZXMgdGhlIGlzc3VlPykKPiAy
LiBSZXN0b3JlIHRoZSBwYXRjaAo+IAo+ID4KPiA+IC0tCj4gPiBSZWdhcmRzLAo+ID4gQXRpc2gK
PiAKPiBJZGFuIEhvcm93aXR6Cg==

