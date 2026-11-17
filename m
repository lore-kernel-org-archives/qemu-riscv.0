Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8095606A323
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 09:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=IUXqJn9a
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTFJO-0008Ay-M5; Tue, 17 Nov 2026 04:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xTFJJ-0008AX-TH
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 04:17:06 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xTFJG-0007KL-Li
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 04:17:04 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6b570ff3dfdso4419207a12.3
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 01:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1794907021; x=1795511821; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=TipT0447L+wpGEH6/84TiZ7W5Hpg04ITL+TeBuQ8V1E=;
 b=IUXqJn9aizR0RM70c0k97A4Ro1Ng9g4YqaEP3lQmYWnhCT1Z7vOlYfLM8HzhVBo16R
 gMAnWLf4aeqcfVMvqDVbcL+Sb7vDAhIfMgvC452RWTOZYaqVyEDA3Qo9vOsVLPrXTEfK
 ud9TPL8r/HhsYKOTnnQGI+lk+mX7EEsv6NFqQLRpUzwZn46l8lwXjvCR99xCiXgCmns6
 F6TGx6XKcUTzwa5uMXwQe7vHsYH1Ezus/qFiMRhQ6dDa2wm12toLYRaW6GtRNw77Wad/
 3JdPThnPac/aIhoFhTcTNjM5vGhyJ/xMsdxfFCfvT+lw//XkhEqfhkV68Go7pvkmsbMq
 yzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794907021; x=1795511821;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=TipT0447L+wpGEH6/84TiZ7W5Hpg04ITL+TeBuQ8V1E=;
 b=Sfe1HCfFkg+k4eoOTDmwi0PmTIpGF7Ec2wGN6s9ACUh61/JnLurMQtTl6YSAN8Lb5q
 aoKIv9xPXBKc/KBp4iGxCqLsPPiC+gmfJth0rT/87f9SFQugZ981AdhCnjGLOsoVe1CT
 C+JuU33LVp/PtrceKLcTzr0HJR8Sf/lkeGQaQR/nqppEYBUHLg6nbiw5qRjxd/5sU9bO
 EN3Eg0mAsm+N9u9ITo44Xj7yu9jxK9iRZafSROgizbMfE9cZcc9xBrIIzgHmrqxu37nH
 wjGXckQnONjSAV9SkLbQvJTBRr1pUJCFHjMTBK1bfPqsNaZjs/zXiq1Rxb7SWu18P0em
 02MQ==
X-Forwarded-Encrypted: i=1;
 AL+hErGKYTXXo/88Ypa5Bcske/SNvUteBMGCJt6oIFXMPKGjSl+OyCHdj8eOAiT6lQ5u1E+ugTa3t8aAM9UC@nongnu.org
X-Gm-Message-State: APuU4Z99OP2ptrYOK6485YbKyZJoc3kCor/dOhXchJxzIXADlxKnJbyW
 Nm3JL0ynmrE92phH/GLHQtuw9zQ5ISBh39KD+cFphTikNl0bUlIAr/fyxz0cvaG2TQJ4noMTdhB
 uUgVXAdo9Aa6/uCqWPrDel7rSur203jMBYUjcneRrmT5aPJjBpn8JHJVFaA3MEySjp720niGXhz
 t+iM9J3zYD4xZRPI1H3XOeRavrvYC9QLvRLaHS/c1NOhw=
X-Gm-Gg: AYBFou3cvFvvhjZ0hDj6gEzrHhqTJgFqiu4B2Xci2TRpnIyDOWmDRdKVc7NncpgDZem
 THe0J4zwU+XiSS22xIa3JgnV0yX8lmTAYv1mbzhU0ccfBhhd2q1dESJt7w4dwMCT/u4nXc+74YM
 mgl3KlEn+SkeERf0PaXxGCRwNeW4TaOLxm+ZPaKucIs9QLu/oPCxND8/xTFe8hOBIE+hS3tg36N
 K3xlui2Am452EZNUhVSEv8b/EMLuAzaxTaaRQx2mS4HK1y7zHbADoHXSDwE3+PKC4ANmrTp4Ezd
 6ReoX3q0k9JY8RymIq0TLApAFogHqyXdb8Sx45zSI1wHs2R/0NIN999XXd+ueIwfp2myS19EHzV
 3hgeuuzI///hpvU3m0lMxQ4PoDv/o0QiTcGG5IgRenhmYtNUbb5872fkF1pEaEDfck3deFWYL/O
 NNdIcqSufhm/NxRsSLmrCEbOTp6lu7KDKMX12u//LPxa5HELNdGKHJk0jInn7It3CO60KBGu4Pl
 4rOkHsU40Ic4cCd56AbaLdRuA60XvU1Enmas1hNbr+gCMoBPZWh6Pdw3m18fmNOsW8AqxlV6Yoc
 C9cfULz4HTVCP64cbtDaThR5vQ6+Bv5X1OK2Jnr1XMNu8Y2h4vPl3I8j5i2hRTOLul4=
