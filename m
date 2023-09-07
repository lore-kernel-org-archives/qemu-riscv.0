Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4E0EB8FB0
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 11:26:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeD9Q-0003Nu-BU; Thu, 07 Sep 2023 07:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1qeD9A-0003Ie-It
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 07:26:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1qeD97-0005TW-TB
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 07:26:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694085960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=tOznAspLbWvrWJNx0UF9J7BdMS4ugfYBwqWesHRWmYU=;
 b=G0Ih0T7pVBRE96BkO4b4mSbCAwdV1jOGsE5Og6e8sug57gFcMNOYR5pR6OIICozDk9Dm13
 hDSgNvgg62udqgeJ+ATPtWsIuQofHRtzhkub3GJkllBV2ICBsbc7JKYlE6zHJBqF4WvbVm
 jH/Xx0DRFxAHnoovlBbo6wl5mx/jlyM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-Tge6idwxPymFgHRAZ3L4gg-1; Thu, 07 Sep 2023 07:25:59 -0400
X-MC-Unique: Tge6idwxPymFgHRAZ3L4gg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7048F29AB41A;
 Thu,  7 Sep 2023 11:25:58 +0000 (UTC)
Received: from [10.39.195.82] (unknown [10.39.195.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 141CA40C2070;
 Thu,  7 Sep 2023 11:25:54 +0000 (UTC)
Content-Type: multipart/mixed; boundary="------------ZR1m14MDFmAsD0TV80ymdGBL"
Message-ID: <139b9697-5732-dafa-0942-6d93eed674c7@redhat.com>
Date: Thu, 7 Sep 2023 13:25:53 +0200
MIME-Version: 1.0
Content-Language: en-US
To: qemu devel list <qemu-devel@nongnu.org>
Cc: "Richard W.M. Jones" <rjones@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 "Warkentin, Andrei" <andrei.warkentin@intel.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
From: Laszlo Ersek <lersek@redhat.com>
Subject: riscv64 virt board crash upon startup
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
--------------ZR1m14MDFmAsD0TV80ymdGBL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This is with QEMU v8.1.0-391-gc152379422a2.

I use the command line from (scroll to the bottom):

  https://github.com/tianocore/edk2/commit/49f06b664018

(with "-full-screen" removed).

The crash is as follows:

  Unexpected error in object_property_find_err() at ../../src/upstream/qemu/qom/object.c:1314:
  qemu: Property 'qemu-fixed-text-console.device' not found
  Aborted (core dumped)

(Full backtrace attached.)

If I replace the "-device virtio-gpu-pci" option with "-nographic", then
there is no crash; QEMU launches fine and the guest starts booting fine.

I think this is a board-related problem; the riscv virt board code
likely does not set up the console properly.

Furthermore, I reckon this could be regression. When Sunil's above patch
was committed to edk2 (2023-06-23), the graphical guest window must have
worked still.

Laszlo
--------------ZR1m14MDFmAsD0TV80ymdGBL
Content-Type: text/plain; charset=UTF-8; name="bt-full.txt"
Content-Disposition: attachment; filename="bt-full.txt"
Content-Transfer-Encoding: base64

IzAgIDB4MDAwMDdmZmZmNGVhMTU0YyBpbiBfX3B0aHJlYWRfa2lsbF9pbXBsZW1lbnRhdGlv
biAoKSBhdCAvbGliNjQvbGliYy5zby42CiMxICAweDAwMDA3ZmZmZjRlNTRkNDYgaW4gcmFp
c2UgKCkgYXQgL2xpYjY0L2xpYmMuc28uNgojMiAgMHgwMDAwN2ZmZmY0ZTI4N2YzIGluIGFi
b3J0ICgpIGF0IC9saWI2NC9saWJjLnNvLjYKIzMgIDB4MDAwMDU1NTU1NWZjNGE3NSBpbiBl
cnJvcl9oYW5kbGUgKGVycnA9MHg1NTU1NTY3ODk3YjggPGVycm9yX2Fib3J0PiwgZXJyPTB4
NTU1NTU3YWVlODYwKSBhdCAuLi8uLi9zcmMvdXBzdHJlYW0vcWVtdS91dGlsL2Vycm9yLmM6
NDEKIzQgIDB4MDAwMDU1NTU1NWZjNGJmOCBpbiBlcnJvcl9zZXR2IChlcnJwPTB4NTU1NTU2
Nzg5N2I4IDxlcnJvcl9hYm9ydD4sIHNyYz0weDU1NTU1NjIwNTA2OCAiLi4vLi4vc3JjL3Vw
c3RyZWFtL3FlbXUvcW9tL29iamVjdC5jIiwgbGluZT0xMzE0LCBmdW5jPTB4NTU1NTU2MjA1
OGEwIDxfX2Z1bmNfXy4yMD4gIm9iamVjdF9wcm9wZXJ0eV9maW5kX2VyciIsIGVycl9jbGFz
cz1FUlJPUl9DTEFTU19HRU5FUklDX0VSUk9SLCBmbXQ9MHg1NTU1NTYyMDU0NTEgIlByb3Bl
cnR5ICclcy4lcycgbm90IGZvdW5kIiwgYXA9MHg3ZmZmZmZmZmNlMjAsIHN1ZmZpeD0weDAp
IGF0IC4uLy4uL3NyYy91cHN0cmVhbS9xZW11L3V0aWwvZXJyb3IuYzo4MgogICAgICAgIGVy
ciA9IDB4NTU1NTU3YWVlODYwCiAgICAgICAgc2F2ZWRfZXJybm8gPSAyCiAgICAgICAgX19Q
UkVUVFlfRlVOQ1RJT05fXyA9ICJlcnJvcl9zZXR2IgojNSAgMHgwMDAwNTU1NTU1ZmM0ZGNi
IGluIGVycm9yX3NldGdfaW50ZXJuYWwgKGVycnA9MHg1NTU1NTY3ODk3YjggPGVycm9yX2Fi
b3J0Piwgc3JjPTB4NTU1NTU2MjA1MDY4ICIuLi8uLi9zcmMvdXBzdHJlYW0vcWVtdS9xb20v
b2JqZWN0LmMiLCBsaW5lPTEzMTQsIGZ1bmM9MHg1NTU1NTYyMDU4YTAgPF9fZnVuY19fLjIw
PiAib2JqZWN0X3Byb3BlcnR5X2ZpbmRfZXJyIiwgZm10PTB4NTU1NTU2MjA1NDUxICJQcm9w
ZXJ0eSAnJXMuJXMnIG5vdCBmb3VuZCIpIGF0IC4uLy4uL3NyYy91cHN0cmVhbS9xZW11L3V0
aWwvZXJyb3IuYzoxMDUKICAgICAgICBhcCA9IHt7Z3Bfb2Zmc2V0ID0gNDgsIGZwX29mZnNl
dCA9IDQ4LCBvdmVyZmxvd19hcmdfYXJlYSA9IDB4N2ZmZmZmZmZjZjA4LCByZWdfc2F2ZV9h
cmVhID0gMHg3ZmZmZmZmZmNlNDB9fQojNiAgMHgwMDAwNTU1NTU1ZGJkMGFlIGluIG9iamVj
dF9wcm9wZXJ0eV9maW5kX2VyciAob2JqPTB4NTU1NTU2OTY3MmEwLCBuYW1lPTB4NTU1NTU2
MDgxMTdkICJkZXZpY2UiLCBlcnJwPTB4NTU1NTU2Nzg5N2I4IDxlcnJvcl9hYm9ydD4pIGF0
IC4uLy4uL3NyYy91cHN0cmVhbS9xZW11L3FvbS9vYmplY3QuYzoxMzE0CiAgICAgICAgcHJv
cCA9IDB4MAogICAgICAgIF9fZnVuY19fID0gIm9iamVjdF9wcm9wZXJ0eV9maW5kX2VyciIK
IzcgIDB4MDAwMDU1NTU1NWRiZDM2MSBpbiBvYmplY3RfcHJvcGVydHlfZ2V0IChvYmo9MHg1
NTU1NTY5NjcyYTAsIG5hbWU9MHg1NTU1NTYwODExN2QgImRldmljZSIsIHY9MHg1NTU1NTZh
ZDA1ZDAsIGVycnA9MHg1NTU1NTY3ODk3YjggPGVycm9yX2Fib3J0PikgYXQgLi4vLi4vc3Jj
L3Vwc3RyZWFtL3FlbXUvcW9tL29iamVjdC5jOjEzODkKICAgICAgICBlcnIgPSAweDAKICAg
ICAgICBwcm9wID0gMHg3ZmZmZjdmZmQwMDAgPF9ydGxkX2xvY2FsPgogICAgICAgIF9fZnVu
Y19fID0gIm9iamVjdF9wcm9wZXJ0eV9nZXQiCiM4ICAweDAwMDA1NTU1NTVkYzFhNDQgaW4g
b2JqZWN0X3Byb3BlcnR5X2dldF9xb2JqZWN0IChvYmo9MHg1NTU1NTY5NjcyYTAsIG5hbWU9
MHg1NTU1NTYwODExN2QgImRldmljZSIsIGVycnA9MHg1NTU1NTY3ODk3YjggPGVycm9yX2Fi
b3J0PikgYXQgLi4vLi4vc3JjL3Vwc3RyZWFtL3FlbXUvcW9tL3FvbS1xb2JqZWN0LmM6NDAK
ICAgICAgICByZXQgPSAweDAKICAgICAgICB2ID0gMHg1NTU1NTZhZDA1ZDAKIzkgIDB4MDAw
MDU1NTU1NWRiZDYzNSBpbiBvYmplY3RfcHJvcGVydHlfZ2V0X3N0ciAob2JqPTB4NTU1NTU2
OTY3MmEwLCBuYW1lPTB4NTU1NTU2MDgxMTdkICJkZXZpY2UiLCBlcnJwPTB4NTU1NTU2Nzg5
N2I4IDxlcnJvcl9hYm9ydD4pIGF0IC4uLy4uL3NyYy91cHN0cmVhbS9xZW11L3FvbS9vYmpl
Y3QuYzoxNDM3CiAgICAgICAgcmV0ID0gMHg3ZmZmZmZmZmQwODAKICAgICAgICBxc3RyaW5n
ID0gMHg1NTU1NTVkYmRmNWQgPG9iamVjdF9wcm9wZXJ0eV9nZXRfdWludCsyNTI+CiAgICAg
ICAgcmV0dmFsID0gMHg1NTU1NTdiMjUzYjAgIlwzMDUnXDM3M1wwMDJQVSIKICAgICAgICBf
X2Z1bmNfXyA9ICJvYmplY3RfcHJvcGVydHlfZ2V0X3N0ciIKIzEwIDB4MDAwMDU1NTU1NWRi
ZDdjMCBpbiBvYmplY3RfcHJvcGVydHlfZ2V0X2xpbmsgKG9iaj0weDU1NTU1Njk2NzJhMCwg
bmFtZT0weDU1NTU1NjA4MTE3ZCAiZGV2aWNlIiwgZXJycD0weDU1NTU1Njc4OTdiOCA8ZXJy
b3JfYWJvcnQ+KSBhdCAuLi8uLi9zcmMvdXBzdHJlYW0vcWVtdS9xb20vb2JqZWN0LmM6MTQ3
MAogICAgICAgIHN0ciA9IDB4ZjAzNmVkNzY2N2JkOTUwMCA8ZXJyb3I6IENhbm5vdCBhY2Nl
c3MgbWVtb3J5IGF0IGFkZHJlc3MgMHhmMDM2ZWQ3NjY3YmQ5NTAwPgogICAgICAgIHRhcmdl
dCA9IDB4NTU1NTU3YjI1M2IwCiAgICAgICAgX19mdW5jX18gPSAib2JqZWN0X3Byb3BlcnR5
X2dldF9saW5rIgojMTEgMHgwMDAwNTU1NTU1ODg5MmMxIGluIHFlbXVfY29uc29sZV9pc19t
dWx0aWhlYWQgKGRldj0weDU1NTU1NzE3MzA5MCkgYXQgLi4vLi4vc3JjL3Vwc3RyZWFtL3Fl
bXUvdWkvY29uc29sZS5jOjIzNzYKICAgICAgICBjb24gPSAweDU1NTU1Njk2NzJhMAogICAg
ICAgIG9iaiA9IDB4NTU1NTU3MTczMDkwCiAgICAgICAgZiA9IDAKICAgICAgICBoID0gMAoj
MTIgMHgwMDAwNTU1NTU1ODg5M2E5IGluIHFlbXVfY29uc29sZV9nZXRfbGFiZWwgKGNvbj0w
eDU1NTU1NmJmN2MwMCkgYXQgLi4vLi4vc3JjL3Vwc3RyZWFtL3FlbXUvdWkvY29uc29sZS5j
OjI0MDIKICAgICAgICBkZXYgPSAweDU1NTU1NzE3MzA5MAogICAgICAgIG11bHRpaGVhZCA9
IGZhbHNlCiAgICAgICAgYyA9IDB4NTU1NTU2YmY3YzAwCiMxMyAweDAwMDA1NTU1NTViYTVm
ZGYgaW4gZ2RfdmNfZ2Z4X2luaXQgKHM9MHg1NTU1NTdhNDU0NTAsIHZjPTB4NTU1NTU3YTQ1
NGYwLCBjb249MHg1NTU1NTZiZjdjMDAsIGlkeD0wLCBncm91cD0weDAsIHZpZXdfbWVudT0w
eDU1NTU1N2NlYTU4MCkgYXQgLi4vLi4vc3JjL3Vwc3RyZWFtL3FlbXUvdWkvZ3RrLmM6MjEz
MAogICAgICAgIHpvb21fdG9fZml0ID0gZmFsc2UKICAgICAgICBpID0gMjE4NDUKIzE0IDB4
MDAwMDU1NTU1NWJhNjgyOCBpbiBnZF9jcmVhdGVfbWVudV92aWV3IChzPTB4NTU1NTU3YTQ1
NDUwLCBvcHRzPTB4NTU1NTU2NzVmNTYwIDxkcHk+KSBhdCAuLi8uLi9zcmMvdXBzdHJlYW0v
cWVtdS91aS9ndGsuYzoyMjk2CiAgICAgICAgZ3JvdXAgPSAweDAKICAgICAgICB2aWV3X21l
bnUgPSAweDU1NTU1N2NlYTU4MAogICAgICAgIHNlcGFyYXRvciA9IDB4NTU1NTU3Y2VlNmYw
CiAgICAgICAgY29uID0gMHg1NTU1NTZiZjdjMDAKICAgICAgICB2YyA9IDAKIzE1IDB4MDAw
MDU1NTU1NWJhNmE5NSBpbiBnZF9jcmVhdGVfbWVudXMgKHM9MHg1NTU1NTdhNDU0NTAsIG9w
dHM9MHg1NTU1NTY3NWY1NjAgPGRweT4pIGF0IC4uLy4uL3NyYy91cHN0cmVhbS9xZW11L3Vp
L2d0ay5jOjIzMzYKICAgICAgICBzZXR0aW5ncyA9IDB4N2ZmZmZmZmZkMjcwCiMxNiAweDAw
MDA1NTU1NTViYTZlZTQgaW4gZ3RrX2Rpc3BsYXlfaW5pdCAoZHM9MHg1NTU1NTY4N2MzOTAs
IG9wdHM9MHg1NTU1NTY3NWY1NjAgPGRweT4pIGF0IC4uLy4uL3NyYy91cHN0cmVhbS9xZW11
L3VpL2d0ay5jOjI0MTQKICAgICAgICB2YyA9IDB4NTU1NTU3YTQzZWEwCiAgICAgICAgcyA9
IDB4NTU1NTU3YTQ1NDUwCiAgICAgICAgd2luZG93X2Rpc3BsYXkgPSAweDU1NTU1NmE5MzEy
MAogICAgICAgIHRoZW1lID0gMHg1NTU1NTZhZTcxYjAKICAgICAgICBkaXIgPSAweDU1NTU1
N2IzMzI5MCAiIgogICAgICAgIF9fUFJFVFRZX0ZVTkNUSU9OX18gPSAiZ3RrX2Rpc3BsYXlf
aW5pdCIKIzE3IDB4MDAwMDU1NTU1NTg4OWY0YSBpbiBxZW11X2Rpc3BsYXlfaW5pdCAoZHM9
MHg1NTU1NTY4N2MzOTAsIG9wdHM9MHg1NTU1NTY3NWY1NjAgPGRweT4pIGF0IC4uLy4uL3Ny
Yy91cHN0cmVhbS9xZW11L3VpL2NvbnNvbGUuYzoyNjg2CiAgICAgICAgX19QUkVUVFlfRlVO
Q1RJT05fXyA9ICJxZW11X2Rpc3BsYXlfaW5pdCIKIzE4IDB4MDAwMDU1NTU1NWIxMDlmMCBp
biBxZW11X2luaXRfZGlzcGxheXMgKCkgYXQgLi4vLi4vc3JjL3Vwc3RyZWFtL3FlbXUvc29m
dG1tdS92bC5jOjI1MjEKICAgICAgICBkcyA9IDB4NTU1NTU2ODdjMzkwCiMxOSAweDAwMDA1
NTU1NTViMTM2NzMgaW4gcWVtdV9pbml0IChhcmdjPTI1LCBhcmd2PTB4N2ZmZmZmZmZkNTY4
KSBhdCAuLi8uLi9zcmMvdXBzdHJlYW0vcWVtdS9zb2Z0bW11L3ZsLmM6MzY0NAogICAgICAg
IG9wdHMgPSAweDU1NTU1Njg3ZGNkMAogICAgICAgIGljb3VudF9vcHRzID0gMHgwCiAgICAg
ICAgYWNjZWxfb3B0cyA9IDB4MAogICAgICAgIG9saXN0ID0gMHg1NTU1NTY4MmNjNzgKICAg
ICAgICBvcHRpbmQgPSAyNQogICAgICAgIG9wdGFyZyA9IDB4N2ZmZmZmZmZkYzI2ICJ2aXJ0
aW8tbmV0LXBjaSxuZXRkZXY9bmV0MCIKICAgICAgICBtYWNoaW5lX2NsYXNzID0gMHg1NTU1
NTZhNThhMzAKICAgICAgICB1c2VyY29uZmlnID0gdHJ1ZQogICAgICAgIHZtc3RhdGVfZHVt
cF9maWxlID0gMHgwCiAgICAgICAgX19mdW5jX18gPSAicWVtdV9pbml0IgogICAgICAgIF9f
UFJFVFRZX0ZVTkNUSU9OX18gPSAicWVtdV9pbml0IgojMjAgMHgwMDAwNTU1NTU1ODczOTMz
IGluIG1haW4gKGFyZ2M9MjUsIGFyZ3Y9MHg3ZmZmZmZmZmQ1NjgpIGF0IC4uLy4uL3NyYy91
cHN0cmVhbS9xZW11L3NvZnRtbXUvbWFpbi5jOjQ3Cg==

--------------ZR1m14MDFmAsD0TV80ymdGBL--


