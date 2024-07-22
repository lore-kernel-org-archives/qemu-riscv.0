Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE27C3DA61
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 01:48:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sViA2-0002oJ-RV; Sun, 21 Jul 2024 21:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yfliu2008@qq.com>) id 1sVi9z-0002mo-BD
 for qemu-riscv@nongnu.org; Sun, 21 Jul 2024 21:48:19 -0400
Received: from out203-205-221-235.mail.qq.com ([203.205.221.235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yfliu2008@qq.com>) id 1sVi9w-0005la-5B
 for qemu-riscv@nongnu.org; Sun, 21 Jul 2024 21:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1721612886; bh=uiYVbF6/dcGHcyl+rifbG03cbqlH1QnHnR90pMYLIsA=;
 h=From:To:Subject:Date;
 b=xr5C0ZgelrxGsU8WCICs0jGF8qzFudqMGKdHwE31xXJnLKqG+xkSI06aT7xyQmIW1
 C/ywvGPIM40iy0lt6krrf5p5fHBCPczjPXPjFy37qAz/AgAHUAuaKEC1aL5V0jmx3t
 lym1Eevg6EFA8PkYfk8RkVUWAH5uYlryMRvtZNOw=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-XMAILINFO: MvBKtgduchMIBh9AJFFR9Vbt/qakaqj21GcL9V3PhemG3NjUKGwukDiZ1YXxVr
 teKmo4d6QZ8DKv6eFZKwiMDkjC07PJLOx34hmDwj0xUN7yvLA4etadfkp9LV4fq5wbg7J80Ayw3jK
 3Si4QUb6mps0mmapTl8iihMPZJBpiVMxpLWw+w+Z8RMh00Am6QpqJK7jhvF3LecVCrJmG29VUXfZL
 D7qv3x0BzEKPv1NQAbWW+FoYXYlNFZKD1vORC9S5PhVgKRxwPiN5TouyTHDsW1/DV3DTKdBT1zo5B
 9p4+fNpokjNsB/8kjMn2+Ijg2kpRSShndB7+mpK9MYp8Jms9NrG9ipesx4KzmzVug7pNPMbSYTay7
 YqL3uUIQn4vU7kBdqCMPbRV+OjPVWz+8jhuPiARCgX0qy/1e+xxSK3bdq8f7dOeN2Q8PJb+DugA8f
 jLqpFqXwJN4eor9UO2UVXAb/XvRZmA00vHQ++A5TIBb+cg/t4GIlOMZtRJvgoe1sF591iNyeNvdO/
 cFenS0s/yCdz3kaE2Xc/bnrW9BgOf33YxxhOmmRfnGSm3wGlIZZ0iz0SgapCSpy8fQa9z0lkyPjsj
 gb9Qj/mdWSZcfuM4+bVqy2ekeYkbj+aQmQc+0g2UcLcGPM5ZiT5hsr5ODpd4RJaNrOq2f4BUygJkA
 1fSp7W82DE5A/v05ntkdtCaFqLBpRwHA4/+2a4+yhS8K18S6lVyq9A4h/3bqRNX04U9KHVfj+UvIz
 4aYBwwVok9dY5gt+wzf4v0Cf8LJXOwCW19y9vbHcLuTviHpkFvtHQIGxfAHTtimO1KMOzPkDbPjAy
 bpZkml6+RQrUel9liFOyLz8hK5jPq9f7LL1HmxIt5J/gTU0psSijb81ez18Sb4+jwDJqB69VT+ZLQ
 fwe3k3Tnpggwr3DH0MaSGKoql5KU8VmPv3gqoKTgur+BpJQcH1pgrkrBfvRJTTgPAjYbPzunhJOmg
 dktXiFLg==
From: "=?utf-8?B?eWZsaXUyMDA4?=" <yfliu2008@qq.com>
To: "=?utf-8?B?cWVtdS1yaXNjdg==?=" <qemu-riscv@nongnu.org>
Subject: non-SMP multi core usage
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_669DBA55_3C91D0E0_1DCC61BB"
Content-Transfer-Encoding: 8Bit
Date: Mon, 22 Jul 2024 09:48:05 +0800
X-Priority: 3
Message-ID: <tencent_8469F790872829C4B573249079063F7A3207@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-mid: xmseszc7-0t1721612885tpfjeqrq5
Received-SPF: pass client-ip=203.205.221.235; envelope-from=yfliu2008@qq.com;
 helo=out203-205-221-235.mail.qq.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, FROM_EXCESS_BASE64=0.001, HELO_DYNAMIC_IPADDR=1.951,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This is a multi-part message in MIME format.

------=_NextPart_669DBA55_3C91D0E0_1DCC61BB
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

RGVhciZuYnNwO2V4cGVydHMsDQoNCg0KDQpJIGFtIHJlc2VuZGluZyBhcyBteSBsYXN0IG1h
aWwgaXMgaW4gc3RyYW5nZSBmb3JtYXQgdGhvdWdoICJwbGFpbiB0ZXh0IiBpcyBzZWxlY3Rl
ZCBoZXJlLiBTb3JyeSBhYm91dCB0aGlzLg0KDQoNCg0KSSZuYnNwO2hhdmUmbmJzcDthJm5i
c3A7dXNhZ2UmbmJzcDtxdWVzdGlvbiZuYnNwO2hlcmUsJm5ic3A7YXMmbmJzcDtJJm5ic3A7
Y2FuJ3QmbmJzcDtyZWdpc3RlciZuYnNwO2luJm5ic3A7R2l0bGFiJm5ic3A7dG8mbmJzcDtj
cmVhdGUmbmJzcDtpc3N1ZXMsJm5ic3A7YW5kJm5ic3A7dGhlJm5ic3A7R2l0aHViJm5ic3A7
cmVwb3NpdG9yeSZuYnNwO2RvZXNuJ3QmbmJzcDthY2NlcHQmbmJzcDtpc3N1ZXMuDQoNCk15
Jm5ic3A7cXVlc3Rpb24mbmJzcDtpcyZuYnNwO2hvdyZuYnNwO3RvJm5ic3A7dXNlJm5ic3A7
InFlbXUtc3lzdGVtLXJpc2N2IC1NIHZpcnQiJm5ic3A7Zm9yJm5ic3A7YSZuYnNwO21hY2hp
bmUgd2l0aCZuYnNwO3R3byZuYnNwO0NQVXMmbmJzcDthbmQgcnVuJm5ic3A7dHdvIHByb2dy
YW1zIHNlcGFyYXRlbHkgKG5vdCZuYnNwO2ZvciZuYnNwO1NNUCkuIA0KDQoNClJlZ2FyZHMs
DQp5Zg==

------=_NextPart_669DBA55_3C91D0E0_1DCC61BB
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGRpdiBjbGFzcz0icW1ib3giPjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiAtYXBwbGUtc3lz
dGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1BpbmdGYW5nIFNDJnF1b3Q7LCAmcXVv
dDtNaWNyb3NvZnQgWWFIZWkmcXVvdDssIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTAuNXB0
OyBjb2xvcjogcmdiKDQ2LCA0OCwgNTEpOyAtLWRhcmtyZWFkZXItaW5saW5lLWNvbG9yOiAj
YzljNWJlOyBtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsiIGRhdGEtZGFy
a3JlYWRlci1pbmxpbmUtY29sb3I9IiI+RGVhciZuYnNwO2V4cGVydHMsPGJyICAvPjwvZGl2
PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiAtYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3Rl
bUZvbnQsICZxdW90O1BpbmdGYW5nIFNDJnF1b3Q7LCAmcXVvdDtNaWNyb3NvZnQgWWFIZWkm
cXVvdDssIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTAuNXB0OyBjb2xvcjogcmdiKDQ2LCA0
OCwgNTEpOyAtLWRhcmtyZWFkZXItaW5saW5lLWNvbG9yOiAjYzljNWJlOyBtYXJnaW4tdG9w
OiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsiIGRhdGEtZGFya3JlYWRlci1pbmxpbmUtY29s
b3I9IiI+PGJyICAvPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiAtYXBwbGUtc3lz
dGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1BpbmdGYW5nIFNDJnF1b3Q7LCAmcXVv
dDtNaWNyb3NvZnQgWWFIZWkmcXVvdDssIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTAuNXB0
OyBjb2xvcjogcmdiKDQ2LCA0OCwgNTEpOyAtLWRhcmtyZWFkZXItaW5saW5lLWNvbG9yOiAj
YzljNWJlOyBtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsiIGRhdGEtZGFy
a3JlYWRlci1pbmxpbmUtY29sb3I9IiI+SSBhbSByZXNlbmRpbmcgYXMgbXkgbGFzdCBtYWls
IGlzIGluIHN0cmFuZ2UgZm9ybWF0IHRob3VnaCAicGxhaW4gdGV4dCIgaXMgc2VsZWN0ZWQg
aGVyZS4gU29ycnkgYWJvdXQgdGhpcy48YnIgIC8+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1m
YW1pbHk6IC1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1b3Q7UGluZ0Zh
bmcgU0MmcXVvdDssICZxdW90O01pY3Jvc29mdCBZYUhlaSZxdW90Oywgc2Fucy1zZXJpZjsg
Zm9udC1zaXplOiAxMC41cHQ7IGNvbG9yOiByZ2IoNDYsIDQ4LCA1MSk7IC0tZGFya3JlYWRl
ci1pbmxpbmUtY29sb3I6ICNjOWM1YmU7IG1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRv
bTogMHB4OyIgZGF0YS1kYXJrcmVhZGVyLWlubGluZS1jb2xvcj0iIj48YnIgIC8+PC9kaXY+
PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IC1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVt
Rm9udCwgJnF1b3Q7UGluZ0ZhbmcgU0MmcXVvdDssICZxdW90O01pY3Jvc29mdCBZYUhlaSZx
dW90Oywgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMC41cHQ7IGNvbG9yOiByZ2IoNDYsIDQ4
LCA1MSk7IC0tZGFya3JlYWRlci1pbmxpbmUtY29sb3I6ICNjOWM1YmU7IG1hcmdpbi10b3A6
IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyIgZGF0YS1kYXJrcmVhZGVyLWlubGluZS1jb2xv
cj0iIj5JJm5ic3A7aGF2ZSZuYnNwO2EmbmJzcDt1c2FnZSZuYnNwO3F1ZXN0aW9uJm5ic3A7
aGVyZSwmbmJzcDthcyZuYnNwO0kmbmJzcDtjYW4ndCZuYnNwO3JlZ2lzdGVyJm5ic3A7aW4m
bmJzcDtHaXRsYWImbmJzcDt0byZuYnNwO2NyZWF0ZSZuYnNwO2lzc3VlcywmbmJzcDthbmQm
bmJzcDt0aGUmbmJzcDtHaXRodWImbmJzcDtyZXBvc2l0b3J5Jm5ic3A7ZG9lc24ndCZuYnNw
O2FjY2VwdCZuYnNwO2lzc3Vlcy48YnIgIC8+PGJyICAvPk15Jm5ic3A7cXVlc3Rpb24mbmJz
cDtpcyZuYnNwO2hvdyZuYnNwO3RvJm5ic3A7dXNlJm5ic3A7InFlbXUtc3lzdGVtLXJpc2N2
IC1NIHZpcnQiJm5ic3A7Zm9yJm5ic3A7YSZuYnNwO21hY2hpbmUgd2l0aCZuYnNwO3R3byZu
YnNwO0NQVXMmbmJzcDthbmQgcnVuJm5ic3A7dHdvIHByb2dyYW1zIHNlcGFyYXRlbHkgKG5v
dCZuYnNwO2ZvciZuYnNwO1NNUCkuIDxiciAgLz48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZh
bWlseTogLWFwcGxlLXN5c3RlbSwgQmxpbmtNYWNTeXN0ZW1Gb250LCAmcXVvdDtQaW5nRmFu
ZyBTQyZxdW90OywgJnF1b3Q7TWljcm9zb2Z0IFlhSGVpJnF1b3Q7LCBzYW5zLXNlcmlmOyBm
b250LXNpemU6IDEwLjVwdDsgY29sb3I6IHJnYig0NiwgNDgsIDUxKTsgLS1kYXJrcmVhZGVy
LWlubGluZS1jb2xvcjogI2M5YzViZTsgbWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9t
OiAwcHg7IiBkYXRhLWRhcmtyZWFkZXItaW5saW5lLWNvbG9yPSIiPjxiciAgLz5SZWdhcmRz
LDxiciAgLz55ZjxiciAgLz48L2Rpdj48L2Rpdj4=

------=_NextPart_669DBA55_3C91D0E0_1DCC61BB--


