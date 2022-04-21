Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhhJA-00074O-1V
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 20:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vysakhpillai@gmail.com>)
 id 1nhfZK-0003WG-Th
 for qemu-riscv@nongnu.org; Thu, 21 Apr 2022 18:46:35 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:39749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vysakhpillai@gmail.com>)
 id 1nhfZJ-0008Bn-4Q
 for qemu-riscv@nongnu.org; Thu, 21 Apr 2022 18:46:34 -0400
Received: by mail-pg1-x533.google.com with SMTP id q19so5840433pgm.6
 for <qemu-riscv@nongnu.org>; Thu, 21 Apr 2022 15:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=DFD5ygqnsU62Apl5BstxkIiWsEk9bkJaBzGekoMVzrg=;
 b=BnBXFMFe/nNk+RPyZV9IlsZimLwMvHW9kCxn944nD25/3tke0vAXh+vgUAtlSShnwu
 zEIl2vUhgaev4wmElPFILhWeNdJps6cqjnMxfUmo7y73wp4D+yWEQHWVlJx+Z/x3NNib
 ZQPDXlewsq/zlt7JRMxFxWyfPFc0PyrYI+la+EKoJ6phtnoRQZ2LvMAX5Rt/T4usykEx
 0ABSE2KsgEd8msrdgkL4YZcsx8vLP56mSgXw1wFTkCJmwkTatAXMHX+2dUg4C/K9qoXp
 FcEOF7FzquOro8bYPc+REaZGi297OlPzKjcFyRZGoZzO90RndAfY91ahDOmA4LkYBDW9
 99og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DFD5ygqnsU62Apl5BstxkIiWsEk9bkJaBzGekoMVzrg=;
 b=S6CEUJNZsMYuRSBiHA3sdy9Ss5rVsdu6j5GvSfSJ8P+IOBUuHUAuMM8RzYI/RODTf9
 Qmkr5LUfM51sTRD0RRWDtMWvBP8Q8wrGoFwCn9ENtAnRgyeuhzbvjypyt6QEYncqGVny
 vmXU8mNHvLcgB4XLvnHj0jGyUW2YnKgntdtBbiSfODrPoUEpJUivp7dpfiwL1KKzh779
 gGeJfeRMgmEO4twOjFIKBArDk4MSnTUPOL09K8kOqjZMJ0WbmAcpJKoTUjybE3iN0CRr
 8XzZfbVfIbFg4ykVl9cqvHE20eHMUNzPdLoa5axFV87mtcmIGQx34pTEkUnC9a8wfXBg
 mCRQ==
X-Gm-Message-State: AOAM531lr2igDKs5nK/rIkTLRnT3sDu/SKu7mj0ssahtGSm4tTWsitjJ
 O2YBpkjtl0gx6LgwBOeNSIPr1lIdzEIURsdyF9x3V92o0BF399ys
X-Google-Smtp-Source: ABdhPJx3M338HP++ZWJQlacyNpjSM0suE7hX2tDm4H+AqkXdH7LoyiCORZEI3zVMeJ7F8tLsxV4dMQ7IJKt/YS8iNY0=
X-Received: by 2002:a65:614e:0:b0:380:bfd9:d4ea with SMTP id
 o14-20020a65614e000000b00380bfd9d4eamr1403836pgv.92.1650581161120; Thu, 21
 Apr 2022 15:46:01 -0700 (PDT)
MIME-Version: 1.0
From: vysakh pillai <vysakhpillai@gmail.com>
Date: Thu, 21 Apr 2022 15:45:50 -0700
Message-ID: <CAAFEQFEMjN1Tt1E4btKw1bQT3DEB7KkJsgh5-tDQvT1W1wHemA@mail.gmail.com>
Subject: Modelling core local interrupts
To: qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000c815c605dd31dffe"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=vysakhpillai@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 21 Apr 2022 20:37:51 -0400
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
X-List-Received-Date: Thu, 21 Apr 2022 22:46:36 -0000

--000000000000c815c605dd31dffe
Content-Type: text/plain; charset="UTF-8"

Hi,
I am looking for some reference code that will let me hook up a peripheral
to the core local interrupt controller. I want to avoid going through the
PLIC for modeling some simpler peripherals that directly interrupt the CPU.

The polar fire SoC datasheet says " 48 interrupts from peripherals are
directly connected as Local interrupts to each processor core". But the
mpsoc machine model seems to be configuring everything via the PLIC. I also
could not find peripherals being connected to the CLIC in any other
machine model.

Is the CLIC currently not modelled in RISC-V QEMU? OR, does the PLIC model
behave similarly to CLIC in the current model?

Vysakh P Pillai
http://embeddedinn.xyz

--000000000000c815c605dd31dffe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>I am looking for some reference code that will let=
 me hook up a=C2=A0peripheral to the core local interrupt controller. I wan=
t to avoid going through the PLIC for modeling some simpler peripherals tha=
t directly interrupt the CPU.=C2=A0</div><div><br></div><div>The polar fire=
 SoC datasheet says &quot;<span style=3D"font-family:Calibri;font-size:11pt=
">=C2=A0</span><span style=3D"font-family:Calibri;font-size:11pt">48 interr=
upts from peripherals are directly
connected as Local interrupts to each processor core</span>&quot;. But the =
mpsoc machine model seems to be configuring everything via the PLIC. I also=
 could not find peripherals being connected to the CLIC in any other machin=
e=C2=A0model.=C2=A0</div><div><br></div><div>Is the CLIC currently not mode=
lled in RISC-V QEMU? OR, does the PLIC model behave similarly to CLIC=C2=A0=
in the current model?</div><div><br clear=3D"all"><div><div dir=3D"ltr" cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">=
<div><div dir=3D"ltr"><div><div dir=3D"ltr">Vysakh P Pillai<div><a href=3D"=
http://embeddedinn.xyz" target=3D"_blank">http://embeddedinn.xyz</a><br></d=
iv></div></div></div></div></div></div></div></div></div>

--000000000000c815c605dd31dffe--

