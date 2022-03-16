Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUXMU-000744-S4
	for mharc-qemu-riscv@gnu.org; Wed, 16 Mar 2022 13:23:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phantom@zju.edu.cn>)
 id 1nUXMT-00073S-2I
 for qemu-riscv@nongnu.org; Wed, 16 Mar 2022 13:23:01 -0400
Received: from mail.zju.edu.cn ([61.164.42.155]:47792 helo=zju.edu.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <phantom@zju.edu.cn>) id 1nUXMN-0003dC-W2
 for qemu-riscv@nongnu.org; Wed, 16 Mar 2022 13:22:58 -0400
Received: by ajax-webmail-mail-app3 (Coremail) ; Thu, 17 Mar 2022 01:22:44
 +0800 (GMT+08:00)
X-Originating-IP: [10.181.233.226]
Date: Thu, 17 Mar 2022 01:22:44 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: phantom@zju.edu.cn
To: idan.horowitz@gmail.com
Cc: qemu-riscv@nongnu.org
Subject: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2022 www.mailtech.cn zju.edu.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7f383fc2.81a2.17f93c0dad7.Coremail.phantom@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cC_KCgCnnqXkHDJiEtYRAA--.3631W
X-CM-SenderInfo: qssqjiatstq6lmxovvfxof0/1tbiAg4LAVZdtYtjdwAAsn
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW7Jw
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
X-List-Received-Date: Wed, 16 Mar 2022 17:23:01 -0000

