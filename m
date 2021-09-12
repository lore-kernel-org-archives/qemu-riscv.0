Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mPRzS-0006PX-3d
	for mharc-qemu-riscv@gnu.org; Sun, 12 Sep 2021 12:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zazad@bu.edu>) id 1mPRzP-0006L6-Sv
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 12:05:56 -0400
Received: from relay72.bu.edu ([128.197.228.172]:48463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zazad@bu.edu>) id 1mPRzN-0000Ul-Ow
 for qemu-riscv@nongnu.org; Sun, 12 Sep 2021 12:05:55 -0400
X-Envelope-From: zazad@bu.edu
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 by relay72.bu.edu (8.14.3/8.14.3) with ESMTP id 18CG5C96031929
 for <qemu-riscv@nongnu.org>; Sun, 12 Sep 2021 12:05:12 -0400
Received: by mail-wr1-f72.google.com with SMTP id
 p10-20020a5d68ca000000b001552bf8b9daso1859204wrw.22
 for <qemu-riscv@nongnu.org>; Sun, 12 Sep 2021 09:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z4D3akpDdvuk781j9ZVpJXKvUDoKXxe2UCfzAhaLY1E=;
 b=NXvAFhL9zZE6uNaeirIkS04nS/ASC6uZr96q0yGUE69yEY3JI86zuyvR9/0vst/nSM
 5wzs2+Gm7JV03WWGVkyv3OeUM2OYV2S3Vqh/RjuPs+iJFReNiSHswK4BKF6dIYgZwyiN
 XgEQnSdCObg7azyxljl2XfgKibzV7dA8pZVp5whMT0vCBmfL2icm7mroTrc1mfQF+oo7
 aVvbqJXVkkFiG+8axGiYKaWF6IkW8qGYFUJyQMJSiSoQ9JLxbc6tAQAzqf6CjZlfT2Yd
 bYQdltV7AcEJ+IbfThd+3jC2/qxODG45mMIeJ3qV00F0qqkr+mDCw9PTtruivoi9L9aW
 zYcw==
X-Gm-Message-State: AOAM532k3OyPNe1LIdOlAEyFBz3rWV369QRwiGKN57Ec3btVurEqAGe5
 hrzYda9x3/U7L/7t44LwH41My53MRe4ThwqNXV6oBzhmQGGWde/O+dYjut5I/W1AepAb+Ai5u9d
 M+6wDrHAsQ5Xmga5MAxBQqfRcFBa63PcS
X-Received: by 2002:adf:b741:: with SMTP id n1mr8192072wre.120.1631462711634; 
 Sun, 12 Sep 2021 09:05:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyssoroy3ZkF26o3DKeFBZXFbcSSo1wIizHRUAYysFY9n86Ozx7sQu9g5QW0aXQZ+ZT+bunxBxIvzXUAKfwTfs=
X-Received: by 2002:adf:b741:: with SMTP id n1mr8192051wre.120.1631462711393; 
 Sun, 12 Sep 2021 09:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAKP3tdRSYSfyTPeBk2+WYaUxt1jApK6XXYjXyZw4JwTxfTackQ@mail.gmail.com>
 <CANzO1D3ET=2H_Y8i6bTJ3LNoo38+2Z3Sv3rcWjBJDXuqqXa5uw@mail.gmail.com>
In-Reply-To: <CANzO1D3ET=2H_Y8i6bTJ3LNoo38+2Z3Sv3rcWjBJDXuqqXa5uw@mail.gmail.com>
From: Zahra Azad <zazad@bu.edu>
Date: Sun, 12 Sep 2021 12:05:00 -0400
Message-ID: <CAKP3tdTqWGjU61FXerMvCTswJE4RcJEG1C8hk29Lb2HAU0u4Ug@mail.gmail.com>
Subject: Re: Question about riscv-qemu trace
To: Frank Chang <frank.chang@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, qemu-discuss@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000006093e905cbce8347"
Received-SPF: pass client-ip=128.197.228.172; envelope-from=zazad@bu.edu;
 helo=relay72.bu.edu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sun, 12 Sep 2021 16:05:56 -0000

