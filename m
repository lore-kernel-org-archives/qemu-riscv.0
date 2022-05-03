Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nlulB-0006NK-UI
	for mharc-qemu-riscv@gnu.org; Tue, 03 May 2022 11:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nlul9-0006HC-Ig
 for qemu-riscv@nongnu.org; Tue, 03 May 2022 11:48:19 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c]:42531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nlul7-0008EU-DK
 for qemu-riscv@nongnu.org; Tue, 03 May 2022 11:48:18 -0400
Received: by mail-ua1-x92c.google.com with SMTP id ay15so4063679uab.9
 for <qemu-riscv@nongnu.org>; Tue, 03 May 2022 08:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IMxsipmfnqaHF2LusZbyme+w8ARS9KQPxBpo2uE6984=;
 b=NU482flteW/wZL1YhnDNSRpUDiBf5/FowNvuHHTH+LJ3kPr5OkH26ScGqm1oahyt57
 fBJpZs3KQMPPWvCn2Mwi2/PHkbMfhSW6rcpONTC5kCpzyarx5iAEta0ovIaXYXxNs4n2
 l/ded8fXpXvFf0QFGPD31n7ph+qZzPk3pXuDt7YqIGLMbtgYvlh0PburCDvC4cH4R3Nr
 WQ4/pjJ5Mb95rIM/xVarxYVyl2asp3StLVAylBg8ti3NLwhEWwM1xdaBwzdT8giDI7nB
 RGU+QzAbDR9ERYaRqrUMKe/AA0WGHciR+5J7PAyykhSxhPUMF320aiyUBR8GcaL6jOnG
 DHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IMxsipmfnqaHF2LusZbyme+w8ARS9KQPxBpo2uE6984=;
 b=pXyBA2Ek2zwWsXxGQkjRUfv0B5Iz2Q3v+1Uo0BUiVyy/5Lxsm7XskT+9luMQaS3deP
 p8UMig/2M11WmPQJ4CoFmM9oSiaUSKTJ9fxDxSUxoMIlhAltzWXilxASDFqR91FBpT7S
 81uIuLmNDDKAWvKvbQtOoaZ2bVMnNDhvBO6NXeG4pY/3QRVbZqkB5eQa72UoYxeFjmS/
 SknKiGNuO8n2xWMbB59EWcvV04wPoaDsFGu3Pp0v7vvsX6LcXtaMLvODw5PJMWdkhYs3
 F4xO4q8YQOnR4Fa8f7Zuka0qMnzDbyoYfVb7P1wGtxlCkFAN2SX0H2er0dRxaLb2AZvt
 CQcw==
X-Gm-Message-State: AOAM530g6IjKp1VCEFKeI47iSzcurc/3Cjx7oaa3pQ61JnU1T/fNNwkS
 7xpFVr0zZG6KJDd/0Zo+slj36JGjs3+pxFQm
X-Google-Smtp-Source: ABdhPJz9MFng195u5U9F/m5LQPH3lLzNgObzLh9A4R01HylQPpAshhFsUs/E7gL5NalwBi2s94xCaw==
X-Received: by 2002:ab0:63d0:0:b0:365:1286:5266 with SMTP id
 i16-20020ab063d0000000b0036512865266mr4713371uap.2.1651592895784; 
 Tue, 03 May 2022 08:48:15 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47]) by smtp.gmail.com with ESMTPSA id
 b8-20020ab05f88000000b003626f894df5sm2975222uaj.35.2022.05.03.08.48.14
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 08:48:15 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id m62so16228017vsc.2
 for <qemu-riscv@nongnu.org>; Tue, 03 May 2022 08:48:14 -0700 (PDT)
X-Received: by 2002:a05:6102:22d9:b0:32c:d879:5cd6 with SMTP id
 a25-20020a05610222d900b0032cd8795cd6mr5483321vsh.30.1651592894510; Tue, 03
 May 2022 08:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAAFEQFEMjN1Tt1E4btKw1bQT3DEB7KkJsgh5-tDQvT1W1wHemA@mail.gmail.com>
