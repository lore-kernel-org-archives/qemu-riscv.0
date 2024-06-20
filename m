Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFB9C27C79
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 16:17:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sKKT7-00040u-EP; Thu, 20 Jun 2024 12:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shobhit32t@gmail.com>)
 id 1sKKSk-0003s7-UY
 for qemu-riscv@nongnu.org; Thu, 20 Jun 2024 12:16:46 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shobhit32t@gmail.com>)
 id 1sKKSi-0001IR-T7
 for qemu-riscv@nongnu.org; Thu, 20 Jun 2024 12:16:38 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6f98178ceb3so635007a34.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Jun 2024 09:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718900195; x=1719504995; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=71sQ1OB+tHz5mxnrQMxje7fubDqH7P7xx6HhtzMCVLU=;
 b=fVAxHF03eA5tqUzUp4wvFqtwtLu6RyEI2f+mjKKBI+Ijni2lXg3+f7/U3/N4UwsF4v
 S7Grh66TpGwoLehB3r6CoXCU+KTHHZgPfonGX7awZlL2PYduWUkYtjFJQRPnYiW9hsL+
 bJtSRA45FCTfSKlY2yLzoR0gHzpvOmKs/YHV5RfleZrbDp3IdQv9BXQjX0HzYWMOPDl0
 mKao1+PjYE6qo2dlhXM4SgMeSzphaEtdzovWTxzTHZHp9mbtt+W9/doOmJklILL9xCVG
 AeBZNntGl4k3TrZOd/c9oeq7dfbyJYJES2brBsdOmPSv0PnDf2vxUiSReHULqjI190VT
 7pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718900195; x=1719504995;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=71sQ1OB+tHz5mxnrQMxje7fubDqH7P7xx6HhtzMCVLU=;
 b=LSPpfiRjgOFRATdJUL3KgKFw5wGxFoLDWrFjESREwuZfDM5JY8Apu6kyNRfBTNu407
 Xb4B3QOtpV9ypON4sRoDnajEshdZ9BjCl4AUzjFB9b35HbzKBulNpj1DHZ6JqtaO5vt8
 +QqqbDKeIzBxq1qAwRl4ti/k7TJGu729okBeeOgZdQCJ0JkZXjms1zsgOglt4E1EQ6pN
 8bd3G+89znPu+ExiXQOBc71TgdCO2TFXbVh4hG+lAK0ck1rS64tBuLQnNNx3wOQyRFTQ
 oqiooizu1MLwqio+5lvwpjlpT82z5RocvOCgh9SPndy3rxmCMPALmhWHBiP8Y6NKHbVw
 PGdg==
X-Gm-Message-State: AOJu0YzjI/AFnAfef+Ih07Tzv6+Y8fww720Cv9gAPXrfy4wz9G3GLQs8
 +0YntUBLfayfMpig6rCZe4VQKKViWVe5z74YKqke5ObUYUayyKJyJXhAg17utze98ArMIGo3YFJ
 wStX/AM6UeyvdpYVNz4TOGj2s08x5ovGK
X-Google-Smtp-Source: AGHT+IEwdSpznQq/7tRpWYhb5RH/3v/x1BBBppavBVdiQw2jsoGiGvVmnyI9elnVQPAwzz+5YQKHklcPPyUucmn6HY4=
X-Received: by 2002:a9d:7ad6:0:b0:6f9:6161:56d6 with SMTP id
 46e09a7af769-7007365bbedmr6078001a34.3.1718900195462; Thu, 20 Jun 2024
 09:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <CANnUGEkHqnecxFa63ESQoQRN8RwKWm0AAmQ=4zKe3VkDDYCLXw@mail.gmail.com>
 <E5CDC0A3-8CC9-9641-9F01-2C4F88EA2767@hxcore.ol>
 <CANnUGE=uWzN-g5+vx46bbLdHmKrQ1K9nq9MZ=npE06kovdm5Sw@mail.gmail.com>
 <CAPd4WeyNkaWByzBWgyf_wwiz00Ys6AOEtMmv1941GR-XHme9_g@mail.gmail.com>
 <a78f70da-1304-803e-c4e9-34902dddf77b@gmail.com>
 <CAKC1njR+S_aPSVULxS-zV-Uz4i0hhOTQJOpV4hfvABD7UBwtxw@mail.gmail.com>
