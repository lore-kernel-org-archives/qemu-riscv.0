Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nw1jZ-0007G8-Is
	for mharc-qemu-riscv@gnu.org; Tue, 31 May 2022 09:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.bu@gmail.com>)
 id 1nvvd5-0000wc-Jr
 for qemu-riscv@nongnu.org; Tue, 31 May 2022 02:45:23 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:45282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.bu@gmail.com>)
 id 1nvvd3-0008Bz-VJ
 for qemu-riscv@nongnu.org; Tue, 31 May 2022 02:45:23 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-300628e76f3so128750767b3.12
 for <qemu-riscv@nongnu.org>; Mon, 30 May 2022 23:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=MIJJ2ytrYrApV4nTqihFyKY45gBwckDL+3oNhB/fuRw=;
 b=OoucIUHU/pPbM/oPXC5ME8qbZ/aVFp51aafaYSyKOyQRkmwQZxh6U4yRL6IC0BGVvf
 P/at7CcKhbfW1e1Y+pVXNePRA+GDjgZhT2kRfaMD8RbXPu4Gnpq7ZcdAAfuIfWF2z0mL
 l5xQEHN5gEl59XlEmv4Yg/6L15nsyqoAhipunsQOJUbeuAz/R0smiKf0sPONcHuBik1n
 H7j7or7DXJdQbolveUfI7pMXw1gJTrve0NX3pEQEsqaG6cEc1YfkZXhbOIYoL9W/kn5m
 rFvo6z5jJ1Hx2PM8lAaFjxjPXGrHWJRqZhnRAyg+fAZ/c+YDrzRbRU9zXPLtSKPCuuEJ
 7Brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=MIJJ2ytrYrApV4nTqihFyKY45gBwckDL+3oNhB/fuRw=;
 b=MyzY0YQlV/blX+H7Na+MA6H3aN47K3KGkXRnFhJBAKG0v5tYO34/NM6eIu+Qd4AInJ
 uzogSMt4zNusuOouXO9eLF2fakBJlq7RyJq2+fSTnjaU5BUzA689nFpo84r+fAnZpYot
 j/RMblgHnhGv6Ylg38daVudgkN5glnF6bPONQKxvifOi4xfN2t3PPrQLERjPDKZCVyzJ
 hmWFSIw+WVGDBWPBN8p7hF1eEovy7Guo67owE74ihXMGZ1p/bNX1uq5oeQmO9ijTYhny
 n9mpmqHzO6B+BauC2bMC4CboXiT7mVXRZwtlRgMqiyYIzWF+GaHRJIEtzRPrFZ34zhnj
 yRPg==
X-Gm-Message-State: AOAM533xuMZVJZsNwmyJS3dzB1XtlNvw3oSLHeepQo9hqo1NStDPwfB8
 qeQ0AEnBC0G8v89ux0z/qTkgMLhlghFFXIsGihs=
X-Google-Smtp-Source: ABdhPJy+AnR97c4z8bTV9jMBVav2mB5QMHu2OSuQnY5q5I8F4QdmcUbjGsciGvjzg79WUe9Fzup6IK5tmWZ+pnLDnsI=
X-Received: by 2002:a05:690c:3a1:b0:2ff:1377:3b9 with SMTP id
 bh33-20020a05690c03a100b002ff137703b9mr62724190ywb.340.1653979520457; Mon, 30
 May 2022 23:45:20 -0700 (PDT)
MIME-Version: 1.0
From: Robert Bu <robert.bu@gmail.com>
Date: Tue, 31 May 2022 14:45:09 +0800
Message-ID: <CAMSqtnyQ3On5SA41kmWa7Eb1S-zvZfET9n8-fBPSV06ZrFRxYg@mail.gmail.com>
Subject: [PATCH] qemu: riscv: rvv: fix vmv.v.x for RV32, el64, vl == vl_max
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com
Cc: qemu-riscv@nongnu.org
Content-Type: multipart/mixed; boundary="000000000000c87d5e05e0491d17"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=robert.bu@gmail.com; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 31 May 2022 09:16:28 -0400
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
X-List-Received-Date: Tue, 31 May 2022 06:45:23 -0000

--000000000000c87d5e05e0491d17
Content-Type: text/plain; charset="UTF-8"



--000000000000c87d5e05e0491d17
Content-Type: text/plain; charset="US-ASCII"; 
	name="0001-qemu-riscv-rvv-fix-vmv.v.x-for-RV32-el64-vl-vl_max.patch"
