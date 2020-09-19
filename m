Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kJfZq-0004Xw-RE
	for mharc-qemu-riscv@gnu.org; Sat, 19 Sep 2020 12:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phantom0308@zju.edu.cn>)
 id 1kJerC-0006Sf-Mp
 for qemu-riscv@nongnu.org; Sat, 19 Sep 2020 11:33:03 -0400
Received: from mail.zju.edu.cn ([61.164.42.155]:30646 helo=zju.edu.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <phantom0308@zju.edu.cn>) id 1kJer3-0003Zv-Mt
 for qemu-riscv@nongnu.org; Sat, 19 Sep 2020 11:32:56 -0400
Received: by ajax-webmail-mail-app3 (Coremail) ; Sat, 19 Sep 2020 23:32:32
 +0800 (GMT+08:00)
X-Originating-IP: [10.15.192.126]
Date: Sat, 19 Sep 2020 23:32:32 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: Jinyan <phantom0308@zju.edu.cn>
To: qemu-riscv@nongnu.org
Subject: Rom regions overlap
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.12 build 20200616(0f5d8152)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
Content-Type: multipart/alternative; 
 boundary="----=_Part_268889_840823713.1600529552459"
MIME-Version: 1.0
Message-ID: <26e4803b.146f7.174a6fed44b.Coremail.phantom0308@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cC_KCgAH0t6QJGZfK3KaBA--.14136W
X-CM-SenderInfo: qtrwiiaqrrjlo62m3hxhgxhubq/1tbiAwIHD1NG3AEz2wAIsh
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUblCS07vEb7Iv0x
 C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
 bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
 CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIAIbVA2z4x0Y4vEx4A2jsIE14v26r
 xl6s0DMIAIbVA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1lV2xY62AIxVAIcxkEcVAq
 07x20xvEncxIr21lV2xY6c02F40EFcxC0VAKzVAqx4xG6I80ewCS07vEYx0E2Ix0cI8IcV
 AFwI0_Jr0_Jr4lV2xY6cIj6I8E87Iv67AKxVWUJVW8JwCS07vEOx8S6xCaFVCjc4AY6r1j
 6r4UMIAIbVCjxxvEw4WlV2xY6xkI7II2jI8vz4vEwIxGrwCS07vE42xK82IY6x8ErcxFaV
 Av8VW8uw4UJr1UMIAIbVCF72vE77IF4wCS07vE4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lV2xY
 6I8I3I0E5I8CrVAFwI0_JrI_JrWlV2xY6I8I3I0E7480Y4vE14v26r106r1rMIAIbVC2zV
 AF1VAY17CE14v26r1j6r15MIAIbVCI42IY6xIIjxv20xvE14v26r1j6r1xMIAIbVCI42IY
 6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lV2xY6IIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s
 0DMIAIbVCI42IY6I8E87Iv67AKxVWUJVW8JwCS07vEIxAIcVC2z280aVCY1x0267AKxVWU
 JVW8JbIYCTnIWIevJa73U
Received-SPF: pass client-ip=61.164.42.155;
 envelope-from=phantom0308@zju.edu.cn; helo=zju.edu.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/19 11:32:37
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 19 Sep 2020 12:19:05 -0400
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Sep 2020 15:33:04 -0000

------=_Part_268889_840823713.1600529552459
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGksIEkgdXNlZCB0byB1c2UgYmJsIHRvIGxvYWQga2VybmVsLCBsaWtlIGZvbGxvd2luZzoKCnFl
bXUtc3lzdGVtLXJpc2N2NjQgLW5vZ3JhcGhpYyAtbWFjaGluZSB2aXJ0IC1rZXJuZWwgYmJsIC1k
cml2ZSBmaWxlPXJvb3Rmcy5iaW4sZm9ybWF0PXJhdyxpZD1oZDAgLWRldmljZSB2aXJ0aW8tYmxr
LWRldmljZSxkcml2ZT1oZDAgLW5ldGRldiB1c2VyLGlkPW5ldDAgLWRldmljZSB2aXJ0aW8tbmV0
LWRldmljZSxuZXRkZXY9bmV0MAoKVGhlc2UgZGF5cyBJIHVwc3RyZWFtIG15IHFlbXUsIGJ1dCBJ
IGdvdCB0aGUgZm9sbG93aW5nIGVycm9yczoKCnJvbTogcmVxdWVzdGVkIHJlZ2lvbnMgb3Zlcmxh
cCAocm9tIHBoZHIgIzA6IGJibC4gZnJlZT0weDAwMDAwMDAwODAwMTE0ODgsIGFkZHI9MHgwMDAw
MDAwMDgwMDAwMDAwKQoKCkhvdyB0byBydW4gbGludXggb24gcmlzY3YtcWVtdSB3aXRoIDUuMS41
MCBub3cgPyBEbyB3ZSBkbyBub3QgbmVlZCBiYmwgdG8gbG9hZCBrZXJuZWwgbm93ID8KClRoYW5r
cwoKCg==
------=_Part_268889_840823713.1600529552459
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PHA+CglIaSwgSSB1c2VkIHRvIHVzZSBiYmwgdG8gbG9hZCBrZXJuZWwsIGxpa2UgZm9sbG93aW5n
Ogo8L3A+CjxwPgoJcWVtdS1zeXN0ZW0tcmlzY3Y2NCAtbm9ncmFwaGljIC1tYWNoaW5lIHZpcnQg
LWtlcm5lbCBiYmwmbmJzcDs8c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlOyI+IDwvc3Bhbj4t
ZHJpdmUgZmlsZT1yb290ZnMuYmluLGZvcm1hdD1yYXcsaWQ9aGQwJm5ic3A7PHNwYW4gc3R5bGU9
IndoaXRlLXNwYWNlOnByZTsiPiA8L3NwYW4+LWRldmljZSB2aXJ0aW8tYmxrLWRldmljZSxkcml2
ZT1oZDAmbmJzcDstbmV0ZGV2IHVzZXIsaWQ9bmV0MCAtZGV2aWNlIHZpcnRpby1uZXQtZGV2aWNl
LG5ldGRldj1uZXQwCjwvcD4KPHA+CglUaGVzZSBkYXlzIEkgdXBzdHJlYW0gbXkgcWVtdSwgYnV0
IEkgZ290IHRoZSBmb2xsb3dpbmcgZXJyb3JzOgo8L3A+CjxwPgoJcm9tOiByZXF1ZXN0ZWQgcmVn
aW9ucyBvdmVybGFwIChyb20gcGhkciAjMDogYmJsLiBmcmVlPTB4MDAwMDAwMDA4MDAxMTQ4OCwg
YWRkcj0weDAwMDAwMDAwODAwMDAwMDApPGJyPgoJPC9wPjxwPgoJCUhvdyB0byBydW4gbGludXgg
b24gcmlzY3YtcWVtdSB3aXRoIDUuMS41MCBub3cgPyBEbyB3ZSBkbyBub3QgbmVlZCBiYmwgdG8g
bG9hZCBrZXJuZWwgbm93ID8KCTwvcD4KCTxwPgoJCVRoYW5rcwoJPC9wPgoKPHA+Cgk8YnI+Cjwv
cD4=
------=_Part_268889_840823713.1600529552459--