--0000000000006093e905cbce8347
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I see, thanks Frank!

On Sun, Sep 12, 2021 at 8:54 AM Frank Chang <frank.chang@sifive.com> wrote:

> Zahra Azad <zazad@bu.edu> =E6=96=BC 2021=E5=B9=B49=E6=9C=8812=E6=97=A5 =
=E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=8812:33=E5=AF=AB=E9=81=93=EF=BC=9A
>
>> Hi all,
>>
>> I want to use riscv-qemu to get a trace of the guest executed
>> instructions of a vectorized program. I'm using the following command:
>> qemu-riscv64 -cpu rv64,x-v=3Dtrue,x-k=3Dtrue,vlen=3D256,elen=3D64,vext_s=
pec=3Dv1.0
>> -D logfile.log -d in_asm,cpu,fpu program
>>
>> Although the program is executed correctly without throwing any error, i=
n
>> the trace log all the vector instructions are shown as illegal
>> instructions. Any ideas what is going wrong?
>>
>> I built riscv toolchain and llvm from the main branch (following sifive
>> instructions <https://github.com/sifive/riscv-llvm>), and riscv qemu is
>> built from https://github.com/sifive/qemu/tree/v5.2.0-rvv-rvb-zfh.
>>
>> Thank you!
>>
>
> Hi Zahra,
>
> We are missing RVV related instructions disassembler in QEMU.
> The illegal instruction messages for vector instructions in the trace log
> are just false alarms for now.
> We need to update disas/riscv.c to decode RVV instructions properly.
>
> Regards,
> Frank Chang
>

--0000000000006093e905cbce8347
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I see, thanks Frank!<br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 12, 2021 at 8:54 AM Fr=
ank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com">frank.chang@sifive.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"ltr">Zahra Azad &lt;<a href=3D"mailto:zazad=
@bu.edu" target=3D"_blank">zazad@bu.edu</a>&gt; =E6=96=BC 2021=E5=B9=B49=E6=
=9C=8812=E6=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=8812:33=E5=AF=AB=E9=81=
=93=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi all,<br></div><div><br></d=
iv><div>I want to use riscv-qemu to get a trace of the guest executed instr=
uctions of a vectorized program. I&#39;m using the following command:</div>=
<div>qemu-riscv64 -cpu rv64,x-v=3Dtrue,x-k=3Dtrue,vlen=3D256,elen=3D64,vext=
_spec=3Dv1.0 -D logfile.log -d in_asm,cpu,fpu program <br></div><div><br></=
div>Although the program is executed correctly without throwing any error, =
in the trace log all the vector instructions are shown as illegal instructi=
ons. Any ideas what is going wrong?<br><br><div>I built riscv toolchain and=
 llvm from the main branch (<a href=3D"https://github.com/sifive/riscv-llvm=
" target=3D"_blank">following sifive instructions</a>), and riscv qemu is b=
uilt from <a href=3D"https://github.com/sifive/qemu/tree/v5.2.0-rvv-rvb-zfh=
" target=3D"_blank">https://github.com/sifive/qemu/tree/v5.2.0-rvv-rvb-zfh<=
/a>.</div><div><br></div><div>Thank you!<br></div></div></blockquote><div><=
br></div><div>Hi Zahra,</div><div><br></div><div>We are missing RVV related=
 instructions disassembler in QEMU.</div><div>The illegal instruction messa=
ges for vector instructions in the trace log are just false alarms for now.=
<br></div><div>We need to update=C2=A0disas/riscv.c=C2=A0to decode RVV inst=
ructions properly.<br></div><div><br></div><div>Regards,</div><div>Frank Ch=
ang=C2=A0</div></div></div>
</blockquote></div>

--0000000000006093e905cbce8347--