Content-Disposition: attachment; 
	filename="0001-qemu-riscv-rvv-fix-vmv.v.x-for-RV32-el64-vl-vl_max.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l3tsmvlz0>
X-Attachment-Id: f_l3tsmvlz0

RnJvbSA2MTk4ZjU4N2YxNGY4NzczMzQzZGRlZDgzYjZjMGVkZmQ3ZGJmODhlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSb2JlcnQgQnUgPHJvYmVydF9idUBnbWFpbC5jb20+CkRhdGU6
IFdlZCwgMTggTWF5IDIwMjIgMDk6MDg6NTIgKzA4MDAKU3ViamVjdDogW1BBVENIXSBxZW11OiBy
aXNjdjogcnZ2OiBmaXggdm12LnYueCBmb3IgUlYzMiwgZWw2NCwgdmwgPT0gdmxfbWF4CgpTaWdu
ZWQtb2ZmLWJ5OiBSb2JlcnQgQnUgPHJvYmVydC5idUBnbWFpbC5jb20+Ci0tLQogdGFyZ2V0L3Jp
c2N2L2luc25fdHJhbnMvdHJhbnNfcnZ2LmMuaW5jIHwgMTIgKysrKysrKysrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90
YXJnZXQvcmlzY3YvaW5zbl90cmFucy90cmFuc19ydnYuYy5pbmMgYi90YXJnZXQvcmlzY3YvaW5z
bl90cmFucy90cmFuc19ydnYuYy5pbmMKaW5kZXggMzkxYzYxZmU5My4uNmIyN2Q4ZTkxZSAxMDA2
NDQKLS0tIGEvdGFyZ2V0L3Jpc2N2L2luc25fdHJhbnMvdHJhbnNfcnZ2LmMuaW5jCisrKyBiL3Rh
cmdldC9yaXNjdi9pbnNuX3RyYW5zL3RyYW5zX3J2di5jLmluYwpAQCAtMjA5Nyw4ICsyMDk3LDE2
IEBAIHN0YXRpYyBib29sIHRyYW5zX3Ztdl92X3goRGlzYXNDb250ZXh0ICpzLCBhcmdfdm12X3Zf
eCAqYSkKICAgICAgICAgczEgPSBnZXRfZ3ByKHMsIGEtPnJzMSwgRVhUX1NJR04pOwogCiAgICAg
ICAgIGlmIChzLT52bF9lcV92bG1heCkgewotICAgICAgICAgICAgdGNnX2dlbl9ndmVjX2R1cF90
bChzLT5zZXcsIHZyZWdfb2ZzKHMsIGEtPnJkKSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgTUFYU1oocyksIE1BWFNaKHMpLCBzMSk7CisgICAgICAgICAgICBpZiAoZ2V0X3hsKHMp
ID09IE1YTF9SVjMyICYmIHMtPnNldyA9PSBNT182NCkgeworICAgICAgICAgICAgICAgIFRDR3Zf
aTY0IHMxX2k2NCA9IHRjZ190ZW1wX25ld19pNjQoKTsKKyAgICAgICAgICAgICAgICB0Y2dfZ2Vu
X2V4dF90bF9pNjQoczFfaTY0LCBzMSk7CisgICAgICAgICAgICAgICAgdGNnX2dlbl9ndmVjX2R1
cF9pNjQocy0+c2V3LCB2cmVnX29mcyhzLCBhLT5yZCksCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgTUFYU1oocyksIE1BWFNaKHMpLCBzMV9pNjQpOworICAgICAgICAgICAg
ICAgIHRjZ190ZW1wX2ZyZWVfaTY0KHMxX2k2NCk7CisgICAgICAgICAgICB9IGVsc2UgeworICAg
ICAgICAgICAgICAgIHRjZ19nZW5fZ3ZlY19kdXBfdGwocy0+c2V3LCB2cmVnX29mcyhzLCBhLT5y
ZCksCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNQVhTWihzKSwgTUFYU1oo
cyksIHMxKTsKKyAgICAgICAgICAgIH0KICAgICAgICAgfSBlbHNlIHsKICAgICAgICAgICAgIFRD
R3ZfaTMyIGRlc2M7CiAgICAgICAgICAgICBUQ0d2X2k2NCBzMV9pNjQgPSB0Y2dfdGVtcF9uZXdf
aTY0KCk7Ci0tIAoyLjMxLjEKCg==
--000000000000c87d5e05e0491d17--