X-Received: by 2002:a05:6402:4504:b0:6b8:77ad:62e8 with SMTP id
 4fb4d7f45d1cf-6b877ad6808mr551793a12.44.1794907020699; 
 Tue, 17 Nov 2026 01:17:00 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b7c23c757esm5722908a12.17.2026.11.17.01.16.59
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 01:16:59 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6b7a488a0a4so4897106a12.0
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 01:16:59 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AL+hErH72C9JUqQ80y66Va7Oo5paClcoWNVd3ei6MX0Ib6ABE1zXjd4GYpl5R/5EHk0QaF3pSsOd6ZwP5h74@nongnu.org
X-Received: by 2002:a05:6402:210d:b0:6b4:86e1:cc67 with SMTP id
 4fb4d7f45d1cf-6b7c0c6fd49mr9417438a12.27.1794907019198; Tue, 17 Nov 2026
 01:16:59 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260825-upstream-ntrace_core-v1-0-f8be2f40d2fd@gmail.com>
 <20260825-upstream-ntrace_core-v1-5-f8be2f40d2fd@gmail.com>
In-Reply-To: <20260825-upstream-ntrace_core-v1-5-f8be2f40d2fd@gmail.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Tue, 17 Nov 2026 17:16:47 +0800
X-Gmail-Original-Message-ID: <CAMXXpfagDhmNPV_vrGRHxCfAqFg=2HXEHMivJUVEd8XPbGYzSA@mail.gmail.com>
X-Gm-Features: AclHuK92GJqHx3zO68TWKhcNXa3aY8HYGWnXICD8rfVlUCJB-XMonHW-xbIp4Mo
Message-ID: <CAMXXpfagDhmNPV_vrGRHxCfAqFg=2HXEHMivJUVEd8XPbGYzSA@mail.gmail.com>
Subject: Re: [PATCH 05/13] hw/riscv/trace_encoder, target/riscv: add trace pc
 history logic
To: Konstantin Semichastnov <antikostya2@gmail.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alexei Filippov <halip0503@gmail.com>, frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="00000000000048c81e0660755b54"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=jay.chang@sifive.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_KAM_HTML_FONT_INVALID=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--00000000000048c81e0660755b54
Content-Type: text/plain; charset="UTF-8"

>
> -void trencoder_report_branch(Object *trencoder_obj, uint64_t pc, bool
> taken)
> +void trencoder_report_branch(Object *trencoder_obj, uint64_t pc,
> +                             uint64_t insn_len, uint64_t offset,
> +                             TraceBranchRes taken)
>  {
>      TraceEncoder *te = TRACE_ENCODER(trencoder_obj);
>
> +    if (te->ntrace && taken != BRANCH_NOT_TAKEN) {
> +            te->icnt_accumulated += (pc + insn_len - te->last_icnt_reset)
> / 2;
> +            te->last_icnt_reset = pc + offset;
>

nit: Could you align these statements

Reviewed-by: Jay Chang<jay.chang@sifive.com>
Thanks

--00000000000048c81e0660755b54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">-void trencoder_report_branch(Obje=
ct *trencoder_obj, uint64_t pc, bool taken)<br>
+void trencoder_report_branch(Object *trencoder_obj, uint64_t pc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t insn_len, uint64_t offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TraceBranchRes taken)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0TraceEncoder *te =3D TRACE_ENCODER(trencoder_obj);<br>
<br>
+=C2=A0 =C2=A0 if (te-&gt;ntrace &amp;&amp; taken !=3D BRANCH_NOT_TAKEN) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 te-&gt;icnt_accumulated +=3D (pc=
 + insn_len - te-&gt;last_icnt_reset) / 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 te-&gt;last_icnt_reset =3D pc + =
offset;<br></blockquote><div><br></div><div>nit: Could you align these stat=
ements=C2=A0</div><div><br></div><div><span style=3D"background-color:trans=
parent">Reviewed</span><span style=3D"background-color:transparent">-by: Ja=
y Chang&lt;</span><a href=3D"mailto:jay.chang@sifive.com" target=3D"_blank"=
 style=3D"background-color:transparent">jay.chang@sifive.com</a><span style=
=3D"background-color:transparent">&gt;</span></div><div>Thanks</div></div><=
/div>

--00000000000048c81e0660755b54--