SGVyZSBpcyBhIHRlc3QgY2FzZSBmb3IgdGhpcyBwYXRjaC4gSSB1c2VkIHRvIHN1Ym1pdCB0aGlz
IGJ1ZyBvbiBodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC9xZW11LytidWcvMTkwNjUxNgoKc2Zl
bmNlLnZtYSB3aWxsIGZsdXNoIHRoZSB0bGIsIHNvIGFmdGVyIHRoaXMgaW5zdHJ1Y3Rpb24sIHRo
ZSB0cmFuc2xhdGlvbiBibG9jayBzaG91bGQgYmUgZW5kLiAKVGhlIGZvbGxvd2luZyBjb2RlIHdp
bGwgb25seSB3b3JrIGluIHNpbmdsZSBzdGVwIG1vZGU6CmBgYApyZWxvY2F0ZToKIGxpIGEwLCBP
RkZTRVQKCiBsYSB0MCwgMWYKIGFkZCB0MCwgdDAsIGEwCiBjc3J3IHN0dmVjLCB0MAoKIGxhIHQw
LCBlYXJseV9wZ3RibAogc3JsIHQwLCB0MCwgUEFHRV9TSElGVAogbGkgdDEsIFNBVFBfU1YzOQog
b3IgdDAsIHQxLCB0MAoKIGNzcncgc2F0cCwgdDAKMToKIHNmZW5jZS52bWEKIGxhIHQwLCB0cmFw
X3MKIGNzcncgc3R2ZWMsIHQwCiByZXQKYGBgCgpJbiB0aGlzIGNvZGUsIEkgd2FudCB0byByZWxv
Y2F0ZSBwYyB0byB2aXJ0dWFsIGFkZHJlc3Mgd2l0aCB0aGUgT0ZGU0VUIHByZWZpeC4gCkJlZm9y
ZSB3cml0aW5nIHRvIHNhdHAsIHBjIHJ1biBhdCBwaHlzaWMgYWRkcmVzcywgc3R2ZWMgaGFzIGJl
ZW4gc2V0IHRvIGxhYmVsIDEgCndpdGggYSB2aXJ0dWFsIHByZWZpeCBhbmQgdmlydHVhbCBhZGRy
ZXNzIGhhcyBiZWVuIG1hcHBpbmcgaW4gZWFybHlfcGd0YmwsIAphZnRlciB3cml0aW5nIHNhdHAs
IHFlbXUgd2lsbCB0aHJvdyBhIHBhZ2UgZmF1bHQsIGFuZCBwYyB3aWxsIHNldCB0byB2aXJ0dWFs
IAphZGRyZXNzIG9mIGxhYmVsIDEuCgpUaGUgcHJvYmxlbSBpcyB0aGF0LCBpbiB0aGlzIHNpdHVh
dGlvbiwgdGhlIHRyYW5zbGF0aW9uIGJsb2NrIHdpbGwgbm90IGVuZCBhZnRlciAKc2ZlbmNlLnZt
YSwgYW5kIHN0dmVjIHdpbGwgYmUgc2V0IHRvIHRyYXBfcywKCmBgYAotLS0tLS0tLS0tLS0tLS0t
CklOOgpQcml2OiAxOyBWaXJ0OiAwCjB4MDAwMDAwMDA4MDAwMDBkYzogMDBhMDgwYjMgYWRkIHJh
LHJhLGEwCjB4MDAwMDAwMDA4MDAwMDBlMDogMDAwMDcyOTcgYXVpcGMgdDAsMjg2NzIgIyAweDgw
MDA3MGUwCjB4MDAwMDAwMDA4MDAwMDBlNDogZjIwMjgyOTMgYWRkaSB0MCx0MCwtMjI0CjB4MDAw
MDAwMDA4MDAwMDBlODogMDBjMmQyOTMgc3JsaSB0MCx0MCwxMgoweDAwMDAwMDAwODAwMDAwZWM6
IGZmZjAwMzFiIGFkZGl3IHQxLHplcm8sLTEKMHgwMDAwMDAwMDgwMDAwMGYwOiAwM2YzMTMxMyBz
bGxpIHQxLHQxLDYzCjB4MDAwMDAwMDA4MDAwMDBmNDogMDA1MzYyYjMgb3IgdDAsdDEsdDAKMHgw
MDAwMDAwMDgwMDAwMGY4OiAxODAyOTA3MyBjc3JydyB6ZXJvLHNhdHAsdDAKCi0tLS0tLS0tLS0t
LS0tLS0KSU46ClByaXY6IDE7IFZpcnQ6IDAKMHgwMDAwMDAwMDgwMDAwMGZjOiAxMjAwMDA3MyBz
ZmVuY2Uudm1hIHplcm8semVybwoweDAwMDAwMDAwODAwMDAxMDA6IDAwMDAwMjk3IGF1aXBjIHQw
LDAgIyAweDgwMDAwMTAwCjB4MDAwMDAwMDA4MDAwMDEwNDogMWM4MjgyOTMgYWRkaSB0MCx0MCw0
NTYKMHgwMDAwMDAwMDgwMDAwMTA4OiAxMDUyOTA3MyBjc3JydyB6ZXJvLHN0dmVjLHQwCgpyaXNj
dl9yYWlzZV9leGNlcHRpb246IDEyCnJpc2N2X3JhaXNlX2V4Y2VwdGlvbjogMTIKcmlzY3ZfcmFp
c2VfZXhjZXB0aW9uOiAxMgpyaXNjdl9yYWlzZV9leGNlcHRpb246IDEyCi4uLgpgYGAKClNvLCB0
aGUgcHJvZ3JhbSB3aWxsIGNyYXNoLiBBbmQgdGhlIHByb2dyYW0gd2lsbCBvbmx5IHdvcmsgaW4g
c2luZ2xlIHN0ZXAgbW9kZToKYGBgCi0tLS0tLS0tLS0tLS0tLS0KSU46ClByaXY6IDE7IFZpcnQ6
IDAKMHgwMDAwMDAwMDgwMDAwMGY4OiAxODAyOTA3MyBjc3JydyB6ZXJvLHNhdHAsdDAKCi0tLS0t
LS0tLS0tLS0tLS0KSU46ClByaXY6IDE7IFZpcnQ6IDAKMHgwMDAwMDAwMDgwMDAwMGZjOiAxMjAw
MDA3MyBzZmVuY2Uudm1hIHplcm8semVybwoKcmlzY3ZfcmFpc2VfZXhjZXB0aW9uOiAxMgotLS0t
LS0tLS0tLS0tLS0tCklOOgpQcml2OiAxOyBWaXJ0OiAwCjB4ZmZmZmZmZmY4MDAwMDBmYzogMTIw
MDAwNzMgc2ZlbmNlLnZtYSB6ZXJvLHplcm8KCi0tLS0tLS0tLS0tLS0tLS0KSU46ClByaXY6IDE7
IFZpcnQ6IDAKMHhmZmZmZmZmZjgwMDAwMTAwOiAwMDAwMDI5NyBhdWlwYyB0MCwwICMgMHhmZmZm
ZmZmZjgwMDAwMTAwCgpgYGAKVGhlIHBjIHdpbGwgc2V0IHRvIGxhYmVsIDEsIGluc3RlYWQgb2Yg
dHJhcF9zLgo=