In-Reply-To: <CAAFEQFEMjN1Tt1E4btKw1bQT3DEB7KkJsgh5-tDQvT1W1wHemA@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 3 May 2022 23:48:03 +0800
X-Gmail-Original-Message-ID: <CANzO1D28bBwxaqbW=vtnS9N--ReaSo-y1_=iEyW=6MCRkBTS0A@mail.gmail.com>
Message-ID: <CANzO1D28bBwxaqbW=vtnS9N--ReaSo-y1_=iEyW=6MCRkBTS0A@mail.gmail.com>
Subject: Re: Modelling core local interrupts
To: vysakh pillai <vysakhpillai@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000ca7aef05de1d6f03"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=frank.chang@sifive.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 03 May 2022 15:48:19 -0000

--000000000000ca7aef05de1d6f03
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 22, 2022 at 8:41 AM vysakh pillai <vysakhpillai@gmail.com>
wrote:

> Hi,
> I am looking for some reference code that will let me hook up a peripheral
> to the core local interrupt controller. I want to avoid going through the
> PLIC for modeling some simpler peripherals that directly interrupt the CPU.
>
> The polar fire SoC datasheet says " 48 interrupts from peripherals are
> directly connected as Local interrupts to each processor core". But the
> mpsoc machine model seems to be configuring everything via the PLIC. I also
> could not find peripherals being connected to the CLIC in any other
> machine model.
>
> Is the CLIC currently not modelled in RISC-V QEMU? OR, does the PLIC model
> behave similarly to CLIC in the current model?
>
> Vysakh P Pillai
> http://embeddedinn.xyz
>

For CLIC, there was a RFC patchet modeling RISC-V CLIC v0.9:
https://patchew.org/QEMU/20210409074857.166082-1-zhiwei_liu@c-sky.com/

I'm not sure whether the author has any plan to upstream the newer version
of the patchset.

Regards,
Frank Chang

--000000000000ca7aef05de1d6f03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Apr 22, 2022 at 8:41 AM vysakh pi=
llai &lt;<a href=3D"mailto:vysakhpillai@gmail.com">vysakhpillai@gmail.com</=
a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr">Hi,<div>I am looking for some ref=
erence code that will let me hook up a=C2=A0peripheral to the core local in=
terrupt controller. I want to avoid going through the PLIC for modeling som=
e simpler peripherals that directly interrupt the CPU.=C2=A0</div><div><br>=
</div><div>The polar fire SoC datasheet says &quot;<span style=3D"font-fami=
ly:Calibri;font-size:11pt">=C2=A0</span><span style=3D"font-family:Calibri;=
font-size:11pt">48 interrupts from peripherals are directly
connected as Local interrupts to each processor core</span>&quot;. But the =
mpsoc machine model seems to be configuring everything via the PLIC. I also=
 could not find peripherals being connected to the CLIC in any other machin=
e=C2=A0model.=C2=A0</div><div><br></div><div>Is the CLIC currently not mode=
lled in RISC-V QEMU? OR, does the PLIC model behave similarly to CLIC=C2=A0=
in the current model?</div><div><br clear=3D"all"><div><div dir=3D"ltr"><di=
v dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">Vysakh P Pillai<d=
iv><a href=3D"http://embeddedinn.xyz" target=3D"_blank">http://embeddedinn.=
xyz</a></div></div></div></div></div></div></div></div></div></div></blockq=
uote><div><br></div><div>For CLIC, there was a RFC patchet=C2=A0modeling RI=
SC-V CLIC v0.9:</div><div><a href=3D"https://patchew.org/QEMU/2021040907485=
7.166082-1-zhiwei_liu@c-sky.com/">https://patchew.org/QEMU/20210409074857.1=
66082-1-zhiwei_liu@c-sky.com/</a></div><div><br></div><div>I&#39;m not sure=
 whether the author has any plan to upstream=C2=A0the newer version of the =
patchset.</div><div><br></div><div>Regards,</div><div>Frank Chang=C2=A0</di=
v></div></div>

--000000000000ca7aef05de1d6f03--

