Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mJZFz-0003tm-Vz
	for mharc-qemu-riscv@gnu.org; Fri, 27 Aug 2021 06:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1mJZFy-0003sw-9w
 for qemu-riscv@nongnu.org; Fri, 27 Aug 2021 06:38:42 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:40858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1mJZFv-00047t-M0
 for qemu-riscv@nongnu.org; Fri, 27 Aug 2021 06:38:42 -0400
Received: by mail-lf1-x12a.google.com with SMTP id bq28so13418117lfb.7
 for <qemu-riscv@nongnu.org>; Fri, 27 Aug 2021 03:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=65VwjAFZroJ6oXPkWOuIEDMnAi5IHnivqvV2AVPQbl4=;
 b=V9xWItLg6zDvCOSy//ZX3Syd1Q1cCoAPrJvaJc1sfXuwRCBsT9Xq8D/T+E7orLXjBQ
 qvCR8RjCmohZB0Z2KouVlGKKKv+kVQ/6RUhuT91D5YKVLxRxuOXpwmvMIZ6dcUn0bxdE
 IRd+5tdCVgLIhSMSqmsl7E4NEqVRj/IehMyXA/05M8OoyqndUb+RIeEGf0vqTOb3oePq
 ZDA5MlUnCdtlcSu4axqjdi5/bwT8NdqguFKBgxHRcPKFQMruml1mAA37sXYpovdY9ZPm
 TDuQLjAyofGNZlJ6PS/QG8PZvkXSX8V8iCmc20LpiqsnH0EMLKPeUo9nuR/uaevvCI2p
 IWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=65VwjAFZroJ6oXPkWOuIEDMnAi5IHnivqvV2AVPQbl4=;
 b=YZnaSVL8nEjBKopLh87zbZ0txZGF+Ylyfn3+PHit48BtCS3MSaWjnrIEoLGNmtOZla
 NR4PVdpWKH87qe6Y9UzbrMj7vzuyo0rb4VUC6694gMTY6NZExIjpanvFdbin60x3Bs2I
 p3QWTdGdmjdTf1ESgy7Z1ePyFxr/yvj9828oJqTmDPdJ1DD2BMDUJAbvzMTfeqP9tUVm
 QbchfdkmV4RruYlajVTYtZj6PQaMlSCwXkKvnXjssooRE/eEWUdD27KcbesWUwKYwHFR
 iI00JQxg4Xw+FJBX4zm+2+/oVvo6IRjRkiKuKWMer2UHf+grPDQE+WU1k7Ofl9u9VynK
 Z54Q==
X-Gm-Message-State: AOAM530xD5eghJQJiOdfvSQHhxwzrsUoz73uc25Xh3Ic4vZqALqoiBtt
 tCsv5lqZbCUUc1B+d6SJeY0PDu7UWQ2Vea+E7HqCt/pwmoNLGA==
X-Google-Smtp-Source: ABdhPJw5f5E5AbxxIC0kZj7pe+Vmjc2PLi/G+fEQJ6QFnwKPEV95TPdXGLxNpYIFoxXUxbxu1JYCAvcLTpl0Nwyctxs=
X-Received: by 2002:a05:6512:3045:: with SMTP id
 b5mr1195627lfb.85.1630060716854; 
 Fri, 27 Aug 2021 03:38:36 -0700 (PDT)
MIME-Version: 1.0
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Fri, 27 Aug 2021 16:08:00 +0530
Message-ID: <CAN37VV745newYKiUe=XWghtgr1ktbdx+7n7NrDuXoxa+jiTnvg@mail.gmail.com>
Subject: Qemu PCIe aer error injection
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000fda46405ca8815e4"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=mchitale@ventanamicro.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 HTML_OBFUSCATE_05_10=0.26, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 27 Aug 2021 10:38:42 -0000

--000000000000fda46405ca8815e4
Content-Type: text/plain; charset="UTF-8"

Hi,

I am working to add the PCIe root complex event collector support to Qemu.
I want to test the AER error injection by using the QMP shell. However I am
unable to use the pcie_aer_inject_error command on the QMP shell. I see
this error: "id or pci device path is invalid or device not found ".

I tried using the pcie device id in the bdf format but apparently that is
not the correct syntax. Help message shows that a qdev device id is
required but I am not sure how to find the qdev device id of a pcie device.

Also, while debugging, I see that qdev_find_recursive function which
compares the input device id with that of the devices on the bus fails. This
is because the dev->id against which the input device string is compared is
always null and it finally causes pci_qdev_find_device to fail.

I am using a Risc V Virt machine with the generic pcie host controller gpex
and two e1000e devices attached to the host bridge as root complex
integrated endpoints.

Any thoughts or comments would be really appreciated.

Thanks,
Mayuresh.

--000000000000fda46405ca8815e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail_default" style=3D"font-family:verdana=
,sans-serif"></span>Hi,<br><br>I am working to add the <span class=3D"gmail=
_default" style=3D"font-family:verdana,sans-serif">PCIe </span>root complex=
 event collector support to Qemu. I want to test the AER error injection by=
 using the QMP shell. However I am unable to use the pcie_aer_inject_error =
command on the QMP shell. I see this error: &quot;id or pci device path is =
invalid or device not found &quot;. <br><br>I tried using the pcie device i=
d in the bdf format but apparently that is not the correct syntax. Help mes=
sage shows that a qdev device id is required but I am not sure how to find =
the qdev device id of a pcie device.=C2=A0<div><br></div><div><span class=
=3D"gmail_default" style=3D"font-family:verdana,sans-serif">Also, w</span>h=
ile debugging<span class=3D"gmail_default" style=3D"font-family:verdana,san=
s-serif">,</span>=C2=A0I see that qdev_find_recursive function which compar=
es the input device id with <span class=3D"gmail_default" style=3D"font-fam=
ily:verdana,sans-serif">that</span>=C2=A0of the devices on the bus fails. T=
his<span class=3D"gmail_default" style=3D"font-family:verdana,sans-serif"><=
/span> is <span class=3D"gmail_default" style=3D"font-family:verdana,sans-s=
erif">because </span>the dev-&gt;id against which the input device string i=
s compared is always null and it finally causes pci_qdev_find_device to fai=
l.<br><br>I am using a Risc V <span class=3D"gmail_default" style=3D"font-f=
amily:verdana,sans-serif">V</span>irt machine with <span class=3D"gmail_def=
ault" style=3D"font-family:verdana,sans-serif">the generic pcie host contro=
ller gpex and </span>two e1000e devices attached to the host bridge as root=
 complex integrated endpoints.</div><div><br></div><div><div class=3D"gmail=
_default" style=3D"font-family:verdana,sans-serif">Any thoughts or comments=
 would be really appreciated.</div><br>Thanks,<br>Mayuresh.</div></div>

--000000000000fda46405ca8815e4--

