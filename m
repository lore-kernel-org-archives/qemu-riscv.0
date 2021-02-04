Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l7mP5-0001S9-RT
	for mharc-qemu-riscv@gnu.org; Thu, 04 Feb 2021 16:43:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jahagirdar.vs@gmail.com>)
 id 1l7mP4-0001Rz-Lf
 for qemu-riscv@nongnu.org; Thu, 04 Feb 2021 16:43:06 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:54965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jahagirdar.vs@gmail.com>)
 id 1l7mOy-0002AM-Hw
 for qemu-riscv@nongnu.org; Thu, 04 Feb 2021 16:43:06 -0500
Received: by mail-pj1-x1033.google.com with SMTP id m12so2460877pjs.4
 for <qemu-riscv@nongnu.org>; Thu, 04 Feb 2021 13:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/i/IEIVt4fzKzFLjq+j09tKQax2gxMQYNU6vy9Pc92E=;
 b=RtmmuM9xGYhh8f/bSWZzW3jaHMW64yJm8vuyKe++IvLBOF+fi9n05LKW5z0QdWQU3n
 +2lshU57M6qVVb8H84JvwD3I1JRRX/g53el+fbO35X6Bnog/DHW4MdCSsVt94/2oEEcf
 ka4mLeJhd3a9YaWTwGu+w24msLgUCzrxWu8Z4WQLCPHTAANaeTfW/XvmW8G/YQx9RsnH
 YX6HnVwuqnTA0QClRLSFTbdDNVTZvte/8oy7cncGnO+7xfwrnMuL5/tMleNOl3h5qfak
 wMMbP4RKjXc8DRQWHxpdPZiYXAU3uu25PxrlwTUQuQM3yi2TaBAvG6Am+hGpKUp12g+W
 A2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/i/IEIVt4fzKzFLjq+j09tKQax2gxMQYNU6vy9Pc92E=;
 b=P9ts5DHov7oBPx2HW0FoyRywjrzh2ChzdUljfd7GgIket7PHIbnA4DxHjNRwyt18Qg
 jT4mk3yuGxmHsd2AzVsvHrxwVFgrTcgegdtpL9wN2VuvIygQxzppQLK1Fj0qkZnuh/go
 Ksd/jTRNjzBuMM/FA57nvIShhXZs88TosxHB5a+Hus8hlgY0WOJ4UgBoGVcwt/7DO+7m
 HknN/gLmvA5K/TIsEVQX22giT4IDlzt4zEqGvmHEq6IPNexHr9k4tygzBTS9WMYJ4Su6
 W+oBgI6Iy2FAIxnuBFirVvsYcSA/djEZ2yZCFvdKvvi82LX4GZrRpqnMauKmf44sEsaS
 Ok5A==
X-Gm-Message-State: AOAM532KIjvTKSh/ynDRtWXBJ4xbsAarLPuc7qYPON6HnpypoJUHDsPR
 A7NJ/40WGJJxavtjnAf1Bjsv4ycXO6eUnXrQiTdWZj7XwGvtSw==
X-Google-Smtp-Source: ABdhPJxAiXNqqS8+vhnsVgYIu6Ki637VF+oO30KrOwDUKBbGVuYVPPoQyaQGuZ+7MWF9qtrES9Bh3ndXjAxtonVU2kk=
X-Received: by 2002:a17:90b:358d:: with SMTP id
 mm13mr998323pjb.146.1612474973075; 
 Thu, 04 Feb 2021 13:42:53 -0800 (PST)
MIME-Version: 1.0
From: vijayvithal jahagirdar <jahagirdar.vs@gmail.com>
Date: Fri, 5 Feb 2021 03:12:41 +0530
Message-ID: <CANvkr8f=X2FR3Kzt0QNm318qA7=jyBrrcUFV-soioMz6CYobYA@mail.gmail.com>
Subject: Sample Baremetal program with Interrupt
To: qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000fabd4a05ba899558"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=jahagirdar.vs@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 04 Feb 2021 21:43:06 -0000

--000000000000fabd4a05ba899558
Content-Type: text/plain; charset="UTF-8"

I am extending hw/riscv/virt.c to model some custom hardware.
At some point in the code, I am calling
 qemu_irq_raise(s->irq);
I was expecting this to trigger the corresponding routine in my baremetal
program. But the routine was not triggered.

Is there a reference  baremetal program with interrupt for qemu+riscv that
I can use as a reference to debug my code??
Is  qemu_irq_raise(s->irq); correct & complete method for raising an
Interrupt?
*Note: *As a part of the debug process, I tried the following:
uint64_t mie_reg;
mie_reg = read_csr(mie);
 mie_reg = mie_reg | 0x0000000000000800;
write_csr(mie, mie_reg);
 mie_reg = read_csr(mie);
printf(" mie_reg after write_csr fun %lx  \n",mie_reg);

I was expecting the print to return 0x800, but it returned 0x00, I am not
sure what next steps I should take to debug this.

Regards
Vijay

--000000000000fabd4a05ba899558
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>I am extending hw/riscv/virt.c to mode=
l some custom hardware.<br></div>At some point in the code, I am calling <b=
r>=C2=A0qemu_irq_raise(s-&gt;irq);<br></div>I was expecting this to trigger=
 the corresponding routine in my baremetal program. But the routine was not=
 triggered.<br><br></div>Is there a reference=C2=A0 baremetal program with =
interrupt for qemu+riscv that I can use as a reference to debug my code??<b=
r></div><div>Is=C2=A0 qemu_irq_raise(s-&gt;irq); correct &amp; complete met=
hod for raising an Interrupt?<br></div><b>Note: </b>As a part of the debug =
process, I tried the following:<br><div><div><div><div><div><div>uint64_t m=
ie_reg;<br>mie_reg =3D read_csr(mie);<br>=C2=A0mie_reg =3D mie_reg | 0x0000=
000000000800;<br>write_csr(mie, mie_reg);<br>=C2=A0mie_reg =3D read_csr(mie=
);<br>printf(&quot; mie_reg after write_csr fun %lx =C2=A0\n&quot;,mie_reg)=
;<br><br></div><div>I was expecting the print to return 0x800, but it retur=
ned 0x00, I am not sure what next steps I should take to debug this.<br><br=
></div><div>Regards<br></div><div>Vijay</div><div><div dir=3D"ltr" class=3D=
"gmail_signature" data-smartmail=3D"gmail_signature"><br></div></div></div>=
</div></div></div></div></div>

--000000000000fabd4a05ba899558--