In-Reply-To: <CAKC1njR+S_aPSVULxS-zV-Uz4i0hhOTQJOpV4hfvABD7UBwtxw@mail.gmail.com>
From: Shobhit <shobhit32t@gmail.com>
Date: Thu, 20 Jun 2024 21:46:24 +0530
Message-ID: <CANnUGEkSR+S5nd-T4YjzJa-Yau9yYkm75pdVvU2gDAwLFpMkAQ@mail.gmail.com>
Subject: Re: Is there a way to check values of registers before and after
 running a program on qemu-system-risc64v?
To: Deepak Gupta <debug@rivosinc.com>
Cc: qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000008e174a061b54a316"
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=shobhit32t@gmail.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--0000000000008e174a061b54a316
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, the si command is more helpful than continue.

Thank you for the suggestion.

On Wed, 19 Jun 2024 at 23:50, Deepak Gupta <debug@rivosinc.com> wrote:

> On Wed, Jun 19, 2024 at 9:58=E2=80=AFAM Shobhit <shobhit32t@gmail.com> wr=
ote:
> >
> > On pressing CTRL+C, I am getting the following line:
> >
> > >> Thread 1 received signal SIGINT, Interrupt.
> > >> 0x0000000080007bac in ?? ()
> >
> > Instead of the following:
> >
> > Thread 4 received signal SIGINT, Interrupt.
> > [Switching to Thread 1.4]
> > _start () at test.S:10
> > 10      1:      j 1b
> >
>
> Why are you even creating 4 cpus (I saw that you had this option `-smp 4`=
)
> Just have 1 cpu. You could use the gdb command `si` (step into)
> instead of continuing.
> Practically you will be stepping through 5 or 6 instructions.
> GDB reference -
>
> https://sourceware.org/gdb/current/onlinedocs/gdb.html/Continuing-and-Ste=
pping.html
>
> As a side note, you may be just starting these things and thus getting
> introduced to a lot of
> sw / tools (like qemu, gdb, compiler) and it might be overwhelming.
> But I would advise that
> spend time with them and their documentation / internet search. What
> do they do and why
> do they do it? It'll help you understand and validate your own thought
> process and make you
> figure out things on your own.
>

--0000000000008e174a061b54a316
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, the si command is more helpful than continue.<br=
></div><div><br></div><div>Thank you for the suggestion.<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 1=
9 Jun 2024 at 23:50, Deepak Gupta &lt;<a href=3D"mailto:debug@rivosinc.com"=
 target=3D"_blank">debug@rivosinc.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Wed, Jun 19, 2024 at 9:58=E2=80=AFA=
M Shobhit &lt;<a href=3D"mailto:shobhit32t@gmail.com" target=3D"_blank">sho=
bhit32t@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On pressing CTRL+C, I am getting the following line:<br>
&gt;<br>
&gt; &gt;&gt; Thread 1 received signal SIGINT, Interrupt.<br>
&gt; &gt;&gt; 0x0000000080007bac in ?? ()<br>
&gt;<br>
&gt; Instead of the following:<br>
&gt;<br>
&gt; Thread 4 received signal SIGINT, Interrupt.<br>
&gt; [Switching to Thread 1.4]<br>
&gt; _start () at test.S:10<br>
&gt; 10=C2=A0 =C2=A0 =C2=A0 1:=C2=A0 =C2=A0 =C2=A0 j 1b<br>
&gt;<br>
<br>
Why are you even creating 4 cpus (I saw that you had this option `-smp 4`)<=
br>
Just have 1 cpu. You could use the gdb command `si` (step into)<br>
instead of continuing.<br>
Practically you will be stepping through 5 or 6 instructions.<br>
GDB reference -<br>
<a href=3D"https://sourceware.org/gdb/current/onlinedocs/gdb.html/Continuin=
g-and-Stepping.html" rel=3D"noreferrer" target=3D"_blank">https://sourcewar=
e.org/gdb/current/onlinedocs/gdb.html/Continuing-and-Stepping.html</a><br>
<br>
As a side note, you may be just starting these things and thus getting<br>
introduced to a lot of<br>
sw / tools (like qemu, gdb, compiler) and it might be overwhelming.<br>
But I would advise that<br>
spend time with them and their documentation / internet search. What<br>
do they do and why<br>
do they do it? It&#39;ll help you understand and validate your own thought<=
br>
process and make you<br>
figure out things on your own.<br>
</blockquote></div>

--0000000000008e174a061b54a316--

